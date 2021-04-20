//
//  DetailView.swift
//  Courses
//
//  Created by Marco Lima on 2021-04-16.
//

import SwiftUI

struct DetailView : View {
    
    var course : Course
    
    var body: some View{
        
        VStack{
            
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Image(systemName: "pencil")
                .padding()
            
            Image("coding")
                .padding()
            
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.large)
//        .navigationBarItems(trailing: Button(action: {}, label: {
//            
//            Image("menu")
//                .renderingMode(.template)
//                .foregroundColor(.gray)
//        }))
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(id: "Coding", name: "", numCourse: 1, asset: "coding"))
    }
}
