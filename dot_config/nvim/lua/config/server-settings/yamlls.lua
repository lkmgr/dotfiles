return {
  settings = {
    yaml = {
      schemaStore = {
        -- disable built-in schemaStore
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
