FactoryBot.define do
  
  factory :log_csp do
    document_uri { 'MyString' }
    referrer { 'MyString' }
    violated_directive { 'MyString' }
    effective_directive { 'MyString' }
    original_policy { 'MyString' }
    disposition { 'MyString' }
    blocked_uri { 'MyString' }
    line_number { 'MyString' }
    column_number { 'MyString' }
    source_file { 'MyString' }
    status_code { 'MyString' }
    script_sample { 'MyString' }
  end
  
end
