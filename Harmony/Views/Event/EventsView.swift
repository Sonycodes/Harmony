//
//  EventsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct EventsView: View {
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.darkPeriwinkle)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.darkPeriwinkle).withAlphaComponent(0.3)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor .white, .font : UIFont.systemFont(ofSize: 16)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor .white, .font : UIFont.systemFont(ofSize: 16)], for: .selected)
    } // Modify Color & Font size in the Picker
    
    @ObservedObject var eventsList = EventsViewModel()
    
    @State private var selectedSegmentIndex = 0
    @State private var filteredMyEvents: [Event] = myEventsList
    let now = Date() // Date() means the date and the time of now.
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Picker("Filter", selection: $selectedSegmentIndex)  {
                    Text("A venir")
                        .tag(0)
                    Text("Passés")
                        .tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 16)
                
                
                List {
                    ForEach(filteredMyEvents) { event in
                        ZStack {
                            NavigationLink {
                                DetailEventView(event: event, eventComments: event.comments)
                            } label: {
                                EventListRowView(myEvent: event)
                            }
                        }
                        .listRowBackground(
                            Rectangle()
                                .fill(.white)
                                .padding(16)
                        )
                        .background(Color.white)
                        .frame(width: 342)
                        .cornerRadius(8)
                        .listRowSeparator(.hidden)
                    }
                } // end List
                .listStyle(.plain)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                .onAppear() {
                    filteredMyEvents = eventsList.eventsList.filter { $0.date > now }
                } // When the user arrives on this screen, "A venir" est selected and the coming events are shown on the list.

                .onChange(of: selectedSegmentIndex) {
                    date in
                    if selectedSegmentIndex == 0 {
                        filteredMyEvents = eventsList.eventsList.filter { $0.date > now }
                    } else {
                        filteredMyEvents = eventsList.eventsList.filter { $0.date <= now }
                    }
                } // When the user tap on the Picker, the elements on the list are filtered according to the date (futur or past).

                                
            } // end VStack
            .padding(.horizontal, 24)
            .background(Color .whiteSmoke)
            .navigationBarTitle("Mes événements")

        } // end NavigationStack
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}




