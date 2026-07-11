//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI
struct Profile: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("Jose Francisco Pinduisaca")
                    .font(.title)
                Image(uiImage:  .githubLogo)
                    .resizable()
                    .scaledToFit()
                Text("josefranciscopinduisaca")
                    .font(.headline)
                    .padding(.vertical)
                Text("GitHub is a cloud-based platform where developers store, share, and track their software code. It uses Git for version control, allowing teams to collaborate on projects safely from anywhere in the world.Key FeaturesCloud Hosting: Stores code repositories safely online.Version Control: Tracks every change made to code.Collaboration: Enables multiple people to work together.Open Source: Hosts millions of free public projects.")
                    .font(.caption)
            }
            .padding()
            .navigationTitle("Perfil de usuario")
        }
    }
}
#Preview {
    Profile()
}
