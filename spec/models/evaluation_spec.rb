require 'rails_helper'
RSpec.describe '評価モデル機能', type: :model do
  before do
    user = FactoryBot.create(:second_user)
    @current_user = User.find_by(email: "user2@gmail.com")
  end
  describe 'バリデーションのテスト' do
    context '評価が空の場合' do
      it 'バリデーションにひっかる' do
        evaluation= Evaluation.create(point: '', evaluation_comment: '失敗テスト', user_id: @current_user.id)
        expect(evaluation).not_to be_valid
      end
    end
  end

  describe 'バリデーションのテスト' do
    context '評価が記入されているの場合' do
      it 'バリデーションにひっかからない' do
        evaluation= Evaluation.create(point: 5, evaluation_comment: '失敗テスト', user_id: @current_user.id)
        expect(evaluation).to be_valid
      end
    end
  end

end