module Jekyll
  class ReferenceGenerator < Generator
    priority :high

    def generate(site)
      @site = site
      @reference = {
          symbols: [],
          pages: [],
          tree: {}
      }
      Jekyll.logger.info('Reference Generation:', 'Generating pages...')
      generate_reference
      render_pages
      Jekyll.logger.info('Reference Generation:', 'Done.')
      set_data
    end

    private

    def generate_reference

    end

    def render_pages
      @reference[:pages].each { |page| @site.pages << page }
    end

    def set_data
      @site.config[:reference] = @reference
      @site.data['reference'] = @reference
      @site.data['reference_tree'] = JSON.parse(JSON.dump(@reference[:tree]))
      @site.data['symbols'] = JSON.parse(JSON.dump(@reference[:symbols]))
    end

    def load_data(reference, type)
      @reference[:tree][type] = []
      reference.load_symbols(@reference[:symbols])
      reference.create_pages(@reference[:pages])
      reference.build_tree(@reference[:tree][type])
    end
  end
end