//
//  HomeView.swift
//  NanoChallenge1
//
//  Created by uiskim on 2022/05/03.
//
import SwiftUI

struct HomeView: View {
    
    @State private var mybooklists: [Mybook] = [
        Mybook(backGroundColor: .appyellow, subject: "swiftUI", title: "SwiftUI Tutorial ๋๋ด๊ธฐ", emoji: "๐"),
        Mybook(backGroundColor: .appbrown1, subject: "swiftUI", title: "๋ค์ํ SwiftUI Examples", emoji: "๐"),
        Mybook(backGroundColor: .appbrown2, subject: "Python", title: "Python์ ๊ธฐ์ด์ ์์ฉ", emoji: "๐"),
        Mybook(backGroundColor: .appgray2, subject: "Django", title: "Django๋ก ๋ฐฐ์ฐ๋ ๋ฐฑ์๋ ๊ธฐ์ด", emoji: "๐")
    ]
    
    @State var goAllref: Bool = false
    @State var randomIndex: Int = 0
    @State var isAddNewBook = false
    @State var goTest1View = false
    @State var goHome = false
    
    var body: some View {

        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                ScrollView{
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading, spacing: 0){
                            Text("My Own Book")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundColor(.appgray1)
                            Text("๋๋ง์ ์ฑ์\n๋ง๋ค๊ณ  ์ฑ์๋๊ฐ ๋ณด์ธ์")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .lineLimit(2)
                        }
                        .padding(.leading, 22)
                        .padding(.bottom, 30)
                        .padding(.top, 20)
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing:20) {
                                ForEach(mybooklists, id: \.self) { book in
                                    NavigationLink(destination: BookDetailVIew(book: book, index: mybooklists.firstIndex(of: book)!).navigationBarBackButtonHidden(true)){
                                        BookListCellView(book: book)
                                        
                                    }
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 170, height: 210)
                                        .foregroundColor(.backgroundReverse)
                                    VStack {
                                        Spacer().frame(height: 0)
                                        Image("MainEmoji")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        
                                        Text("๊ณต๋ถํ ๋ด์ฉ์\n๋๋ง์ ๋ฐฉ์๋๋ก ์ ๋ฆฌํด๋ด์")
                                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                                            .foregroundColor(.white)
                                        
                                        Spacer().frame(height: 10)
                                        
                                        HStack(spacing: 5){
                                            Text("๐")
                                                .font(.title2)
                                            VStack(alignment: .leading) {
                                                Text("๋๋ง์ ์ฑ ๋ง๋ค๊ธฐ")
                                                    .font(.system(size: 8, weight: .medium, design: .rounded))
                                                    .foregroundColor(.appgray1)
                                                Text("๋ถ์ผ์ ์ฑ ์ ๋ชฉ์ ์ ์ด๋ด์")
                                                    .font(.system(size: 10, weight: .bold, design: .rounded))
                                                    .foregroundColor(.buttonblue)
                                            }
                                        }
                                        
                                        Spacer().frame(height: 20)
                                        
                                        ZStack {
                                            Button {
                                                isAddNewBook.toggle()
                                                randomIndex += 1
                                                randomIndex = randomIndex%3
                                            } label: {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: 140, height: 30)
                                                    .foregroundColor(.buttonblue)
                                            }
                                            Text("ํ๋ฒ ๋ง๋ค์ด๋ณผ๊ฒ์")
                                                .font(.system(size: 10, weight: .semibold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                        
                        Spacer().frame(height: 30)

                        VStack(alignment: .leading) {
                            Text("๋ค์ํ ๋ ํผ๋ฐ์ค")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.leading, 22)
                                .padding(.bottom, 7)
                            
                            Spacer().frame(height: 0)
                            ForEach(refsublist1){ref in
                                ReferenceSubCellView(refsubcell: ref)
                            }
                            Spacer().frame(height: 15)
                            
                            Button {
                                goAllref.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 17)
                                        .frame(width: 355, height: 55, alignment: .center)
                                        .foregroundColor(.buttonColor)
                                        .padding(.horizontal)
                                    Text("๋ชจ๋๋ณด๊ธฐ")
                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                    }
                    .padding()
                }
                .navigationBarHidden(true)
                if isAddNewBook {
                    BookInfoAlertVIew(randomIndex: $randomIndex, mybooklists: $mybooklists, isAddNewBook: $isAddNewBook)
                }
                if goAllref{
                    RefAllListView(goAllref: $goAllref)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

