module Docs
  class Feathers
    class CleanHtmlFilter < Filter
      def call
        @doc = at_css('.page-inner section')

        css('#edit-link', 'hr').remove

        if root_page?
          css('a[target]').each do |node|
            node.remove_attribute('target') unless node['href'].start_with?('http')
          end
        end

        css('h1 > code').each do |node|
          node.before(node.children).remove
        end

        css('pre > code').each do |node|
          node.parent['data-language'] = node['class'][/lang-(\w+)/, 1] if node['class']
          node.parent.content = node.parent.content
        end

        doc
      end
    end
  end
end
