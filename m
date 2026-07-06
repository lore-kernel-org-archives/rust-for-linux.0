Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5137C0EC
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303844; cv=none; b=ADW52F/nV6tgzM1sEj5/wDFJOgyvKU2d9pbwVhqu+ABkGJM8ZG9fRaWNaVZrbGxBSZIw+tI2UWfUeBk1PYb9J6YchNZYmPlQXvUBn6qrJbz2DOQmWBwZ5H1mnU+K6J44ZYN0+qWAUwTEqjqoOdF3nofo6BDQbV3Ifpyf60t+ElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303844; c=relaxed/simple;
	bh=BocP+QrRN+f/Rqi0zmYl67zgAUcnpOa1LWasJSiPrqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dbQ+lidvmFq5ktS/ax4wQuNgW165byYmY/cduap7AIqEVtjcrBWoGohh3+jpMxPUUW09SqVVTCZ4ZNcwlNO5FwKAFjbXEPfGeKKnGp4osvp1wdk4eG/AYyb+dxcvM67aObrgMrd2AGrbbufPze99dVWjv7YModBzU4jpIJI5wFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso977694a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 19:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303842; x=1783908642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi7rQ1kmCM1IoMCleaiDI0L7lHfMr6oxqVoKUsut/24=;
        b=foEVmCN9wAIwtYoUNkCRtP/2HuQ+dDfXJVP3FEKXUjh6GndRm8wFW4LNZ/vXo9cG9Q
         nmEeRDMsiNfoRF6D3DnvOznOUbccyIPIBxA9r7mvf4wEkiZYrde/TtA285MDVvNhaQgx
         LQg5l3+aOHSGrwAEEjQcDI7p3fLx9/TD22NuQpC52wsG5HGbs6IPSkd7+Xq+wg7YCLCu
         EmwFE+y2vT4bmiCPVnh9mviKw9Ra2GWeuVwYwu+9uDCaC5B2/sB199Xt1OgqwkrAvenL
         qp+sT/yBFQo47dOJ59TwqeRmEP8hRaJgEwfAPkP8oeqyLq+z4Yl81HYvx+mg6rTLo3rg
         x20A==
X-Gm-Message-State: AOJu0YyffwHvbT/MrgtDJwXbw1xc82AIDm7zJJjv9aO2L2+AGtF8byMI
	sOr6fTdQXrqpgv1uUEwzwnK52us4oTURmbF7Dakc86h5TimP96uelRop
X-Gm-Gg: AfdE7ckI/D3/HXz8WzCDQ71TOAw1Ctfu8bU/RjVj00A51/QOeXzDBNTos9grY5LniKy
	xJwa11dCcZN3r9y5D/IhFprucoYpfWCrh+GGrQMalxS8AeMJhOvHKAyEUVmkKHk9oH5tDp/T9GX
	RWfhbwlUSO4Kf2z9cMW5RVk/Of7n8eUqR6jtALGSeUk1K9ejFOa7h3+1OBCfOZLi/GCUTaOXsxA
	7DBzDWvFa10Z77UqLWsNgLyGwMYl9nSn0oQqeX2pJlpMTh605juM/G/wQArlGyMkYnsecLKIS6v
	J1I2tt7riqDfcx+ATW0gcaKPevlqPX6M867GBAP2RiWHTDzCyUEBcL1jxh25VawDygSi8zbdBxB
	7yrl6G4dA3sRxHHOAfoCTlOc4RBsp3VmdBZk1rfylG7W2LnSuzGZzoZ8MSQ==
X-Received: by 2002:a17:90b:5350:b0:37d:7bbb:afab with SMTP id 98e67ed59e1d1-38280e9063emr8092539a91.11.1783303842289;
        Sun, 05 Jul 2026 19:10:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm27288065eec.6.2026.07.05.19.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:10:41 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH RESEND v13 0/6] rust: Add safe pointer formatting support
Date: Mon, 06 Jul 2026 10:09:53 +0800
Message-Id: <20260706-hashedptr-v13-0-e32a15ee2854@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ke Sun <sunke@kylinos.cn>, David Gow <david@davidgow.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Jann Horn <jannh@google.com>, 
 stable@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303833; l=6492;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=BocP+QrRN+f/Rqi0zmYl67zgAUcnpOa1LWasJSiPrqE=;
 b=GgpztB5oUjzkAlcnFFq4WPHxpORDTDG3XbtiH8fE5FFhRm3bwSZxbo4vMwROoMgPE1vEuAB48
 w2YDszwIZBcAXUATsbbiU+6U56DdPC2MglNdgeycjP87qXYww2do6Bg
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak — {:p} prints raw pointer values, exposing kernel
  address space layout

---
Changes in v13:
- Add NonNull<T> pointer formatting support
- Add #[inline] to all Pointer impl methods
- Support zero-padding format ({:0width$p})
- Simplify SAFETY comments
- Rewrite tests: remove NoHashPointersGuard — modifying
  no_hash_pointers after boot panics since it's __ro_after_init; read
  current value and branch instead; expand format coverage
- Link to v12: https://lore.kernel.org/r/20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn

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

 rust/kernel/fmt.rs | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 2 deletions(-)
---
base-commit: bb1459368dd795c43380057523f571d5eb0ddded
change-id: 20260512-hashedptr-22469b930113
prerequisite-change-id: 20260512-clean-fmt-use-5c2289d13741:v1
prerequisite-patch-id: 4ad50fd407b8f4aeb3a0e148e34b298077fa5754

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

