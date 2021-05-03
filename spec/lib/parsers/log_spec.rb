require_relative '../../../lib/parsers/log'

describe Parser::Log do
  let(:file_name) { 'spec/fixtures/real_file.log' }

  it "returns processed results" do
    expect(Parser::Log.process(file_name)).to eq(
      {
        '/help_page/1' => ['126.318.035.038', '126.318.035.038'],
        '/contact' => ['184.123.665.067']
      }
    )
  end
end
