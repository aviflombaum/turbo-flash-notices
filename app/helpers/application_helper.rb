module ApplicationHelper
  def code_block(path, lang)
    content_tag(:pre) do
      content_tag(:code, ERB::Util.html_escape(File.read(Rails.root.join(path))), class: "language-#{lang}")
    end
  end
end
