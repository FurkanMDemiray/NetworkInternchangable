//
//  UserViewModel.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import Foundation




class UserListViewModel: ObservableObject {

    @Published var users = [UserViewModel]()

    private let webservice = Webservice()

    func fetchUsers() async throws {

        let users = try await webservice.downloadData("https://jsonplaceholder.typicode.com/users")
        DispatchQueue.main.async {
            self.users = users.map(UserViewModel.init)
        }
    }

}




struct UserViewModel {

    let user: User

    var id: Int {
        user.id
    }

    var name: String {
        user.name
    }

    var email: String {
        user.email
    }

    var username: String {
        user.username
    }

}
