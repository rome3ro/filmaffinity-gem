module Constants
  def self.query_params
    {
      genre: 'genre=%s&',
      country: 'country=%s&',
      from_year: 'fromyear=%i&',
      to_year: 'toyear=%i&',
      no_doc: 'nodoc&',
      no_tv: 'notvse&'
    }
  end

  def self.urls
    {
      top: "https://www.filmaffinity.com/#{lang}/topgen.php%s",
      search_by_title: "https://www.filmaffinity.com/#{lang}/search.php?stext=%s&stype=title",
      movie: "https://www.filmaffinity.com/#{lang}/film%i.html"
    }
  end

  def self.tags
    {

      title: { EN: '#main-title span',
               ES: '#main-title span',
               MX: '#main-title span'
      },

      year: { EN: 'dd[itemprop="datePublished"]',
              ES: 'dd[itemprop="datePublished"]',
              MX: 'dd[itemprop="datePublished"]'
      },

      duration: { EN: 'dd[itemprop="duration"]',
                  ES: 'dd[itemprop="duration"]',
                  MX: 'dd[itemprop="duration"]'
      },

      country: { EN: '#country-img',
                 ES: '#country-img',
                 MX: '#country-img'
      },

      director: { EN: 'a[itemprop="url"]',
                  ES: 'a[itemprop="url"]',
                  MX: 'a[itemprop="url"]'
      },

      music: { EN: 'dt:contains("Music")',
               ES: 'dt:contains("Music")',
               MX: 'dt:contains("Music")'
      },

      company: { EN: 'dt:contains("Producer")',
                 ES: 'dt:contains("Productora")',
                 MX: 'dt:contains("Productora")'
      },

      script: { EN: 'dt:contains("Screenwriter")',
                ES: 'dt:contains("Guion")',
                MX: 'dt:contains("Guion")'
      },

      photography: { EN: 'dt:contains("Cinematography")',
                     ES: 'dt:contains("Fotografía")',
                     MX: 'dt:contains("Fotografía")'
      },

      cast: { EN: 'span[itemprop="actor"]',
              ES: 'span[itemprop="actor"]',
              MX: 'span[itemprop="actor"]'
      },

      cast_each: { EN: 'span[itemprop="name"]',
                   ES: 'span[itemprop="name"]',
                   MX: 'span[itemprop="name"]'
      },

      genre: { EN: 'dt:contains("Genre")',
               ES: 'dt:contains("Género")',
               MX: 'dt:contains("Género")'
      },

      sinopsis: { EN: 'dd[itemprop="description"]',
                  ES: 'dd[itemprop="description"]',
                  MX: 'dd[itemprop="description"]'
      },

      rating: { EN: 'div[itemprop="ratingValue"]',
                ES: 'div[itemprop="ratingValue"]',
                MX: 'div[itemprop="ratingValue"]'
      },

      poster: { EN: 'img[itemprop="image"]',
                ES: 'img[itemprop="image"]',
                MX: 'img[itemprop="image"]'
      },

      poster_big: { EN: 'a[class="lightbox"]',
                    ES: 'a[class="lightbox"]',
                    MX: 'a[class="lightbox"]'
      },

      original: { EN: 'dt:contains("Original title")',
               ES: 'dt:contains("Título original")',
               MX: 'dt:contains("Título original")'
      },

    }
  end

  def self.tag(type)
    lang = FilmAffinity.configuration.language.to_sym
    Constants.tags[type][lang]
  end

  def self.lang
    FilmAffinity.configuration.language.downcase
  end
end
