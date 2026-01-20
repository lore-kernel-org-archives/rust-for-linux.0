Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35C3446B1
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909941; cv=none; b=L3qH6jwJJvspZiXbL/aEXgWa31yGLmtGJ4aTMrggHn7DpEszhmfLCrXgYmIeDz++ziWQtaxmIQxavnm9kI+g3h+gtIpyJz4kKxR9Vn0ZfIe1bBUqAEB9HmBYskaJqf5kMbsuGE6ZvJvy1LGh9F/jscBehw2kavBF4pi4wNVZz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909941; c=relaxed/simple;
	bh=eZ7TJKGaYF3Btsft7zsIUPV8gs07SrfjDP9DbiNuoFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwQvS6qlfy8yeH7zY+zU3FrfH7s9wBJlsBVs9qKCcDht4Udkmph96WSOY3ajfk480iT3ctrIlPhC+PFBx2vsSbghlI1ma+yNeq5ENTTJYjnaq57vj4QwTVaWebM6BgrIcmEQiRLAg474V76O8HltdKB404j5J5ijOKv7ObUbHww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pue9Cpys; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pue9Cpys"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5014d4ddb54so56519551cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909936; x=1769514736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3jCOHRzv4aKjnldOO0XQggF0Di9XNaJfQUF6T7RtB4A=;
        b=Pue9CpystnGmZrx/fluVZjLHebUi4aNWTlVUOrz4/swJm2oUVrnZWaBt8cGwYP4Fv7
         TVvPMJf3UGwSwgir6uSBUZiqRD/BnPnkcD947UDirU6VThgByfPQ48orS4l5f/1L5dud
         tdemvgCUXNfjYGDc0vdm8pf3kFbYV42gsYGnzxA9aF8yYiLDF0oEbL7dx9VeSwAj2YlY
         NDNspL3+L5Tp2/aHdBPwBdMYmU/cscIFz9p4ab6AYCW9PZG/seDVIppUMQcLi5SVOphF
         a0e0r+0PJgjijGrWbNjnnxyJW0PVZIW3JyMR655YN+/3VR9TgddbdmBH0lgCB1E8xMN9
         LXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909936; x=1769514736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jCOHRzv4aKjnldOO0XQggF0Di9XNaJfQUF6T7RtB4A=;
        b=F0zlSnyT2Wtm4WiF/ujZwb20RZk3n+7mu8c8UisvW9H3FWPX2M2yeWSaKYpGfXeWBA
         B42H65ZFuwERFRNxTbHe2P8uomwD1whRibKZBUdupOvcuXRLfJ5rj3N6zDq8O7RRswkG
         vy+sCukQFfE9+I7rn476CJrcdBYEysXyNtzygHM0cnKWu7XuQ9pzv/q4KPqA3SBD1QUG
         /n4GIJGa2Y2ZOcUwwYkR6cwGgSsZzor66qXLjMX7G5Sq0rdtZsZvObrTroscftiLNpoE
         JcBc5lzV2wAizLHcanlPQxBG20wAfuo9TTLO9iFxDN1u+g3LpPibhERlNWHmOrzk8I2s
         Nd6g==
X-Forwarded-Encrypted: i=1; AJvYcCVSf2k+H7a9TWs9E4F/k1jg9EiBJUFC2Qq9hQnInguoR6fFjscLBfu47+6Atp3h70A+KfwpkRpUjo1DxgeTMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHtejt+I3kvD7NhkxPm4ZBZXgMB2z8ekD1nEoE4vnjyKkDv+z
	PYVk0LBQbE8sqbOG0RQ3Up21aNV0F47vLSWyL7elMSSiIMM26tGpTnnt
X-Gm-Gg: AY/fxX5gcsQQUwwoM52Xr/GKgPJPnpjouYH6tQQisHQ84lTJRL3KJN2yweNXPh7aFNm
	Ml9UUaIIe26dS940Y4dUy6MeVmHja0So+CTxh6Shs56zhOuT4J+vZ+TWbHvI42IR3FA7KOhEAOw
	LgNvjZRSnkIpluUwV0xQy7/YD1RudroJ3a3WY7yaL+KBfAF1+qUDjru94NudO0lhbT83z4KlZWA
	Y+WPVcPWVzCR05dIM2sZuqpxofQrb/P4paOTy4Ev5T8FPIGN+05+/wWrkUtAwnx9nvZXdCGVc+N
	kmxRt9clvEVEwdUA8b44w3lQ+NfUzmgyU6h4kD0wviBc4tOLlziFrwXkVqDZPNxOW1F+gdy2gG6
	iRiA5R8GGjvJ7Ljzx2V7yVQD26PbT4ucPcRnAsmSNr0o8Nhzlvx4s6kiTgZofRG0Xcz/brtpI/n
	AcKeU9o7+BKkNHADcVliE+ExY+vuA7imqVBSKf7JR6ze458UveYZDgu/FvwPPTA6jrTChdxsiVO
	/fz8/uEYxTQANM=
X-Received: by 2002:ac8:5ac2:0:b0:501:4857:62e3 with SMTP id d75a77b69052e-502a17567camr193852581cf.50.1768909936488;
        Tue, 20 Jan 2026 03:52:16 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9eca6sm99050811cf.11.2026.01.20.03.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:52:16 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8333BF40068;
	Tue, 20 Jan 2026 06:52:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 20 Jan 2026 06:52:14 -0500
X-ME-Sender: <xms:bmxvaWGr-4XpSM2vYETxRfUydfurWqwHFWJHiYR4KhaLawbuGlmK7w>
    <xme:bmxvacP1XsD6L4zGUHJS-GKS6exgJDYz4GNc69LdovkPTiAg9XappwTcXrJoE7tBb
    1QJaNmCVCPmIcANzBF-Jw6zwj6JeIpfyQuxg0jBC7_VevoPjMxvjA>
X-ME-Received: <xmr:bmxvaYseTBbK91tjAnIgIZ4nsUU5pt3fox2UdyKq9mHmollKkMp5ZbMG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsug
    gvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrghsrghnqdgu
    vghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopeifihhllheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvght
X-ME-Proxy: <xmx:bmxvaRUyAXBwVhh_V6IggSwh965r_5ycO2CiXOl1oFwnxZdIrzUaPg>
    <xmx:bmxvafQX8S1hdf_qS3P8eOrUvH3N6-86RENZCU3v91371q2d_58Q1g>
    <xmx:bmxvafJUjytmr_Y_iDeVc80QQA6XSAGnWssoZysgpL-n3M7wdpK54Q>
    <xmx:bmxvaQ1Q3Ph2XeOXJbSoSzmOgXP6qMYFVJSm48JOJrLVZLudCjGwZw>
    <xmx:bmxvaSJaEbhz4J4k9DL3G6r9PGLr8WJKLvCTeSQJf2kmGQStvOl5P2je>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 06:52:13 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Elver <elver@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 0/2] Provide Rust atomic helpers over raw pointers
Date: Tue, 20 Jan 2026 19:52:05 +0800
Message-ID: <20260120115207.55318-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[1] indicates that there might be need for Rust to synchronize with C
over atomic, currently the recommendation is using
`Atomic::from_ptr().op()`, however, it's more convenient to have helper
wrapper that directly perform operation over pointers. Hence add them
for load()/store()/xchg()/cmpxgh().

While working on this, I also found an issue in `from_ptr()`, therefore
fix it.

[1]: https://lore.kernel.org/rust-for-linux/20251231-rwonce-v1-0-702a10b85278@google.com/

Regards,
Boqun

Boqun Feng (2):
  rust: sync: atomic: Remove bound `T: Sync` for `Atomci::from_ptr()`
  rust: sync: atomic: Add atomic operation helpers over raw pointers

 rust/kernel/sync/atomic.rs           | 109 ++++++++++++++++++++++++++-
 rust/kernel/sync/atomic/predefine.rs |  46 +++++++++++
 2 files changed, 151 insertions(+), 4 deletions(-)

-- 
2.51.0

