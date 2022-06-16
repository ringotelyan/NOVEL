class Public::ChatsController < ApplicationController

  def show
    # チャット相手のuser情報を取得
    @user = User.find(params[:id])
    # user_roomsテーブルのuser_idが本人のレコードのroom_id配列で取得
    rooms = current_user.user_rooms.pluck(:room_id)
    # user_idがチャット相手で、room_idが本人の属するroom_id(配列)となるuser_roomsテーブルのレコードを取得して、user_room変数に格納
    # これによって、本人とチャット相手に共通のroom_idが存在していれば、その共通のroom_idとチャット相手のuser_idがuser_room変数に格納される（１レコード）。
    # 存在しなければnilになる。
    user_room = UserRoom.find_by(user_id: @user_id, room_id: rooms)

    # user_roomでルームを取得できなかった(本人(Aさん)とチャット相手(Bさん)のチャットがまだ存在しない)場合の処理
    room = nil
    if user_room.nil?
      # roomのidを採番
      room = Room.new

      room.save
      # 採番したroomのidを使って、user_roomのレコードを2人分(Aさん用、Bさん用)作る(=AさんとBさんに共通のroom_idを作る)
      # Bさんの@user.idをuser_idとして、room.idをroom_idとして、UserRoomモデルのカラムに保存(1レコード)
      UserRoom.create(user_id: @user.id, room_id: room.id)
      # Aさんのcurrent_user.idをuser_idとして。room.idをroom_idとして、UserRoomモデルのカラムに保存
      UserRoom.create(user_id: current_user.id, room_id: room.id)
    else
      # user_roomに紐づくroomsテーブルのレコードをroomに格納
      room = user_room.room
    end

    # roomに紐づくchatsテーブルのレコードを@chatsに格納
    @chats = room.chats
    # form_withでチャットを送信する際に必要な空のインスタンス
    # ここでroom.idを@chatに代入しておかないと、form_withで記述するroom_idに値が渡らない
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chat.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

end
