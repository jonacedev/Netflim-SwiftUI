


import SwiftUI
import Lottie

struct LaunchView: View {
    @StateObject var viewModel: LaunchViewModel

    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            LottieView(animation: .named("netflix_anim"))
                .playing(loopMode: .playOnce)
                .animationDidFinish({ completed in
                    viewModel.goToProfileSelector()
                })
                .frame(width: 500, height: 400)
        }
    }
}

#Preview {
    LaunchWireframe(navigator: nil).preview()
}
