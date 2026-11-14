Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658726;
	b=uTXm8PvfbXcjuPp3w022mD+900wzSVlcrBl3O5AcwpwPFAB4xG5Dnp3rGFIuZm6jce6/
	 J4OxQehT/dR6X+fb8hEdHrTEEkZe5l79qOQCYKQIYp/XL32mxA+qDwtCmaSK6ixSen22E
	 iMXpC8Z9w6Cwto1UOJa/W7Md665JdyYD8OLFmCU4ilLVE9IbSQxwY4LhBMkEkriTSZagY
	 Vt028hnlQ4pDqegldxbjIFyJ3p+xIw6D+YkjYTg4IkYkPaAS8mbc3Y9sAp0eI2IemGyE2
	 yAKwBaVKHTe+eHB5YSdN/2dEQOiKkBvWuQvNOJ05XUvaegxGCFAIJMPtZHHkgaAdnWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
	b=W9qFboY49MbP5hyYrbj8Orzg4nc/B9Q9HOW9n4oebiLnbXDx8KS4ejs0fG6lKABawbuk
	 y8R8WEyfPS5uBqtOr4EQ5gunFey3Ss4F+Dxs4huOox8ujvRRFFCQ+D33Shv9CxO0sro2S
	 7ljKRzK+202x96Cz3tXwV3FnzBs9OxC2hxxUXBCTkTo2cEW/nSn3inpOHA57EtKQFWhSL
	 pDN2ZLSehvYntlS0w0EN+o7D7yAFRVLIt7l4Rr8wZ1cggVkG0b9IdIejbgS5MRRxXJYPs
	 GEv+QfHRLAM9FCxPRcy+spYIrCriIKzheIw1HAfldPeU4PjD5xceoL39ftqGkkQAU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=myHe1jKa;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C07606A332
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C07606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=myHe1jKa
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07078200fso822039b3a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658725; x=1795263525; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
        b=myHe1jKawmPJVBFYBlRZoyr12FwQ2uXBiQFKGIDQLzObXAC1i6zVlqBg7D7UC88BA6
         v8XNB+/oX3t9euHqJvEQK/XBkobPxXtJ6T7CbvR79lMscA9yCvuRLPMBtEgCWOvXq3dL
         AjLm8rlI7L88Ju049KX1UcKSpHfuJF3yCpqIdTKFpa11CY1X9AZCYizyAvLCcnL9mSvo
         i4IS0sxNw10sml92RygzlGxkPZjcJ0vL1zsXsLGqWHee+/ciRdqoOwM7yR17zTWPEs9d
         xZdGNukqiiabx25VHjbLENPANUrjW5OISBk6Qi7WZ/5kVTJcIQ+PuWfzvSMuR2sl7x9g
         Ffdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658725; x=1795263525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
        b=CIwMEnJRkwlf3yTIRXLwEuFaEWxqQV+Z1MVz1MwRJ+mW/ydL+xb0NfiBOuUTqBajXV
         sui5n2G935boKXLOmc4dBE+cE0bxRfzXilepr3DfzzVw0a+Y75x5DVBsubM0OCl0yB+0
         eUPR5M9oO38sVyoX75yFe4VmfXs8kidLoYp/a/FBrCMPcViXVrNEf2dbZGjcWLgl/WPa
         uPXCdvkJg0lEvtAlO6u6iJ7rRbMuqWnaO9iJ90Y5N1N4HX22mC9eO3idnwlGhnZuV4pL
         HCARD0ikYwLx//UhcuIZX+tOU4wiP6KW0jtHuzgRam6KwyEL0T3LhPLt/VPQLIAHL01t
         iOmQ==
X-Forwarded-Encrypted: i=1; AL+hErHpAPNWQt7TzojcKqVu8WjZmecZTG//k/pf86sH0GvS/+Us/NdqrbPArde01g0YpX8VfZL2XAfQsKJQU9k2ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pbdt3HmJUjDt4HB1v+nlkrXu59bnMZ2DN7KTgYd8ILWpr7H0j
	uXerKMb/o6szRv1Xj7RdzoyxKeQVxjya98NJpyxx2Jg107YQFrC+Lfyv
X-Gm-Gg: AYBFou0NUflo+lxsB2ED/qtmq5Tz5I5qlHb4uON86ZB5ed4CR/wxLjNbD7ZqE+LeR67
	QfqeixT2UqjVrOWgft6tsCNPI9Gr8yNKzVWaToUzyQ9Yl/v86831Xc+vqrLpv1uf3Y6dB3LHNbu
	spM/XsuNulX1b5Z/nUkft3tcvSxjygHbJDxO29pcTyyywyrLXzf5FQdW3SfZMYE2juXJJOfKKEZ
	E9n3yMFe/NiPlI70vaWDSqNk/i6LtxIHLtJFXcAhjMGVQpjaA+l9xctuxMgAY+tGthzyAzMUfrk
	S1VWgXBkU0sN4xUp8KSmickVGc7Cp2xfmxmHDMunU90qGhurkXDjxq/j3djPXtWNFAZPedDyncc
	MGvGjSh2ndX/hxemfBsJ18WYvH9SzejizegTVCvsNOZ0zvJucL70WndXas204glLuhrveRq/UwS
	uL9dqJAdspEkT3OZLZBREUWeVWUUPh7Q2Wjle9Fw++xp9XadEr4voLOtCQEqHMEtAC/mvaN7Dua
	9stPa7Yi8hYAT5F1G3ELW42+7Gc2LwhZBCJ5TXSCls7Bzs7SM65ttUQ5ytmvpJhbCnHh/dd7B/6
	19MDaR0tzqpFhzH6dD/o+8nzbdSNmyyMVHawlTJFImau8NwRC6DMsaakZhPvHfqAqEdUBe2aUQJ
	7xjDOc2e/m4comtM8ePaqPomTGjP4jQLDwf3I2ADdJtTC+M1OAg00jNgN
X-Received: by 2002:a05:6a21:66c4:b0:3fa:ab6:387a with SMTP id adf61e73a8af0-3fa0ab63ff3mr129233637.43.1794658725241;
        Sat, 14 Nov 2026 04:18:45 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:18:44 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next v2 0/3] rust: net: phy: soft_reset may run without
 phy_device->lock
Date: Sat, 14 Nov 2026 21:18:22 +0900
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5R+GoC/4WOQQ6DIBREr2L+ur8BjE3oqvdoXCB8lVaBADUa4
 92r9gBdTmbezKyQKFpKcC9WiDTZZL3bhbgUoHvlOkJrdg2CiRvnnCHNAUO/YEw4qqWhwes3GTR
 GV1LKktpGwQ6HSK2dz+InOMroaM5Q/5z0aV6k89F7ZHubso/L+WHiJ/FvbuLIsGSi1FqyqiL56
 EZlh6v2I9Tbtn0B2MjwSdgAAAA=
X-Change-ID: 20261110-exp-phy-rs-maybelocked-ddc59993efba
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

The Rust PHY abstraction tells `soft_reset` that PHYLIB holds
`phy_device->lock`, but phy_init_hw() calls it both with and without the
lock. This was found while auditing the SAFETY comments of Rust
abstractions against their C callers, and confirmed with Clang's context
analysis [1].

Patch 1 drops `read_mmd` and `write_mmd`, which make the same claim, run
under the MDIO bus lock instead, and have no users. Patch 2 makes
`Device` generic over a lock context, and patch 3 gives `soft_reset` the
`MaybeLocked` one.

`match_phy_device` is left as it is. It runs on devices that may be
unbound or bound to another driver, which is a binding question rather
than a locking one; I think it fits better with moving `phy::Device`
onto `device::DeviceContext`, as `pci::Device` does.

No in-tree driver is affected, so if this is not worth doing before
there is a real user, I am happy to drop it.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (3):
      rust: net: phy: drop read_mmd and write_mmd from Driver
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to soft_reset

 drivers/net/phy/ax88796b_rust.rs |   8 +-
 rust/kernel/net/phy.rs           | 206 +++++++++++++++++++--------------------
 rust/kernel/net/phy/reg.rs       |  17 ++--
 3 files changed, 112 insertions(+), 119 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

