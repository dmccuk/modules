require 'spec_helper'
describe 'sudoers' do

  context 'with defaults for all parameters' do
    it { should contain_class('sudoers') }
  end
end
