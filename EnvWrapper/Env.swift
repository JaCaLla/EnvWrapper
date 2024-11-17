//
//  Env.swift
//  EnvWrapper
//
//  Created by Javier Calatrava on 17/11/24.
//
import Foundation

@globalActor
actor GlobalManager {
    static var shared = GlobalManager()
}

@GlobalManager final class Env {
    static let env: [String: String] = loadEnvVariables()
    
    private init() {
    }
    
    static func fetch(key: String) -> String? {
        env[key]
    }
    
    static func  loadEnvVariables() -> [String: String] {
        var envVariables: [String: String] = [:]
        if let path = Bundle.main.path(forResource: ".env", ofType: nil) {
            do {
                let content = try String(contentsOfFile: path, encoding: .utf8)
                let lines = content.components(separatedBy: .newlines)
                for line in lines {
                    let components = line.components(separatedBy: "=")
                    if components.count == 2 {
                        let key = components[0].trimmingCharacters(in: .whitespaces)
                        let value = components[1].trimmingCharacters(in: .whitespaces)
                        envVariables[key] = value
                    }
                }
            } catch {
                print("Error al leer el archivo .env: \(error)")
            }
        }
        return envVariables
    }
}
