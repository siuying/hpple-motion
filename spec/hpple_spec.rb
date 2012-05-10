describe "Application 'HppleMotion'" do
  def xml
    "<folder name='lib'><file name='libxml.dylib'></file><file name='libz.dylib'></file></folder>"
  end
  
  def html
    %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><body><h1>Hello</h1><div><p>Foo</p><p>Bar</p></div><p><a href="http://google.com">google</a></p></body></html>"}
  end

  it "create xml and html parser" do
    doc = Hpple.XML(xml)
    doc.is_a?(TFHpple).should.be.true
    
    doc = Hpple.HTML(html)
    doc.is_a?(TFHpple).should.be.true
  end
  
  it "parse xml" do
    doc = Hpple.XML(xml)
    items = doc.xpath("/folder/file")
    items.size.should == 2

    items[0].tagName.should == "file"
    items[1].tagName.should == "file"
    items[0]["name"].should == "libxml.dylib"
    items[1]["name"].should == "libz.dylib"
  end

  it "parse html" do
    doc = Hpple.HTML(html)
    h1_items = doc.xpath("//h1")
    h1_items.size.should == 1
    h1 = h1_items.first
    h1.tag.should == "h1"
    
    link = doc.xpath("//a").first
    link["href"].should == "http://google.com"
  end

  it "should parse inner_text" do
    doc = Hpple.HTML(html)
    h1 = doc.xpath("//h1").first
    h1.inner_text.should == "Hello"
    
    div = doc.xpath("//div").first
    div.inner_text.should == "FooBar"
    
    p = doc.xpath("//div/p").first
    p.inner_text.should == "Foo"
    
    p = doc.xpath("//div/p").last
    p.inner_text.should == "Bar"
  end
  
  it "should parse inner_html" do
    doc = Hpple.HTML(html)
    h1 = doc.xpath("//h1").first
    h1.inner_html.should == "Hello"
    
    div = doc.xpath("//div").first
    div.inner_html.should == "<p>Foo</p><p>Bar</p>"
    
    myhtml = doc.xpath("//html").first
    myhtml.to_html.should == "<html><body><h1>Hello</h1><div><p>Foo</p><p>Bar</p></div><p><a href=\"http://google.com\">google</a></p></body></html>"
  end
end
