module RecommendationsHelper

  def citation_line(t)
    [
      content_tag(:b, h(t.name)),
      h(t.role),
      website_or_company(t)
    ].reject{|o| o.blank?}.join(', ').sub(/,\s/, ': ')
  end

  def website_or_company(t)
    if t.company_url.blank?
      h(t.company)
    else
      content_tag(:a, h(t.company.blank? ? t.company_url : t.company), :href => h(t.company_url))
    end
  end
end

