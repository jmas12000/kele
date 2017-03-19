require "spec_helper"

RSpec.describe Kele do
  it "has a version number" do
    expect(Kele::VERSION).not_to be nil
  end
  
  it "has a Auth error" do
    expect(Kele::InvalidCredentialsError).not_to be nil
  end
end
