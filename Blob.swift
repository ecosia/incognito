import SwiftUI

struct Blob {
    struct Title: View {
        let title: LocalizedStringKey
        let action: () -> Void
        
        var body: some View {
            _Blob(content: Text(title)
                .foregroundColor(.primary)
                .font(.footnote)
                .bold(),
                  action: action)
        }
    }
    
    struct Icon: View {
        let icon: String
        let action: () -> Void
        
        var body: some View {
            _Blob(content: Image(systemName: icon)
                .foregroundColor(.primary),
                  action: action)
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
                    .frame(width: 60, height: 60)
                    .shadow(color: .secondary, radius: 2, x: -2, y: -2)
                    .shadow(color: .init(.systemBackground), radius: 2, x: 2, y: 2)
                    .foregroundColor(.init(.systemBackground))
                content
            }
        }
    }
}
