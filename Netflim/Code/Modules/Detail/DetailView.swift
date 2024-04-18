
import SwiftUI
import YouTubePlayerKit
import SDWebImageSwiftUI

struct DetailView: View {
    
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        
        VStack {
            if let youTubePlayer = viewModel.youTubePlayer, viewModel.videoAvaiable {
                YouTubePlayerView(youTubePlayer) { state in
                    switch state {
                    case .ready:
                        EmptyView()
                    case .error(let error):
                        EmptyView()
                    default:
                        ProgressView()
                    }
                }
                .scaledToFill()
                .scaleEffect(1.4)
                .frame(maxWidth: .infinity, minHeight: 0, maxHeight: 220)
            }
            else {
                WebImage(url: viewModel.film.detailImageUrl())
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 0, maxHeight: 220)
                    .clipShape(RoundedCorner(radius: 8))
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                   
                    Text(viewModel.film.title ?? "")
                        .font(.title3.bold())
                        .padding(.top, 10)
                      
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Reproducir")
                                .font(.system(size: 18).bold())
                        }
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(6)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.down.to.line")
                            Text("Descargar")
                                .font(.system(size: 18).bold())
                        }
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(Color(.darkGray))
                        .cornerRadius(6)
                    })
                    
                    Text(viewModel.film.overview ?? "")
                        .font(.subheadline)
                        .padding(.top, 20)
                }
                .padding(.horizontal, 10)
            }
            .background(Color.black)
            
        }
        .overlay(alignment: .topTrailing) {
            
            HStack(spacing: 15) {
                Spacer()
                
                Button(action: {
                  
                }, label: {
                    Image("ic_stream")
                        .resizable()
                        .scaledToFit()
                        .tint(.white)
                        .frame(width: 23, height: 23)
                        .padding(7)
                        .background(Color(.darkGray))
                        .clipShape(Circle())
                })
                
                
                Button(action: {
                    viewModel.dismissModal()
                }, label: {
                    Image("ic_close")
                        .resizable()
                        .scaledToFit()
                        .tint(.white)
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .background(Color(.darkGray))
                        .clipShape(Circle())
                })
                .clipShape(Circle())
            }
            .padding(.top, 15)
            .padding(.horizontal, 10)
            
        }
        .onAppear {
            Task {
                await viewModel.getTrailer()
            }
        }
    }
}

#Preview {
    DetailWireframe(navigator: nil).preview()
}
