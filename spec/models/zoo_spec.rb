require 'rails_helper'

RSpec.describe Zoo, type: :model do
  it { is_expected.to have_valid(:name).when('Big Zoo') }
  it { is_expected.to have_valid(:address).when('23 Somesher Road') }
  it { is_expected.to have_valid(:city ).when('Boston') }
  it { is_expected.to have_valid(:state).when('MA') }
  it { is_expected.to have_valid(:zip).when('01234') }
  it { is_expected.to_not have_valid(:name).when(nil, '') }
  it { is_expected.to_not have_valid(:address).when(nil, '') }
  it { is_expected.to_not have_valid(:city).when(nil, '') }
  it { is_expected.to_not have_valid(:state).when(nil, '') }
  it { is_expected.to_not have_valid(:zip).when(nil, '', '0987654', 'letters') }
  it { is_expected.to_not have_valid(:user_id).when('') }
end
