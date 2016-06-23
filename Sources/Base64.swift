import Foundation


/// URI Safe base64 encode
func base64encode(input:NSData) -> String {
  let data = input.base64EncodedData(NSData.Base64EncodingOptions(rawValue: 0))
  let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String
  return string
    .replacingOccurrences(of: "+", with: "-")
    .replacingOccurrences(of: "/", with: "_")
    .replacingOccurrences(of: "=", with: "")
}

/// URI Safe base64 decode
func base64decode(input:String) -> NSData? {
  let rem = input.characters.count % 4

  var ending = ""
  if rem > 0 {
    let amount = 4 - rem
    ending = String(repeating: Character("="), count: amount)
  }

  let base64 = input.replacingOccurrences(of: "-", with: "+")
    .replacingOccurrences(of: "_", with: "/") + ending

  return NSData(base64Encoded: base64, options: NSData.Base64DecodingOptions(rawValue: 0))
}
