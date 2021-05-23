-- local applyCustomColors = require('material.functions').applyCustomColors
-- The original material if no setting is set
local gruvbox_bg = {
    bg0 = "#282828",
    bg1 = "#32302f",
    bg2 = "#32302f",
    bg3 = "#45403d",
    bg4 = "#45403d",
    bg5 = "#5a524c",
    bg_statusline1 = "#32302f",
    bg_statusline2 = "#3a3735",
    bg_statusline3 = "#504945",
    bg_diff_green = "#34381b",
    bg_visual_green = "#3b4439",
    bg_diff_red = "#402120",
    bg_visual_red = "#4c3432",
    bg_diff_blue = "#0e363e",
    bg_visual_blue = "#374141",
    bg_visual_yellow = "#4f422e",
    bg_current_word = "#3c3836"
}

local gruvbox_palette = {
    fg0 = "#654735",
    fg1 = "#4f3829",
    red = "#c14a4a",
    orange = "#c35e0a",
    yellow = "#b47109",
    green = "#6c782e",
    aqua = "#4c7a5d",
    blue = "#45707a",
    purple = "#945e80",
    bg_red = "#ae5858",
    bg_green = "#6f8352",
    bg_yellow = "#a96b2c",
    grey0 = '#a89984',
    grey1 = '#928374',
    grey2 = '#7c6f64',
    white = "#f2e5bc",
    black = '#1d2021',
    none = 'NONE',
    cyan = "#7daea3",
    pink = "#d3869b",
    link = "#89b482",
    cursor = "#ddc7a1"
}

local material = {
    -- Common colors

    white = gruvbox_palette.white,
    gray = gruvbox_palette.grey0,
    black = gruvbox_palette.black,
    red = gruvbox_palette.red,
    green = gruvbox_palette.green,
    yellow = gruvbox_palette.yellow,
    blue = gruvbox_palette.blue,
    paleblue = gruvbox_palette.aqua, -- TODO: change paleblue to: aqua
    cyan = gruvbox_palette.cyan,
    purple = gruvbox_palette.purple,
    orange = gruvbox_palette.orange,
    pink = gruvbox_palette.pink,
    error = gruvbox_palette.bg_red,
    link = gruvbox_palette.link,
    cursor = gruvbox_palette.cursor,

    none = 'NONE'
}

-- Style specific colors

if vim.g.material_style == 'darker' then

    -- Darker theme style TODO: coming soon
    material.bg = '#212121'
    material.bg_alt = '#1A1A1A'
    material.fg = '#B0BEC5'
    material.text = '#727272'
    material.comments = '#616161'
    material.selection = '#404040'
    material.contrast = '#1A1A1A'
    material.active = '#323232'
    material.border = '#292929'
    material.line_numbers = '#424242'
    material.highlight = '#3F3F3F'
    material.disabled = '#474747'
    material.accent = '#FF9800'
else
    material.bg = gruvbox_bg.bg0
    material.bg_alt = gruvbox_bg.bg1
    material.fg = gruvbox_palette.fg0
    material.text = gruvbox_palette.grey1
    material.comments = gruvbox_bg.grey1
    material.selection = gruvbox_bg.bg
    material.contrast = gruvbox_bg.bg3
    material.active = gruvbox_palette.grey0
    material.border = gruvbox_palette.grey1
    material.line_numbers = gruvbox_palette.grey0
    material.highlight = gruvbox_palette.grey2
    material.disabled = gruvbox_bg.bg3
    material.accent = gruvbox_palette.orange
end

-- Optional colors

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.material_contrast == false then
    material.sidebar = material.bg
    material.float = material.bg
else
    material.sidebar = material.bg_alt
    material.float = material.bg_alt
end

-- Enable custom variable colors
if vim.g.material_variable_color == nil then
    material.variable = material.gray
else
    material.variable = vim.g.material_variable_color
end

-- Set black titles for lighter style
if vim.g.material_style == 'lighter' then
    material.title = material.black
else
    material.title = material.white
end

-- Apply user defined colors

-- Check if vim.g.material_custom_colors = is a table
if type(vim.g.material_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.material_custom_colors) do
        -- If the key doesn't exist=
        if not material[key] then
            error("Color " .. key .. " does not exist")
        end
        -- If it exists and the sting starts with a "#"
        if string.sub(value, 1, 1) == "#" then
            -- Hex override
            material[key] = value
            -- IF it doesn't, dont accept it
        else
            -- Another group
            if not material[value] then
                error("Color " .. value .. " does not exist")
            end
            material[key] = material[value]
        end
    end
end

return material
