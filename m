Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499753AF647
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090527; cv=none; b=qTZuM5aM0almRixMOVmtJRy26f8PTzjbiEdAR5tJdSxWb+MTaOHurj+EB2fHOSteaNBqE1b7MBqZNpWF5pHO+uBj19XROCGG03+IR6bxUwwlVfsNQ27wFebea9shWyCMiaO73H1kt3MLp0rOxFAN9YvKjydKi2fsckvEwTrHlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090527; c=relaxed/simple;
	bh=tkCwiHM5Yy8VAsIhHkzjtBVNSBo5NUMgLP0Eb1hegXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p1GXIx09OY/b0fBbeULItVpfqKPt41sXSlf/sHK4RKrRZe+Fjb9k51IE/WeR60qzjneDsPU0S4+RzVdEiW33+P1NVLcQ/yfpFsahgkc0uR/FshVcRAsjA7OR+/I+QlShu1bNDTDjR8rCfkKJEaZDk+Xaq7QwWnElniWumu44RnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84867f07d63so3686386b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090516; x=1786695316;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7q8/nVQpkj9Gz+H2J6fGGvF/z4vNpglfJyg/OIloQY4=;
        b=eub5ciyzN3+oXek7jUCFP/ci5nt7LCz6V3IaCTVrQWagOmEmw3dONzV3SrWSoCHtvV
         xJFDGkGP/SgtiSdq5STd0AEg2EWLnrdH7uJ9he6kkkgcKx6B/xkBc2gbDJhgtWHL4RUG
         c6vlRh0WJ+ufw1RMBzf9oi6Xw/pl46+3dfiX29Dkb0yWP5MNmWlmRXxDtl0VBkVp6yyd
         Zv5nL80Ygx/DiSnTGuTBRJ8mobcG1J1sDQ1sWZNa2yKmWo+C/l/nStvg5S8u+pzPRekb
         zx955A1xJm7JBirsX7cf8QSeY9ZNyJDRFuHAkakDKB5JBogoRD7rbOhd0pcyPhh/kULt
         5g+Q==
X-Gm-Message-State: AOJu0Yxf5FGWn+E+AlihIDGT/dNrRaqZnPt6zXbs1UzLGfi7b7iaGaAd
	+umcZzhIs94VPVIYrdcaf96FTIS4eQ59J5U5ZXKjrKfoQAQiC7aZeRqG
X-Gm-Gg: AR+sD11W25D31hOC1gtJCuA3G2VWzvqPaj42ZbAYDEU9gV2hRu0jTs0Oh7frQBY61MD
	itAp482ZBq29z6CwiF+g5hlNBsMIcsuxsqigVIbf1WqQc/E5+qAdCp8RLd2jBTbbNV/wWLP4jck
	YGSL8RdOWxBRio2+Ug/0j9kL6wJOq3selVPYe8LRsETIWeaUDJ0eCGRyM65s4du2JopMLtttfO1
	MS+++OiZEHWhac8UISNNx1hUMuIb+ArFGoo0KgmIzmOsKsgsVe3mk6ypSJmY3CHaJrAZGbcjZv4
	bbVPdP++Wvh6AZI1bbEdxkcFv9RNq5z9F/68kFMFPgQGSBxEFr6Uax/gTEf7xmFVygBx7E4luJu
	C5x8m6yNBgBsJURkyUpv4Mifvgu346tjMrV1VeQegYBp5wYqyPa5oR/moE8cjgq+cdKu+uO6F/m
	ZJ7Ld9PbRQkXLJoVIy2OZcptRdYID1kg==
X-Received: by 2002:a05:6a00:4294:b0:83e:b443:965e with SMTP id d2e1a72fcca58-84f2dfc5413mr24095892b3a.3.1786090516334;
        Fri, 07 Aug 2026 01:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3c948bsm630035b3a.17.2026.08.07.01.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:15:14 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v14 0/2] rust: Add safe pointer formatting support
Date: Fri, 07 Aug 2026 16:14:52 +0800
Message-Id: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyTdWoC/22QQW7DIBBFr2KxLhEz2GBn1XtEXdgwFNTaToFYj
 aLcvdhZJKmynGH+4+lfWKIYKLF9dWGRlpDCPJUB6reKGd9Pn8SDLQuGApVoALnvkyd7zJEj1qo
 bOikAJCv3x0gu/G6ww0eZXZxHnn2k/k5A0TwQFgAOfLDCkdGOlIP3r/N3mOa0M9OK9CHlOZ43v
 QVwJb8yKU9ccAW2MVq3qm27R87qshTFexjVU1iWsMRaNqhB0dD9k9gyWrzIaN0L7dDp1j59eL2
 1EennVBrNt0rY0CfiZh7HkPfVonfIo6nL8fUPvwD1A4YBAAA=
X-Change-ID: 20260512-hashedptr-22469b930113
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786090507; l=6644;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=tkCwiHM5Yy8VAsIhHkzjtBVNSBo5NUMgLP0Eb1hegXA=;
 b=Rn4Jc3I10vS+6s5ow6VTa/Gdptkxbso7prDx77MxL+sphkp2XeeAY3dhi9h/wU5Vi/GSXSfXd
 LkhSP1hqES8Dz4BmsXf0wx5dSAlwshptBdNR4jVoGXo7r+86qJeUlmx
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak - {:p} prints raw pointer values, exposing kernel
  address space layout

---
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

 rust/kernel/fmt.rs | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 2 deletions(-)
---
base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
change-id: 20260512-hashedptr-22469b930113

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

