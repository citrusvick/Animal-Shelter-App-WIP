//
//  ContentView.swift
//  Animal Shelter App
//
//  Created by Mushik, Victoria on 3/18/24.
//

import SwiftUI

var adoption:[Adoptions] =
[.init(name: "Cats", color: .purple, imageName: "cat"),
 .init(name: "Dogs", color: .brown, imageName: "dog"),
 .init(name: "Reptiles", color: .green, imageName: "lizard"), .init(name: "Birds", color: .blue, imageName: "bird")]

var helps:[Helping] =
[.init(name: "Donate", color: .black, location: "Link to Donate"),
 .init(name: "Foster", color: .black, location: "Link to Foster Animals")]

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List {
                Section("For Adoption"){
                    ForEach(adoption,
                            id:\.name){
                        adoption in
                        NavigationLink(value: adoption)
                        {
                            Label(adoption.name, systemImage: adoption.imageName).foregroundColor(adoption.color)
                        }
                    }
                }
                Section("How to help"){
                    ForEach(helps,
                            id:\.name){
                        helps in
                        NavigationLink(value: helps)
                        {
                            Text(helps.name).foregroundColor(helps.color)
                        }
                    }
                }
                Image("frontpic")
                }
            }
            .navigationTitle("For Adoption")
            .navigationDestination(for: Adoptions.self) { adoption in
                ZStack{
                    adoption.color.ignoresSafeArea()
                    Text(adoption.name).font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Helping.self) { helping in
                ZStack{
                    helping.color.ignoresSafeArea()
                    Text(helping.location).font(.largeTitle).bold()
                }
            }
        }
    }

#Preview {
    ContentView()
}

struct Adoptions:Hashable{
    let name: String
    let color: Color
    let imageName: String
    
}

struct Helping:Hashable{
    let name: String
    let color: Color
    let location: String
}
