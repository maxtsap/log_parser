require_relative '../lib/visiting_statistic'

describe VisitingStatistic do
  subject(:statistic) { VisitingStatistic.new }
  let(:parsed_results) do
    [
      '/help_page/1' => ['126.318.035.038', '126.318.035.038'],
      '/contact' => ['184.123.665.067']
    ]
  end

  before do
    parsed_results.each do |visit|
      subject.add(visit)
    end
  end

  it "returns uniq views" do
    expect(subject.uniq_views).to eq([['/contact', 1], ['/help_page/1', 1]])
  end

  it "returns total visits" do
    expect(subject.total_visits).to eq([['/help_page/1', 2], ['/contact', 1]])
  end
end
