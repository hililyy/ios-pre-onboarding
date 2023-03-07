//
//  ImageUrl.swift
//  ImageDownloadProgram
//
//  Created by 강조은 on 2023/03/07.
//

import Foundation

enum ImageURL {
    private static let imageIds: [String] = [
        "6d63b4a30258e7a7201afb3475d022fd41d1a2caccd0c566eab28b91e2e5d306",
        "6d63b4a30258e7a7201afb3475d022fd113e2bd2b7407c8202a97d2241a96625",
        "6d63b4a30258e7a7201afb3475d022fd4022de826f725e10df604bf1b9725cfd",
        "33a4e97c018d49e364f99718f188c89dac8e738cb631e72fdb9a96b36413984e",
        "8fb89536158119f901780df1ba184931960f4ab09fe6e38bae8c63030c9b37f9"
    ]
    
    static subscript(index: Int) -> URL {
        let id = imageIds[index]
        return URL(string: "https://item.kakaocdn.net/do/"+id)!
    }
}
