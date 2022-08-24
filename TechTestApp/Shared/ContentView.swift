//
//  ContentView.swift
//  Shared
//
//  Created by Ranjit Singh on 23/08/22.
//

import SwiftUI

public struct ContentView: View {
    public var body: some View {
        NavigationView{
            AppDIContainer.createFriendsListView()
        }
    }
}

