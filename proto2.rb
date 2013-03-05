#encode:utf-8
require 'net/http'

url = "www.acis.famic.go.jp"

res = nil
Net::HTTP.start(url,80) do |http|
  res = http.get("/ddata/data/%E7%99%BB%E9%8C%B2%E5%9F%BA%E6%9C%AC%E9%83%A8.lzh")
end

p res

File.open("kihonbu_xls.lzh","wb") do |f|
  f.print res.body
end
