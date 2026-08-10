Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939D357CF1
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343756; cv=none; b=IGEdeIkSLW1/X2mpTcS1YSEk7K9bult5cepcC+MGic+//xeuJ5Lxwz/RXjha3Q+O2+GW9/3rBI6fZOaCvuyj92x37Hbf3YMviCvJNewgcU2EEKrganMI7+2UaEsXR3OF8YOIM9/v+ObeLcfvUKv8RQKVjaBphwXgPG66sLBvAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343756; c=relaxed/simple;
	bh=1hDIxSDoI0Y0kxYEP/wRC8dslwxtbw1eu2zXew3moVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UgJe5Rkgjt6oj03l733uNPgohMNwsJjF+Exfyob9jQEF8W/01SOZ8Tqy7OXw1MiqUhK7Wgavzgjj5hsXzWf/d57OiCgAFySKotdaCxB7B2GJhxao5xQbeZ9Xoq5zD3Jah3RO90fkCiEAjO9agHi4RC7dxEqWMGFLDZ8P7t3zrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so18258825ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343753; x=1786948553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F/xv2YU+n4kMcnnd6EZRxUTwnnLCYY0whOcLOlLTt+k=;
        b=WtdrR3QghNcKkQiTRUK9PON5BB6fTrWVTYXOM3tSuJhJaYjjxuvnd0JZc6mk26gix6
         Er1pF1Biw1g7gSadLWrZUTDTSto9axDVuWDy0hi4zNUc88ysqkn5L1dWyE5TivcUREnj
         Ix/JBJ3hCPXW88EfHKrbKf9XFhYXorh6l1C6IFmaSwn35gijCy71vBv76vYd+Ksl1Fmj
         pVa4+0uKHad46wyUN2FgDQMTmtxztax5xlqwhVDxxjbpRKq5sEJK9fAjy2v2tjYpCD8U
         eUKk+4xDooBrNsSIdYmOw2nToMUnlzmrxQ8BAnSVOrwM4iyeH6T0aUJMag6OrUNXZ5Py
         FPnQ==
X-Gm-Message-State: AOJu0Yw1Ig5CoJbl91tbSRl4TFeFkVdff5EfIrcFOJFCXSUvfOvoD9op
	yOFS/7tpcd1g3LtR3o9MRTqipuKlUjBN288eUa87ilHlV0n9p378PmJ+
X-Gm-Gg: AR+sD13GTzKG44w+OKCHSUo1znV/C+4VfP/+fGo+1kpzEP2hk06IYMtyi9NREQJBYVt
	zkWHYPXBaBblFcCRJVfKYCwBnA0UTDgAfzQF+OCpclrLz3BTX4X03q5hD6HGKWdn29a1Ttnqq6Z
	IBjhK0qU68PLqzjhktTngibcdeV75PtQHRDB4fZT+VSzKvWu63LCP206fsjl18HlBgaNBy/g9Dm
	4BIk7JJxTviqgHZFVRH2BgpACk1oILhucrSte+vFyT5loltcVDJFMCQIIZeeapdqk3QQ4xAICGC
	LO/ntq5zI4eLZ/vbiINk8zHaLTP8beZHGX314SSppDD/qD18dMD1Di+GaNv3SZjTekaVaSTFEuJ
	wZddYu5PDsMB9qweVIomfcsOgYezahFxmPz62imltuw4jjEpDHgkfAqI6qjmwBp3/09QTtbzcUV
	fdrr7cAgUr6MhyYkeXI688Rg4A95D2UIcIEX7I4ycK
X-Received: by 2002:a17:902:d2c9:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2d0ca7599d6mr422071045ad.10.1786343753388;
        Sun, 09 Aug 2026 23:35:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm46754021eec.28.2026.08.09.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:35:52 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v15 0/2] rust: Add safe pointer formatting support
Date: Mon, 10 Aug 2026 14:35:41 +0800
Message-Id: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1xeWoC/22RwW6DMAyGXwXlvFSxgTj0tPeYdoDgjGgD2oShV
 VXffYEeKFuPTvx9/mVfReTgOYpjdhWBZx/9OKQCypdM2K4ePlj6Nj0IVKhVCSi7OnbcnqYgEQt
 dNVWuAHKR+k+Bnf9ZZW/vqXZh7OXUBa43A6rywTADSJBNqxxbcqwdvH5evvwwxoMdFmXn4zSGy
 xpvBlzMz5KkL6mkhra0REYbUz16lixzirjBqHdwnuAci7xEAs1N9SfEypB6whDVihw6Mu3/gcU
 20CjawUWCDZBSFenKuWYH3+6rDHz+TueY7vsUTR1Z2rHv/XTMZjqgDJZS8+0X43CrnsMBAAA=
X-Change-ID: 20260512-hashedptr-22469b930113
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786343747; l=6879;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=1hDIxSDoI0Y0kxYEP/wRC8dslwxtbw1eu2zXew3moVU=;
 b=gQ7MT4ckIu6H1gGyFkcSj/8PViooDKL2wlhKdcPyuA0/8T5azEDMYvAFvBs6V6maMQ3z+muCi
 Mwg73YHETNfA4ky21uBS+Y5OtIAHhDYqlczEUMqWRbno+VhfV/mI257
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak - {:p} prints raw pointer values, exposing kernel
  address space layout

---
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

 rust/kernel/fmt.rs | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 2 deletions(-)
---
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
change-id: 20260512-hashedptr-22469b930113

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

