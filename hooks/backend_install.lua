-- hooks/backend_install.lua
-- Installs a specific version of a tool
-- Documentation: https://mise.jdx.dev/backend-plugin-development.html#backendinstall

function PLUGIN:BackendInstall(ctx)
    local file = require("file")
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

    local channel = nil
    local channel_sep = version:find(":")
    if channel_sep ~= nil then
        channel = version:sub(0, channel_sep)
        version = version:sub(channel_sep + 1)
    end

    -- Create installation directory
    local cmd = require("cmd")
    cmd.exec("mkdir -p " .. install_path)

    -- Example implementations (choose/modify based on your backend):

    -- Example 1: Package manager installation (like npm, pip)
    if not file.exists(file.join_path(install_path, "pixi.toml")) then
        cmd.exec("pixi init " .. install_path)
    end

    local install_cmd = "pixi add "
        .. tool
        .. "="
        .. version
        .. " --manifest-path "
        .. install_path
        .. ((channel ~= nil) and ("-c " .. channel) or "")
    local result = cmd.exec(install_cmd)

    if result:match("error") or result:match("failed") then
        error("Failed to install " .. tool .. "@" .. version .. ": " .. result)
    end

    return {}
end
