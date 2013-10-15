# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classification do
    review_panel "MyString"
    medical_speciality "MyString"
    product_code "MyString"
    device_generic_name "MyString"
    device_class 1
    unclassified_reason_code "MyString"
    gmp_exempt_flag "MyString"
    third_party_review_eligible "MyString"
    third_party_review_code "MyString"
    regulation_number "MyString"
    submission_type_id "MyString"
    definition "MyText"
    physical_state "MyString"
    technical_method "MyString"
    target_area "MyText"
  end
end
