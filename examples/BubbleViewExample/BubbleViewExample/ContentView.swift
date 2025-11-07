//
//  ContentView.swift
//  BubbleViewExample
//
//  Created by Löffler, Markus (extern) on 07.11.25.
//

import SwiftUI
import SwiftBubbleView

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("BubbleView Demo")
                    .font(.title)
                    .fontWeight(.bold)

                // No arrow example
                VStack(spacing: 12) {
                    Text("No Arrow")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    BubbleView(margin: 16) {
                        Text("Simple bubble without arrow")
                            .foregroundColor(.black)
                    }
                }

                // Top arrow examples
                VStack(spacing: 12) {
                    Text("Top Arrow")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    VStack(spacing: 20) {
                        BubbleView(arrowEdge: .top, arrowSize: 12, arrowPosition: 0.2) {
                            Text("Arrow at 20%")
                                .foregroundColor(.black)
                        }

                        BubbleView(arrowEdge: .top, arrowSize: 12, arrowPosition: 0.5) {
                            Text("Arrow centered")
                                .foregroundColor(.black)
                        }

                        BubbleView(arrowEdge: .top, arrowSize: 12, arrowPosition: 0.8) {
                            Text("Arrow at 80%")
                                .foregroundColor(.black)
                        }
                    }
                }

                // Bottom arrow examples
                VStack(spacing: 12) {
                    Text("Bottom Arrow")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    VStack(spacing: 20) {
                        BubbleView(arrowEdge: .bottom, arrowSize: 12, arrowPosition: 0.3) {
                            Text("Bottom arrow at 30%")
                                .foregroundColor(.black)
                        }

                        BubbleView(arrowEdge: .bottom, arrowSize: 12, arrowPosition: 0.7) {
                            Text("Bottom arrow at 70%")
                                .foregroundColor(.black)
                        }
                    }
                }

                // Side arrows
                HStack(spacing: 30) {
                    VStack(spacing: 12) {
                        Text("Leading")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        BubbleView(arrowEdge: .leading, arrowSize: 12, arrowPosition: 0.5) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Left arrow")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text("Points left")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    VStack(spacing: 12) {
                        Text("Trailing")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        BubbleView(arrowEdge: .trailing, arrowSize: 12, arrowPosition: 0.5) {
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("Right arrow")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text("Points right")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                // Rich content example
                VStack(spacing: 12) {
                    Text("Rich Content")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    BubbleView(arrowEdge: .bottom, arrowSize: 12, arrowPosition: 0.5, margin: 20) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                Text("Information")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }

                            Text("BubbleView supports rich content including images, multiple text styles, and complex layouts.")
                                .font(.body)
                                .foregroundColor(.secondary)

                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Flexible and customizable")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(maxWidth: 280)
                    }
                }

                // Variable sizes
                VStack(spacing: 12) {
                    Text("Variable Arrow Sizes")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    HStack(spacing: 20) {
                        BubbleView(arrowEdge: .top, arrowSize: 6, arrowPosition: 0.5, margin: 12) {
                            Text("Small")
                                .font(.caption)
                                .foregroundColor(.black)
                        }

                        BubbleView(arrowEdge: .top, arrowSize: 12, arrowPosition: 0.5, margin: 12) {
                            Text("Medium")
                                .font(.body)
                                .foregroundColor(.black)
                        }

                        BubbleView(arrowEdge: .top, arrowSize: 18, arrowPosition: 0.5, margin: 12) {
                            Text("Large")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    ContentView()
}
