require 'htmlentities'
require 'slugize'

module Jekyll
  class GuideGenerator < Generator
    priority :highest

    def initialize(config)
      logger.warn("Generating guides")
    end

    def generate(site)
      @site = site
      site.collections['guides'].docs.each do |guide|
        group = find_group(guide)
        guide.data['group_data'] = group
        unless group.nil?
          group['guides'] << {
              'title' => guide.data['title'],
              'url' => guide.url,
              'summary' => guide.data['summary']
          }
        end
      end

      site.data['guides'] = [] if site.data['guides'].nil?

      site.data['guides'].each do |id, group|
        group['url'] = "/guides/#{id}"
      end
    end

    def find_group(guide)
      @site.data['guides'].each do |id, group|
        if id == guide.data['category']
          group['guides'] = [] if group['guides'].nil?
          return group
        end
      end
      nil
    end
  end
end