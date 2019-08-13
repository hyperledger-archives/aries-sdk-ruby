abort "Rust compiler required (https://www.rust-lang.org/)" if `which rustc`.empty?

File.open("Makefile", "wb") do |f|

  f.puts(<<EOD)
all:
\tbundle --deployment --path vendor/bundle
\tbundle exec rake
clean:
install:
\trm -r vendor/bundle target
EOD

end
