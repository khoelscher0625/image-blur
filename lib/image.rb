class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end


   def transform (prev_row, curr_row, next_row)
    new_row = []

    curr_row.each_with_index do |val, index|
      if val == 1
        new_row << 1
      elsif prev_row[index] == 1
        new_row << 1
      elsif next_row[index] == 1
        new_row << 1
      elsif curr_row[index - 1] == 1 && index - 1 != -1
        new_row << 1
      elsif curr_row[index + 1] == 1
        new_row << 1
      else 
        new_row << 0
      end
    end
      return new_row
      
  end

  def output 
    final_array = []
  
    @data.each_with_index do |row, index|
      prev_row = @data[index - 1]
        #if index - 1 = -1 then []
        if index - 1 == -1
          prev_row = []
        end
      next_row = @data[index + 1]
        if index + 1 == @data.count
          next_row = []
        end
      new_row = self.transform(prev_row, row, next_row)             
                    #changed rows
    final_array << new_row
    end
    return final_array
  end

  def blur
    array_blur = self.output
    return array_blur
  end

  def working(rows) 
    final_array = []
  
    rows.each_with_index do |row, ind|
      prev_row = rows[ind - 1]
        #if index - 1 = -1 then []
        if ind - 1 == -1
          prev_row = []
        end
      next_row = rows[ind + 1]

        if ind + 1 >= rows.length
          next_row = []
        end
      new_row = self.transform(prev_row, row, next_row)             
                    #changed rows
    final_array << new_row
    end
    return final_array

  end

  def final
    self.working(@data)
  end
end

