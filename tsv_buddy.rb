# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []

    lines = tsv.split("\n").map { |line| line.split("\t") }
    key = lines.first
    lines.shift
    lines.each do |line| # put the records into hash to result
      record = {}
      key.each_index { |index| record[key[index]] = line[index] }
      @data.push(record)
    end
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    s = ''
    @data[0].each_key { |key| s << "#{key}\t" }
    s.chop!
    @data.each do |r|
      s << "\n"
      @data[0].keys.each { |key| s << r[key] << "\t" }
      s.chop!
    end
    s << "\n"
    @data = s
  end
end
