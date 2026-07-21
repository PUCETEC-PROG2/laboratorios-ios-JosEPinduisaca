//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI
import Foundation

struct RepoForm: View {
    @StateObject private var viewController = RepoFormViewController()
    @Binding var selectTab: Int

    var body: some View {
        NavigationStack {
            VStack {
                if viewController.isLoading {
                    ProgressView("Crear Repositorios ...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else {

                    Spacer()

                    TextField(
                        "Nombre del repositorio",
                        text: $viewController.repoName
                    )
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)

                    TextField(
                        "Descripcion del repositorio",
                        text: $viewController.repoDescription,
                        axis: .vertical
                    )
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(3...6)
                    .padding(.vertical)

                    Spacer()

                    HStack {
                        Button(action: {
                            print("Boton presionado")
                        }) {
                            Label("Cancelar", systemImage: "xmark.circle")
                                .padding(.all, 4)
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 4)

                        Button(action: {
                            Task {
                                await viewController.createRepository()
                                if(viewController.errorMsg == nil){
                                    selectTab = 0
                                }
                            }
                            print("Boton presionado")
                        }) {
                            Label("Guardar", systemImage: "square.and.arrow.down")
                                .padding(.all, 4)
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 4)
                        .disabled(viewController.repoName == "")
                    }
                }
            } // cierra VStack
            .padding()
            .navigationTitle("Formulario de repositorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm(selectTab: .constant (1))
}
