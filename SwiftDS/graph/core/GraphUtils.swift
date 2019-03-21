//
//  GraphUtils.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class GraphUtils {
    public func openHomeFile(inputDirectory: String, fileName: String) -> String {
        var input = ""
        var x = fileName.components(separatedBy: ".")
        let home = FileManager.default.homeDirectoryForCurrentUser
        let url = home.appendingPathComponent(inputDirectory)
            .appendingPathComponent(x[0])
            .appendingPathExtension(x[1])
        do {
            input = try String(contentsOf: url, encoding: .utf8)
            print("===== input: \(input)=====")
        } catch {
            print("open file: \(fileName) failed")
        }
        return input
    }

    public func parseGraphJsonFile(inputDirectory: String, fileName: String) -> [Vertex<String>] {
        let inputString = openHomeFile(inputDirectory: inputDirectory, fileName: fileName)
        let data = inputString.data(using: String.Encoding.utf8)!
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        var vertexArray = [Vertex<String>]()
        
        if let dict1 = json as? [String: Any] {
            if let vertexJsonArray = dict1["graph"] as? [Any] {
                for vertexJson in vertexJsonArray {
                    if let dict2 = vertexJson as? [String: Any] {
                        let vertexValue = dict2["vertex"]
                        if let dict3 = vertexValue as? [String: Any] {
                            let vertexId: String = dict3["id"]! as! String
                            print("======== vertexId: \(vertexId) ========")
                            let v = Vertex<String>(id: vertexId)
                            if let edgeJsonArray = dict3["edge"] as? [Any] {
                                for edgeJson in edgeJsonArray {
                                    if let edgeValue = edgeJson as? [String: String] {
                                        let edgeId = edgeValue["id"]!
                                        let edgeWeight = edgeValue["weight"]!
                                        let edgeDirection = edgeValue["direction"]!
                                        print("========== eId: \(edgeId) ==========")
                                        print("========== eWeight: \(edgeWeight) ==========")
                                        print("========== eDirection: \(edgeDirection) ==========")
                                        let edgeWeightValue = Int(edgeWeight)!
                                        let edge = Edge(x: vertexId, y: edgeId, weight: edgeWeightValue)
                                        v.edgeList.append(edge)
                                    }
                                }
                            }
                            vertexArray.append(v)
                        }
                    }
                }
            }
        }
        return vertexArray
    }
}
