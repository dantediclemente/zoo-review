require "rails_helper"

RSpec.describe StatesSeeder do
  it "doesn't create duplicate records on multiple runs" do
    StatesSeeder.seed!
    initial_count = States.count
    StatesSeeder.seed!
    expect(State.count).to eq(initial_count)
  end
end
