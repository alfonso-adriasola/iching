# frozen_string_literal: true

task default: :test
task :test do
  Dir.glob('./test/*_test.rb').each { |file| require file }
end
