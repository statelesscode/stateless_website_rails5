module ApplicationHelper

  # http://davidlesches.com/blog/titles-and-seo-tags-for-rails-5-a-better-way
  # Written by David Lesches
  def title override = nil
    meta_or_override :title, override
  end

  def meta_keywords override = nil
    meta_or_override :keywords, override
  end

  def meta_description override = nil
    meta_or_override :description, override
  end


  private

  def page_key
    [ controller_name, action_name ].join('_').to_sym
  end

  def meta_or_override type, override
    if override
      content_for(type, override)
      return
    end

    if content_for?(type)
      content_for(type)
    else
      t "meta.#{page_key}.#{type}", default: t("meta.default.#{type}")
    end
  end  
end
