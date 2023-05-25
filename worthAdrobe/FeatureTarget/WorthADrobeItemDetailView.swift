//
//  WorthADrobeItemDetailView.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 25/05/23.
//

import SwiftUI

struct WorthADrobeItemDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("Shirt")
                        .resizable()
                        .frame(width: 218, height: 286)
                    Text("Shirt")
                        .font(.largeTitle)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            UserDefaults.standard.set(0.0075, forKey: "scale")
                            dismiss()
                            dismiss()
                        }) {
                            Text("S")
                                .font(.title)
                        }
                        Button(action: {
                            UserDefaults.standard.set(0.0085, forKey: "scale")
                            dismiss()
                            dismiss()
                        }) {
                            Text("  M")
                                .font(.title)
                        }
                        Button(action: {
                            UserDefaults.standard.set(0.0095, forKey: "scale")
                            dismiss()
                            dismiss()
                            
                        }) {
                            Text("  L")
                                .font(.title)
                        }
                        Button(action: {
                            UserDefaults.standard.set(0.0105, forKey: "scale")
                            dismiss()
                            dismiss()
                        }) {
                            Text("  XL")
                                .font(.title)
                        }
                        Button(action: {
                            UserDefaults.standard.set(0.0115, forKey: "scale")
                            dismiss()
                            dismiss()
                        }) {
                            Text("  XXL")
                                .font(.title)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
        .navigationTitle("Item Detail")
    }
}

struct WorthADrobeItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorthADrobeItemDetailView()
    }
}
