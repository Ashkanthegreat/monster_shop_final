require 'rails_helper'

RSpec.describe Cart do
  describe 'Instance Methods' do
    before :each do
      @megan = create(:merchant)
      @brian = create(:merchant)
      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 2 )
      @hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
      @cart = Cart.new({
        @ogre.id.to_s => 6,
        @giant.id.to_s => 2
        })
      @discount1 = @megan.discounts.create!(name: "Ogre Discount", percent_off: 10, min_quantity: 5)
    end

    it '.contents' do
      expect(@cart.contents).to eq({
        @ogre.id.to_s => 6,
        @giant.id.to_s => 2
        })
    end

    it '.add_item()' do
      @cart.add_item(@hippo.id.to_s)

      expect(@cart.contents).to eq({
        @ogre.id.to_s => 6,
        @giant.id.to_s => 2,
        @hippo.id.to_s => 1
        })
    end

    it '.count' do
      expect(@cart.count).to eq(8)
    end

    it '.items' do
      expect(@cart.items).to eq([@ogre, @giant])
    end

    it '.grand_total' do
      expect(@cart.grand_total).to eq(208)
    end

    it '.count_of()' do
      expect(@cart.count_of(@ogre.id)).to eq(6)
      expect(@cart.count_of(@giant.id)).to eq(2)
    end

    it '.subtotal_of()' do
      expect(@cart.subtotal_of(@ogre.id)).to eq(108)
      expect(@cart.subtotal_of(@giant.id)).to eq(100)
    end

    it '.limit_reached?()' do
      expect(@cart.limit_reached?(@ogre.id)).to eq(false)
      expect(@cart.limit_reached?(@giant.id)).to eq(true)
    end

    it '.less_item()' do
      @cart.less_item(@giant.id.to_s)

      expect(@cart.count_of(@giant.id)).to eq(1)
    end

    it '.it_discounted()' do
      expect(@cart.it_discounted(@ogre.id)).to eq(true)
      expect(@cart.it_discounted(@giant.id)).to eq(false)
    end

    it '.can_discount?()' do
      expect(@cart.can_discount?(@ogre.id, @discount1)).to eq(true)
      expect(@cart.can_discount?(@giant.id, @discount1)).to eq(false)
    end

    it '.highest_disc()' do
      discount2 = @megan.discounts.create!(name: "Ogre 2 Discount", percent_off: 20, min_quantity: 5)
      expect(@cart.highest_disc(@ogre.id)).to eq(0.2)
    end
  end
end
