# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device_review do
    content "MyText"
    user_id 1
    medicaldevice_id ""
  end
end
