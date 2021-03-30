//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var currentSugarLevel: Double = 5.5
    @State private var targetSugarLevel: Double = 5.5
    @State private var carbsPerUnitOfInsuline: Double = 10.0
    @State private var showButtons = false
    @State private var dosage = 2
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                colorScheme == .light ? LinearGradient(.whiteStart, .whiteEnd) : LinearGradient(.darkStart, .darkEnd)
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.20)
                    HomeViewCalculationTab(dosage: $dosage, colorScheme: colorScheme)
                    Spacer()
                        .frame(height: geometry.size.height * 0.1)
                    HomeViewSlider(currentSugarLevel: $currentSugarLevel, targetSugarLevel: $targetSugarLevel, carbsPerUnitOfInsuline: $carbsPerUnitOfInsuline, colorScheme: colorScheme)
                    Spacer()
                    HomeViewExtraButtons(showButtons: $showButtons, colorScheme: colorScheme)
                    Spacer()
                    HomeViewAddButton(showButtons: $showButtons, colorScheme: colorScheme)
                    Spacer()
                        .frame(height: geometry.size.height * 0.025)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            showButtons = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}