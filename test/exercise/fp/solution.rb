module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.map do |film|
          next 0 unless film['country']
          next 0 if film['country'].count(',').zero?

          film['rating_kinopoisk'].to_f
        end

        sum = ratings.reduce(0, &:+)
        non_zero_ratings = ratings.reduce(0) { |sum, rating| rating > 0 ? sum + 1 : sum }

        sum / non_zero_ratings
      end

      def chars_count(films, threshold)
        films.map do |film|
          next 0 unless film['rating_kinopoisk']
          next 0 if film['rating_kinopoisk'].to_f < threshold

          film['name'].count('и')
        end.reduce(0, &:+)
      end
    end
  end
end
