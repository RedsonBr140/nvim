local function setup(module)
    local status_ok = pcall(require, module)

    if not status_ok then
        local error_msg = string.format('[ ERROR] Can\'t find %s module', module)
        print(error_msg)
    end
end


setup 'plugins.plugins'
setup 'user.mappings'
setup 'user.options'


