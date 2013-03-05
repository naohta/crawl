#encode:utf-8
require '
require 'net/http'
require 'lhalib'

url = "www.acis.famic.go.jp"

res = nil
Net::HTTP.start(url,80) do |http|
  res = http.get("/ddata/data/%E7%99%BB%E9%8C%B2%E5%9F%BA%E6%9C%AC%E9%83%A8.lzh")
end

file_name = "./downloaded/kihonbu_xls.lzh"
File.open(file_name,"wb") do |f|
  f.print res.body
end

LhaLib::x(file_name)
