require_relative '../../../lib/parsers/null'
require_relative '../../../lib/visiting_statistic'

describe Parser::Null do
  it "returns instance of VisitingStatistic" do
    expect(Parser::Null.process('')).to be_a(VisitingStatistic)
  end
end
