//
//  ContentView.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var personViewModel = PersonViewModel()
    @State private var showingAddPerson = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(personViewModel.people, id: \.self){ person in
                    
                    NavigationLink{
                        Image(uiImage: person.content!)
                            .resizable()
                            .scaledToFill()
                    } label: {
                        Text(person.name!)
                    }
                    
                }
            }
            .navigationTitle("People")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddPerson = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPerson){
                AddPerson()
            }
        }
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
