//
//  File.swift
//  
//
//  Created by Antonio Rodriguez Cia on 26/11/22.
//

import Foundation

class NetworkService<PromptObject, ResultObject> {
  var jsonObject: PromptObject
  var translator: (PromptObject) -> String

  init(jsonObject: PromptObject, translator: @escaping (PromptObject) -> String) {
    self.jsonObject = jsonObject
    self.translator = translator
  }

  var jsonString: String {
    translator(jsonObject)
  }
}
