module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        array.map { |item| item > 0 ? max_value : item }
      end

      def search(array, query, lo: 0, hi: array.length)
        return -1 if (hi - lo).zero?
        return lo if hi - lo == 1 && query == array[lo]
        return -1 if hi - lo == 1

        me = (lo + hi) / 2

        if query == array[me]
          me
        elsif query < array[me]
          search(array, query, lo: lo, hi: me)
        else
          search(array, query, lo: me, hi: hi)
        end
      end
    end
  end
end
