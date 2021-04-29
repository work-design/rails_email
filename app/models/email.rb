module Email

  def self.use_relative_model_naming?
    true
  end

  def self.table_name_prefix
    'email_'
  end

end
