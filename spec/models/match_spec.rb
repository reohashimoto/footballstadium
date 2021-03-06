require 'rails_helper'

RSpec.describe Match, type: :model do
  before do
    @match = FactoryBot.build(:match)
    @match.home_team_image = fixture_file_upload('app/assets/images/test_image.png')
    @match.away_team_image = fixture_file_upload('app/assets/images/test_image.png')
  end

    describe '試合投稿機能' do
      context "試合投稿できる場合" do
        it "全ての情報が正しく入力されていれば投稿できる" do
          expect(@match).to be_valid
        end
      end
      context "試合投稿できない場合" do
        it "リーグか大会名がないと投稿できない" do
          @match.league = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("League can't be blank")
        end
        
        it "開催場所がないと投稿できない" do
          @match.place = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("Place can't be blank")
        end
        it "ホームチーム名がないと投稿できない" do
          @match.home_team_name = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("Home team name can't be blank")
        end

        it "アウェイチーム名がないと投稿できない" do
          @match.away_team_name = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("Away team name can't be blank")
        end

        it "ホームチーム画像がないと投稿できない" do
          @match.home_team_image = nil
          @match.valid?
          expect(@match.errors.full_messages).to include("Home team image can't be blank")
        end

        it "アウェイチーム画像がないと投稿できない" do
          @match.away_team_image = nil
          @match.valid?
          expect(@match.errors.full_messages).to include("Away team image can't be blank")
        end

        it "ホームチームスコアがないと投稿できない" do
          @match.home_team_score = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("Home team score can't be blank")
        end
        it "ホームチームスコアが数字でないと投稿できない" do
          @match.home_team_score = "a"
          @match.valid?
          expect(@match.errors.full_messages).to include("Home team score is not a number")
        end

        it "アウェイチームスコアがないと投稿できない" do
          @match.away_team_score = ""
          @match.valid?
          expect(@match.errors.full_messages).to include("Away team score can't be blank")
        end

        it "アウェイチームのスコアが数字でない登録できない" do
          @match.away_team_score = "a"
          @match.valid?
          expect(@match.errors.full_messages).to include("Away team score is not a number")
        end

        it "日付がないと投稿できない" do
          @match.date = nil
          @match.valid?
          expect(@match.errors.full_messages).to include("Date can't be blank")
        end

      end
    end
end
