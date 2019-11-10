class WechatWorkMarkdown
  attr_reader :content
  
  def initialize
    @content = ''
  end
  
  
  def markdown
  
  end
  
  def add_section(header, paragraph, level: 3)
    @content << "#{'#' * level} #{header}"
    @content << "\n"
    @content << "#{paragraph}"
  end
  
  def add_link(
  
  )
  end

end
