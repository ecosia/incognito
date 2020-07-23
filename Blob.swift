import SwiftUI

struct Blob {
    struct Title: View {
        let title: LocalizedStringKey
        let action: () -> Void
        
        var body: some View {
            _Blob(content: Text(title)
                .font(.footnote)
                .bold(),
                  action: action)
        }
    }
    
    struct Icon: View {
        let icon: String
        let action: () -> Void
        
        var body: some View {
            _Blob(content:
                Image(systemName: icon)
                    .font(Font.headline.bold()), action: action)
        }
    }
}

struct _Blob<Content>: View where Content : View {
    let content: Content
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 45, height: 45)
                    .shadow(color: .init(.systemBackground), radius: 2, x: -2, y: -2)
                    .shadow(color: .init(.systemBackground), radius: 3, x: 3, y: 3)
                    .foregroundColor(.init(.secondarySystemBackground))
                content
                    .foregroundColor(.pink)
            }
        }
    }
}
