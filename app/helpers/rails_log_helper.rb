module RailsLogHelper

  def simple_format_hash(hash_text, options = {})
    wrapper_tag = options.fetch(:wrapper_tag, :p)

    hash_text.map do |k, v|
      text = k.to_s + ': ' + v.to_s
      content_tag(wrapper_tag, text)
    end.join("\n\n").html_safe
  end

end