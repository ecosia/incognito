import SwiftUI

struct Tools: View {
    @State private var text = ""
    @State private var hide = true
    @State private var tabsY = CGFloat()
    @State private var menuY = CGFloat()
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                if !hide {
                    HStack {
                        Spacer()
                        Bar(text: $text, action: commit)
                        Spacer()
                    }
                }
                HStack {
                    ZStack {
                        if !hide {
                            Blob.Icon(icon: "square.on.square", action: show)
                                .padding()
                                .offset(y: tabsY)
                            Blob.Icon(icon: "line.horizontal.3", action: show)
                                .padding()
                                .offset(y: menuY)
                        }
                        Blob.Icon(icon: hide ? "magnifyingglass" : "multiply", action: show)
                            .padding()
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func show() {
        if hide {
            withAnimation(Animation.linear(duration: 0.2)) {
                hide = false
            }
            
            withAnimation(Animation.easeOut(duration: 0.3).delay(0.1)) {
                menuY = -75
            }
            
            withAnimation(Animation.easeOut(duration: 0.5).delay(0.1)) {
                tabsY = -150
            }
        } else {
            withAnimation(Animation.easeOut(duration: 0.3)) {
                tabsY = 0
                menuY = 0
            }
            
            withAnimation(Animation.linear(duration: 0.3).delay(0.1)) {
                hide = true
            }
        }
        
    }
    
    private func commit() {
        
    }
}
