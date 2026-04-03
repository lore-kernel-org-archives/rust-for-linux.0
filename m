Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6812248A5
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228006; cv=none; b=cgiM5mwy9Kc5vmCgGYBTb7ZiJVOVYrj9txmPozdCeKQNUnBxP+0FzQgOOiUJ2FjWGJ01p7svw7w9OgjrbeHNr+6EJrPwZ7+SOgwvXCHWNh6TmfQUAgjpC8TLSSmAJeLzhSRWM8H+hm7SRD2au+edYAxwpDc42aVNM9QK8K4cT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228006; c=relaxed/simple;
	bh=7RoFm77bOhyk6cQZSK927ydS9/Zgl5MybmrB4ByFItE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EdWpKBUrp8qMqw+WLnpBjX3ZIoYRI4E6SHSU9v+kj9xdqruhNGXOW+GuwdsXqSeIwGS3M98nlWnk3Ld+944Jm2auQNCOo2pkuUK7ETDvWyE6W6URkXP1YuyAlV8lBXm/BblwamgAOpA24Xmgg83t1eqGSyeOPGcJcru0B/bCf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ne52X6sH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ne52X6sH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-827270d50d4so1806289b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228003; x=1775832803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y741cUw5/skL529bebHe+2MR3Atn8T2EhTb8n3/Lxrg=;
        b=Ne52X6sHkisvuLDRRQysseAOIwyMZikBB70tOWltXqIplxxIz3kxzfAnhMEd5pA5S1
         ZcKcixChl00flDLfvccCvv4XpyukpuT6ifYesyS/sbfY7fxyWbFxB//3onMjGegZ2jGb
         3pqobnHUbuGalzFa0VO4adgGb59ELOE+anVjUvsqOSj7zIQA1uStYZD2kDSzUluw8+iU
         lY64DdQcVNaDU4wrixUMksfhpvPwwMMWHzZp1nApdGO97czSQFAcfvKGj8Z29qOwSEoM
         hJd/HlkSfrMcxxcmedUi9iEwF2sm5HbwEiw/WJKk06vp1VeuskpRUTM+G8Mc2c0KpPa6
         goUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228003; x=1775832803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y741cUw5/skL529bebHe+2MR3Atn8T2EhTb8n3/Lxrg=;
        b=YJrqQuredtitNZMuNxDpNM5Xo4bIW2Ucyz2HgQuhMzZA/YCurgdlpFb7bGc6dwu701
         CqDN3TlsxUMQYN+K4XOf2OtUhlYksF/S5dVyYXJ/X73MNj+ei1f6UAEiGGgx0nz1t/b6
         TkKJ9Np3TMRhwyM4WihGIF8v7H6i6OQxQXpMtKeEvoTpmeaK/KvJRXKYFeO1ZV/6faFG
         qoahzNyUaHNDKCwvKJ/0wkWfZuwpO9EsjtEVEYPXz9qKbVggrr3jvCfuKFssI3fy+bjO
         v8marQdfGtkp7656nHThIf9hWHFiebAVRhlZQ7Deuae5Qzs83WCdicffRIWXJiZhk4jo
         XvfA==
X-Forwarded-Encrypted: i=1; AJvYcCXNIcNxtPl1shmhRp3BIzwxr59hzAuCwoMOIL7HL2la151cIVCVAr86jQMZB/WTCumdW/aXBOT6gj3WAGZ+Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw1eASQsMoI2N0BkcjSUcRbH1Ffjmw29MnZMRnU85thVdjayH
	RmIAuYR4h8B1LRnAARbVyTilACOduS+8kxmDUSW1D57vDQcI6bIZMdiQ
X-Gm-Gg: AeBDietol/x0VGuyfHN1bMp1Xa/loVGq+NmB7Y6aPcOQilz5WVVy8/hngEYjhOPWDAe
	9zSiHi/8jlUv5lnxQp14UnCj+6e+YSibYaIhc2jyTUJspOhg/VO8HmgskKdV6qnKPZYUYzeSevU
	tTyexCLcS5FZQr22gpYsOKjIk3hxSLdVOwPAn4Od7R5+hoG05fq7pHsuOIIbgYV7H6ZwKIFW/di
	0pActjLSKUlD8nwpZrj1CANre5/P96CQrD32RutsP8NLPAt2+mzkEV7w68yl2Vd1HeBS3C5NmA1
	IH7iyozqArFuzZaigH7zN+SoTgQO51mzKaHmFFtjBoENzIOHlvxnCyx3ekPG8T/3rhZ7ZYalIP/
	zhhkrrk07mjDbqlSrd0A9Ek/7nsaDBqAua6E2UAa2B11zRwkaJN8SfIcC0CN1uVOtd2SLfowHLY
	ThWwpYeOzxIAvB8oB2CYrjr3iS8i76PTCtwRoWS5crIyLyXB5jVuia99i5smd+ppTKUMJ8Dqmkg
	6w=
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr3167167b3a.1.1775228003145;
        Fri, 03 Apr 2026 07:53:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:22 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V8 0/4] Rust support for powerpc
Date: Fri,  3 Apr 2026 20:23:04 +0530
Message-ID: <20260403145308.1042622-1-mkchauras@gmail.com>
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

This has been tested on
- powernv9 hardware
- pseries P11 hardware
- pseries(9, 10) qemu
- powernv(9, 10) qemu
- rustdoc on x86 and powerpc64le
- rusttest on x86 and powerpc64le

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.


[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V7 -> V8:
- rust/Makefile updated to separate host libraries from target
V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/

Changelog:
V6 -> V7:
- Documentation removed as powerpc is still under development
- Added a fix for race condition in rust/Makefile
V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com

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

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 +++
 arch/powerpc/include/asm/jump_label.h | 23 +++++----
 rust/Makefile                         | 73 ++++++++++++++++++---------
 4 files changed, 71 insertions(+), 34 deletions(-)

-- 
2.53.0

