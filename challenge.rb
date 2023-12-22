require 'date'
require 'set'
require 'pry'

def solution(s)
  parsed_input = Gallery::InputParser.new.perform(s)
  result = Gallery::GalleryOrganizer.new.perform(parsed_input)
end

module Gallery
  class InputParser
    INPUT_PATTERN = /^(\w{1,20})\.(jpg|png|jpeg), ([A-Z][\w]{0,19}), (\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})$/
    PHOTO_COUNT_RANGE = 1..100
    YEAR_RANGE = 2000..2020

    def initialize
      @city_timestamps = {}
    end

    def perform(input)
      lines = input.to_s.split(/\n/)

      raise OutOfRangeError.new('Should receive between 1 and 100 photos') unless PHOTO_COUNT_RANGE.cover?(lines.size)

      lines.each_with_index.map do |line, i|
        extension, city, datetime = parse_line(line, i + 1)

        {
          extension: extension,
          city: city,
          datetime: datetime
        }
      end
    end

    def parse_line(line, line_number)
      raise InvalidInputError.new("Invalid line: #{line_number} - #{line}") unless line =~ INPUT_PATTERN

      name, extension, city, datetime = line.scan(INPUT_PATTERN).first
      parsed_datetime = DateTime.parse(datetime)

      raise InvalidInputError.new("Invalid line: #{line_number} - #{line}") unless YEAR_RANGE.cover? parsed_datetime.year

      @city_timestamps[city] ||= Set.new
      raise BrokenSpaceTimeError.new("Invalid line: #{line_number} - #{line}") unless @city_timestamps[city].add?(datetime)

      [extension, city, parsed_datetime]
    end
  end

  class GalleryOrganizer
    def perform(photos)
      index = build_photos_by_city_index(photos)

      rename(photos, index)
    end

    private

    def build_photos_by_city_index(photos)
      @photo_count_by_city = {}

      photos
        .each_with_index.map{ |photo, i| photo.merge({ index: i })}
        .sort { |a, b| a[:datetime] <=> b[:datetime] }
        .inject({}) do |acc, photo|
          current_city = photo[:city]
          @photo_count_by_city[current_city] = @photo_count_by_city[current_city] ? @photo_count_by_city[current_city] + 1 : 1

          acc.merge({ photo[:index] => @photo_count_by_city[current_city] })
        end
    end

    def rename(photos, index)
      photos
        .each_with_index
        .map do |photo, i|
          photo_index_by_city = index[i]
          padded_index = photo_index_by_city.to_s.rjust(@photo_count_by_city[photo[:city]].to_s.size, '0')

          "#{photo[:city]}#{padded_index}.#{photo[:extension]}"
        end.join("\n")
    end
  end

  class OutOfRangeError < StandardError; end
  class InvalidInputError < StandardError; end
  class BrokenSpaceTimeError < StandardError; end
end