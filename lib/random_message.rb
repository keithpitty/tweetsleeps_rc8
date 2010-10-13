class RandomMessage
  def self.generate
    msg = [
        'hack Rails, Ruby and more!',
        'make the most of shared coding experiences.',
        'meet and catch up with other hackers.',
        'tap to start!',
        'will you be a werewolf or a villager?',
        'you will thank the baristas!',
        'laugh, share and learn!',
        'a gem of an unconference.',
        'presented by and for the Australian Ruby community.',
        'your chance to learn from informal presentations.',
        'a chance to share your geek knowledge.',
        'enjoy access to the VIP refreshment plan!',
        'brought to you by some awesome Perth Ruby people.',
        'will your app provoke demands for an encore?',
        'will you make it to breakfast in time?',
        'not strictly Rails, not strictly Ruby.',
        'learn from others and help others learn.',
        'learn more Ruby!',
        'learn more Rails!',
        'learn more Sinatra!',
        'bundles of fun to be had.',
        'git push banana master',
        'share your banana!',
        'what geek-fu will you share?',
        'got an itch to scratch?',
        'got a pet project to share?',
        'how will this camp unfold?',
        'be a mentor to other Ruby programmers.',
        'bring your Ruby and Rails questions.',
        'what memes will this camp generate?'
      ]
    msg[rand(msg.size)]
  end
end