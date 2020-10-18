class SimpleCovMerger
  def self.report_coverage(base_dir:, ci_project_path:, project_path:)
    new(base_dir: base_dir, ci_project_path: ci_project_path, project_path: project_path).merge_results
  end

  attr_reader :base_dir, :ci_project_path, :project_path

  def initialize(base_dir:, ci_project_path:, project_path:)
    @base_dir = base_dir
    @ci_project_path = ci_project_path
    @project_path = project_path
  end

  def merge_results
    require 'simplecov'
    require 'json'

    SimpleCov.filters = []

    results = resultsets.map do |file|
      hash_result = JSON.parse(clean(File.read(file)))
      SimpleCov::Result.from_hash(hash_result)
    end.flatten

    result = SimpleCov::ResultMerger.merge_results(*results)
    puts "Current coverage is #{result.covered_percent}%"

    SimpleCov::ResultMerger.store_result(result)
  end

  private

  def resultsets
    Dir["#{base_dir}/*.json"]
  end

  def clean(results)
    results.gsub(ci_project_path, project_path)
  end
end

SimpleCovMerger.report_coverage(
  base_dir: './input',
  ci_project_path: '/app/app',
  project_path: './../backend_rails/app'
)
