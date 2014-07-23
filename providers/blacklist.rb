#
# Cookbook Name:: modules
# Provider:: blacklist
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 2014, Ooyala
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

use_inline_resources

action :add do
  template path do
    cookbook "modules"
    source "blacklist-name.conf.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
      :mods => new_resource.mods
    )
  end
end

action :remove do
  if ::File.exists?(path)
    Chef::Log.info "Removing #{new_resource.name}: blacklist from #{path}"
    file path do
      action :delete
    end
    new_resource.updated_by_last_action(true)
  end
end

def path
  new_resource.path ? new_resource.path : "/etc/modules.d/blacklist-#{new_resource.name}.conf"
end

