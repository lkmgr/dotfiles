pcall(require, "impatient")

local load = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

load "core.options"
load "core.plugins"
load "core.autocmds"
load "core.mappings"
load "core.commands"
load "core.ui"
