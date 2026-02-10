Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1532D8364
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714036; cv=none; b=G8BMyJpxJQ5eb79JZoKaPl5jaFPX3eSwwfrn4zyFSNoeL2MEsp7xojErJpdU6bY2aK1eHVp+5/BwQkJ8v6juLvn0p3a8anOb5oa42w2FjmYCef/K6nlRNsobGb6b6Xvfh48NNHwojBTW+UMFJbarXCf5SR6/Zk6aWIlbfLXI26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714036; c=relaxed/simple;
	bh=w8yTUdbyiQnvXE0Tpjqmrd1R0TJWD7BCw3qshT+8cVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rmtnMsCJzAXdJJkb7xDTroq2bZVUARQ9ZzR/oIhjXDTC1r5X6EokPsy9i8IKyUS13RPchyR5DCtGIbiOduHt4GpxpcU2ArYv/99oLvln1C9tjECpEzMfVZ8kmhGp7zcr2Prb1xT57eHEKnT5Jidd8qV33wxjkcVQ/ce2eUU+wK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig5gTCwE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig5gTCwE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aadc18f230so15017335ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 01:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714035; x=1771318835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=ig5gTCwEHAKfQWWqB5aVidYbBcy60KGqpcGQR0Or+ASRkgVLv+kOh7+QdsB6ZLzWcm
         eLJWB4VOOqnsdXrrhfT0ahR9q0HZZcqW6gn9+b4/2wH0x6dq152pHd+8dj6H45m7eEG1
         ozIpfE1m3SfiMmKoySic/lZ2w7suN37Sughb/jN+aR/NXxKvf2Hu/BxxkMi2sIzIsxGB
         jQ5orlMQGTeydQwtM8pY5UdSAyZIOpDrYPvmRhfCgV+/tPS9jxEEA91cjmUZ6lv7gTKh
         QT3ARroaC50TBefGSfirHolNHilkvdNWbqarWZgpOe2eRYRv972i85E5dXgAYzQSbtHL
         DNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714035; x=1771318835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=TZcjC7JuN60woApOczLZ2XpubQ4WaBWd9OAPjZ6+IJtbg7JObGS4bjsU6uuuHi0+qv
         B8ZPkLZrfaqUa360xrq8dtXAdtzlhvXXSiI3n85gr6Ge3rq0KizC/yklD/sITvgmyHXW
         2qnzZZhNG3TztlOMBZo+S1grrHgTHyyeGsdwFWHGyzJ/bdPBhKAXyTbFMmGvLrHhmhzN
         Ip6p0I3MPE1qvEGJMEan6h9Dwdf5RQYPWFfOvMyJerlcIYGft3NLuFDDZnq1XWYEdBEz
         IEVkQwz6pLdzyC67hxHygUO7TB9YvPssR2pxTXIUvQbIB3wShPdTdYiwk3Rp3Oob7EoX
         42Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXwb6ZdRqV3ETwgc7LS3RLz7pEy8B6LPGmglFBNRE9fXBiZpTZr1yfkNqtJl4oimLV56pj3m8Qf0mTHPoRJYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxExO+uSqc7DXaNE8oq1su22B8dhFK0O846kmQSZ2MMVR+hfqfU
	qgzeY/fkwhNvIyf5pWXXHdKEw19U+b5I7dJQ3RSQQSgtX2lwKZrDj8XN
X-Gm-Gg: AZuq6aLlmlKOVju64qQx9Ng6ZhoR4DosHwI/GKP/XcLQCZmEHpOYeXyAxBalbpK0/8f
	8Wr/w1HhsTEyv891AaLNOkSnn/9V3AvJAXVWPL5bVcusd1NXiYczeFkwWWmaKf9diWCQAo1JyiR
	dnj6BVAegTR7OWinowyaImPONn6LO5p/B9xT4n2x8PSojYWO4EcV/wIBtbepwjVuOglrdV46IIR
	qSHN1+cRovd6WwgCXR+Zps7TnOftNPjO30ODIiTeGcWkujdcfvts1CgTn7Af68PPPUJVQksxUKl
	yZRZzyROeC79r6eDmdtfdJI75dyXwC5C3jeSi05mnQERjCQAls8rKQyeyf7IZMqRG6GOI29PIof
	xtGkE7JaBCse4LK/L7z5sBaYHe3rnBBdD8uaB6scVFvrpwgadoK0mI5QKWCPkP8N13UfBj2+od0
	klP56S+d5u0w7lUFPmqioQ4pxmQmOMA5JnT7d7wngiotOP1K0aFR1eDIEC+h9oGBCxLxllxmQ=
X-Received: by 2002:a17:902:e94e:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2aaececa5ffmr69096715ad.36.1770714034700;
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V6 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 14:30:19 +0530
Message-ID: <20260210090023.2587534-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out.

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64


Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 +++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.53.0

