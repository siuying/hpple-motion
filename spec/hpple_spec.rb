describe "Application 'HppleMotion'" do
  def xml
    "<folder name='lib'><file name='libxml.dylib'></file><file name='libz.dylib'></file></folder>"
  end
  
  def html
    "<html><body><h1>Hello</h1><div><p>Foo</p><p>Bar</p></div><p><a href=\"http://google.com\">google</a></p></body></html>"
  end

  it "create xml and html parser" do
    parser = Hpple.XML(xml)
    parser.is_a?(TFHpple).should.be.true
    
    parser = Hpple.HTML(html)
    parser.is_a?(TFHpple).should.be.true
  end
  
  it "parse xml" do
    parser = Hpple.XML(xml)
    items = parser.xpath("/folder/file")
    items.size.should == 2

    items[0].tagName.should == "file"
    items[1].tagName.should == "file"
    items[0]["name"].should == "libxml.dylib"
    items[1]["name"].should == "libz.dylib"
  end

  it "parse html" do
    parser = Hpple.HTML(html)
    h1_items = parser.xpath("//h1")
    h1_items.size.should == 1
    h1 = h1_items.first
    h1.tag.should == "h1"
  end

  it "should parse inner_text" do
    parser = Hpple.HTML(html)
    h1 = parser.xpath("//h1").first
    h1.inner_text.should == "Hello"
    
    div = parser.xpath("//div").first
    div.inner_text.should == "FooBar"
    
    p = parser.xpath("//div/p").first
    p.inner_text.should == "Foo"
    
    p = parser.xpath("//div/p").last
    p.inner_text.should == "Bar"
  end
  
  it "should parse inner_html" do
    parser = Hpple.HTML(html)
    h1 = parser.xpath("//h1").first
    h1.inner_html.should == "Hello"
    
    div = parser.xpath("//div").first
    div.inner_html.should == "<p>Foo</p><p>Bar</p>"
    
    myhtml = parser.xpath("//html").first
    myhtml.to_html.should == html
  end
end
