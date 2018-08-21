require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
  it 'validates all given fields provided' do
  # name:, email:, password:, password_confirmation:
  user1 = User.new(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'123')
  expect(user1.valid?).to eq(true)
  end

  it 'validates that the passwords match' do
    user1 = User.new(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'321')
    expect(user1.valid?).to eq(false)
    expect(user1.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'validates that the email is unique' do
    user1 = User.new(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'123')
    user1.save
    user2 = User.new(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'123')

    expect(user2.valid?).to eq(false)
    expect(user2.errors.full_messages).to include("Email has already been taken")
  end

  it 'validates that the passwords has a minimum length of 3' do
    user1 = User.new(name:'Perry Mason', email:'perry@mason.com', password:'12', password_confirmation:'12')
    expect(user1.valid?).to eq(false)
    expect(user1.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
  end
end

  describe '.authenticate_with_credentials' do
  it 'validates that the normal login works' do    
    user1 = User.create(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'123')
    login_result = User.authenticate_with_credentials('perry@mason.com','123')
    expect(login_result).to eq(user1)
  end
end


# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
end