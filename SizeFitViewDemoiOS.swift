//
//  SizeFitView.swift
//  IOSDemo3
//
//  Created by Itsuki on 2026/02/08.
//

import SwiftUI

struct SizeFitViewDemoiOS: View {
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
                **View to find size:**
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
                
                // won't work
                Text("View Size (Geometry Proxy): \(Int(viewSize.width)) * \(Int(viewSize.height))")
                
                let uiView = UIHostingController(rootView: view)
                // some large number for width and height
                let sizeThatFit = uiView.sizeThatFits(in: .init(width: 8000, height: 8000))
                Text("View Size (`sizeThatFits`): \(Int(sizeThatFit.width)) * \(Int(sizeThatFit.height))")
                // won't work
                Text("View Size (`preferredContentSize`): \(Int(uiView.preferredContentSize.width)) * \(Int(uiView.preferredContentSize.height))")

            })
            .padding()
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow.opacity(0.1))
            .navigationTitle("View Size w/o Render")
        }
    }
}
