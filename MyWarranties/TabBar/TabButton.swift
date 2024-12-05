//
//  TabButton.swift
//  Furnitures
//
//  Created by Balaji on 25/11/20.
//

import SwiftUI

struct TabButton: View {

    var title: String
    var image: String

    @Binding var selected : String

    var body: some View {

        Button(action: {
            withAnimation(.spring()) { selected = title }
        }) {

            HStack(spacing: 10) {

                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)

                if selected == title {

                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.white.opacity(selected == title ? 0.35 : 0))
            .clipShape(Capsule())
        }
    }
}

struct TabButton2 : View {

    var title : String
    var image : String

    @Binding var selectedTab : String

    var body: some View {

        Button(action: {
            withAnimation(.spring()) { selectedTab = title }
        }) {

            HStack(spacing: 10) {

                Image(image)
                    .renderingMode(.template)
                //                .frame(width: 23, height: 23)
                    .foregroundColor(.white)

                if selectedTab == title {

                    Text(title)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedTab == title ? Color.white : Color.yellow)

                }

            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.white.opacity(selectedTab == title ? 0.35 : 0))
            .clipShape(Rectangle())
            .cornerRadius(10)


        }

    }
}


