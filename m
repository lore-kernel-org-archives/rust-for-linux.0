Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527083A5E77
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576153; cv=none; b=OxIDadhl/s58Q7SOlnEOMd2IxzsB/AOsnnYRmTvF7sOLypINxQMse2a0CUjd1xTyH3WcIlhoHTAGZhxYK1wJPMKbapLVFY4q/Nt3HKTLesYqTnlagqdak5VpKszUx36Gmjv/tY5rn6nZ9RuSeQEGSPEuXXhKrVQa3uQMqY5MBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576153; c=relaxed/simple;
	bh=/dT3PzOZAA9/exwRWedj0VbUtsLvCzPEfLzYxdVyqA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SHaXXGxiSrsF6sv20Wbjq6mSyrxX65cSsXg5vK8p0NeJHjXf6arQP703YNqcwzqe9tWalEl1MoEiTHFAgoykdavSWCsEKfxlyq2qnJFcjI705NNuj2b7C0AQe3Dl5TJs6Obga7YgIhZPc9OECbyY2ZsioVckkNO/KktNfwjqeWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-367c26471f5so2261445a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 01:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576142; x=1779180942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w1zTT0lMIQ6DZZT+P68HxSXD8yAZkQrnajPPw1ltPA=;
        b=sFyRD2sumoVNUKo8X/zPiQSKOU+uqkUBv1d6zGW5Yr+nDrdcIC0MIKIiF0qOhfZL/c
         ict6cnJE4Hpg2sJKQi05Rqp7M9zS7XiwRn5u9S58UETv4yJLG5XRDX4vWDIyD57bkIto
         TM47MT3llYJ01R6/eLV22pU69rIRIOr3HxKA2v4NISgRsJHRoqQm22F5raPV2c7J3ji2
         DIPhJqt/OZkzvvi5HezAMQ3WDZC/5Ay5GHjrN8snHw5OJzHuBIb1dWSdOuhLvaRgPAAZ
         hNGKIG3oMLlQUGMq1ljWQP+OAW6q8HlGEpHIApu0q3RpgBvNnaUURyY0j9FYch3SA7Ao
         64GA==
X-Gm-Message-State: AOJu0Yx4kkyHsnjnnqfxBTfMjM4SJ4vElgeJ/ugTL0adspPOvynb2BbA
	AYS4+yKjnPrAb92ZW7zBPxH7jUJecdQ+r8bf1UsZ676W4LChbyb2uZxJ
X-Gm-Gg: Acq92OHGX3Rt6qLcX7DdRH7+M6EnES76hortkWG6jvQiwEUAPn2BqM2NHdTvZ6TqO9U
	1IpB3sN5y/qZ63H8d/XpHHp5Y+fXpu9upg1co35pl5VkxnKBJWYuo2S/ZAY7KmuZ0/rLCjIDVBJ
	zGtYQxTjo3oqUPiBtFAf1Bt2nlw4r0sSm8sg/4ptLH4EAGxDcasMp67SbaWtMzUeiwc5xmyigM3
	qoYJi5tiCRVt4rIM7kydPDWbr4xoSuU9rRGlmAdly23waj5qoV/cnmhEAY9SDGNcfBqdOux724m
	OTMY2GiqQKiODyttiYGpBrNi4wF/0DVsO2vIxMscnMV2ZkaC2KQf0aH9i+YB0rH5lLIWSdw8guF
	O/+Dsn52OpVQs48+leEs3D81LYGizLI4iAOeRoPciEyeNQ3tsEG7hTU9syn+wYDIhU74=
X-Received: by 2002:a17:90b:1645:b0:366:d9c:91dc with SMTP id 98e67ed59e1d1-3660d9c95e9mr21146769a91.5.1778576141833;
        Tue, 12 May 2026 01:55:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm124209215ad.44.2026.05.12.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:41 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v12 0/2] rust: Add safe pointer formatting support
Date: Tue, 12 May 2026 16:55:26 +0800
Message-Id: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP7qAmoC/03MQQrCMBCF4auUWTuSmdpIXXkPcZGmExPUpCSlK
 KV3N7jR5f94fCsUyUEKnJoVsiyhhBRrEO8asN7Em2AY6wCsWKuOGL0pXsZpzsh80P3Qt4qohfq
 fsrjw+mKXa22X0xNnn8X8BFbdn7AQIeEwKif26EQ7Ot/fjxBT2dsI2/YBgQG6f58AAAA=
X-Change-ID: 20260512-hashedptr-22469b930113
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576135; l=5900;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=/dT3PzOZAA9/exwRWedj0VbUtsLvCzPEfLzYxdVyqA8=;
 b=bT6lLScr2HmYt+temy5N8z+Mu/9WZ5wEJZbxircxbXxsc2rD75vKtKPuGKQ28DdiNGjblYNoj
 TYt1YBPxatYD/aC0bYWgjWqX4FnTRbL1WXi+gbjd1r+ZK+3KG0rKcDE
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak — {:p} prints raw pointer values, exposing kernel
  address space layout

---
Changes in v12:
- Split into 2 patches: fix {:p} printing stack addresses → route {:p}
  through HashedPtr
- Test cleanup: NoHashPointersGuard RAII guard replaces raw
  save/restore; mod expected consolidates 32/64-bit constants
- Impl delegation: &T, &mut T, *mut T all forward to *const T (matching
  core library conventions), replacing v11's blanket impl + macro
- Link to v11: https://lore.kernel.org/r/20260205-hashedptr-v11-1-bd0fec7fe6f1@kylinos.cn

Changes in v11:
- Fix inaccurate or inappropriate descriptions in comments
- Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
  always passed to scnprintf on all architectures
- Per Tamir's suggestion, replace doctests with mod tests and adjust
  test content to make the tests more meaningful
- Remove the RawPtr wrapper type: it and HashedPtr use different
  formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
  call core's Pointer impl directly). This series focuses on fixing the
  issue that without it {:p} would output the pointer's stack address,
  and on using HashedPtr to safely format raw pointers and avoid leaking
  kernel address space layout information
- Link to v10: https://lore.kernel.org/r/20260121050059.2315091-1-sunke@kylinos.cn

Changes in v10:
- Merge all patches into a single patch
- Improve `kernel::fmt::Pointer` trait implementation
Link to v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn

Changes in v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
- Refactor implementation to use Pointer trait and Adapter pattern
  instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
  scnprintf directly in Rust for pointer hashing, eliminating the
  need for C function export
- Move pointer wrapper types from rust/kernel/ptr.rs to
  rust/kernel/fmt.rs
- Split implementation into more granular patches: Pointer trait
  foundation, HashedPtr type, raw pointer default behavior, and
  RawPtr type
- Remove documentation patch, integrate examples into code doctests
- Simplify API and improve code organization following Display trait
  pattern
- Link to v8: https://lore.kernel.org/r/20260101081605.1300953-1-sunke@kylinos.cn

Changes in v8:
- Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
  EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
  pointer wrapper types (HashedPtr, RawPtr) for %p and %px
- Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
  construction
- Link to v7: https://lore.kernel.org/r/20251229072157.3857053-1-sunke@kylinos.cn

Changes in v7:
- Refactor kptr_restrict handling: extract kptr_restrict_value() from
  restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
  improve RestrictedPtr::fmt() implementation to directly handle
  kptr_restrict_value() return values (0, 1, 2, -1) for better code
  clarity
- Remove Debug derive from pointer wrapper types (HashedPtr,
  RestrictedPtr, RawPtr)
- Link to v6: https://lore.kernel.org/r/20251227033958.3713232-1-sunke@kylinos.cn

Changes in v6:
- Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
  in format_hashed_ptr(), ensuring width, alignment, and padding options
  are correctly applied to PTR_PLACEHOLDER
- Link to v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn

Changes in v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
- Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
  using kernel vertical style with alphabetical ordering
- Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
  Clippy warning)
- Update type ordering to alphabetical (HashedPtr, RawPtr,
  RestrictedPtr) in fmt.rs macro invocation
- Link to v4: https://lore.kernel.org/r/20251225225709.3944255-1-sunke@kylinos.cn

Changes in v4:
- Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
  formatting options (width, alignment, padding characters)
- Improve code structure: reduce unsafe block scope, use early return
  pattern
- Add doctests with formatting option tests for all pointer wrapper
  types
- Enhance documentation with detailed formatting options section,
  including examples for width, alignment, and padding
- Fix RestrictedPtr example to use pr_info! instead of seq_print! in
  docs
- Link to v3: https://lore.kernel.org/r/20251224081315.729684-1-sunke@kylinos.cn

Changes in v3:
- Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
- Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
  rust/kernel/ptr.rs corresponding to %p, %pK, and %px
- Make raw pointers automatically use HashedPtr when formatted with {:p}
- Add documentation for pointer wrapper types
- Link to v2: https://lore.kernel.org/r/20251223033018.2814732-1-sunke@kylinos.cn

Changes in v2:
- Disabled {:p} raw pointer printing by default to prevent accidental
  information leaks
- Link to v1: https://lore.kernel.org/r/20251218032709.2184890-1-sunke@kylinos.cn

Signed-off-by: Ke Sun <sunke@kylinos.cn>

---
Ke Sun (2):
      rust: fmt: fix {:p} printing stack addresses
      rust: fmt: route {:p} through HashedPtr to prevent address leaks

 rust/kernel/fmt.rs | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 2 deletions(-)
---
base-commit: 50897c955902c93ae71c38698abb910525ebdc89
change-id: 20260512-hashedptr-22469b930113

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

