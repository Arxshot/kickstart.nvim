local M = {}

-- Detect if Windows
local is_windows = vim.loop.os_uname().sysname:match 'Windows'

---@class EspeakOpts
---@field bufnr integer
---@field range? {start: {line: integer, col: integer}, end_: {line: integer, col: integer}}
---@field register string
---@field format function
---@field quiet boolean
---@field async boolean

function M.speak(opts, callback)
  opts = opts or {}
  callback = callback or function(_) end

  opts.register = opts.register or '"' -- optional register to read from

  local text = nil

  if opts.bufnr then
    -- No register given: get visual selection and save it to unnamed register
    local mode = vim.api.nvim_get_mode().mode
    local start_pos, end_pos

    if opts.range then
      start_pos = { opts.range.start.line, opts.range.start.col }
      end_pos = { opts.range.end_.line, opts.range.end_.col }
    elseif mode == 'v' or mode == 'V' then
      local start = vim.fn.getpos 'v'
      local finish = vim.fn.getpos '.'
      start_pos = { start[2] - 1, start[3] - 1 }
      end_pos = { finish[2] - 1, finish[3] }
    else
      callback 'No valid visual range or opts.range provided'
      return false
    end

    if (start_pos[1] > end_pos[1]) or (start_pos[1] == end_pos[1] and start_pos[2] < end_pos[2]) then
      local temp = end_pos
      end_pos = start_pos
      start_pos = temp
    end

    local lines = vim.api.nvim_buf_get_lines(opts.bufnr, start_pos[1], end_pos[1] + 1, false)
    if #lines == 0 then
      callback 'No lines in selected range'
      return false
    end

    lines[1] = string.sub(lines[1], start_pos[2] + 1)
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[2])

    -- Save selection text to unnamed register (")
    text = table.concat(lines, '\n')
    vim.fn.setreg(opts.register, text) -- save to unnamed register
  elseif opts.register then
    -- Read text from given register
    text = vim.fn.getreg(opts.register)
    if text == '' then
      callback('Register "' .. opts.register .. '" is empty')
      return false
    end
  end

  -- format the text
  if opts.format then
    text = opts.format(text)
  end

  -- Escape quotes for shell command
  local safe_text = (text or ''):gsub('"', '\\"')

  local cmd = is_windows and ('espeak "%s"'):format(safe_text) or ('espeak "%s" &'):format(safe_text)
  local result = os.execute(cmd)

  if result then
    callback(nil)
    return true
  else
    callback 'Failed to execute espeak'
    return false
  end
end

function M.stop()
  if is_windows then
    os.execute 'taskkill /IM espeak.exe /F >NUL 2>&1'
  else
    os.execute 'pkill espeak'
  end
end

M.setup = function(opts)
  -- Optional config
  opts = opts or {}

  -- Visual mode command
  vim.api.nvim_create_user_command('EspeakVisual', function()
    M.visual_speak()
  end, { desc = 'Speak visually selected text', range = true })

  vim.api.nvim_create_user_command('EspeakStop', function()
    M.stop()
  end, { desc = 'Stops the espeak proccess' })
end

return M
