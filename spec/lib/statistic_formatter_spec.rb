require_relative '../../lib/statistic_formatter'
require_relative '../../lib/visiting_statistic'

describe StatisticFormatter do
  subject(:formatter) { StatisticFormatter.new(statistic) }

  let(:statistic) do
    double(
      uniq_views: [['/contact', 1], ['/help_page/1', 1]],
      total_visits: [['/help_page/1', 2], ['/contact', 1]]
    )
  end

  it "returns formatted statistic" do
    expect(formatter.output).to eq(
      [
        '/help_page/1 2 total visits',
        '/contact 1 total visits',
        '/contact 1 unique views',
        '/help_page/1 1 unique views'
      ].join("\n")
    )
  end
end
