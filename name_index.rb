class NameIndex
  def self.create_index(names)
    names.sort.chunk{|item|
      grouping(item)
    }.each_with_object([]) {|item, categorize_names|
      categorize_names << item
    }
  end

  def self.grouping(name)
    return "ア" if name=~/^[ァ-オ]/
    return "カ" if name=~/^[カ-ゴ]/
  end
end