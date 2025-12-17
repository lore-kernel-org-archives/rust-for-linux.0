Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF23A1E84
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007881; cv=none; b=qZmVQRdt7ECyzjuSawdmIMAAdn1dYYsDrZs8y4e+pz+BZ0iB+WUgd30iGmhltBC7781kxGHrgW+LlJaPzq7/02L0OixZihBWeqkFKtkL3B734z3VSqz1nEePUedAOeGai4UdmQkZO6mOnwEPJOncCU+NgzBIYJjfFtZlecv3Asw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007881; c=relaxed/simple;
	bh=eUbvdFF9Z6hYnwSB66kMWYayN/cDbPdfi+LT2n8RQYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBNUsQzsdOx689y2CfxlSD6Rs/x2elqyNucA5qXPlsdwGi4cegkVXeax7sEbtCbg/UKRisutloyU1joYCCXzQOHQB+ATsfBP4KzkUrSo2H7B2h3sbTQrj9AHmjuxyJX6+X11rwq6rRXTxSNyCwNzTUvDmt9w4guW/bhCtiiYPeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHPTPuU2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHPTPuU2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29efd139227so77455505ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007879; x=1766612679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xoUZ05CT95VkujejXH2gtmNq5uwHrWi0k0EoiToN/f0=;
        b=BHPTPuU2IKBO4hsN2ah5L1QtJ8FPm/0i4z03Lhg3i5J4OZKTKoK6bYb+kD4FQh9lL9
         bGIwJBICEMiLWYgf/rrpbDv7l+bF1+ns6flTccMycqgLL/zTkkR682cWJy44dKGBxead
         RqdfBl6GODZ5HFfwQgdWNvrYMmmJ6LlNQZKGyZ9YK4nF83/RAWZMdUjKbBvgym8Tx4yb
         1nkJwS8vkJCKKsOCZWHTA2rQHwUN4XfwWUMZ0pjXPO0/zRTnIa2U4MZRmTwycsr4AATB
         guAYvuX0QCisSq69VJUOvHDNa/0KPx/nKfb43qFCUugveKYAppQkxSbHfvBAH22ClvtK
         L82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007879; x=1766612679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoUZ05CT95VkujejXH2gtmNq5uwHrWi0k0EoiToN/f0=;
        b=EJmIVzxuT1xoK0Zlgq/xjIjbLqX+MDTQ/7P2UXjUKWFQQPXfZe7VjSwt74YRQ+sA48
         zBTynE2/X2ey0do5iGGfbmeLTZJAsavX9H3d7EgXNHI7ivizMsMEsCMJBvMZHKpDF5IL
         tLyoaG+B4+1bVs42XO+Wc1A6izk6KLDUaNc4ohgw/W/0KuSgDuBlfF7IqHml3jOGfH8L
         6Nu/84ZYDY2KSL7Df/uFpa4WAf/b9X53mtDtKjDtff2rW9RB3KzBBw+8PidIA9olsg/X
         R5DhnQox/XwQzFuYl81WCO1a7rYwdbIVr0I+qcGqlsct9UZ3EeWlpKNSgSDVboFB4kMd
         rsqw==
X-Forwarded-Encrypted: i=1; AJvYcCUxcvnr74LgQ4Ru8zFA00EAB/mHXDWlo4woJgIOektpURyKVlGrG2E0C7vp0G4K9rUrVpn/MXZmagQEnNrL5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/W62asG6gvv5X4V8HVvp54aFC4G/vxUFV3sbtWdp2s3UPIO4
	upyst+IkVcBG26/xcEJjYaPhkiIkAWVvsVCBxU9fbCqVdVB5einYr1hq
X-Gm-Gg: AY/fxX5INJ/YztIkoO9yIq++1UNkqmXjnbDHD/QQmjHX7uqQIOTWEVj0A88ChY0ON78
	T8RLEhGfC7DWc6fab9vVlMqC+Js2hiEbqMoghpJEK1eRgj8ctKX2KlYQi+Vwvn0m+1gce4XGK2J
	1iUIMM8DPseQfibRbnHGqbXgrUhHFQgJwZUFqfJaKknJTxfhtlvNEntUpgt52vP3c0KGqhbTqlZ
	taz4PMNi3D403gcx4cFHqMQWZqCyIN1bqGked1KnQgAEj/xsQsXpH/vM0BxLTMdLI0StDAnW9Nw
	JqczBjG6cujsFqqO5P6ekylHrhW5XWb9T/6P2Pd1y+PCMEnbVp31MukM5i3paa98vvKeFB5znpH
	vsQ1Ejp+thCBLiYA4SWOJJwfHO5DPQvg7MSBxVoQiBXiZowDpSZothkazqIxN6kZ/js+2QZayB1
	9NmS/P1m7RZyNNuk0cSKKZRnj2siCtkmzeYSHaovpMdebiY/gOLQbuxRKWaD95IA==
X-Google-Smtp-Source: AGHT+IE9tyzQAJwh8SZXLoKsIZPJxzMR/lL4HFiEC7DUJsFINGNG3ozWy+g1R61IhwMaV1imD/SOuQ==
X-Received: by 2002:a17:902:ef02:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a083603cafmr120079485ad.51.1766007879184;
        Wed, 17 Dec 2025 13:44:39 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fc8sm3050905ad.26.2025.12.17.13.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:44:38 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
Date: Thu, 18 Dec 2025 06:37:38 +0900
Message-ID: <20251217213742.639812-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds atomic xchg helpers with full, acquire, release, and relaxed
orderings in preparation for i8/i16 atomic xchg support.

The architectures supporting Rust, implement atomic xchg families
using architecture-specific instructions. So the helpers just call
them.

Note that the architectures that support Rust handle xchg differently:

- arm64 and riscv support xchg with all the orderings.

- x86_64 and loongarch support only full-ordering xchg. They calls the
  full-ordering xchg for any orderings.

- arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
 macros to add barriers properly.

FUJITA Tomonori (4):
  rust: helpers: Add i8/i16 atomic xchg helpers
  rust: helpers: Add i8/i16 atomic xchg_acquire helpers
  rust: helpers: Add i8/i16 atomic xchg_release helpers
  rust: helpers: Add i8/i16 atomic xchg_relaxed helpers

 rust/helpers/atomic_ext.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)


base-commit: 02c5c8c11bbd34cdd9c566dd4ecca48995c09621
-- 
2.43.0

