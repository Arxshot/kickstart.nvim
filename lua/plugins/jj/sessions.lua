-- File: ~/.config/nvim/lua/plugins/jj_sessions.lua
return {
  'nvim-mini/mini.sessions',
  version = '*',
  config = function()
    -- Precheck: ensure we are in a jj repo
    local function is_jj_repo()
      local handle = io.popen 'jj workspace root --ignore-working-copy 2>&1'
      if not handle then
        return false
      end
      local output = handle:read '*a'
      local ok, _, exit_code = handle:close()
      -- Exit code 0 = jj repo, else not
      return exit_code == 0
    end

    if not is_jj_repo() then
      vim.notify('[JJ Sessions] Not a jj repository, skipping session management.', vim.log.levels.INFO)
      return
    end

    local mini_sessions = require 'mini.sessions'

    -- Base directory for jj sessions
    local session_base_dir = vim.fn.stdpath 'data' .. '/jj_sessions'

    -- Ensure the directory exists
    if vim.fn.isdirectory(session_base_dir) == 0 then
      vim.fn.mkdir(session_base_dir, 'p')
    end

    -- Helper to get jj workspace root
    local function get_workspace_root()
      local handle = io.popen 'jj workspace root --ignore-working-copy 2>/dev/null'
      if handle then
        local result = handle:read '*l'
        handle:close()
        return result or ''
      end
      return ''
    end

    -- Helper to get current jj change ID
    local function get_current_change()
      local cmd = [[jj log --no-graph --revisions @ --ignore-working-copy --template 'change_id']]
      local handle = io.popen(cmd .. ' 2>/dev/null')
      if handle then
        local result = handle:read '*l'
        handle:close()
        return result or ''
      end
      return ''
    end

    -- Generate a safe session path based on workspace root + change ID
    local function get_session_path()
      local root = get_workspace_root()
      local change = get_current_change()
      if root == '' or change == '' then
        return nil
      end

      -- Replace slashes and unsafe chars
      local safe_root = root:gsub('[/:\\]', '_')
      local session_dir = session_base_dir .. '/' .. safe_root
      if vim.fn.isdirectory(session_dir) == 0 then
        vim.fn.mkdir(session_dir, 'p')
      end
      return session_dir .. '/' .. change .. '.vim'
    end

    -- Keep track of current session path
    local current_session = nil

    -- Main function to switch session if needed
    local function switch_jj_session()
      local target_session = get_session_path()
      if not target_session then
        return
      end

      -- If session changed
      if target_session ~= current_session then
        -- Save current session
        if current_session then
          mini_sessions.write(current_session, { force = true })
        end

        -- Load new session if exists
        if vim.fn.filereadable(target_session) == 1 then
          mini_sessions.read(target_session, { force = true })
        else
          -- Create new session
          mini_sessions.write(target_session, { force = true })
        end

        current_session = target_session
      end
    end

    -- Setup mini.sessions
    mini_sessions.setup {
      autoread = false,
      autowrite = false,
      directory = session_base_dir,
    }

    -- Autocmds to track changes
    local events = {
      'VimEnter',
      'BufEnter',
      'BufLeave',
      'FocusGained',
      'FocusLost',
      'TermEnter',
      'TermLeave',
      'VimResume',
      'VimSuspend',
      'QuitPre',
      'UIEnter',
      'UILeave',
    }

    vim.api.nvim_create_augroup('JJSessions', { clear = true })
    for _, ev in ipairs(events) do
      vim.api.nvim_create_autocmd(ev, {
        group = 'JJSessions',
        callback = function()
          vim.schedule(switch_jj_session) -- schedule to avoid event conflicts
        end,
      })
    end
  end,
}
