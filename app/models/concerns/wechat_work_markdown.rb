class WechatWorkMarkdown
  attr_reader :content
  
  def initialize
    @content = ''
  end
  
  def as_markdown
    {
      msgtype: 'markdown',
      markdown: {
        content: content
      }
    }
  end
  
  def add_paragraph(content)
    @content
  end
  
  def add_section(header, paragraph, level: 3)
    @content << "#{'#' * level} #{header}\n"
    @content << "#{paragraph}\n"
  end
  
  def add_column(title, content)
    @content << "**#{title}：**#{content}\n"
  end
 
  def link_more(name, url)
    text = "\n[#{name}](#{url})"
    truncate_length = 4096 - text.bytesize

    @content = @content.truncate_bytes(truncate_length) + text
  end

end
