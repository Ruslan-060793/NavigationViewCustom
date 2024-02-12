

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct CustomNavigationViewController<Content>: View where Content: View {
    @ObservedObject private var viewModel: NavigationViewModel
    
    // View или страница
    var content: Content
    
    // Анимация
    var transition: (push: AnyTransition, pop: AnyTransition)

    init(
        viewModel: NavigationViewModel = NavigationViewModel(easing: .easeOut(duration: 0.4)),
        transition: AnimationType,
        @ViewBuilder contentBuilder: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let pushAnim, let popAnim):
            self.transition = (pushAnim, popAnim)
        }
    }

    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            case false:
                viewModel.currentScreen!.screenView
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}