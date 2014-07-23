actions :add, :remove

default_action :add

attribute :mods :kind_of => Array, :default => nil
attribute :name, :kind_of => String, :name_attribute => true
attribute :path, :kind_of => String, :default => nil

# Covers 0.10.8 and earlier
def initialize(*args)
  super
  @action = :add
end
