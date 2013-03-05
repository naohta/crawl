require 'net/http'

url = "www.yahoo.co.jp"
res = nil
Net::HTTP.start(url,80) do |http|
  res = http.get("/")
end

p res
(res.body).each_line do |i|
  puts i
  puts
end

