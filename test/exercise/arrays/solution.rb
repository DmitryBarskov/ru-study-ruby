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

      def search(array, query, low: 0, high: array.length)
        return -1 if (high - low).zero?
        return low if high - low == 1 && query == array[low]
        return -1 if high - low == 1

        me = (low + high) / 2

        if query == array[me]
          me
        elsif query < array[me]
          search(array, query, low: low, high: me)
        else
          search(array, query, low: me, high: high)
        end
      end
    end
  end
end
