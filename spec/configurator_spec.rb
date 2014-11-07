require File.expand_path('spec_helper', File.dirname(__FILE__))

require 'config_file'

describe ConfigFile do

  it "reads from yaml" do
    config = subject.load "spec/config/test_config.yaml"

    expect(config['property1']).to eq "value1"
    expect(config['property2']['property21']).to eq "value21"
  end

  it "reads from json" do
    config = subject.load "spec/config/test_config.json"

    expect(config['property1']).to eq "value1"
    expect(config['property2']['property21']).to eq "value21"
  end

  it "reads from ruby fragment" do
    config = subject.load "spec/config/test_config.rb"

    expect(config[:property1]).to eq "value1"
    expect(config[:property2][:property21]).to eq "value21"
  end
end
