FactoryBot.define do

  factory :log_record do
    path { 'MyString' }
    controller_name { 'MyString' }
    action_name { 'MyString' }
    exception { 'MyString' }
    exception_object { 'MyString' }
    exception_backtrace { ['MyText'] }
  end

end
