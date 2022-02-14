module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        idx = 0
        while idx < size
          yield self[idx]
          idx += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        self.class.new(size).tap do |new_array|
          idx = 0
          while idx < size
            new_array[idx] = yield self[idx]
            idx += 1
          end
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        self.class.new.tap do |new_array|
          my_each do |item|
            new_array << item unless item.nil?
          end
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc
          idx = 0
        else
          idx = 1
          acc = self[0]
        end

        while idx < size
          acc = yield(acc, self[idx])

          idx += 1
        end

        acc
      end
    end
  end
end
