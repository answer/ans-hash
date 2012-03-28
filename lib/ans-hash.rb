require "ans-hash/version"

module Ans
  module Hash
    def sha256(value, is_microtime=false, is_salt=true)
      if is_microtime 
        value << Time.now.to_f.to_s
      end
      if is_salt 
        value << salt
      end
      hash = Digest::SHA256.hexdigest(value) 
    end
# ソルトメソッドをを作る必要あり
#   def self.salt
#     "salt-string"
#   end
  end
end
