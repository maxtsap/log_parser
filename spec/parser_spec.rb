require_relative '../lib/file_parser'

describe "parser" do
  let(:file_name) { 'fake_file.log' }
  let(:mocked_result) { 'Mocked result' }

  it "outputs result of FileParser.parse" do
    ARGV.clear
    ARGV.push(file_name)

    expect(FileParser).to receive(:parse).with([file_name]).and_return(mocked_result)
    expect { load 'parser.rb' }.to(
      output(a_string_including(mocked_result))
        .to_stdout_from_any_process
    )
  end
end
