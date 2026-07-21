//
//  ContentView.swift
//  GithubClient
//
//  Created by Usuario invitado on 13/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0;// segun lo que tenga aqui cambiara de valor
    var body: some View {
        TabView(selection: $selectedTab) {
            RepoList()
                .tabItem{
                    Label("Repositorios",
                          systemImage:
                            "arrow.trianglehead.branch")
                }
                .tag(0)
            RepoForm(selectTab: $selectedTab)
                .tabItem{ Label("Crear repositorio",
                                systemImage: "plus")
                }
                .tag(1)
            
            Profile()
                .tabItem{
                    Label("Perfil de usuario",
                          systemImage: "person.crop.circle")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
