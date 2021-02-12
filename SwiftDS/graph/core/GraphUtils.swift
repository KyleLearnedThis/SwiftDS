//
//  GraphUtils.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  TODO: Would like to remove generic in favor of the simple decodable JSON object in the future.

import Foundation

public class GraphUtils {
    public static func openHomeFile(inputDirectory: String, fileName: String) -> String {
        var input = ""
        let x = fileName.components(separatedBy: ".")
        let home = FileManager.default.homeDirectoryForCurrentUser
        let url = home.appendingPathComponent(inputDirectory)
            .appendingPathComponent(x[0])
            .appendingPathExtension(x[1])
        do {
            input = try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("open file: \(fileName) failed")
        }
        return input
    }

    public static func parseGraphJsonFile(inputDirectory: String, fileName: String) -> Dictionary<String, Vertex<String>> {
        let inputString = openHomeFile(inputDirectory: inputDirectory, fileName: fileName)
        let data = inputString.data(using: String.Encoding.utf8)!
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        var vertexMap: Dictionary<String, Vertex<String>> = [:]
        
        if let dict1 = json as? [String: Any] {
            if let vertexJsonArray = dict1["graph"] as? [Any] {
                for vertexJson in vertexJsonArray {
                    if let dict2 = vertexJson as? [String: Any] {
                        let vertexValue = dict2["vertex"]
                        if let dict3 = vertexValue as? [String: Any] {
                            let vertexId: String = dict3["id"]! as! String
                            // print("======== VertexId: \(vertexId) ========")
                            let v = Vertex<String>(id: vertexId)
                            if let edgeJsonArray = dict3["edge"] as? [Any] {
                                for edgeJson in edgeJsonArray {
                                    if let edgeValue = edgeJson as? [String: String] {
                                        let edgeId = edgeValue["id"]!
                                        let edgeWeight = edgeValue["weight"]!
                                        let edgeDirection = edgeValue["direction"]!
                                        let direction = chooseDirection(inputString: edgeDirection)
                                        // print("========== EdgeId: \(edgeId) ==========")
                                        // print("========== EdgeWeight: \(edgeWeight) ==========")
                                        // print("========== EdgeDirection: \(edgeDirection) ==========")
                                        let edgeWeightValue = Int(edgeWeight)!
                                        let edge = Edge(x: vertexId, y: edgeId, weight: edgeWeightValue, direction: direction)
                                        v.edgeList.append(edge)
                                    }
                                }
                            }
                            vertexMap[vertexId] = v
                        }
                    }
                }
            }
        }
        return vertexMap
    }

    private static func chooseDirection(inputString: String) -> Direction {
        var direction: Direction
        switch(inputString) {
        case "X_TO_Y":
            direction = .X_TO_Y
        case "Y_TO_X":
            direction = .Y_TO_X
        case "BOTH":
            direction = .BOTH
        default:
            direction = .BOTH
        }
        return direction
    }
}
