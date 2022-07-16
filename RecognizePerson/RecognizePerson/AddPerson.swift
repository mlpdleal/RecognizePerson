//
//  AddPerson.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//

import SwiftUI

struct AddPerson: View {
    
    
    @Environment(\.dismiss) var dismiss
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var name = ""
    @StateObject private var personViewModel = PersonViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 280, height: 200)
                        
                        Text("Tap to select a picture")
                            .foregroundColor(.secondary)
                            .font(.headline)
                        
                        image?
                            .resizable()
                            .scaledToFit()
        
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    
                    TextField("Name:", text: $name)
                    
                    Button{
                        personViewModel.savePerson(image: inputImage!, name: name)
                        personViewModel.getPeople()
                        dismiss()
                    }label: {
                        Text("Save")
                    }
                    
                    }
                    
                    Spacer()
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Add Person")
            .onChange(of: inputImage){ _ in loadImage()}
            .sheet(isPresented: $showingImagePicker){
                ImagePicker(image: $inputImage)
            }
            
        }
    }
    
    func loadImage(){
        image = Image(uiImage: inputImage!)
    }
}

struct AddPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson()
    }
}
