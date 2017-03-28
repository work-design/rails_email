module RailsLogHelper

  def js_load(filename = nil, root: Rails.root, **options)
    filename ||= "controllers/#{controller_path}/#{action_name}"
    path = root + 'app/assets/javascripts' + filename.to_s
    if File.exist?(path.to_s + '.js') || File.exist?(path.to_s + '.js.erb')
      javascript_include_tag filename, options
    end
  end

  def simple_format_hash(hash_text, options = {})
    wrapper_tag = options.fetch(:wrapper_tag, :p)

    hash_text.map do |k, v|
      text = k.to_s + ': ' + v.to_s
      content_tag(wrapper_tag, text)
    end.join("\n\n").html_safe
  end

end