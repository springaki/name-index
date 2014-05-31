class NameIndex
  GROUPING_RULES = [
      {:group => "ア", :rule => /^[ァ-オヴ]/},
      {:group => "カ", :rule => /^[カ-ゴヵヶ]/},
      {:group => "サ", :rule => /^[サ-ゾ]/},
      {:group => "タ", :rule => /^[タ-ド]/},
      {:group => "ナ", :rule => /^[ナ-ノ]/},
      {:group => "ハ", :rule => /^[ハ-ポ]/},
      {:group => "マ", :rule => /^[マ-モ]/},
      {:group => "ヤ", :rule => /^[ャ-ヨ]/},
      {:group => "ラ", :rule => /^[ラ-ロ]/},
      {:group => "ワ", :rule => /^[ヮ-ヲヷヸヹヺ]/},
      {:group => "ン", :rule => /^[ン]/},
  ].freeze

  class << self
    def create_index(names)
      names.sort.chunk{|item| find_group(item) }.to_a
    end

    def find_group(name)
      GROUPING_RULES.find { |rule| name =~ rule[:rule] }[:group]
    end
  end
end