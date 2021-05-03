require_relative '../../../lib/factories/parser_factory'
require_relative '../../../lib/parsers/null'

describe ParserFactory do
  context "when file extension is unknown" do
    let(:file_name) { 'some_file' }

    it "returns Parser::Null" do
      expect(ParserFactory.get(file_name)).to eq(Parser::Null)
    end
  end

  context "when file extension is log" do
    let(:file_name) { 'some_file.log' }

    it "returns Parser::Null" do
      expect(ParserFactory.get(file_name)).to eq(Parser::Log)
    end
  end
end
