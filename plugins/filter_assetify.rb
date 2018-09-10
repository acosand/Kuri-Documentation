module FilterAssetify
  def assetify(input)
    asset_path = @context.registers[:site].config['asset_path']
    %r{^/[^/]}.match(input) ? (asset_path + input) : input
  end
end
Liquid::Template.register_filter(FilterAssetify)