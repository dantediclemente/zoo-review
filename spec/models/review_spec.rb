require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to have_valid(:rating).when('1')}
  it { is_expected.to_not have_valid(:rating).when( nil, '', 'a', '0')}
  it { is_expected.to have_valid(:user_id).when('1')}
  it { is_expected.to have_valid(:zoo_id).when('1')}
  it { is_expected.to_not have_valid(:user_id).when('')}
  it { is_expected.to_not have_valid(:zoo_id).when('')}
end
