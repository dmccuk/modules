require 'spec_helper'
describe 'webapp' do

  context 'with defaults for all parameters' do
    it { should contain_class('webapp') }
  end
end
