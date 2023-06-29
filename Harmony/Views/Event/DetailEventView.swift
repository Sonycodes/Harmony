//
//  DetailEventView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct DetailEventView: View {
    
    @State var event: Event
    @ObservedObject var eventComments: Comments
    
    let now = Date()
    var myProfil: User = myUser
    
    @State var showBookingForm = false
    
    @State var newContent: String = ""
    
    
    var body: some View {
        ScrollView(.vertical) {
            
            Image(event.photo) // Cover image
                .resizable()
                .scaledToFill()
                .frame(width: 390, height: 240)
                .clipped()
                .padding(.bottom, 8)
            
            
            VStack(spacing: 32) {
                
                EventInfoView(event: event)
                
                VStack(spacing: 12) {
                    
                    if (self.event.listParticipant.contains(myProfil)) && ( self.event.date > now) {
                        DeactivatedButtonView()
                        // If the participants list contains my profil, a desactivated button is displayed.
                        
                        if self.event.isOnline == true {
                            NavigationLink {
                                WaitingToStartQuizView()
                            } label: {
                                Text("Commencer le Quiz")
                                    .frame(width: 342, height: 56)
                                    .background(Color.darkPeriwinkle)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .font(.custom("Urbanist", size: 18))
                                    .fontWeight(.bold)
                            }
                            
                        }
                    } else if self.event.date < now {
                        // If the event date is past
                        ButtonEvenementPastView()
                    }
                    else {
                        BookButtonView(showBookingForm: $showBookingForm)
                    }   // Else, a registration button is displayed
                }
                
                
                VStack(alignment: .leading) {
                    Text("Mon équipe")
                        .padding(.horizontal, 24)
                        .modifier(Head2())
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(event.team) { teamMate in
                                MyTeamView(teamMate: teamMate)
                            }
                        }
                        .padding(.leading, 24)
                    }
                }
                
                
                
                VStack(alignment: .leading) {
                    Text("Autres participants")
                        .padding(.horizontal, 24)
                        .modifier(Head2())
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(event.listParticipant) { participant in
                                ParticipantsView(participant: participant)
                            }
                        }
                        .padding(.leading, 24)
                    }
                }
                
                
                
                EventDescriptionView(event: event)
                
                
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Discussion")
                        .modifier(Head2())
                    
                    ForEach(eventComments.comments) { comment in
                        DiscussionFeedView(comment: comment)
                    }
                }
                .padding(.horizontal, 24)
                
                
                WriteCommentFieldView(myProfil: myProfil, newContent: newContent, eventComments: eventComments)
                
                
            }  // end VStack
            
            .sheet(isPresented: $showBookingForm) {
                BookingFormView(event: $event)
            }
            .presentationDetents([.medium, .large])
            
        } // end ScrollView
        .background(Color("whiteSmoke"))
        
        
    }
}

struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEventView(event: eventExampleNonRegistered, eventComments: eventExampleNonRegistered.comments)
    }
}



// ------------------- ExtractedViews -------------------

struct EventInfoView: View {
    
    var event: Event
    
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        return dateFormatter.string(from: event.date)
    } // Convert the display format of event.date in "dd month yyyy" in French
    
    
    var body: some View {
        VStack(spacing: 8) {
            
            Text(event.title)
                .modifier(Head0())
            
            Text(formattedDateString) // Display the converted date
                .modifier(Head2())
            
            Spacer()
                .frame(height: 16)
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    
                    MapPinView()
                    
                    VStack(alignment: .leading) {
                        Text(event.address?.namePlace ?? "Evénement")
                        
                        HStack {
                            Text(event.address?.address ?? "en ligne")
                            Text(event.address?.city ?? "")
                        }
                    }
                }
                
                HStack {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 16.0))
                    Text(event.community.name)
                }
            }
            .modifier(Normal())
            
        }
    }
}



struct DeactivatedButtonView: View {
    var body: some View {
        Button {
            //
        } label: {
            Text("Je suis déjà inscrit")
                .frame(width: 316, height: 44)
                .modifier(Head2())
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.sky.opacity(0.5))
        .cornerRadius(8)
    }
}



struct BookButtonView: View {
    
    @Binding var showBookingForm: Bool
    
    var body: some View {
        Button {
            showBookingForm = true
        } label: {
            Text("M'inscrire à l'événement")
                .frame(width: 316, height: 44)
                .foregroundColor(.white)
                .font(.custom("Urbanist", size: 18))
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.darkPeriwinkle)
        .cornerRadius(8)
    }
}



struct ButtonEvenementPastView: View {
    var body: some View {
        Button {
            //
        } label: {
            Text("Cet événement est terminé")
                .frame(width: 316, height: 44)
                .modifier(Head2())
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.sky.opacity(0.5))
        .cornerRadius(8)
    }
}



struct MyTeamView: View {
    
    var teamMate : User
    
    var body: some View {
        VStack {
            Image(teamMate.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(teamMate.pseudo)
                .font(.caption)
        }
    }
}



struct ParticipantsView: View {
    
    var participant: User
    
    var body: some View {
        VStack {
            Image(participant.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(participant.pseudo)
                .font(.caption)
        }
    }
}



struct EventDescriptionView: View {
    
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Description")
                .modifier(Head2())
            
            Text(event.detail)
                .modifier(Normal())
            
            Text("Nombre minimum de participants : \(event.minParticipants) personnes")
                .modifier(SmallGray())
            
        }
        .padding(.horizontal, 24)
    }
}




struct DiscussionFeedView: View {
    
    var comment: Comment
    
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        return dateFormatter.string(from: comment.date)
    }     // Convert the display format of comment.date
    
    
    var body: some View {
        HStack {
            Image(comment.user.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                Divider()
                    .padding(.bottom, 16)
                
                Spacer()
                
                HStack {
                    Text(comment.user.pseudo)
                        .modifier(Head2())
                    
                    Spacer()
                    
                    Text(formattedDateString) // Display the date with the converted format
                        .modifier(SmallGray())
                        .padding(.trailing, 8)
                }
                .padding(.bottom, 4)
                
                Text(comment.content)
                    .modifier(Normal())
                
            }
            .padding(.leading, 8)
        }
    }
}



struct WriteCommentFieldView: View {
    
    var myProfil : User
    @State var newContent: String = ""
    @ObservedObject var eventComments: Comments
    
    var body: some View {
        HStack {
            
            Image(myProfil.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            TextField("Ecrire un commentaire", text: $newContent)
                .textFieldStyle(.roundedBorder)
            
            Button {
                eventComments.addComment(newComment: Comment(user: myProfil, content: newContent, date: Date()))
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(Color.sapphire)
            }
            
        }
        .padding(.horizontal, 24)
    }
}






struct BookingFormView: View {
    
    @Binding var event: Event
    
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        return dateFormatter.string(from: event.date)
    } // Convert the display format of event.date in "dd month yyyy" in French
    
    var body: some View {
        VStack {
            
            ZStack {
                BookingFormBannerShape()
                    .fill(Color.sapphire)
                    .ignoresSafeArea()
                    .frame(height: 172)
                
                VStack(spacing: 8) {
                    
                    Text("Inscription à l'événement")
                        .foregroundColor(Color.sky)
                        .modifier(Head1())
                        .padding(.top, 16)
                                            
                    Text(event.title)
                        .foregroundColor(Color.sky)
                        .modifier(Head0())
                }
            }
            .padding(.bottom, 16)
            // fin Banner
            
            VStack { // Need this VStack to apply 'listStyle(.plain)'
                List {
                    Text("Récapitulatif de l'événement")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .modifier(Head3())
                        .padding(8)
                    
                    HStack {
                        Image(systemName: "calendar.badge.clock")
                            .frame(width: 60)
                        
                        Text(formattedDateString)
                    }
                    .padding(.vertical,8)
                    
                    HStack {
                        MapPinView()
                            .frame(width: 60)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(event.address?.namePlace ?? "Cet événement aura lieu")
                            
                            HStack {
                                Text(event.address?.address ?? "en ligne")
                                Text(event.address?.city ?? "")
                            }
                        }
                    }
                    .padding(.vertical,8)
                    
                    HStack {
                        Image(systemName: "person.3.fill")
                            .frame(width: 60)
                        
                        Text(event.community.name)
                    }
                    .padding(.vertical,8)
                }
            }
            .listStyle(.plain)
            .modifier(Head2())
            
            
            Button {
                //
            } label: {
                Text("Confiermer mon inscription")
                    .frame(width: 316, height: 44)
                    .foregroundColor(.white)
                    .font(.custom("Urbanist", size: 18))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.darkPeriwinkle)
            .cornerRadius(8)
            
            Spacer()
            
            
        }
    }
}
