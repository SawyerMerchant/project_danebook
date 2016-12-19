FactoryGirl.define do
  factory :photo do
    
  end

  factory :user, aliases: [:author] do
    sequence(:email) { |n| "foouser#{n}@email.com"}
    password "password"
    # after(:create) do |user|
    #   create(:profile, user: user)
    # end

    trait :with_profile do
      # after(:create) do |user|
      #   create(:profile, user: user)
      # end
      # association :profile, factory: :profile
    end
  end

  factory :profile do
    college "FooU"
    hometown "Denverville"
    currentlylives "Tampaburg"
    telephone "555.555.5555"
    words "Deep stuff goes here"
    about "More stuff"
    first_name "Merf"
    last_name "Fergeson"
    birthday (Date.today - 20.years)
    gender "ale"
    user
  end

  factory :post do
    body  "Foo Paragraph"
    # association :author, factory: :user
    user
  end

end



#
# create_table "profiles", force: :cascade do |t|
#   t.string   "college"
#   t.string   "hometown"
#   t.string   "currentlylives"
#   t.string   "telephone"
#   t.text     "words"
#   t.text     "about"
#   t.string   "first_name",                     null: false
#   t.string   "last_name",                      null: false
#   t.date     "birthday"
#   t.string   "gender"
#   t.integer  "user_id"
#   t.datetime "created_at",                     null: false
#   t.datetime "updated_at",                     null: false
#   t.boolean  "updated",        default: false
#   t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
# end
