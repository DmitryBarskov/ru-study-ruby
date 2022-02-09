module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
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
