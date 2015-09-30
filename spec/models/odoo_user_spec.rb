require 'rails_helper'

RSpec.describe OdooUser, type: :model do

  let(:user) { OdooUser.new(login: "weston") }

  it { expect(user).to validate_presence_of(:login)}
  it { expect(user).to validate_presence_of(:company_id)}

end
