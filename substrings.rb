# Takes a word(s) and an array of valid substrings and returns a hash listing 
# each substring that was found in the original string and how many times found
def substrings(str, subs)
  matched_subs = {}
  words = str.downcase.split

  subs.each do |s|
    words.each do |w|
      if w.include? s
        if matched_subs.include? s
          matched_subs[s] += 1
        else
          matched_subs[s] = 1
        end
      end
    end
  end

  matched_subs
end


# Tests
dictionary = ["below","down","go","going","horn","how","howdy","it","i",
              "low","own","part","partner","sit"]
puts substrings("below", dictionary) == {"below"=>1, "low"=>1} 
puts substrings("below below below", dictionary) == {"below"=>3, "low"=>3} 
puts substrings("Ba! Humbug", dictionary) == {}
puts substrings("Howdy partner, sit down! How's it going?", dictionary) ==
  {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, 
   "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}