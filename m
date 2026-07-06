Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CE1C5D72
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315147; cv=none; b=lYTpkgohIPqSRCZzz+0JC1lsafwwnrcgVFWE3fY3r7ztNiCJMek0HV/E99WCkVc8PFPaRgz0jq+7bZd3Fib0ai8CczWj5QxJnLBSc/YrPcdyRmsyTQQpJq+BbYfW5vihSYLHPfLdehtwfR9bEvM+DubgFIRH8K1byitCH7T+7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315147; c=relaxed/simple;
	bh=NgJ+ozCNGbYNiF/Oxy854h0KGtCL5Yaer3dQdt/96Yc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Js9GflUjs9PBnLMWLLmaqYybVy8yW/kJtACOWK8Zdehrwk1kOJu5A1iX5NvY5otJdjE3vAukUMRjyn84nulEwt1aqzsm/b3V9D03PxMEAiYHgP3WJyy5GvbNJKrk4T6G+AJMwx15ultUhxYsTcxxuzOtI830yhoJTWMaEGJ1AFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37df72c9984so2326693a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 22:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315145; x=1783919945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+7kFWWI6DifTjKJC17XZfFBMotzFakAXEysGuj/UnM=;
        b=QiAPoURdolsimPAMCoNjQJKn6OWFmmosrOn7iUjhNvrghwFfu3t+6Em/klHD8wrMJs
         3HbrvpfM3J275nYNVECKu2McWpB+QWYr/qT2fJButFdWh9AgPVlOAxiP7WNK+3e6zWeV
         APjWPqBuvakHDHU/87y3lNoBOVhDWrCmVhucCdhSYNwP9F4/swPNhSBlGQ3Tvi8q8kAv
         CDvgPZvXic+5raw4I44FnyAycFnHgnHEUTrVL1itZUx1v0CPsgP6LY9kWZy+yy4uAKWj
         H5/FUqDayLz+98Dqa+Ly1rhgKZIrcvMEw2+Yv9wrlzgEQ+G57elHIPp70RxU8TrrD4oX
         vTkw==
X-Gm-Message-State: AOJu0Yx9T1MYE6BYg/Ltvajjy4jqk5ouFuuqdthSN1nowogLFXLWZifS
	1r+qy8QKaqGmHb9j1Cspt1z1opIl3aKkh3RHF1MCUMkW1/l4XYsB1ZPb
X-Gm-Gg: AfdE7ckS8VzjQvjt+BfKEpNkyo5bCzb6/jsX91UjGEW8uG6BeRXcY2BQohGH+dhvVly
	BQ+1ylPGOKLChDPD1XuxPP4aIPMlIXMOC6zS0Of0kTI1pKyQVGZ6WSFxVs19Cmutnc6cwK0M98W
	upb4/4B5ek5XYrf1Wp9FSuHHbNdXcXMflP+MowtclIa+YAQVEJo/iDOB48h8gNqBA+1Hdb4xfe5
	DzFWWFVjKBEJZQh63j5S3MwrNl45uEoCF1nGi8c2lgQ1Sj2czh25KqEj//UxT2w6ql24YdWa/Jq
	wtmRP5ONmMuYKTntxXHN+MGUN26RZI8HzaWdDjL/Znmu3rv5CFhThzbaDD+mI4B8fkDWRU5JADO
	30314LRMouQjMUlhwStFTzWKjQmaS4qQb/Ye9VZKRR+BZ/MLGyvStDUxGVw==
X-Received: by 2002:a17:90b:184e:b0:37f:9cdf:f0ad with SMTP id 98e67ed59e1d1-3829f9e3ecamr8465916a91.28.1783315144602;
        Sun, 05 Jul 2026 22:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm26511081eec.19.2026.07.05.22.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 22:19:04 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Subject: [PATCH RESEND v13 0/2] rust: Add safe pointer formatting support
Date: Mon, 06 Jul 2026 13:18:42 +0800
Message-Id: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALM6S2oC/22QQU/DMAyF/0qVM5liZ03anTiw6w5wRBza1CURt
 NmSEDFN++9kBWmbxNH2e5+ffWKRgqPINtWJBcouOj+XAuRDxYzt5nfibigNhgKVqAG57aKlYZ8
 CR1yrtm+lAJCs6PeBRve9wF7Z8/Zlu3tib6U/Bj/xZAN1VxKK+oaUATjwfhAjGT2SGuHx4/jpZ
 h9XZr6grYvJh+MSMwMuG/5JVEZccAVDbbRuVNO0t5xLllyiXs2o7syymCWuZY0aFPX35vPvhYE
 OX+VL6e/MvovEjZ8mlzZV1ivkwUARn38A73sH/loBAAA=
X-Change-ID: 20260512-hashedptr-22469b930113
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783315138; l=6582;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=NgJ+ozCNGbYNiF/Oxy854h0KGtCL5Yaer3dQdt/96Yc=;
 b=TH2+7tPDprll8GwiZaE63sSBekGfbMVDdiwn8kw96OSRWJGNMwUqpzRM1ScLa8oxW6yATKoVg
 rV9g5GJLisiA7qa56ouQYCKN1aH/4PZhTpKVqIioTlTPEq/sxRQQm3D
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

This series fixes two issues with {:p} pointer formatting:
- The impl_fmt_adapter_forward! macro destructures self into a local
  variable, causing {:p} to print a stack address instead of the actual
  pointer
- Kernel address leak — {:p} prints raw pointer values, exposing kernel
  address space layout

---
Changes in v14:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v13: https://lore.kernel.org/r/20260526-hashedptr-v13-0-324352716eb9@kylinos.cn

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
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260512-hashedptr-22469b930113

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

