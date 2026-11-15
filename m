Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725276;
	b=Exw927mbgjTeDYS3GUCH0/i3aYI9MZA8E4mHpeIrRqnusaFKw98tCyJXsn5MuPjuL3Q3
	 FJ8G0LZmwCmtcgy/qBeXrJ5lVbHSQn4dUiwNnQa91hWWNsJV6x0lOrVhi/i7LvImhXbd5
	 DdyF4evmlcbFW+8v+/pw4rdy/xurSk3xo8S+eNq/U9YLOjJ20hmkwWgEIc2658j0NzSgc
	 Vi2GIQuHIRqusKN42g6tIoWtZhY69VdGUuczcRUUt5DyRujwtCcMlGJ/6/WOG8BaDCi8q
	 SOmVlEe42Tcx7hxX3SCqmINSJxhrPXdCPUoDY3smn+QaL+kqo72X2lrN9kQ+aW+AkJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:X-Mailer;
	bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
	b=MlhP9eYrGqAo0VeZsBAsPOb6z1LZVA5fuACyxCioZ31Zd/jiDhyo5dkdLgNRVd0OBQDk
	 Y7av9XmUUqbnAGRduXoHJTVckPMtM/lsIoV35PFaH+Oxa7ocMt/XD12yebYrw/niveiFB
	 nwW8dgePoCOm1bmyK8Pt7zkwaHMeLfIBO0v9pQ/EllQrTTjBcyEoPEVV9C9OvQZ7RyXfy
	 HbG8dKxnU/YSPO6yXWl5/SYZasctEMedWdQ1poe2OlhLbizIcmgwbZlPbhrSycEApv6zD
	 SB1KwO9sch9ebiDdwpdQDk5ChJkmWeM5Apd2kDfoNNwYld767Bjjcp5qnxfwfBMX8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE41606A329
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 06:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE41606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso2044166a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 22:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725274; x=1795330074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=oJz2hC3ClvJrfhKNgz2wQryvBei6eSKNVOTwRwIrluYR/TalqWb8P0ajRdbbki1okt
         7/mhDKKbseYy7ovi8vY5DAOsNoE0GiFVY2PF4YmfAfSb1MdwAEe4I0pvuvF2wEiVQ23i
         5nVELoisMLrVlGv+K6fVFmUiCRv33Zi4GOkvJMqf2Wie7FstaCerZX1Mf6tDYkA5HkUV
         Klr0tccU6VrlHU6rs9XUX05jHZ12cNDMrB7KA0rXj8h6PFghS19tXeJ6I4HsiHuh3ld9
         Y/ZWkdTEZPCJkpvu31RUmCLrgVIquGTCfyM8LWN9sJBR3mT9yVECKwbs9LT6/Sq77jok
         8MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725274; x=1795330074;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=ZhcYa8qpAUg8bkbBP0CDDOdO/+VXKZPS52jDMjvPHm2XgBCGzsMK/cCDur+Ag148ul
         H5ri6ZBG/Uem9zp+PJlIzx8SC8KNLSZLDNSL30b1MRYHf3s9hMfx/QIiymfWZx5o1+27
         dfffbbgQjPp2Hh2KOVF544nMWxM8nruPi940T8Fm5byPr1S8BgFqPwRXOzyG+GPN1tLU
         3+Bh4Gc9KtwlKkmSF3pdewY3O8BxGa/LqEINqpFno805/s8Yl0foMBJJUUro0M2SI1OM
         Vyfx+Vut8R7eO7i5XVp+8CKgQclGlnCWxIqkTtbMX8k2b6fXsxSMTt90lnP/t3m6afEy
         mMhQ==
X-Forwarded-Encrypted: i=1; AL+hErG41i4ddaK+yuGMp0LnrxK20FQxp2jdGLjVnWkwkVe2gGXnUVSZCpQOmJRVvpt6YPtzHJTGm7/HMVL09/hwLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xVTa1U0Yr79qo0NKh7jDGJ4J4Yp97xXOugg8/YjKePtc/nRDA
	F2zjQ62/8LOdhzS7vR2dBRNx85WWLOI3WyoljwWdSOggpsdlBNGZaeYt
X-Gm-Gg: AYBFou0e8g7s6hqFYv2eqz/Ivun65sCJds+atZhCFIO5w37etuwseHi53CRQ8rD8CEz
	8eXY+Y9+GZvfOZM2AHRYFwMPgV7cIL9Wh7dkowzGDFguOgmfVL3z4DwC8GS9klxRkP9h95UET6g
	2YHFZFVicbhEh1LwP+BXMQVSdOyLCY3gcHkOdEWlp1yjAduieIeD0eYDqO/KsSNhXJQ+Ug7Q2Te
	PAETG0JNnZesiT94SRgyZ9HQqBsX2pLybfKhhg3vl20jvhvL1Ve62eAgTpajyDdxen8ylVeXH2+
	x6phnT+BKGAQe13BGw+DbWSq2V9XxguuExSGkiW86hVHxkLq1QAHKVFSVF1jOwVMV+wycwc+vC/
	KaauUhmAAnoh6VaZnmzayBdZ4ozOaDNT/pO1jCQHen57elJK0STJyGNbedvK1QqeQIvUe1MgKcZ
	E/LTLoeYZ8Kj/RlPiEQtDGsdUVrafeZmdsIuN07T0OWlgCuaky9GTIiTGVlo+PpNsvyEh8OLpUG
	3jxz4OBMK3n64X7PCRCl9JTr/g8peCB0VGFm/B9CVwvPf+LBiFey2S+q4NORv6bWg9+5JuHEDL6
	d1U73PJzqRsOdnoa+kcS//c3XUlnJEncWRlxFUDRXSvagNCqoHa69fVTOHkjhGIYPmfNC5oR1Gs
	Nn7MNIMlj9HWGcoBNFOXkT04jr/Iz31msgk1GSoyt2FTca+k1nyE9f6VnPg/NkxhErTKACP1HPF
	3Sxg==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b1b0a5064cmr6609898a91.39.1794725274127;
        Sat, 14 Nov 2026 22:47:54 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:47:53 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [net-next PATCH RESEND v2 0/3] rust: net: phy: soft_reset may run
 without phy_device->lock
Date: Sun, 15 Nov 2026 15:47:35 +0900
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
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
-- 
SeungJong Ha <engineer.jjhama@gmail.com>

