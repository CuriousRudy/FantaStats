module FantasyScoring

  # Scoring Rules
  PY25 = 1
  PTD = 6
  INT = -2
  TWO_PC = 2
  RY10 = 1
  RTD = 6
  TWO_PR = 2
  REY10 = 1
  REC = 1
  RETD = 6
  TWO_PRE = 2
  FUM = -2

  def score
    score_fumbles + score_pass_tds + score_pass_twopts + score_pass_yds + score_pass_int + score_rec_yds + score_rec_tds + score_rec_twopts + score_rush_yds + score_rush_tds + score_rush_twopts
  end

  def score_fumbles
    self.fumbles * FUM
  end

  def score_pass_tds
    self.pass_tds * PTD
  end

  def score_pass_twopts
    self.pass_twopts * TWO_PC
  end

  def score_pass_yds
    self.pass_yds / 25 * PY25
  end

  def score_pass_int
    self.pass_int * INT
  end

  def score_rec_yds
    self.rec_yds / 10 * REY10
  end

  def score_rec_tds
    self.rec_tds * 6
  end

  def score_rec_twopts
    self.rec_twopts * TWO_PRE
  end

  def score_rush_yds
    self.rush_yds / 10 * RY10
  end

  def score_rush_tds
    self.rush_tds * RTD
  end

  def score_rush_twopts
    self.rush_twopts * TWO_PR
  end

end
