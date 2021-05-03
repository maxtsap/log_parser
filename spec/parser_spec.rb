describe "parser" do
  def run_script!
    system "ruby parser.rb #{file_name}"
  end

  context "when there is no argument" do
    let(:file_name) { nil }

    it "outputs error message" do
      expect { run_script! }.to(
        output(a_string_including('You must provide file name'))
          .to_stdout_from_any_process
      )
    end
  end

  context "when file does not exist" do
    let(:file_name) { 'fake_file.log' }

    it "outputs error message" do
      expect { run_script! }.to(
        output(a_string_including('File not found'))
          .to_stdout_from_any_process
      )
    end
  end

  context "when file exists" do
    let(:file_name) { 'spec/fixtures/real_file.log' }

    it "doesn't output error message" do
      expect { run_script! }.to_not(
        output(a_string_including('File not found')
                 .or(a_string_including('You must provide file name')))
          .to_stdout_from_any_process
      )
    end
  end
end
