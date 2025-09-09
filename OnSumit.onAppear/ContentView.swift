//
//  ContentView.swift
//  OnSumit.onAppear
//
//  Created by Авазбек Надырбек уулу on 07.09.25.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedCategory: Category = .upcoming
    @State var toggleState: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Name
                    nameView()
                    
                    //Category
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            
                            ForEach(Category.allCases, id: \.self) { card in
                                
                                    CategoryBtn(selectedCategory: $selectedCategory, category: card)
                                
                                
                                
                            }
                        }
                        .padding(.vertical,2)
                        .padding(.horizontal, 20)
                        
                    }
                    
                    //Cards
                    VStack(alignment: .leading) {
                        
                        //one Card
                        ForEach(CardItem.mockData(), id: \.self) { card in
                            
                            if card.category == selectedCategory {
                                CardView(toggleState: $toggleState, cardData: card)

                            }
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 45)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.appBG)
        
    }
}

#Preview {
    ContentView()
}

enum Category: String, CaseIterable {
    case upcoming = "Upcoming"
    case onHold = "On hold"
    case past = "Past"
    case canceled = "Canceled"
    
}

struct CategoryBtn: View {
    
    @Binding var selectedCategory: Category
    var category: Category
    
    var body: some View {
        Button {
            withAnimation {
                selectedCategory = category
            }
        } label: {
            Text(category.rawValue)
                .foregroundStyle(selectedCategory == category ? Color.white : .white.opacity(0.7))
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .font(.system(size: 14, weight: .bold))
                .background(
                    Capsule()
                        .stroke(Color.appGreen, lineWidth: selectedCategory == category ? 1 : 0)
                        .foregroundStyle(.clear)
                        
                )
        }
    }
}


struct HeaderView: View {
    var body: some View {
        HStack {
            // Ava + text
            HStack {
                
                Button {
                    
                } label: {
                    Image(.img2)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .clipShape(Circle())
                }
                
                Text("Hey, Oleg!")
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            //Plus
            Button {
                
            } label: {
                ZStack {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .zIndex(1)
                    Circle()
                        .stroke(.white, lineWidth: 1)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.clear)
                    //                            .overlay {
                    //                                RoundedRectangle(cornerRadius: 20)
                    //                                    .stroke(.white, lineWidth: 1)
                    //                            }
                }
                
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .background(.appBG)
        .zIndex(1)
        
    }
}

struct nameView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Check your")
                .font(.system(size: 30))
            Text("Meeting Details")
                .font(.system(size: 30, weight: .bold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

struct AvatarView: View {
    let image: ImageResource
    let size: CGFloat

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

struct AvatarStack: View {
    let images: [ImageResource]
    let size: CGFloat
    let overlap: CGFloat

    var body: some View {
        ZStack(alignment: .center) {
            ForEach(Array(images.enumerated()), id: \.offset) { index, img in
                AvatarView(image: img, size: size)
                    .offset(x: CGFloat(index) * (size - overlap))
                    .zIndex(Double(index))
            }
        }
        .frame(
            height: size
        )
    }
}


struct CardItem: Identifiable, Hashable {
    var id: UUID = UUID()
    let time: String
    let title: String
    let memberCount: Int
    var userUser: Int?
    var firtsUserImages: [ImageResource]
    var color: String
    var newUser: Int?
    var category: Category
    
    static func mockData() -> [CardItem] {
        [
            CardItem(time: "1:30 - 3:30 PM", title: "Development", memberCount: 14, firtsUserImages: [.img2, .img3, .img4], color: "appBrown", newUser: 14, category: .upcoming),
            
            CardItem(time: "4:30 - 6:30 PM", title: "New Site", memberCount: 7, firtsUserImages: [.img2, .img3, .img4], color: "appGreen",newUser: 4, category: .upcoming),
            
            CardItem(time: "1:30 - 3:30 PM", title: "Interview", memberCount: 14, firtsUserImages: [.img2, .img3, .img4], color: "appLightblue",newUser: 10, category: .past),
            
            CardItem(time: "1:30 - 3:30 PM", title: "Interview", memberCount: 14, firtsUserImages: [.img2, .img3, .img4], color: "appLightblue",newUser: 10, category: .onHold),
            
            CardItem(time: "1:30 - 3:30 PM", title: "Interview", memberCount: 14, firtsUserImages: [.img2, .img3, .img4], color: "appLightblue",newUser: 10, category: .canceled)
             
        ]
    }
    
}

struct CardView: View {
    @Binding var toggleState: Bool
    
    var cardData: CardItem
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                HStack {
                    
                    Text("\(cardData.time) PM")
                        .font(.system(size: 12, weight: .medium, design: .default))
                    Spacer()
                    Toggle(isOn: $toggleState) {
                        
                    }
                }
                Text(cardData.title)
                    .font(.system(size: 20, weight: .bold))
            }
            
            VStack(alignment: .leading) {
                Text("\(cardData.memberCount) Members Joning")
                    .font(.system(size: 12))
                HStack {
                    
                    HStack(spacing: 60) {
                        
                        ZStack {
                            AvatarStack(images: cardData.firtsUserImages, size: 36, overlap: 12)
                        }
                        
                        Text("+ \(cardData.newUser ?? 0)")
                            .foregroundStyle(.white)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Join")
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 15)
                            .foregroundColor(.black)
                            .background(
                                Capsule()
                                    .stroke(.black, lineWidth: 1)
                                    .foregroundStyle(.clear)
                                    
                            )
                    }

                    
                }
            }
        }
        .padding(20)
        .background(Color(cardData.color))
        .foregroundStyle(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}
