Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AD34104B
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387862; cv=none; b=Tw2IhpjFyYBiDcYTnJtbdNeJ0Mm40RncJsjpgQYyrI4//gVCIjVG0KbiCQGxchLkMQFNengCLxES8YJ38xW+wE3166Nky2b1+/BD0RhA4wyFmB9683dDDyWDrGoQ7slrTTJYpYDs/bVMj5ryauzDiGxn+Lp8Ex15dT0Pn5RPJBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387862; c=relaxed/simple;
	bh=FX9+ytC4Iz6IpEsyGIB35Jd2O4SwepeLOOS0Uyo6W5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+DDrvDODwlAvIG9a3obkXlLytHDZUZdOx8Dz/9lGKDVoqzELw3BNPsDwAGacWamZh/dR8firI9Lhjd3+eoS039uiDYEk0fKKPw/7nqHoFLf6er1gXolzr4pddwiCmK1pFg5Ev/9ci+t+o8Wqf5vEqbmpBnC8jtV2ke1J/eIv4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4USDkEw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4USDkEw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so9856515e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784387859; x=1784992659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/utO568HGbVmGB6Jd4gPvyi2DOEWefL8XBowMOF3j1g=;
        b=k4USDkEwRoz10H2QOkLvLU1f0ohL8IMIdtqJxeGBxHXwCQpIfrc9NcdXeOlrBc8Vut
         EwfAQpiy7x6xoFLRu5HcVlBCNYwtEJFZ2zqYCzFAoVGbvvC7IHchLEl4HThMVtUBngIB
         +/UlMwxypm3hoi7Sd0wGsHDInDZN8QQ/sLWjBpKu59LCwrvDU7H1fL3UqVvbRjcvIh8J
         WUXrgaeryuOv39mccOX69j2eccNX6wsRbSOSOlPmwrHH7tqIpYu669AYlbrqIaYKD8MF
         cuGUCMqG9vtTJAMiY2loHe2y1Wbn8tQq6GdS8rxHIC9FeOL93pXrIzvNwA8lm5Z9zhHm
         HGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784387859; x=1784992659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/utO568HGbVmGB6Jd4gPvyi2DOEWefL8XBowMOF3j1g=;
        b=oHolyMzG80UU72EVE8lfTz5VMWBzoN7Q5wvDKkCMVzZSExfpU0arifbBdIr6160eNL
         YMpiP0bEOg6t1atHvahwu6qT6K5xPDdeAhkuVXNNuticJ1j05ycn0tpV40iTsYshrqaw
         6iqztQ7gMCpnensLJLcE/25jLy3m4znlssT7kUWc5ue3fOjxWX1PogAwcXZKoQGtoulE
         pgyIFEiWIoq63acNKcZAWTWW78CwptJ1YBCVfWaJiPkjQxPjCFA2jpRvpdA/apgO6pe5
         0dYXCbcB3aRBzulUKSHT2JU7PQcny1SWsU4xRFmE/X1o9xczanRN9c7aZHxM64SPBMcO
         ahBw==
X-Forwarded-Encrypted: i=1; AHgh+RrKB7xQemmCvUcR96dmGDu864ba6uau2pUZiE5SdigS6NLVLwbuuGRsY2vXesX/cO+kN7JXi+h63rQ8tPG1bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmmgGFfEtYspBM+iovn4Lf1YBvkUAOe18D0/GhhgShwxn3YLUO
	SdBo0j5mk375N2VTb9xCZKHEOaKRFkMW8B/MM9Ei1SW0zG1rGSa/chx+
X-Gm-Gg: AfdE7cm+AQdrVzGru1D62+PB4CruOwVpIxUCjKCnixdWsuUxVgBMZ4Iqp0uu9mY+aSS
	RLFLQ/LilREH7MkrgJywqEpnlPTfEKm8n8mBT3Xi2+XVMXSw6sAhlbn+wjBMXweKXEQDGC3sB65
	HG2sxArLJuN7xexehUJjygI0L5X/Wt384Fbzf9wK0mXTpwa27p+KZrliwoeHy/zdRF5LVJuvPTL
	BIbKI3Pe7iOeucFk01O9+iaaIX7Zfq9kk7eHII2+fzra8IF+olfITsLjBWSFnK37AbgkUFzkoed
	rTgdqUIU5YxUcWnqkFVdueWexOTbNTClzQN2YleqWHQhmZlv+MN222epJLb0zY24Qbv7Q7hYthJ
	JLbp2UDj32TbcCrO+1oUZDlxYH12nBrRqeJvacbFF5ljwcvkS/fADvNPQ7/N6ISykhBy3udAuyE
	c8Dy58JJ+i0zPDvm/Dv8QqRusoRZKY1bum3MY=
X-Received: by 2002:a05:600c:5247:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-495573e1da1mr2785675e9.9.1784387859117;
        Sat, 18 Jul 2026 08:17:39 -0700 (PDT)
Received: from ubuntu ([95.143.48.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e56fsm129621965e9.5.2026.07.18.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 08:17:38 -0700 (PDT)
From: Burak Emir <burak.emir@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Chuck Lever <cel@kernel.org>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
	=?UTF-8?q?St=C3=A9phane=20Grosjean?= <s.grosjean@peak-system.fr>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Burak Emir <burak.emir@gmail.com>
Subject: [PATCH] MAINTAINERS: Update address for Burak Emir
Date: Sat, 18 Jul 2026 17:13:03 +0200
Message-ID: <20260718151303.2649-1-burak.emir@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update MAINTAINERS and .mailmap to point to my gmail.com address:
burak.emir@gmail.com.

Signed-off-by: Burak Emir <burak.emir@gmail.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 735470e21075..d447b05711b3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -171,6 +171,7 @@ Brian Cain <bcain@kernel.org> <bcain@quicinc.com>
 Brian King <brking@us.ibm.com>
 Brian Silverman <bsilver16384@gmail.com> <brian.silverman@bluerivertech.com>
 Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
+Burak Emir <burak.emir@gmail.com> <bqe@google.com>
 Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
 Casey Connolly <casey.connolly@linaro.org> <caleb.connolly@linaro.org>
 Casey Connolly <casey.connolly@linaro.org> <caleb@connolly.tech>
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..3abb1e4b7344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4634,7 +4634,7 @@ F:	rust/helpers/cpumask.c
 
 BITMAP API [RUST]
 M:	Alice Ryhl <aliceryhl@google.com>
-M:	Burak Emir <bqe@google.com>
+M:	Burak Emir <burak.emir@gmail.com>
 R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	lib/find_bit_benchmark_rust.rs
-- 
2.53.0

