require "ans-hash/version"

module Ans
  module Hash
    def sha256(value, is_microtime=false, is_salt=true)
      Digest::SHA256.hexdigest value.dup.tap{|seed|
        seed << Time.now.to_f.to_s if is_microtime
        seed << salt if is_salt
      }
    end

    # このモジュールを extend するクラスにソルトメソッドをを作る必要がある
    #def salt
    #  "salt-string"
    #end
  end
end
