# frozen_string_literal: true

begin
  require 'bundler/gem_tasks'
rescue LoadError
  warn $ERROR_INFO.message
end

readme_src = File.expand_path('../../README.md', __dir__)
readme_dst = File.expand_path('../README.md', __dir__)

namespace :readme do
  task :copy do
    cp readme_src, readme_dst
  end

  task :clean do
    rm readme_dst if File.exist?(readme_dst)
  end
end

Rake::Task['build'].enhance(['readme:copy']) do
  Rake::Task['readme:clean'].invoke
end
