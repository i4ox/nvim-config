local components = require("custom.statusline.components")

function status_line()
  local mode = components.get_mode_component()
  local branch = components.get_branch_component()
  local file = components.get_file_component()
  local errors = components.get_errors_component()
  local warnings = components.get_warnings_component()
  local infos = components.get_infos_component()
  local saved = components.get_saved_component()
  local noice_mode = components.get_noice_mode_component()
  local noice_command = components.get_noice_command_component()
  local yaml_schema = components.get_yaml_schema_component()

  return table.concat({
    components.get_component("StatusMode", mode),
    components.get_component("StatusBranch", branch),
    components.get_component("StatusFile", file),
    components.get_component("StatusYamlSchema", yaml_schema),
    components.get_component_separator(),
    components.get_component("NoiceMode", noice_mode),
    components.get_component("NoiceCommand", noice_command),
    components.get_component("StatusSaved", saved),
    components.get_component("StatusErrors", errors),
    components.get_component("StatusWarnings", warnings),
    components.get_component("StatusInfos", infos),
  })
end

vim.cmd([[
  highlight StatusMode guifg=#7aa2f7 gui=bold
  highlight StatusBranch guifg=#bb9af7 gui=bold
  highlight StatusFile guifg=#c0caf5 gui=bold
  highlight StatusYamlSchema guifg=#7dcfff gui=bold
  highlight StatusSaved guifg=#9ece6a gui=bold
  highlight StatusErrors guifg=#f7768e gui=bold
  highlight StatusWarnings guifg=#e0af68 gui=bold
  highlight StatusInfos guifg=#7dcfff gui=bold
  highlight NoiceMode guifg=#bb9af7 gui=bold
  highlight NoiceCommand guifg=#9ece6a gui=bold
]])

vim.cmd([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line()
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.status_line()
  augroup END
]])
