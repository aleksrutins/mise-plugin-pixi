-- hooks/backend_install.lua
-- Installs a specific version of a tool
-- Documentation: https://mise.jdx.dev/backend-plugin-development.html#backendinstall

function PLUGIN:BackendInstall(ctx)
    local tool = ctx.tool
    local version = ctx.version
    local install_path = ctx.install_path

    -- Validate inputs
    if not tool or tool == "" then
        error("Tool name cannot be empty")
    end
    if not version or version == "" then
        error("Version cannot be empty")
    end
    if not install_path or install_path == "" then
        error("Install path cannot be empty")
    end

    -- Create installation directory
    local cmd = require("cmd")
    cmd.exec("mkdir -p " .. install_path)

    -- Example implementations (choose/modify based on your backend):

    -- Example 1: Package manager installation (like npm, pip)
    local install_cmd = "pixi install " .. tool .. "=" .. version .. " --manifest-path " .. install_path
    local result = cmd.exec(install_cmd)

    if result:match("error") or result:match("failed") then
        error("Failed to install " .. tool .. "@" .. version .. ": " .. result)
    end

    return {}
end
