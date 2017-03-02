require 'spec_helper'
describe 'load_balancer' do

  context 'with defaults for all parameters' do
    it { should contain_class('load_balancer') }
  end
end
