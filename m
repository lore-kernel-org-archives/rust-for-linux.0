Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179122DAFDA
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100128; cv=none; b=GMItMEgXc2CVnw36bDQyzaZmeIdup3EzsW5QG3zfbGSh+dCMQRInVnuEMGv8gheXayq1NOq9I3Y2I3mckb1Oxr6ZnQ/uUO8t+NYd3Yntz1XVYLSspCCkSv9bT429l423T5wLHZfRjLqKbNKBEkH/1Bpy6gs3xT6rgWTlB9sTVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100128; c=relaxed/simple;
	bh=bjXyiDlUf6zekKeC+kQAdhy67MIRUnepXQTZF8UhcrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hXZ2itIZekX/jcXyNHsSBhgE3xEoIdA5OoAdIhxtKxMhPHigZao/byn5F3M7d02sCefCtLxNdnUNBGAp+uw0KtL4dd3UZNf4Zn/2MWxyPCQ4DEdSag/jLGVHIPlCDcctfkQgyrc4JpTJdsJMKs+9xx47rdmUJjWz5v3iPOsn0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie68ciO7; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie68ciO7"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b29b6f3178so172209185a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 22:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763100125; x=1763704925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ugr2qflEGTxl9hRyGLf7eoNJgqFUQQ7VB6zXVsgKPc=;
        b=ie68ciO7QrhzY9oALikwZ2RhYqBOKOezijYjCl1sd6uGPZv6ybHSaZKCrsCTVSHEE4
         khsxYDkEW3HpWfry0eSOrV3zqv0gJD330OVK7PeO9ec+zBlYMacIm1gxN9gFgz63EJEc
         1smx/a56J/0ZDuPnl1ceCfJKp1ArwESDZIMLq7TDUQFnxnt1zkGSQtW+MdSHEJEwrQLp
         M+lHJ6WjbVfzYf2HdJhzHPNPtfUPL/jgW4/GcLW7ziNV5Qk4Nd6cme18TBWHvUaayaCa
         31votxhWBWAIg++Avy++LoKHdtgEeGyl8m9ZKS2I7thMZmLAdr+E+wxj3Ot8hQDfi1I1
         rXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100125; x=1763704925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ugr2qflEGTxl9hRyGLf7eoNJgqFUQQ7VB6zXVsgKPc=;
        b=DJI/XfkWhOQbgYkatJxuUNZtJeOFrQKfOm9K1f+jJKiYI52fQ3NBIlKyt03DqjW1Mt
         KQwXK3F8jcANxlzM/2Sz5eftfi0+tMEP2pAca5otb96DCIeVS6ggXEmiWpNN+lDupsN+
         ZT0OzW1sUjW+P6xORRKUP099FHv5n4Kxkm8Y977Uoo2q6ETz4gJWFPXpUMvC4y1pzWJL
         MiQ9VcbvDExpDof6rRsAkO42gdec7tgmxnpVN8gvjMSgnCaypiRsPUfpKTn2Ztep7Ypo
         TBcKRKsfIzdlmbAtSq0kDrZNX4LBi2/iyz2r6XvdUHdPeBPA6KTrMIhB8mFo7xPAgvSV
         GtcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6WDBcw+lLGJAQ2QwcVWavV/54ZCs3zHk2miRxL1GJEmp6QRDmjGPDwjzlUo8KJIhmLarGWu82Vm4tRFpqPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQLAgF1Kp+neNC42aJbtbbDBSCzj9e2F/hWicT7MACjoQw5cnt
	NzSf20y7CZrlb3BCM29GK5Bs6B337BBsYf7fA3/RgRihsjqf8Nfd6oop
X-Gm-Gg: ASbGncvNkl3SPhRrFFFKl57+i2nq8D45R4HtfLGPYnpi+5llV+7kIwkywUTfgs0mjO8
	NEAEkPv/QfXUWSYYEGSb9l+vyiz+doUDs7M/D5yeBwdXOVXRHlMu90UhjEOosCrMVGTZNXK1wwb
	IrkDeA05imAvp7kJDEkWstQlSEj4K4IiCSpnQNsZ/7eIh/xR7roN4HILByWI5X9fN/MRS3KnQu5
	5UE+lCRvB1Hmdj2ivLOnI6wFCYOc/RXtEggKNSEd4AM15+VwzJi0m2WeAqbWiWDQ86tf19sMIL5
	PgOB43uUUf2u3K6eXhTw438OfCWd20coalg/ve5ikdcXvEGw067bm897KUCN4/kiOdQXSc3RHlN
	BNlS+L7Sk3OTJqco3fVstlgVhBfwmEseHQ9rdtusnjok7L4FbymYUj45+/XW75pw/A/jrS3Z3fS
	P1gLvg0cque3FpXPwh3HHE4fqjHbPqnqGTaaixCv5Qj9qjw7NdHuq7zgj8at8W8jdZenWaA+ann
	k+hSnGEbrdnKL8=
X-Google-Smtp-Source: AGHT+IFRGEKibvajggrBhRdJliHpb17pjCAyifoNlpMskBv8KNy2pL35ZzOR+T8ks3uf/Iuc0ugD/Q==
X-Received: by 2002:a05:620a:2981:b0:8a3:6c1f:31cb with SMTP id af79cd13be357-8b2c046e3fdmr323113385a.26.1763100124667;
        Thu, 13 Nov 2025 22:02:04 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aeeb541esm273809785a.18.2025.11.13.22.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:02:03 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21A72F4007E;
	Fri, 14 Nov 2025 01:02:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 14 Nov 2025 01:02:03 -0500
X-ME-Sender: <xms:2sUWaXYpVR59Ilqsf4HLOdj1ys1J8nOrVlpmnIu_q-oly9Hv2hqpAQ>
    <xme:2sUWaXxCZVwx2EZK7E8sn4I6tXqL_FBCMiI-Ic9JjWq6BqgE7mxj7ZxRykcnlUHD4
    1VRHyZ5qakWW34yQc_tjIr6UAivp5WaKUulVn-oFCO_PhPZtAEe>
X-ME-Received: <xmr:2sUWaTN2377OGJX6_sDq_Jwy6e-0DQX5RujdzB8wM6rsmChyBBCc7I_bsmfl1PPNyfxClidjcTJoC2yAWlNWK7PQe0qQfR1f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeltdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedu
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgu
    rghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:28UWaV7cUT7GWF0dusHtQynLNMOZGIKX8QLH8-EvX5J-HcfTv-EEOw>
    <xmx:28UWaZdRJdWLs9hTyyaQMHAvjUyW3baUZF-LCNZn69zvg-iAMv8WqA>
    <xmx:28UWaeLESIb7nAmlgjgFcHSY1mSKJge87KA6BmlXCjbzWcCpiQJ6LA>
    <xmx:28UWaXkyJrxyQTi94ovtrnasE70czN7w_rEvyApVH8nELKP-87gL6g>
    <xmx:28UWaaFr3gf6lVUB0QT7OFc6TzvegBG4UvNVeA1v4pSbp4VANQ-2_lyR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 01:02:02 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: "Will Deacon" <will@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] [PATCH 1/4] Rust atomics & locking changes for v6.19
Date: Thu, 13 Nov 2025 22:01:56 -0800
Message-ID: <20251114060200.12982-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter & Ingo,

Please pull this Rust atomics + locking changes for v6.19, it's fairly
simple and small for this cycle ;-)

The following changes since commit b94d45b6bbb42571ec225d3be0e7457c8765a5b4:

  seqlock: Allow KASAN to fail optimizing (2025-10-28 09:58:57 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-locking.2025.11.13

for you to fetch changes up to 3572e2edc7b611d0b564c487bafda04b5dbb5134:

  locking/mutex: Redo __mutex_init() (2025-11-12 08:56:42 -0800)

Regards,
Boqun

----------------------------------------------------------------
Rust atomic changes for v6.19:

- Replace Rust native atomics with LKMM atomics in debugfs

Locking changes for v6.19:

- Redo __mutex_init() to allow compiler removing unused parameters
-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmkWw9wACgkQSXnow7UH
+rjD+gf9Eri5Au1hyYD/UPmBBZWMgWRx32RMbJ261he1YEa1gTbHqitlHu0++vmf
8+B1VGU7ts6c9vyAR/7yAAuIjfnnunxcF7NnjsguGSywWG3uQpd75o2C+TiELwfz
aJvkNTNUcX6IA7I2j4tdGh3likG+4viSb2LxQBRUkJ557LySRv+/XcBrpjWW6lit
pIohp3UUVGApTjwP/UiBETUqZz9bnwYHhQvPaCwCUt93GiNrAQC8rmQIMFQj8RhN
g28RsLXxN06ozGLsjfNFHVRTDRc8KsLgWsuQwWPwMY6CUE9AiyqX4B6IZ9ymtGNt
ENbskYAiXLDqmShB7ASmjL4CST8LNQ==
=8JA2
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Boqun Feng (3):
      rust: sync: atomic: Make Atomic*Ops pub(crate)
      rust: sync: atomic: Implement Debug for Atomic<Debug>
      rust: debugfs: Replace the usage of Rust native atomics

Sebastian Andrzej Siewior (1):
      locking/mutex: Redo __mutex_init()

 include/linux/mutex.h               | 45 ++++++++++++++++++++++++-------
 kernel/locking/mutex.c              | 22 ++++++++++-----
 kernel/locking/rtmutex_api.c        | 19 ++++++++++---
 rust/kernel/debugfs/traits.rs       | 53 ++++++++++++-------------------------
 rust/kernel/sync/atomic.rs          | 12 ++++++++-
 samples/rust/rust_debugfs.rs        | 12 ++++-----
 samples/rust/rust_debugfs_scoped.rs |  6 ++---
 7 files changed, 102 insertions(+), 67 deletions(-)
