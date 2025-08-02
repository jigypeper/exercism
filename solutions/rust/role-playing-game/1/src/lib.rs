// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        //unimplemented!("Revive this player")

        match self.health {
            (x) if x > 0 => None,
            _ => if self.level > 9 {
                        Some(Self {
                                health: 100,
                                mana: Some(100),
                                level: self.level
                            })
                    } else {
                        Some(Self {
                                health: 100,
                                mana: None,
                                level: self.level
                            })
                    }
        }

    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        //unimplemented!("Cast a spell of cost {}", mana_cost)
        match self.mana {
            None => {self.health -= std::cmp::min(mana_cost, self.health); 0},
            Some(x) => if x >= mana_cost {
                self.mana = Some(x - mana_cost);
                mana_cost * 2
            } else {
                0
            },
            (_) => 0,
        }
    }
}
    
