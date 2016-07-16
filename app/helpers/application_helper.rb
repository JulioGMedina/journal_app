module ApplicationHelper

  def error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
      <div class="row">
        <div class="small-12 columns text-center">
          <h2>#{sentence} !!!!!</h2>
          <ul>#{messages}</ul>
        </div>
      </div>
    HTML

    html.html_safe
  end
end
