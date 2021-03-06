require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(id: 7, name: "MICROSOFT") }

  subject {
    described_class.new(name: "WHATSUP", price_cents: 10.00, quantity: 4, category_id: category.id)
  }

  describe 'Validations' do

    it "should have all the attributes" do
      expect(subject).to be_valid
    end

    it "should have not have a valid name" do
      subject.name = nil;
      expect(subject).to_not be_valid
    end
    it "should have not have a price" do
      subject.price_cents = nil;
      expect(subject).to_not be_valid
    end

    it "should have no quantities" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "should have not have a category" do
      subject.category = nil;
      expect(subject).to_not be_valid
    end

  end
end