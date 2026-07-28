//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    @StateObject private var viewController = ProfileViewController()

    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando perfil...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else if let user = viewController.user {
                    VStack {
                        Text(user.name ?? user.login)
                            .font(.title)

                        AsyncImage(url: URL(string: user.avatarUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(uiImage: .githubLogo)
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 150, height: 150)

                        Text(user.login)
                            .font(.headline)
                            .padding(.vertical)

                        if let bio = user.bio {
                            Text(bio)
                                .font(.caption)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Perfil de usuario")
        }
        .onAppear {
            Task {
                await viewController.loadUser()
            }
        }
    }
}

#Preview {
    Profile()
}
