require 'rspec'

# Write a method that takes a value and a collection and returns the number of 
# elements in the collection that are equal to the value.

def count_equal_elements(value, collection)
  collection.inject(0) do |count, element|
    count += 1 if element == value
    count
  end
end

describe "count equal elements" do
  it "returns the count of equal elements" do
    result = count_equal_elements("ben", ["ben"] * 3)

    expect(result).to eq 3
  end

  it "can handle integers too" do
    result = count_equal_elements(1, [0,1,0,1])

    expect(result).to eq 2
  end
end

# Write a method that takes an array of string and returns a hash, where the
# keys are the strings and the values are their lengths

def to_lengths(strings)
  strings.inject({}) do |count_hash, word|
    count_hash[word] = word.length
    count_hash
  end
end

describe "returns word lengths in hash" do
  it "returns word lengths" do
    result = to_lengths(%w(test happy christine))
    expect(result).to eq({"test" => 4, "happy" => 5, "christine" => 9})
  end
end

def count_occurences(collection)
  collection.inject(Hash.new(0)) do |hash, element|
    hash[element] += 1
    hash
  end
end

describe "#count occurences" do
  it "returns the number of time each object appears in the collection" do
    result = count_occurences(["ben", Hash, "ben", 9])
    expect(result).to eq({ "ben" => 2, Hash => 1, 9 => 1})
  end
end

def value_at_nested_keys(keys, hash)
  keys.inject(hash) do |result, key|
    result[key]
  end
end

describe "#value_at_nested_keys" do
  it "returns the value found by accessing all keys" do
    keys =[:a, :b]
    hash = { a: { b: "value", d: "whatever" }, c: "foo" }

    result = value_at_nested_keys(keys, hash)

    expect(result).to eq("value")
  end

  context "when there are more keys" do
    it "still works" do
      keys = [:a, :b, :c, :d]
      hash = {a: { b: { c: { d: "value" } } }}

      result = value_at_nested_keys(keys, hash)

      expect(result).to eq("value")
    end
  end
end

