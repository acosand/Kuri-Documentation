require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet # yep, that's it.
end

module Jekyll
  module Converters
    class Markdown::CustomMarkdownParser
      def intialize(config)
        @site_config = config
      end

      def convert(content)
        content = '' if content.nil?
        md = CustomMarkdown.new(@site_config)
        Redcarpet::Markdown.new(md,
                                fenced_code_blocks: true,
                                autolink: true,
                                tables: true,
                                no_intra_emphasis: true,
                                strikethrough: true,
                                highlight: true).render(content)
      end

      class CustomMarkdown < Redcarpet::Render::HTML
        def initialize(config)
          @site_config = config
          super()
        end

        def preprocess(document)
          process_double_backticks(document)
          document
        end

        def header(text, header_level)
          id = text.slugize
          str = "<h#{header_level} id=\"#{id}\" class=\"anchor\">"
          str += text
          str += "</h#{header_level}>"
        end

        private

        def process_double_backticks(document)
          document.gsub!(/([^`]+|\A)``([^`]+)``/) do |str|
            symbol = parse_symbol(Regexp.last_match[2])
            entry = lookup(symbol)
            if entry.nil?
              Jekyll.logger.warn('Backtick Warning:', "Could not find symbol '#{Regexp.last_match[2]}'")
              str
            else
              symbol_str = Regexp.last_match[2]
              "#{Regexp.last_match[1]}[`#{symbol_str}`]#{backtick_link(entry)}"
            end
          end
        end

        def backtick_link(symbol)
          "(#{symbol[:url]} \"DOOCS:#{symbol[:name]}\")"
        end

        def parse_symbol(str)
          match = /^([\w_:\.\_]*)/.match(str)
          name = match[2]
          return name
        end

        def lookup(name)
          return nil if name.nil?
          @site_config[:reference][:symbols].find do |symbol|
            symbol[:name].downcase == name.downcase
          end
        end
      end
    end
  end
end