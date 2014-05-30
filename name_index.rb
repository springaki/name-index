class NameIndex
  GROUPING_RULES = [
      {:rule => /^[ァ-オヴ]/, :group => "ア"},
      {:rule => /^[カ-ゴヵヶ]/, :group => "カ"},
      {:rule => /^[サ-ゾ]/, :group => "サ"},
      {:rule => /^[タ-ド]/, :group => "タ"},
      {:rule => /^[ナ-ノ]/, :group => "ナ"},
      {:rule => /^[ハ-ポ]/, :group => "ハ"},
      {:rule => /^[マ-モ]/, :group => "マ"},
      {:rule => /^[ャ-ヨ]/, :group => "ヤ"},
      {:rule => /^[ラ-ロ]/, :group => "ラ"},
      {:rule => /^[ヮ-ヲヷヸヹヺ]/, :group => "ワ"},
      {:rule => /^[ン]/, :group => "ン"},
  ].freeze

  class << self
    def create_index(names)
      names.sort.chunk{|item|
        find_group(item)
      }.each_with_object([]) {|item, grouped_names|
        grouped_names << item
      }
    end

    def find_group(name)
      GROUPING_RULES.each { |rule|
        return rule[:group] if name =~ rule[:rule]
      }
    end
  end
end