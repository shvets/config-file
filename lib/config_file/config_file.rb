class ConfigFile
  @types = []

  def self.register(type)
    @types << type unless @types.include? type
  end

  def self.type(extension)
    @types.detect { |type| type.extensions.include? extension }
  end

  attr_reader :config

  def read file_name, ext=nil
    ext = File.extname(file_name) unless ext

    config_file_type = ConfigFile.type(ext)

    if config_file_type
      config_file = config_file_type.new

      @config = config_file.read file_name
    else
      raise ArgumentError, "Configuration from #{ext} is not supported"
    end
  end
end
