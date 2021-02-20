//
//  WidgetDemo.swift
//  WidgetDemo
//
//  Created by Shusuke Ota on 2021/2/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), timeLineText: "TEST", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), timeLineText: "TEST", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        var texts: [String] = []
        for i in 0 ..< 5 {
            texts.append("timeline: \(i) h")
        }
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entryText = texts[hourOffset]
            let entry = SimpleEntry(date: entryDate, timeLineText: entryText, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeLineText: String
    let configuration: ConfigurationIntent
}
// MARK: - Setting View
struct WidgetDemoEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text("TEST")
            Text(entry.timeLineText)
                .foregroundColor(.red)
        }
    }
}
// MARK: - Setting Widget Info
@main
struct WidgetDemo: Widget {
    let kind: String = "WidgetDemo"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetDemoEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
// MARK: - Preview
struct WidgetDemo_Previews: PreviewProvider {
    static var previews: some View {
        WidgetDemoEntryView(entry: SimpleEntry(date: Date(), timeLineText: "TEST", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
