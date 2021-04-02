//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var calculationManager: CalculationManager
    @ObservedObject var viewTransitionManager: ViewTransitionManager
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                switch viewTransitionManager.currentView {
                case .home:
                    HomeView(calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
                case .list:
                    ListView(calculationManager: calculationManager, colorScheme: colorScheme)
                case .popup:
                    PopupView(calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(viewTransitionManager: viewTransitionManager, spacing: geometry.size.width * 0.6)
                }
                .show(isVisible: $viewTransitionManager.showTabBar)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(calculationManager: CalculationManager(), viewTransitionManager: ViewTransitionManager())
        }
    }
}



