require_relative '../../lib/file_parser'

describe FileParser do
  subject(:file_parser) { FileParser.parse(args) }

  let(:args) { [] }

  it { is_expected.to eq('You must provide file name') }

  context "when file does not exist" do
    let(:args) { ['fake_file.log'] }

    it { is_expected.to eq('File not found') }
  end

  context "when file exists" do
    let(:args) { ['spec/fixtures/real_file.log'] }

    it { is_expected.to_not eq('File not found') }
    it { is_expected.to_not eq('You must provide file name') }
  end
end
