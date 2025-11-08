-- metadata.lua
-- Backend plugin metadata and configuration
-- Documentation: https://mise.jdx.dev/backend-plugin-development.html

PLUGIN = { -- luacheck: ignore
    -- Required: Plugin name (will be the backend name users reference)
    name = "pixi",

    -- Required: Plugin version (not the tool versions)
    version = "1.0.0",

    -- Required: Brief description of the backend and tools it manages
    description = "A mise backend plugin for Pixi and Prefix.dev",

    -- Required: Plugin author/maintainer
    author = "aleksrutins",

    -- Optional: Plugin homepage/repository URL
    homepage = "https://github.com/aleksrutins/mise-plugin-pixi",

    -- Optional: Plugin license
    license = "MIT",

    -- Optional: Important notes for users
    notes = {
        -- "Requires pixi to be installed on your system",
        -- "This plugin manages tools from the pixi ecosystem"
        "Requires Pixi to be installed; this can be done with `mise use pixi`.",
    },
}
