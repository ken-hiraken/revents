require 'mechanize'

agent = Mechanize.new
page = agent.get ("http://r.gnavi.co.jp/area/tokyo/rs/?fwr=%E3%82%BF%E3%82%A4%E8%AA%9E&fwp=%E6%9D%B1%E4%BA%AC&fw=%E3%82%BF%E3%82%A4%E8%AA%9E&redp=%E6%9D%B1%E4%BA%AC&redf=1")

page.search('.search-result-cassette__headline-text-wrapper a').each do |ele|
  puts ele.inner_text
end