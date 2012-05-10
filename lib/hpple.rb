module Hpple
  module_function
  
  def XML(xml, encoding=NSUTF8StringEncoding)
    if xml.is_a?(NSString)
      xml = xml.dataUsingEncoding(encoding)
    end
    TFHpple.hppleWithXMLData(xml)
  end

  def HTML(html, encoding=NSUTF8StringEncoding)
    if html.is_a?(NSString)
      html = html.dataUsingEncoding(encoding)
    end
    TFHpple.hppleWithHTMLData(html)
  end

end

class TFHpple
  def xpath(query)
    searchWithXPathQuery(query)
  end
end

class TFHppleElement
  def tag
    self.tagName
  end

  def [](key)
    self.objectForKey(key)
  end
  
  def text
    self.inner_text
  end

  def inner_text
    return self.content if self.content
    return self.children.collect do |sub_node|
      sub_node.inner_text
    end.join("")
  end

  def inner_html
    return self.children.map do |sub_node|
      sub_node.to_html
    end.join
  end
  
  # a hack to return html
  def to_html
    if self.content
      self.content
    else
      tags_fragments = []
      tags_fragments << "<#{self.tag}"
      self.attributes.each do |key, value|
        value = value.gsub('"', '&quot;')
        tags_fragments << "#{key}=\"#{value}\""
      end
      tags_fragments.join(" ") + ">" + self.inner_html + "</#{self.tag}>"
    end
  end

  def to_s
    if self.content
      self.content
    else
      self.inner_text
    end
  end
end