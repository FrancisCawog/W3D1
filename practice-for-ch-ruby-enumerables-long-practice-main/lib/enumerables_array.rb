class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        return self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr <<  ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr <<  ele if !prc.call(ele)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten(data = self)
        return [data] if !data.is_a?(Array)
        flattened = []
        data.my_each do |ele|
            flattened += my_flatten(ele)
        end
        flattened
    end

    def my_zip(*arg)
       new_arr = []
       base = [self]

       arg.each do |array|
            base << array
       end

       while new_arr.length < self.length
            new_arr << []
       end

       base.each do |arr|
            (0...self.length).each do |i|
                new_arr[i] << arr[i]
            end
        end
        new_arr
    end

    def my_rotate(num = 1)
        arr = self.clone
        num = self.length + num if num < 0

        num.times do 
            ele = arr.shift
            arr << ele
        end
        arr
    end

    def my_join(seperator = '')
        str = ''
        self.each do |ele|
            str += ele + seperator
        end
        str
    end

    def my_reverse
        new_arr =[]

        i = self.length - 1 
        while i >= 0
            new_arr << self[i]
            i -= 1
        end

        new_arr
    end
end

