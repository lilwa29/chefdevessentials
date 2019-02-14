
require 'spec_helper'

describe 'devessentials::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:conf) do
      { platform: 'ubuntu', version: '14.04' }
    end

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(conf)
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs package httpd' do
      expect(chef_run).to install_package 'httpd'
    end

    it 'enables service httpd' do
        expect(chef_run).to enable_service 'httpd'
    end

    it 'starts service httpd' do
      expect(chef_run).to start_service 'httpd'
    end
  end
end
