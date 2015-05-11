require "rails_helper"

describe ApplicationHelper do
  describe "#markdown" do
    it "parses markdown to html" do
      content = %Q{###Test Title

      And body}
      output = helper.markdown(content)
      expect(output).to eq("<h3>Test Title</h3>\n\n<p>And body</p>\n")
    end
  end
end
