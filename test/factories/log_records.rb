FactoryBot.define do
  factory :log_record do
    id 1
    path "MyString"
    controller "MyString"
    action "MyString"
    params {}
    headers {}
    cookie {}
    session {}
    exception "MyString"
    exception_object "MyString"
    exception_backtrace "MyText"
    created_at "2018-05-04 11:21:47"
    updated_at "2018-05-04 11:21:47"
  end
end
