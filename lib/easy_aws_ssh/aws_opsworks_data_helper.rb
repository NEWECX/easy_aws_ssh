module AwsOpsworksDataHelper

  def stack_instance_data
    @stack_instance_data ||= JSON.parse(`aws opsworks describe-instances --stack-id=#{stack_id}`)['Instances']
  end

  def instance_data
    stack_instance_data.find{|data| data['Hostname'] == @instance_name}
  end

  def instance_ip
    instance_data['PublicIp']
  end

  def ssh_key_name
    instance_data['SshKeyName']
  end

  def all_stack_instance_names
    stack_instance_data.map{|data| data['Hostname']}
  end

  def all_stack_names
    stack_data.map{|s| s['Name']}.sort
  end

  def stack_data
    @stack_data = JSON.parse(`aws opsworks describe-stacks`)['Stacks']
  end

  def stack_id
    stack = stack_data.select{|s| s['Name'].downcase == @stack_name.downcase}.first
    if stack
      stack['StackId']
    else
      raise "Stack not found.  Available opsworks stacks: #{all_stack_names}"
    end
  end
end
