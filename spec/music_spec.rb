require_relative '../lib/music'

describe MusicAlbum do
  let(:publish_date) { Time.new(1999, 1, 1) }
  let(:on_spotify) { true }
  let(:album) { MusicAlbum.new(publish_date, on_spotify) }

  describe '#initialize' do
    it 'creates a new MusicAlbum object with the correct publish date and on_spotify flag' do
      expect(album.publish_date).to eq(publish_date)
      expect(album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#can_be_archived?' do
    context 'when the album is on Spotify and was published over 10 years ago' do
      date = 1999
      spotify = true
      music = MusicAlbum.new(date, spotify)

      it 'returns true' do
        expect(music.can_be_archived?).to be true
      end
    end

    context 'when the album is not on Spotify' do
      let(:on_spotify) { false }

      it 'returns false' do
        expect(album.can_be_archived?).to be false
      end
    end

    context 'when the album was published less than 10 years ago' do
      date = 2020
      spotify = true
      music = MusicAlbum.new(date, spotify)

      it 'returns false' do
        expect(music.can_be_archived?).to be false
      end
    end
  end
end
