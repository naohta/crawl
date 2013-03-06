#encode:utf-8
require 'net/http'
require 'digest/md5'
require 'lhalib'
require 'nkf'
require 'shell'

DOWNLOAD_DIR = "downloaded/"
Net::HTTP.version_1_2
url = "www.acis.famic.go.jp"

res = nil
Net::HTTP.start(url,80) do |http|
  res = http.get("/ddata/data/%E7%99%BB%E9%8C%B2%E5%9F%BA%E6%9C%AC%E9%83%A8.lzh")
end

file_name = "#{DOWNLOAD_DIR}kihonbu_xls.lzh"
if(!File.exist?(DOWNLOAD_DIR)) then Dir.mkdir(DOWNLOAD_DIR) end
File.open(file_name,"wb") do |f|
  f.print res.body
end
puts Digest::MD5.file(file_name).hexdigest

LhaLib::x(file_name) do |info|
  puts info
  puts NKF.guess info[:name]
  system "mv #{info[:name]} #{DOWNLOAD_DIR}kihon_bu.xls"
end

cmd = "echo hi!"
`#{cmd}`

system "ls"
p "yay!"
exec "#{cmd}"
p "wow!"
