require_relative '../../lib/file_parser'
require_relative '../../lib/factories/parser_factory'

describe FileParser do
  subject(:parse_file) { FileParser.parse(args) }

  let(:args) { [] }

  it { is_expected.to eq('You must provide file name') }

  context "when file does not exist" do
    let(:args) { ['fake_file.log'] }

    it { is_expected.to eq('File not found') }
  end

  context "when file exists" do
    let(:file_name) { 'spec/fixtures/real_file.log' }
    let(:args) { [file_name] }
    let(:parser_double) { double(process: 'mocked result') }

    before do
      allow(ParserFactory).to receive(:get).and_return(parser_double)
    end

    it { is_expected.to_not eq('File not found') }
    it { is_expected.to_not eq('You must provide file name') }

    it "calls ParserFactory.get" do
      expect(ParserFactory).to(
        receive(:get).with(file_name).and_return(parser_double)
      )
      parse_file
    end

    it "calls .process on ParserFactory.get result" do
      expect(parser_double).to receive(:process).with(file_name)
      parse_file
    end

    it "returns result of parser's .process" do
      expect(subject).to eq('mocked result')
    end
  end
end
