require 'spec_helper'

describe 'load_seeds' do
  let(:valid_email) { 'jan@gmail.com' }
  include_context 'rake'

  it 'raises an error when user is not found' do
    expect { subject.invoke('jan@jan.pl') }.to raise_error
  end

  it 'raises an error with no parameters' do
    expect { subject.invoke }.to raise_error
  end
end

