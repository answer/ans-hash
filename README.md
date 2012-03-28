ハッシュ
======================
ハッシュを作ります
 
 
使い方
------
class MyHashClass
  extend Ans::Hash
  # salt メソッドは必ず作成してください。
  def self.salt
    "salt"
  end
end
 
MyHashClas.sha256(value,false,false)

パラメータの解説
----------------
    def sha256(value, is_microtime=false, is_salt=true)
   
  +   `value` :
      ハッシュを生成する値
       
  +   `is_microtime` :
        true or false 
        true にするとマイクロタイムを value の後ろに足します
       
  +   `is_salt` :
        true にすると ソルトを value の後ろに足します
