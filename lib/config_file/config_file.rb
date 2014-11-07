require 'meta_methods/core'
require 'yaml'
require 'json'

class ConfigFile
  YAML_EXT = '.yaml'
  RUBY_EXT = '.rb'
  JSON_EXT = 'json'

  attr_reader :config

  def load file_name, ext=nil
    ext = File.extname(file_name) unless ext

    @config = case ext
      when YAML_EXT
        YAML.load_file(File.expand_path(file_name))

      when RUBY_EXT
        content = File.open(file_name).read

        MetaMethods::Core.instance.block_to_hash(content)

      when JSON_EXT
        content = File.open(file_name).read

        JSON.parse(content)

      else
        content = File.open(file_name).read

        JSON.parse(content)
    end
  end

end
