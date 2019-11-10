class WechatWorkMarkdown
  attr_reader :content
  
  def initialize
    @content = ''
  end
  
  def as_markdown
    {
      msgtype: 'markdown',
      markdown: {
        content: content.truncate(4096)
      }
    }
  end
  
  def add_section(header, paragraph, level: 3)
    @content << "#{'#' * level} #{header}\n"
    @content << "#{paragraph}\n"
  end
  
  def add_column(title, content)
    @content << "**#{title}：**#{content}\n"
  end
 
  def add_link(name, url)
    @content << "[#{name}](#{url})"
  end

end
