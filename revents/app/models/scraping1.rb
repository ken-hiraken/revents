class Scraping1
  def self.event_blocks
    events = []
    agent = Mechanize.new
    next_url = ""

    while true
      current_page = agent.get("http://www.enjoytokyo.jp/shopping/event/list/" + next_url)
      events = current_page.search('.tab_inner div.vevent')
    #binding.pry
      next_link = current_page.at('.next a')

      events.each do |event|
      get_events(event)
      end

      break unless next_link
      next_url = next_link.get_attribute('href')
      next_url.slice!("/shopping/event/list/")
    end
  end

  def self.get_events(event)
      title = event.at('.onetxt a').inner_text if event.at('.onetxt a')
      image_url = event.at('.rl_img img')[:src] if event.at('.rl_img img')
      date = event.at('.rl_date span').inner_text if event.at('.rl_date span')
      place = event.at('.rl_shop_title a').inner_text if event.at('.rl_shop_title a')
      station = event.at('p.rl_shop_access').inner_text if event.at('p.rl_shop_access')
      detail = event.at('p.rl_maintxt').inner_text if event.at('p.rl_maintxt')
      category = "セール"

      evt = Event.where(title: title, image_url: image_url, date: date, place: place, station: station, detail: detail, category: category).first_or_initialize
      evt.save
  end
end

#以下、これまでの試行錯誤

#   def self.get_event(link)
#     agent = Mechanize.new
#     page = agent.get(link)
#     title = page.at('.entry-title').inner_text
#     image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')


#     product = Product.new(title: title, image_url: image_url)
#     product.save
#   end
# end



# class Scraping1
#   def self.get_event
#     agent = Mechanize.new
#     page = agent.get("http://www.enjoytokyo.jp/museum/event/list/")

#     title = page.search('.onetxt a').inner_text #if page.('.onetxt a')
#     binding.pry
#     image_url = page.search('.rl_img img')[:src]#.get_attribute('src')#[:src] #if page.at('.rl_img img')
#     date = page.search('.rl_date span').inner_text #if page.at('.rl_date span')
#     place = page.search('.rl_shop_title a').inner_text #if page.at('.rl_shop_title a')
#     station = page.search('p.rl_shop_access').inner_text #if page.at('p.rl_shop_access')
#     detail = page.search('p.rl_maintxt').inner_text #if page.at('p.rl_maintxt')

#     event = Event.new(title: title, image_url: image_url, date: date, place: place, station: station, detail: detail)
#     event.save
#   end
# end


# require 'mechanize'

#   agent = Mechanize.new
#   page = agent.get("http://www.enjoytokyo.jp/museum/event/list/")

#   titles = page.search(".onetxt a")
#   titles.each do |title|
#     puts title.inner_text
#   end

#    image_urls = page.search(".rl_img img")
#   image_urls.each do |image_url|
#     puts image_url.get_attribute('src')
#   end

#    dates = page.search(".rl_date span")
#   dates.each do |date|
#     puts date.inner_text
#   end

#    places = page.search(".rl_shop_title a")
#   places.each do |place|
#     puts place.inner_text
#   end

#    stations = page.search("p.rl_shop_access")
#   stations.each do |station|
#     puts station.inner_text
#   end

#    details = page.search("p.rl_maintxt")
#   details.each do |detail|
#     puts detail.inner_text
#   end