require 'mechanize'

agent = Mechanize.new
page = agent.get ("http://mooovi.tech-camp.in/works/third_scraping")

page.search('.etc div').each do |ele|
  puts ele.inner_text
end