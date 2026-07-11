//
//  Repoitem.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoItem: View {
    var body: some View {
        HStack{
            Image(uiImage: .githubLogo)
                .resizable()
                .frame(width: 80, height: 80)
            VStack{
                Text("Nombre del repositorio")
                    .font(.title2)
                Text("Lorem Inpsun dolor descripcciòn del repositorio")
                HStack {
                    Text("Lenguaje")
                        .font(.caption)
                    Spacer()
                    Text("swift")
                        .font(.caption)
                }
            }
        }
        .padding()
    }
}

#Preview {
    RepoItem()
}
