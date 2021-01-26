=begin
given a letter it supplies the diamond at the widest point

    A       4 spaces 1 letter A = 1 (0 spaces)
   B B      3 spaces 1 letter B 1 space 1 Letter B = 2
  C   C     2 spaces 1 letter C 3 spaces 1 letter C = 3
 D     D    1 space 1 letter D 5 spaces 1 letter D = 4
E       E   0 spaces 1 letter E 7 spaces 1 letter E = 5
 D     D    1 space 1 letter D 5 spaces 1 letter D = 4
  C   C     2 spaces 1 letter C 3 spaces 1 letter C = 3
   B B      3 spaces 1 letter B 1 space 1 Letter B = 2
    A       4 spaces 1 letter A = 1 (0 spaces)
=end

class Diamond
  def self.make_diamond(letter)
    return p "A\n" if letter.upcase == 'A'
    alpha_arr = ('A'..'Z').to_a
    width = alpha_arr.index(letter.upcase) - 1
    space = 1
    idx = 0
    diamond = ''
    diamond << ' ' * (width + 1) + alpha_arr[idx] + ' ' * (width + 1) + "\n"
    width.downto(0) do |num|
      idx += 1
      diamond << (' ' * num) + alpha_arr[idx] + (' ' * space) + alpha_arr[idx] + (' ' * num) + "\n"
      space += 2
    end
    space -= 4
    1.upto(width) do |num|
       idx -= 1
       diamond << (' ' * num) + alpha_arr[idx] + (' ' * space) + alpha_arr[idx] + (' ' * num) + "\n"
       space -= 2
    end
    diamond << ' ' * (width + 1) + alpha_arr[idx-1] + ' ' * (width + 1) + "\n"
    diamond
  end
end

Diamond.make_diamond('c')
