require "fileutils"

if ARGV.length > 0
  puts "Writes YARD documentation to ./doc"
  exit(1)
end

unless `mruby -e "puts WebKit::MAJOR_VERSION"`.split("\n").last.to_i == 1
  puts "ABORT: WebKit version != 1.x"
  exit(127)
end

od = File.expand_path(Dir.getwd)
`rm -rf doc`
Dir.chdir("../mruby-girffi-docgen-html/")
exit(127) unless system "ruby bin/docgen --lib=WebKit"
`cp -rf ./tmp/doc #{od}/`
`rm -rf ./tmp`
