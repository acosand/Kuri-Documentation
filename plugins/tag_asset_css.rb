class TagAssetCss < Liquid::Tag
  def initialize(tag_name, text, tokens)
    super
    @text = text
  end

  def render(context)
    style = context[@text]
    site = context.registers[:site]
    unless %r(^//).match(style)
      style = "#{site.config['asset_path']}/css/#{style}.css"
    end
    "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{style}\">"
  end
end
Liquid::Template.register_tag('asset_css', TagAssetCss)