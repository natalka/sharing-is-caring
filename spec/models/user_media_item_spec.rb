require 'spec_helper'

describe UserMediaItem do
  it { should belong_to :user }
  it { should belong_to :media_item }
end
