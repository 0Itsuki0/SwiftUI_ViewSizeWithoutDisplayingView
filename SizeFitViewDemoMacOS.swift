
import SwiftUI

struct SizeFitViewDemoMacOS: View {
    @State private var viewSize: CGSize = .zero
    var body: some View {
        NavigationStack {

            VStack(spacing: 36, content: {
                let view = Text("View to get Size")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).fill(.red.opacity(0.1)))
                    .onGeometryChange(
                        for: CGSize.self,
                        of: { proxy in
                            proxy.size
                        },
                        action: { _, new in
                            self.viewSize = new
                        }
                    )
                
                Text("""
                View to find size:
                -------
                let view = Text("View to get Size")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).fill(.red.opacity(0.1)))
                    .onGeometryChange(
                        for: CGSize.self,
                        of: { proxy in
                            proxy.size
                        },
                        action: { _, new in
                            self.viewSize = new
                        }
                    )
                -------
                """)
                .font(.subheadline)
                                
                Divider()

                // won't work
                Text("View Size (Geometry Proxy): \(Int(viewSize.width)) * \(Int(viewSize.height))")
                
                let hostingView = NSHostingView(rootView: view)
                let sizeThatFit = hostingView.fittingSize
                Text("View Size (`fittingSize`): \(Int(sizeThatFit.width)) * \(Int(sizeThatFit.height))")

            })
            .padding()
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow.opacity(0.1))
            .navigationTitle("View Size w/o Render")
        }
    }
}
