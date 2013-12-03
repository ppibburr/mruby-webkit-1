require "fileutils"

if ARGV.length > 0
  puts "Writes YARD documentation to ./doc"
  exit(1)
end

FileUtils.mkdir_p d="./tmp/dummy_source"

Dir.chdir d

File.open "document.rb", "w" do |f|
  f.puts DATA.read
end

system "mruby document.rb"
system "yard doc webkit*.rb"

# FileUtils.rm_f "../../doc"
`rm -rf ../../doc`
FileUtils.mv "doc", "../../"

Dir.chdir "../../"
`rm -rf tmp`

__END__
dg = DocGen.new(WebKit)
ns = dg.document()

YARDGenerator.generate(ns)
