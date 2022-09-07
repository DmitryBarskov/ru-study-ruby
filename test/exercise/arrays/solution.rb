module Exercise
  module Arrays
    class << self
      def max(array)
        max_value = array[0]

        array.each do |value|
          max_value = value if value > max_value
        end

        max_value
      end

      def replace(array)
        max_value = max(array)
        array.map { |item| item.positive? ? max_value : item }
      end

      # Search item index with value = query in range [low, high) in given array
      # @param [Array] array The array to search in
      # @param [Object] query The value to search (should implement <=>)
      # @param [Integer] :low Index to search after (inclusive)
      # @param [Integer] :high Index to search before (exclusive)
      # @retrun [Integer] Index query found at or -1 if not found
      def search(array, query, low: 0, high: array.length)
        return -1 if high <= low

        if low + 1 == high
          return low if query == array[low]

          return -1
        end

        middle = (low + high) / 2

        case query <=> array[middle]
        when 0
          middle
        when -1
          search(array, query, low: low, high: middle)
        when 1
          search(array, query, low: middle, high: high)
        end
      end
    end
  end
end
