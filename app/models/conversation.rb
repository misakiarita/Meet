class Conversation < ApplicationRecord
    # 会話はどのUserが作成しているか、どのPet(案件)に属しているか
    belongs_to :user
    belongs_to :pet
    # 一つの会話はメッセージをたくさん含む一対多。作成された会話には複数人のMember(conversation_idを持ったuser)なので一対多。
    has_many :messages, dependent: :destroy
    has_many :members, dependent: :destroy
end
