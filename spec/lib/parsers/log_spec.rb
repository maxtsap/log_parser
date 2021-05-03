require_relative '../../../lib/parsers/log'
require_relative '../../../lib/visiting_statistic'

describe Parser::Log do
  let(:file_name) { 'spec/fixtures/real_file.log' }

  it "returns instance of VisitingStatistic" do
    expect(Parser::Log.process(file_name)).to be_a(VisitingStatistic)
  end

  it "adds parsed results to VisitingStatistic" do
    statistic = double(add: nil)
    aggregator_double = double(new: statistic)

    expect(statistic)
      .to receive(:add).with('/help_page/1' => '126.318.035.038').twice
    expect(statistic)
      .to receive(:add).with('/contact' => '184.123.665.067').once

    Parser::Log.new(file_name, aggregator_double).process
  end
end
