def supported?
  case node['platform']
  when 'ubuntu', 'debian'
    # only work with upstart
    if Gem::Version.new(node['platform_version']) >= Gem::Version.new('9.10')
      puts Gem::Version.new(node['platform_version'])
      return true
    else
      puts Gem::Version.new(node['platform_version'])
      return false
    end
  else
    Chef::Log.info("Your platform isn't manage to save module changes")
    return false
  end
end
