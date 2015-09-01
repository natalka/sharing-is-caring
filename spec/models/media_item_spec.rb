require 'spec_helper'

describe MediaItem do
  it 'should not be published be default' do
    expect(User.new).to_not be_published
  end

  it { should validate_presence_of :source_link }
end
