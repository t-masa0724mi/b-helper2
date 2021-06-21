require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'contentが空では保存できないこと' do
      @message.content = ''
      @message.valid?
      expect(@message.errors.full_messages).to include("Contentを入力してください")
    end 
  end   
end
