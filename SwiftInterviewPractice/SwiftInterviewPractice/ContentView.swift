//
//  ContentView.swift
//  SwiftInterviewPractice
//
//  Created by Manan Juneja on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GitHubUser?
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)

            
            Text("\(user?.login ?? "Login Username")")
                .bold()
                .font(.title2)
            
            Text("\(user?.bio ?? "Bio placeholder")")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            await fetchUser()
        }
    }
    
    func fetchUser() async {
        do {
            user = try await getUser()
        } catch {
            print("Error fetching user: \(error)")
        }
    }
    
    func getUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/Manan-J98"
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

#Preview {
    ContentView()
}

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GHError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
