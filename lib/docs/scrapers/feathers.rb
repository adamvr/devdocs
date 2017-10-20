module Docs
  class Feathers < UrlScraper
    self.type = 'feathers'
    self.release = '2.2.2'
    self.base_url = 'https://docs.feathersjs.com'
    self.root_path = '/index.html'
    self.links = {
      home: 'https://feathersjs.com',
      code: 'https://github.com/feathersjs/feathers/'
    }

    html_filters.push 'feathers/entries', 'feathers/clean_html'

    options[:attribution] = <<-HTML
      &copy; 2015&ndash;2017 Feathers Contributors<br>
      Licensed under the MIT License.
    HTML
  end
end
