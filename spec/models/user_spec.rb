RSpec.describe User, type: :model do

  subject {
    described_class.new(first_name: "John", last_name: "Smith", email: "testing@TESTING.COM", password_confirmation: "12345678", password: "12345678")
  }

  describe 'Validations' do

    it "must not have an empty password and password_confirmation fields" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).not_to be_valid
    end

    it "must not have an empty password" do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it "must NOT match the password and password_confirmation fields" do
      subject.password_confirmation = "lkajsdf"
      expect(subject).not_to be_valid
    end

    it "must have NOT a password valid length" do
      subject.password = "123456"
      subject.password_confirmation = "123456"
      expect(subject).not_to be_valid
    end

    it "must NOT have a valid password length" do
      subject.password = "123456"
      expect(subject).not_to be_valid
    end
    it "must have a valid password before creating" do
      subject.password = "1234567890"
      subject.password_confirmation = "1234567890"
      expect(subject).to be_valid
    end


    it "emails must be unique and not case sensitive" do
      new_user = User.create(first_name: "John", last_name: "Smith", email: "TesTing@testing.COM", password_confirmation: "12345678", password: "12345678")
  
      expect(subject).not_to be_valid
    end

    it "must have first name, last name" do 
      expect(subject).to be_valid
    end

    it "must not have any white spaces before" do
      new_user = User.create(first_name: "John", last_name: "Smith", email: "  TesTing@testing.COM  ", password_confirmation: "12345678", password: "12345678")

      

      expect(new_user).not_to be_valid
    end
  end



  describe '.authenticate_with_credentials' do
    it "must be valid if the password is correct" do
      user = User.create(first_name: "John", last_name: "Smith", email: "3@com", password_confirmation: "12345678", password: "12345678")

      session = User.authenticate_with_credentials("3@com", "12345678")

      expect(session).to eq user
    end
  end

end