require 'yaml'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n").map { |line| line.split("\t") }
    title = lines.first
    lines.shift
    @data = lines.map do |line|
      line.map.with_index { |cell, i| [title[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    title = @data[0].keys.join("\t")
    content = @data.map { |row| row.values.join("\t") }.join("\n")
    title + "\n" + content
  end
end
