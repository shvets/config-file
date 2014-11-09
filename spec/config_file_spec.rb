require File.expand_path('spec_helper', File.dirname(__FILE__))

require 'config_file'

describe ConfigFile do

  it "reads from yaml" do
    config = subject.read "spec/config/test_config.yaml"

    expect(config['property1']).to eq "value1"
    expect(config['property2']['property21']).to eq "value21"
  end

  it "reads from json" do
    config = subject.read "spec/config/test_config.json"

    expect(config[:property1]).to eq "value1"
    expect(config[:property2][:property21]).to eq "value21"
  end

  it "reads from ruby fragment" do
    config = subject.read "spec/config/test_config.rb"

    expect(config[:property1]).to eq "value1"
    expect(config[:property2][:property21]).to eq "value21"
  end

  it "raises exception for unsupported type" do
    expect {
      subject.read "spec/config/test_config.pdf"
    }.to raise_exception(ArgumentError)
  end

  # it "registers and uses xml format" do
  #   require 'nokogiri'
  #   require 'active_support/core_ext/hash'
  #
  #   require 'config_file/config_file'
  #
  #   class ConfigType
  #     class Xml
  #       ConfigFile.register(self)
  #
  #       def self.extensions
  #         [".xml"]
  #       end
  #
  #       def read file_name
  #         doc = Nokogiri::XML(File.read(file_name))
  #
  #         HashWithIndifferentAccess.new Hash.from_xml(doc.to_s)
  #       end
  #     end
  #   end
  #
  #   config_file = ConfigFile.new
  #
  #   config = config_file.load("spec/config/test_config.xml")
  #
  #   p config
  # end
end
