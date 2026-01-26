Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150322EC090
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769415025; cv=none; b=NaK5ckg8gMmGZ9VvrRcIQ6cuNiJuRBCT8iwI6iLcoZH4Sfr18lt0ysOo2XFXGYXMAtKy7vlcr8GEVpWAANvBlGYXZ2SGQCmUr8HotW6pZyCwZj2Sviq/qsZUpyIEjLgGdDMwIPEntraAHokIKi1WCC8XpqRgD8PtSCOC9wDGrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769415025; c=relaxed/simple;
	bh=W0dudvR0R9h+8DeW6t/JkeMvoLYFB+TzQYhtUm1aSLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUTVKuXlK89L8SXq4zx0WKilaU1sYLdZB3T5x+3JgcOknNJYPUY1G69m31JYjyNzQtEygLS50TSjznCBcAkt/YH4NL+IxMG0PZf+gSfI4S5K4tG5ewDgLTT1X9gqPojEO8JDf9ShoOgdlrbTZHdnIH3WPUYvumYUKFXd1Pqg5WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QguPsyZl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QguPsyZl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09d981507so28266415ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 00:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769415023; x=1770019823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Acxw4c0MoDfSl6aNvooDVKHzjhj78zcaux/VJn0gfg=;
        b=QguPsyZl4lR24Mie5i7xhMqnR2m+9fRhvi2ezPcd/LFA3OPXNjZaHetLJiYpO8AsOl
         xqVbAVP1il6ke5oSECLed6aCXcDmbWEOPsO65Zdw3q9/v5OkO58re5a8CFTkUtTxc1ch
         hsSuFZ3CgaJ+8NHbYQzI7iVgAH2Hhcl1xxZH09HgUg91Av1ldnEzV2j2KgclcIwgDIZ0
         fCcgRWxPi6ROo7R95LUZoNludx7GL+eQ3zajPUAhxBvnk1CITokWgR6yxEkHNSLbhzSD
         ntAr9c2VyBS8+hwm8Y+60qtNJkzbo4Hw4+BFo1s7FNL4YlhnKl9Ax8pj4lbEVQiVJKe5
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769415023; x=1770019823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Acxw4c0MoDfSl6aNvooDVKHzjhj78zcaux/VJn0gfg=;
        b=RFgygSZBvtYgYLECX3pmffY7MV0pv0Vf9r87FO6Cqmqmv2AOhn+R5uK/XUWVWYOGWn
         fJqBFCuflYBJutktXdPexU3xiUM6FQZk8DSNyYTWC2tIo5hs69ucx7bjZTQtiWQ9JdPm
         FFaBA4gRx9rQ0IozugMXvA8bdex/fNbhOjuaXUerTvUOO98ma7dTaSvqQeDwpZTo4yDn
         1/WRADQX2UwMo4Gj4kYb5zdT9CQliLekgv1J9nT5uoO92Lzic2M9/Jb+B7BjJE3gIdrh
         R1TahqoyXAx9m5dVb3zcc5MfSY0VfLKzoAOeB9g7PxeQZ3gyFLSSvLPWcZA73sS5ydP5
         bhnA==
X-Forwarded-Encrypted: i=1; AJvYcCWrT3BFG573SQ00CgR0HamODnWCbdguatU0JlP11Kkf7iRV3lbMG8kxWmK3cP+eERvY5rm89GyJU1c6MEivTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzixJt2jwpo/5MndHYTb8RBDRmX7xkMVvgCUaKDFQ0qOWohhuwz
	AePbunL6TS0LA2kWQIXQ8KXyNFn9nHneCIMULqXa4dbBxcROHj7Dp+0mkUXzcQ==
X-Gm-Gg: AZuq6aJ54LqdekzlaPRy1kr3ZqGkdiBcV537asFNAeBor6MW3pV9BEgoiwuEfIMXcqc
	1W9Yrk90v9YLUDtniw8YgQnq8tSels+0+BVY8I7K1L8TX3iuRlo2Y0SNLT8Shnk9ausIpyqMWa+
	wNxnRSdf5iyVMLMGD191Ock8V1Atn6bj0rQ8JyOI+IUo0HxVNF7pjemCK2MG8PwmwGEwR3Cxlt+
	Q3nmnMFrKl0Ooyta4e0yxpuZHMoDUA2i12RdsQuQu/CHDCChNuxvX2ySeYY1LUpHLWLHKOs+Mle
	FeA1tQtDC9cZmEGaD+IzvfenY0L9TkRdxdVtkotDAHGNiCE/9kNNXXQrHfHAiHrnVHWAvEh1xmH
	r/eiwgYwaC+ZTFjHKwdfaGzTpEWUCBlTt3laQLVJfzEdmQE2Vu4CIzdYyDePSit7OWFbe4n6Asz
	idlS1Rx7zYq53qi5bkhcFWEgBZZWZdyNgddxBS/NnbblqKYwnxoRSa2wsXuK+plA==
X-Received: by 2002:a17:902:da87:b0:2a7:8865:a1cc with SMTP id d9443c01a7336-2a8454dfe9emr29206215ad.9.1769415023283;
        Mon, 26 Jan 2026 00:10:23 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978c7sm83498565ad.65.2026.01.26.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:10:22 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
Date: Mon, 26 Jan 2026 17:10:11 +0900
Message-ID: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This series adds AtomicFlag::get_mut to expose a bool API under exclusive
access, and switches the list atomic tracker to use AtomicFlag.

v2:
- Add AtomicFlag::get_mut()
- Make AtomicTracker use get_mut()
v1: https://lore.kernel.org/rust-for-linux/20260119231757.3460885-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  rust: sync: atomic: Add AtomicFlag::get_mut
  rust: list: Use AtomicFlag in AtomicTracker

 rust/kernel/list/arc.rs              |  8 ++++----
 rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)


base-commit: ed45fc4e7712dabca517bee9f73b91e7da0030a6
-- 
2.43.0

