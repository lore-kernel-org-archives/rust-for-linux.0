Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308430;
	b=E3yYrDTNT7dgHVM3CJrPCeFMUcvs0wjJqLjDQEohE4pC1nDeQF7Of48YThk3FQS2FEfM
	 SMESu38Mj8PvQ4hbbFzq9nPhCnWBHJ+ZfHUgurCl+BS7I9pKlR7tb8GaUpzPkDHkD5o5f
	 2YTONDrHrrPq8naRAd8CerLx6xWd7KzjKRKN2I562D3AIqvNrz0wbS02NnkcMe8iZowd+
	 uZo1LntVekZVwHMO8d5PTVau4Jv2i4J+5Q9ymTME93gVkhV5/eQOetcSLqON7N7f9Le3b
	 gxOwP2Skkc26XkcLaig5iKXOoW+HIQ4Yk0jEYtsPdEaLkjYHbgD9PYD372e9XlNEsxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
	b=D4GAVnRLo4ukMPYGdn5arhk0/7JTvebzaWtROoX404mHWA9hmVOpo3SYkOlBRk8KXryK
	 h3mneT3IMoWNXRGdakDb57DJM/iFGOvVQtJPa1IBuNRR2HIeXrpAuPZyi5/QYALyOp2cg
	 QHPOrJkq7Y/aXACMlA+gqKh+6h9Nvgz5Mec3kZr7fElZBG2nBWxixQ9riUXiqJUynF6Ip
	 ROWOi2GlU5sQiz0Frp3RqM/YttAoFV2I5gD7xdKLLeHzloebq7CI91GtbuQgG03FLX2Nc
	 1XIV5pEw00NEypN9WlArVfbNvcudo4Q/UBXlWj4InpbCZcTkd3+a4sA0uPUdcUllITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dECL2K89;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEC60A2609
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EEC60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dECL2K89
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so1324305b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308429; x=1794913229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
        b=dECL2K89EqGowjtmI85fE1kGXTnL5DUZVS2wH51Rwra2wZRbiG0W8bu8tMMkigTC7U
         awRTsHAOB285Gdu1rbosZ7/4APLkYRQhFtagGq1XTpo/z+toUUaI2p4RkbrZdeGmn68j
         m+5Ci5V9wFQPF06o6KfXcpkOC6lr9uUPcRyvNTBQ1XQxGqSfoPQeOeGhB/WuI/ymDPRe
         s8rUbIIqqFqUUL4UloiNOjCgAuntR46wZeHIjWTrUfFUSoyZ6vabDBMBotOG8EAilzH+
         66N6JtHLCZSe/6KOg2mh81PjYmyjW9wcN53gLi+dKBOkQlJmMvo8ZTBsF5Gk1zLbvFEs
         V44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308429; x=1794913229;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbVGUB3IRAFoe3Oztm5dCzRoAL2gir1+wqkvM8dJQDg=;
        b=ysB00lkVJIiwaw6Xwb7n1KUPLcRlOZ7/kt8hbv3ysZLEqzRc67BqdKF+cflQ7UcOe9
         iZNxATrTWlJy2iWMdBiTg0mQ15t0EFBh+csv/AdzLQCcobqS1RnHnXuewnv+TuG/8QKX
         pRfU52OC1cDkRG1IpuhLZo6iQOqjyJCsxxxZqfqhFOedxAYHgAW/afvHD6UGTAqJ0su4
         z2Gl54s1tdxc6ZMEr5wTfKoLfw9EuLKUgMUTho5LwUwb/bf5pPsItE7V7x5d9fGbmKTf
         FdfviwB2FGOkjcKyVFC0KbCrh7qO3o6oMxpDCNCVZr5Q5KOr0A91cR/y4JguvNTjyhu6
         vv+Q==
X-Forwarded-Encrypted: i=1; AL+hErF7ivOSo6d6KMQJzFOFcLi2Yh3mtfAEfCxyIceAHG7g3Lp9Eesb/KxnckAPQFCbuF+7LA9ea/LgZl7H+okY8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kwOGOwvhxIYfPsMiO/FTdSCjwzPs+VcPTQmOWJcCLme84quHA
	6YFOKJTkMMxTLQFLrtZKq8s7IHpovG8xQq/aBUaIvj+jak8sv8eKMjhgyCIOErpk
X-Gm-Gg: AYBFou1Bn+0vuxW5PS1upBvwsLzxevnzbNo9LTX40angI8Uxe6ISonWOsn9PRGZODDV
	7t4GilF/5ad3rgk2fI6jXtloQLnB4byfdzpTkSAnWZ2qfLAeu6r40I/ssrp6IXWbQfJMyrqMWdv
	oyBMwJf0qN11wbTV3hjz2m+J1/PWUGu2pOPmrkTUdFT6R7dXUARp7Szu3/hq1r3ecxSnSFK0QRV
	IE2MHCZAAduLP9jy4eD9IjIl1d4bDMtz3lVLwEKvk8wyk/JOXjrtgSd4JOALQCWS4GI8Pz5Pmyc
	1bTcAKzMPwB1Rc0AElYLiCBT6Cfddg6SnwuzaABDKi9wEFyaUnMSPQskIkpwaH6VRC+23BzjlDx
	J2LgqTWOslN0dMoxVdx+I97ZygwkadOAz8SMk1OB+P9gTzrB7dtj02uoAtvADhK19kAgW90TL5n
	VvuiYRqb/5yfDG/5+cDOeyuawJtKjnAJppQ3/5z2SKkfCyNEgzaOIspN/5xVIES7Fi4rDCGwO6Z
	q/de+0y4+QJieNZZ/l1ZcyH/QLTKWGleVyX0gmf8wSGXkaTJvxFjpB/5euEeX4aAQzTvPBtL9e0
	xtyuzykxpOFX6kxKWcrmUFg1izw6KJcnxW2wvJqAekguh/J3KwpNv66+I+bz6b9urDhZoakk1Zd
	HGd0D/C2+fYzwKNulc+fCtY6A3bVIOU9alxyvcn7t1nwb6Wk7j1siT/R2kYnzwJx0DIWyJ9OZ33
	84/Aum
X-Received: by 2002:a05:6a00:1817:b0:89f:e64f:c34a with SMTP id d2e1a72fcca58-8ba8a6e5212mr2359802b3a.46.1794308428472;
        Tue, 10 Nov 2026 03:00:28 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de768fsm740596b3a.6.2026.11.10.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:00:27 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next 0/2] rust: net: phy: soft_reset and
 match_phy_device may run without phy_device->lock
Date: Tue, 10 Nov 2026 19:59:25 +0900
Message-Id: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAA358moC/yWM2wrCMBAFf6XsswtNRSH+iviQy6mNlzRko6SU/
 rtRH4dhZiVBDhA6dStlvIOEOTZQu47cZOIVHHxjGvrhqJTqGTVxmhbOwk+zWDxmd4dn791Ba73
 HaA21OGWMof7GZ4ooHFELXf5GXvYGV75f2rYPOElOXIQAAAA=
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

While auditing the SAFETY comments of Rust abstractions against their C
callers, and confirming the result with Clang's context analysis [1], it
turned out that PHYLIB calls `soft_reset` and `match_phy_device` both
with and without `phy_device->lock`, while the Rust side assumes it is
held.

No driver is affected, but it seems better for the abstraction to tell
the two cases apart. Patch 1 makes `Device` generic over a lock context,
as `device::Device` is, and patch 2 gives these two callbacks the
`MaybeLocked` one.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5); the lock-less paths were then
checked with Clang 23 context analysis as described in patch 2.

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
SeungJong Ha (2):
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to soft_reset and match_phy_device

 drivers/net/phy/ax88796b_rust.rs |   8 +-
 rust/kernel/net/phy.rs           | 183 ++++++++++++++++++++++++++++-----------
 rust/kernel/net/phy/reg.rs       |  17 ++--
 3 files changed, 145 insertions(+), 63 deletions(-)
---
base-commit: 2d916a8c307c31b433318509bf0311d52d509f09
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

