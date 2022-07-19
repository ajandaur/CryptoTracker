//
//  SettingsView.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 7/18/22.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let coingeckoURL = URL(string: "https://wwww.coingecko.com")!
    let personalURL = URL(string: "https://www.anmoljandaur.com")!
    
    var body: some View {
        NavigationView {
            List {
               swiftfulThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @Swiftful Thinking course on YT. It uses MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube", destination: youtubeURL)
            
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app is used from a free API from CoinGecko! Prices may be slighty delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("App developed by Anmol Jandaur using SwiftUI and is written 100% in Swift.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit website", destination: personalURL)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            
            Link("Terms of Service", destination: personalURL)
            Link("Privacy Policy", destination: personalURL)
            Link("Company Website", destination: personalURL)
            Link("Learn More", destination: personalURL)
            
        }
    }
}
