require 'digest/sha1'
require 'zlib'
require 'fileutils'

content = 'Hi LUGSB!'

header = "blob #{content.length}\0"
store = header + content
sha1 = Digest::SHA1.hexdigest(store)

zlib_content = Zlib::Deflate.deflate(store)

path = '.git/objects/' + sha1[0,2] + '/' + sha1[2,38]
FileUtils.mkdir_p(File.dirname(path))
File.open(path, 'w') { |f| f.write zlib_content }
