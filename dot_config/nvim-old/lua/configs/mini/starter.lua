local starter_ok, starter = pcall(require, "mini.starter")
if not starter_ok then return end

starter.setup {
  autoopen = true,
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.sessions(5, true),
    starter.sections.recent_files(10, true),
    starter.sections.recent_files(5, false),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing("all", { "Builtin actions" }),
    starter.gen_hook.padding(3, 2),
  },
}
