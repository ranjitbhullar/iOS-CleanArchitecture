//
//  FriendsListView.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI

public struct FriendsListView: View {
    
    @ObservedObject private var viewModel: FriendsListViewModel
    
    public init(viewModel: FriendsListViewModel) {
        self.viewModel = viewModel
        viewModel.fetchFriends()
    }
    
    public var body: some View {
        List(viewModel.friends) { item in
            FriendsListRow(item: item)
        }
        .navigationTitle(AppConstants.Constants.friendsListTitle)
        .accessibilityIdentifier(AppConstants.Constants.friendsTableIdentifier)
    }
}
