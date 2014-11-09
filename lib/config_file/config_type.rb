require 'meta_methods/core'
require 'yaml'
require 'json'
require 'text_interpolator'

require 'config_file/config_file'

class ConfigType
  class Yaml
    ConfigFile.register(self)

    def self.extensions
      [".yaml"]
    end

    def read file_name
      ::YAML.load_file(File.expand_path(file_name))
    end
  end

  class Ruby
    ConfigFile.register(self)

    def self.extensions
      [".rb"]
    end

    def read file_name
      content = File.read(file_name)

      MetaMethods::Core.instance.block_to_hash(content)
    end
  end

  class Json
    ConfigFile.register(self)

    def self.extensions
      [".json"]
    end

    def read file_name
      interpolator = TextInterpolator.new

      content = File.read(file_name)

      hash = ::JSON.parse(content, :symbolize_names => true)

      interpolator.interpolate hash
    end
  end
end
