require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify { expect(NameIndex.create_index([])).to eq [] }
  specify { expect(NameIndex.create_index(['キシモト', 'イトウ', 'カネダ'])).to eq [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']] ] }

  # 段の中の並び
  specify {expect(NameIndex.create_index(['キシモト', 'イトウ', 'カネダ', 'アイザワ','エトウ','オザキ','ウドウ',])).to eq [ ['ア', ['アイザワ', 'イトウ', 'ウドウ', 'エトウ', 'オザキ']], ['カ', ['カネダ', 'キシモト']] ] }

end