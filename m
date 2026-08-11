Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE43594A
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786414625; cv=none; b=cbas0ILS4ouQL8MBkB7uwWXZT0UjY8v8Yh3HZrTUU9N7Kf+aVWt3bpsyIKaI0EDYcgylvl7h0yf3luYSQfhQpQbNadLVXL6aJMgjqYKB5ETVLMqwu2odBWbyG+syItXllOB4qk6Zy5mFu+YZi3i6UjSIJwAP5onSOvSvx36V5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786414625; c=relaxed/simple;
	bh=6TcbRPngxB1/4Xd7SQvMRW+SPTd6Os2KhlrgSEuWTQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M1ndjBtWXgEXGdV0JpIX8Od1ytAJAKhy95BK+FuNNPjD4YRq1sh1Kd9Mtaz1dcxfmFZ4K0XNStubCMmWaxVwBivq+Sdj0plhajaGrmXd/WKL9bLexhuxGlwZU5XKX4YH421AvdS2lH41Bch5tdYKiD4Q95E6eVOSQLl2I/A/0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1953581a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 19:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786414623; x=1787019423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0rTETrZQD80b0HbQOyMHNJ/NXLDgcpZh2UKWexYXibQ=;
        b=WDKdf5zwHiuPpJVhsPe1GlKVLhoDqTZGSVLc0w1WPUtmbVf6OMRaNqbxuYsY3ebxIw
         hRs3VhAvaNbwL3D65/PtrcmfcHwjpvMkQtQQ1LLRPDPpa+GslqWbzPe3+8SHJEcNbzi6
         3wqcSSeRvZUGTrr3jAWU3tYIc2yWHhnQieCSGDZcZdOj4iHrvVk9FFIDrjVrwcYRoQQW
         c9K5vRoMaqeWPZmY1VdXq1lBIK0s6sUvxr1ms07YXcKF9OWIejFSEH2ody5NI/ytUO3v
         aUfhjOW648MiemIpLHqTQ3gprL+b1pSIzj926phHoDB/xnaJgc4a8xrrz2vKIbRjnWYT
         ouBg==
X-Forwarded-Encrypted: i=1; AHgh+RrM8yajHBxB0oofVQQ2q6Eqzv5e+eO1DP3vfImpNRUV8m3Ea5kkn/rmcFzgbo5p/QhOd0um8XCb9k4fm/VFYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8iQvwh2sdz30pOYyvkY88kV5Jtl2PvTE8NRLQVSJ4pFuWbs3
	3DEQxgmhwQ7ZEjLafldogeHEE4h25c/aLBKVcnSIUvC+drl0yOKNOypqNnuLnYvJVNc=
X-Gm-Gg: AR+sD12GRfIUQOJLdWcY1lLUtqFD8Ofaz3eCLqICeNMKj7AO7FdhcpfYAk8JxosABTw
	kAIL+z33b2yXrrzrNmT19tg3SnGvppPW6FqPAtyt/5DirjkGw8A7bHp+BiW/UAj9ytfbGJgkRg2
	h+drmo5s7yVtUBsmHgIfa1YPufBq6WxKSS/rHGY3L004lPPYh9WZZlBYI0nWcxi8y1ZkuD9UCg5
	8Cs7HBSX9b0kw/btlkHCklI9FinApg1EuxH3G1gYhN08qm9qnad/sN3f429gNrNdp4EzEYAibjj
	JV2y+DZX4WbKuGeziFH+keb+JLel9FlXRlPWJDF7UrmvL2Bk8LinYuq4yo1Xv7zVVn9fdreLO0H
	C6LlV0jdsKrF2OU0mdULL/8NrTTDvDOqQ2v6o9VzJTlKX1B8M9BE4tCaH4lH5Q4+8Bgk18x8aOO
	rN/SJWsu1tOi37amtjQ0AkAVpDHp5h
X-Received: by 2002:a05:6a21:1b84:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cc2b80bb73mr296764637.10.1786414622667;
        Mon, 10 Aug 2026 19:17:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a60867sm40073968c88.9.2026.08.10.19.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:17:01 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v16 0/2] rust: Add safe pointer formatting support
Date: Tue, 11 Aug 2026 10:16:47 +0800
Message-Id: <20260811-hashedptr-v16-0-fc483a02b6c7@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+GemoC/22RQW6DMBBFr4K8riPPGDyQVe9RdQF4XKw2kNoUN
 Ypy9xqyAJosx5735kv/KiIHz1Ecs6sIPPnohz4NYF4y0XZ1/8HS2/QgUKFRBaDs6tixPY9BIua
 maiqtALRI++fAzv8usrf3NLswnOTYBa5XA6piY5gAJMjGKsctOTYOXj8vX74f4qHtZ2Xn4ziEy
 xJvApzNz5KkL6mkAVu0RKUpy2rrmbNMKeIKo9nBOsEac10ggeGm+hdiYUg9YYhqRQ4dlfbxYL4
 eLBXt4DzBJZBSFZnKueYRLjYwqB1cJJhrZ5GsNjmZHXy79xD4+yd1Od7LEE0dWbbD6eTHYzbRA
 WVoKS3f/gBJW+lAAAIAAA==
X-Change-ID: 20260512-hashedptr-22469b930113
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
 Ke Sun <sunke@kylinos.cn>, Link Mauve <linkmauve@linkmauve.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786414612; l=7166;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=6TcbRPngxB1/4Xd7SQvMRW+SPTd6Os2KhlrgSEuWTQc=;
 b=147I0zmBww4JNKvLRoubAyYq5+XjmcT5wNHRewA6OYe3t9obULattosttBr6lYzti42WFziFV
 eWgtlE4b8muDKKIXxw5D7n7ZkekQa/hJxWKNa+kaiLc3FypXBj6LSdv
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak - {:p} prints raw pointer values, exposing kernel
  address space layout

---
Changes in v16:
- Reword `HashedPtr::fmt` comment, drop `no_hash` test branch, use
  `without_provenance`, assert formats against the first `{:p}` output,
  reduce clamped test width (Gary)
- Link to v15: https://lore.kernel.org/r/20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn

Changes in v15:
- Clamp zero-pad width to buffer size, add boundary tests (Sashiko, Miguel)
- Fix {:00p} output mismatch introduced in v14
- Link to v14: https://lore.kernel.org/r/20260807-hashedptr-v14-0-817009769ffb@kylinos.cn

Changes in v14:
- Use `%#0*p` for `0x` prefix and zero-padding (Gary); this also avoids
  "0x(...)" for placeholder tokens like "(____ptrval____)" (Alice)
- Simplify pointer impls per Gary
- Link to v13: https://lore.kernel.org/r/20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn

Changes in v13:
- Add NonNull<T> pointer formatting support
- Add #[inline] to all Pointer impl methods
- Support zero-padding format ({:0width$p})
- Simplify SAFETY comments
- Rewrite tests: remove NoHashPointersGuard - modifying
  no_hash_pointers after boot panics since it's __ro_after_init; read
  current value and branch instead; expand format coverage
- Link to v12: https://lore.kernel.org/r/20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn

Changes in v12:
- Split into 2 patches: fix {:p} printing stack addresses -> route {:p}
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

 rust/kernel/fmt.rs | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 2 deletions(-)
---
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
change-id: 20260512-hashedptr-22469b930113

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

