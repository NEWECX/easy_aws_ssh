require 'json'

require "easy_aws_ssh/aws_opsworks_data_helper"
include AwsOpsworksDataHelper

module EasyAwsSsh
  class OpsworksSsh

    def initialize(opsworks_stack_name:, instance_name:)
      @stack_name = opsworks_stack_name
      @instance_name = instance_name

      raise "Invalid stack name, valid stacks are: #{all_stack_names}" unless all_stack_names.include?(opsworks_stack_name)
      raise "Invalid instance name, valid instance names are: #{all_stack_instance_names}" unless all_stack_instance_names.include?(instance_name)
    end

    def ssh
      exec "ssh #{ENV.fetch('EASY_AWS_SSH_USER', 'ubuntu')}#{certificate}@#{instance_ip}"
    end

    private

    def certificate
      full_path = "#{ENV.fetch('EASY_AWS_SSH_CERTIFICATE_PATH', '~/.ssh')}/#{ssh_key_name}.pem"
      if File.exist?(full_path)
        " -i #{full_path} "
      end
    end

  end
end
