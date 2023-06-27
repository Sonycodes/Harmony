//
//  DetailEventView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct DetailEventView: View {
    
    var event: Event
    var date: Date
    var myTeam: [User]
    var participants: [User]
    var discussion: [Comment]
    var isOnline: Bool
    
    let now = Date()
    var myProfil: User = userSonia

    @State var newComment: String = ""
    
//    @ObservedObject var quizManagerVM: QuizManagerVM
    
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
                    
                    if (self.participants.contains(myProfil)) && ( self.date > now) {
                        DeactivatedButtonView()
                        // If the participants list contains my profil, a desactivated button is displayed.
                        
                        if self.isOnline == true {
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
                    } else if self.date < now {
                        // If the event date is past
                        ButtonEvenementPastView()
                    }
                    else {
                        BookButtonView()
                    }   // Else a registration button is displayed
                }
                                
                

                
                VStack(alignment: .leading) {
                    Text("Mon équipe")
                        .padding(.horizontal, 24)
                        .modifier(Head2())
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(myTeam) { teamMate in
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
                            ForEach(participants) { participant in
                                ParticipantsView(participant: participant)
                            }
                        }
                        .padding(.leading, 24)
                    }
                }
                
                
                
                EventDescriptionView(event: event)
                
                
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Discussions")
                        .modifier(Head2())
                    
                    ForEach(discussion) { comment in
                        DiscussionFeedView(comment: comment)
                    }
                }
                .padding(.horizontal, 24)
                
                
                
                WriteCommentFieldView(newComment: $newComment, myProfil: myProfil)

                
                
            }  // end VStack
            
        } // end ScrollView
        .background(Color("whiteSmoke"))
    }
}

struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEventView(event: eventExampleNonRegistered, date: eventExampleNonRegistered.date, myTeam: eventExampleNonRegistered.team, participants: eventExampleNonRegistered.listParticipant, discussion: eventExampleNonRegistered.comments, isOnline: eventExampleNonRegistered.isOnline)
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
                    
                    ZStack {
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180))
                            .offset(x: 0.3, y: 6.2)
                            .font(.system(size: 12))
                        
                        Image(systemName: "circle.fill")
                            .offset(x: 0, y: -4)
                            .font(.system(size: 18))
                        
                        Image(systemName: "circle.fill")
                            .offset(x: 0, y: -4)
                            .font(.system(size: 8))
                            .foregroundColor(.white)
                    }
                    
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
                    Text(event.community)
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
    var body: some View {
        Button {
            //
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
    
    @Binding var newComment: String
    var myProfil : User
    
    var body: some View {
        HStack {
            
            Image(myProfil.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            TextField("Ecrire un commentaire", text: $newComment)
                .textFieldStyle(.roundedBorder)
            
            Image(systemName: "paperplane.fill")
                .foregroundColor(Color.sapphire)
            
        }
        .padding(.horizontal, 24)
    }
}





