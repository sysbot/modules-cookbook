actions :add, :remove

default_action :add

attribute :modules, :kind_of => Array, :name_attribute => true
attribute :name, :kind_of => String, :default => nil
attribute :path, :kind_of => String, :default => nil

# Covers 0.10.8 and earlier
def initialize(*args)
  super
  @action = :add
end
