# For sitemap_generator

every 5.days, :at => '5:00 am' do
  rake "-s sitemap:refresh"
end