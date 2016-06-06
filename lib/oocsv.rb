module OOCSV
  module_function

  # A struct representing a single line in a CSV file.
  CSVEntry = Struct.new('CSVEntry') do
    # Creates a new CSVEntry from a hash, rather than specific symbol => value sets.
    # @param opts [Hash<Symbol, Any>] The options hash. Key is the instance variable name (header in CSV), value is
    #   this entry's value.
    def initialize(opts = {})
      opts.each do |k, v|
        self.class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end

      # noinspection RubyInstanceVariableNamingConvention
      @i_expect_that_nobody_will_use_this_name = opts
    end

    # Returns a string representation of the CSV. This is not the same as {OOCSV#write}.
    def to_s
      values = {}
      @i_expect_that_nobody_will_use_this_name.keys.each do |key|
        val = instance_variable_get("@#{key}")
        values[key] = val
      end
      str = '#<struct Struct::CSVEntry'
      values.each do |k, v|
        str << " @#{k}=#{v}"
      end
      str << '>'
    end
  end

  # Read a CSV string into an array of CSVEntries.
  # @param string [String] The CSV.
  # @return [Array<Struct::CSVEntry>] An array of CSVEntries representing the CSV provided.
  def read(string)
    lines = string.split("\n")
    header = lines[0]
    attributes = header.split(',').map! { |v| v.to_sym }
    # Struct.new('CSVEntry', *attributes)
    ret = []
    lines.drop(1).each do |line|
      values = line.split(',')
      opts = {}
      values.each_with_index do |val, idx|
        opts[attributes[idx]] = val
      end
      ret << Struct::CSVEntry.new(opts)
    end

    ret
  end

  # Turns an array of CSVEntries (see #read) into a String.
  # @param objects [Array<Struct::CSVEntry>] The array of structs.
  # @return [String] The CSV representing the array given.
  def write(objects = [])
    return '' if objects.empty?
    str = ''
    vars = objects[0].instance_variables.select! { |v| v != :@i_expect_that_nobody_will_use_this_name }.map { |v| v }
    str << vars.map { |i| i[1..-1] }.join(',')
    str << "\n"
    objects.each_with_index do |obj, obj_indx|
      vars.each_with_index do |var, var_indx|
        val = obj.instance_variable_get(var)
        str << val
        str << ',' if var_indx != vars.size - 1
      end
      str << "\n" if obj_indx != objects.size - 1
    end

    str
  end
end
