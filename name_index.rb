class NameIndex
  CATEGORIZE_RULES = [
      {:rule => /^[ァ-オヴ]/, :category => "ア"},
      {:rule => /^[カ-ゴヵヶ]/, :category => "カ"},
      {:rule => /^[サ-ゾ]/, :category => "サ"},
      {:rule => /^[タ-ド]/, :category => "タ"},
      {:rule => /^[ナ-ノ]/, :category => "ナ"},
      {:rule => /^[ハ-ポ]/, :category => "ハ"},
      {:rule => /^[マ-モ]/, :category => "マ"},
      {:rule => /^[ャ-ヨ]/, :category => "ヤ"},
      {:rule => /^[ラ-ロ]/, :category => "ラ"},
      {:rule => /^[ヮ-ヲヷヸヹヺ]/, :category => "ワ"},
      {:rule => /^[ン]/, :category => "ン"},
  ].freeze

  def self.create_index(names)
    names.sort.chunk{|item|
      grouping(item)
    }.each_with_object([]) {|item, categorize_names|
      categorize_names << item
    }
  end

  def self.grouping(name)

    CATEGORIZE_RULES.each { |rule|
      return rule[:category] if name =~ rule[:rule]
    }
  end
end