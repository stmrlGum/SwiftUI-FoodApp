//
//  ProfileView.swift
//  Fodei
//
//  Created by Danil on 09.04.2026.
//

import SwiftUI

struct ProfileView: View {
    
    @State var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            profile
                .padding(.horizontal, 24)
            accountSetting
                .padding(.top, 40)
                .padding(.horizontal, 24)
                .onTapGesture {
                    // go to account Setting
                }
            appSettings
                .padding(.top, 12)
                .padding(.horizontal, 24)
            logOutButton
                .padding(.top, 40)
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)))
    }
}

private extension ProfileView {
    var profile: some View {
        HStack(spacing: 0) {
            Image("avatar")
                .resizable()
                .clipShape(Circle())
                .frame(width: 44, height: 44)
            VStack(alignment: .leading, spacing: 2) {
                Text("Sadek Hossef")
                    .font(.interSemiBold(size: 16))
                    .foregroundStyle(Color(#colorLiteral(red: 0.2156862745, green: 0.2549019608, blue: 0.3176470588, alpha: 1)))
                Text(verbatim: "sadekbranding@gmail.com")
                    .font(.interMedium(size: 10))
                    .foregroundStyle(Color(#colorLiteral(red: 0.4196, green: 0.4471, blue: 0.5020, alpha: 1)))
            }
            .padding(.leading, 16)
            Spacer()
            Button {
                // go to notification
            } label: {
                ZStack(alignment: .topTrailing) {
                    Image("notification")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Circle()
                        .fill(.red)
                        .frame(width: 12, height: 12)
                        .offset(x: 0, y: 0)
                        .overlay {
                            Text("3")
                                .font(.interMedium(size: 8))
                                .foregroundStyle(Color.white)
                        }
                }
            }
            
            
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 13)
        .background(Color.white)
        .cornerRadius(11)
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

private extension ProfileView {
    var accountSetting: some View {
        HStack(spacing: 0) {
            Image("accountIcon")
                .padding(.leading, 0)
            Text("Account setting")
                .font(.interRegular(size: 18))
                .foregroundStyle(Color(#colorLiteral(red: 0.2156862745, green: 0.2549019608, blue: 0.3176470588, alpha: 1)))
                .padding(.leading, 7)
            Spacer()
            Image("editIcon")
                .frame(width: 19, height: 19)
                .padding(.trailing, 0)
        }
        .padding(23)
        .background(Color.white)
        .cornerRadius(11)
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

private extension ProfileView {
    var appSettings: some View {
        VStack(spacing: 20) {
            ForEach(Array(viewModel.settingsItem)) { item in
                AppSettingsItem(item: item)
                    .onTapGesture {
                        print("go to \(item.item)")
                    }
            }
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(11)
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
    
}

private extension ProfileView {
    var logOutButton: some View {
        Button {
            print("logOuted")
        } label: {
            Text("Logout")
                .font(.interSemiBold(size: 16))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 28)
                .padding(.vertical, 8)
                .background(Color(#colorLiteral(red: 0.946508944, green: 0.3694341183, blue: 0.3427879214, alpha: 1)))
                .cornerRadius(11)
                .shadow(color: Color.black.opacity(0.19), radius: 6, x: 0, y: 3)
            
        }
        
    }
}


struct AppSettingsItem: View {
    let item: SettingsItemModel
    var body: some View {
        HStack(spacing: 0) {
            Image(item.icon)
                .scaledToFit()
                .frame(width: 22, height: 22)
            Text(item.item)
                .font(.interRegular(size: 18))
                .padding(.leading, 24)
            Spacer()
            Image("boldGrayArrow")
                .frame(width: 19, height: 19)
                .padding(.trailing, 0)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    //ProfileView()
    ScreenFactory.makeProfile()
}
