//
//  BubbleView.swift
//  SwipeCalendar
//
//  Created by Löffler, Markus (extern) on 16.04.25.
//  Copyright © 2025 MarkusLoeffler. All rights reserved.
//

import SwiftUI

public enum BubbleArrowEdge { case none, top, bottom, leading, trailing }

public struct BubbleView<Content: View>: View {
    let arrowEdge: BubbleArrowEdge
    let arrowSize: CGFloat
    let arrowPosition: CGFloat // from 0.0 (start) to 1.0 (end)
    let margin: CGFloat
    let content: Content
    let edgeInsets: EdgeInsets

    init(
        arrowEdge: BubbleArrowEdge = .none, arrowSize: CGFloat = 12, arrowPosition: CGFloat = 0.5, margin: CGFloat = 16,
        @ViewBuilder content: () -> Content
    ) {
        self.arrowEdge = arrowEdge
        self.arrowSize = arrowSize
        self.arrowPosition = arrowPosition
        self.margin = margin
        self.content = content()

        switch arrowEdge {
        case .none: edgeInsets = EdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        case .top:
            edgeInsets = EdgeInsets(top: margin + arrowSize, leading: margin, bottom: margin, trailing: margin)
        case .bottom:
            edgeInsets = EdgeInsets(top: margin, leading: margin, bottom: margin + arrowSize, trailing: margin)
        case .leading:
            edgeInsets = EdgeInsets(top: margin, leading: margin + arrowSize, bottom: margin, trailing: margin)
        case .trailing: edgeInsets = EdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        }
    }

    var body: some View {
        content.padding(edgeInsets).background(
            BubbleShape(arrowEdge: arrowEdge, arrowSize: arrowSize, arrowPosition: arrowPosition, cornerRadius: 12)
                .fill(Color.white).shadow(radius: 4))
    }
}

struct BubbleShape: Shape {
    var arrowEdge: BubbleArrowEdge
    var arrowSize: CGFloat
    var arrowPosition: CGFloat // 0 to 1
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let r = cornerRadius
        let a = arrowSize

        let w = rect.width
        let h = rect.height

        // Arrow base offset (keeps it within bounds)
        func arrowOffset(for dimension: CGFloat) -> CGFloat { max(a, min(dimension - a, dimension * arrowPosition)) }

        switch arrowEdge {
        case .none:
            path.move(to: CGPoint(x: r, y: 0))
            path.addArc(
                center: CGPoint(x: w - r, y: r), radius: r, startAngle: .degrees(-90), endAngle: .degrees(0),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: w, y: h - r))
            path.addArc(
                center: CGPoint(x: w - r, y: h - r), radius: r, startAngle: .degrees(0), endAngle: .degrees(90),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: r, y: h))
            path.addArc(
                center: CGPoint(x: r, y: h - r), radius: r, startAngle: .degrees(90), endAngle: .degrees(180),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: 0, y: r))
            path.addArc(
                center: CGPoint(x: r, y: r), radius: r, startAngle: .degrees(180), endAngle: .degrees(270),
                clockwise: false
            )

        case .top:
            let ax = arrowOffset(for: w)
            path.move(to: CGPoint(x: r, y: a))
            path.addLine(to: CGPoint(x: ax - a, y: a))
            path.addLine(to: CGPoint(x: ax, y: 0))
            path.addLine(to: CGPoint(x: ax + a, y: a))
            path.addLine(to: CGPoint(x: w - r, y: a))
            path.addArc(
                center: CGPoint(x: w - r, y: a + r), radius: r, startAngle: .degrees(-90), endAngle: .degrees(0),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: w, y: h - r))
            path.addArc(
                center: CGPoint(x: w - r, y: h - r), radius: r, startAngle: .degrees(0), endAngle: .degrees(90),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: r, y: h))
            path.addArc(
                center: CGPoint(x: r, y: h - r), radius: r, startAngle: .degrees(90), endAngle: .degrees(180),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: 0, y: a + r))
            path.addArc(
                center: CGPoint(x: r, y: a + r), radius: r, startAngle: .degrees(180), endAngle: .degrees(270),
                clockwise: false
            )

        case .bottom:
            let ax = arrowOffset(for: w)
            path.move(to: CGPoint(x: r, y: 0))
            path.addLine(to: CGPoint(x: w - r, y: 0))
            path.addArc(
                center: CGPoint(x: w - r, y: r), radius: r, startAngle: .degrees(-90), endAngle: .degrees(0),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: w, y: h - a - r))
            path.addArc(
                center: CGPoint(x: w - r, y: h - a - r), radius: r, startAngle: .degrees(0), endAngle: .degrees(90),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: ax + a, y: h - a))
            path.addLine(to: CGPoint(x: ax, y: h))
            path.addLine(to: CGPoint(x: ax - a, y: h - a))
            path.addLine(to: CGPoint(x: r, y: h - a))
            path.addArc(
                center: CGPoint(x: r, y: h - a - r), radius: r, startAngle: .degrees(90), endAngle: .degrees(180),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: 0, y: r))
            path.addArc(
                center: CGPoint(x: r, y: r), radius: r, startAngle: .degrees(180), endAngle: .degrees(270),
                clockwise: false
            )

        case .leading:
            let ay = arrowOffset(for: h)
            path.move(to: CGPoint(x: a, y: r))
            path.addLine(to: CGPoint(x: a, y: ay - a))
            path.addLine(to: CGPoint(x: 0, y: ay))
            path.addLine(to: CGPoint(x: a, y: ay + a))
            path.addLine(to: CGPoint(x: a, y: h - r))
            path.addArc(
                center: CGPoint(x: a + r, y: h - r), radius: r, startAngle: .degrees(180), endAngle: .degrees(90),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: w - r, y: h))
            path.addArc(
                center: CGPoint(x: w - r, y: h - r), radius: r, startAngle: .degrees(90), endAngle: .degrees(0),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: w, y: r))
            path.addArc(
                center: CGPoint(x: w - r, y: r), radius: r, startAngle: .degrees(0), endAngle: .degrees(-90),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: a + r, y: 0))
            path.addArc(
                center: CGPoint(x: a + r, y: r), radius: r, startAngle: .degrees(-90), endAngle: .degrees(180),
                clockwise: true
            )

        case .trailing:
            let arrowY = rect.midY + (arrowPosition - 0.5) * (rect.height - 2 * cornerRadius)

            path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius,
                startAngle: .degrees(270), endAngle: .degrees(180), clockwise: true
            )

            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius))
            path.addArc(
                center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius,
                startAngle: .degrees(180), endAngle: .degrees(90), clockwise: true
            )

            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius,
                startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true
            )

            path.addLine(to: CGPoint(x: rect.maxX, y: arrowY + arrowSize))
            path.addLine(to: CGPoint(x: rect.maxX + arrowSize, y: arrowY))
            path.addLine(to: CGPoint(x: rect.maxX, y: arrowY - arrowSize))

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius))
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius,
                startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true
            )

            path.closeSubpath()
        }

        return path
    }
}

#Preview {
    VStack(spacing: 30) {
        BubbleView(margin: 12) { Text("No callout").foregroundColor(.black) }

        BubbleView(arrowEdge: .top, arrowSize: 8, arrowPosition: 0.5, margin: 12) {
            Text("Hello from the top!").foregroundColor(.black)
        }

        BubbleView(arrowEdge: .bottom, arrowSize: 8, arrowPosition: 0.3, margin: 12) {
            Text("Bottom left-ish arrow").foregroundColor(.black)
        }

        BubbleView(arrowEdge: .leading, arrowSize: 8, arrowPosition: 0.5, margin: 12) {
            Text("Left side pop").foregroundColor(.black)
        }

        BubbleView(arrowEdge: .trailing, arrowSize: 8, arrowPosition: 0.5, margin: 12) {
            Text("Right side pop").foregroundColor(.black)
        }
    }.padding().background(Color.gray.opacity(0.2))
}
