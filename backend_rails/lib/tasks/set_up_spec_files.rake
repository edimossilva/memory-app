# frozen_string_literal: true

require 'rspec'
require 'rspec/core/rake_task'

namespace :spec do
  task :set_up_spec_files do
    spec_files = Dir['spec/**/*_spec.rb']
    @spec_file_digests = Hash[spec_files.map { |f| [f, Zlib.crc32(f)] }]
  end

  RSpec::Core::RakeTask.new(:sliced, %i[index concurrency] => :set_up_spec_files) do |t, args|
    index = args[:index].to_i
    concurrency = args[:concurrency].to_i
    t.pattern = @spec_file_digests.select { |_f, d| d % concurrency == index }.keys
  end
end
