Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E263905E6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415326; cv=none; b=WJuFX3zUNWxsuU4zEqe265pJahI3f55b6aSs0C+GWjbzXuPgJz+MaMGXU3Mfh5j9LcHg5t21Z+fOAxLdFkrwsOplq9gtsm6Bq+x7OtWU8WYzpLJhfqzy4DwcC99ItexQVhqisSutLJ6Q1rWwzvEFXG3ptjr1MUnU5VdUnIRvebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415326; c=relaxed/simple;
	bh=6TcbRPngxB1/4Xd7SQvMRW+SPTd6Os2KhlrgSEuWTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rn+rbK44aKnd3v+NBvFS9vHhgCi+wvDDrS2bDrte0vAsgvkjQVitYgVYniSdZHy6Bbsdo+DWNi7RCp3dlBPQsGryz0zto2i/XfYBwF/6sRNNi2u3vKWmHOSfxh24zQGAQl23LORTISAYNG8MMYQqL9xIW8kBFpnhcpG2NnOoARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso38104085ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 19:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415324; x=1787020124;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0rTETrZQD80b0HbQOyMHNJ/NXLDgcpZh2UKWexYXibQ=;
        b=jnT6sdc5JGYyYcgbejtM8JVDVpVhDvA24mBYBl0nAVx631NJoM+lkmCcWm0fmOd0eb
         rs32Y7OlvyHFkHif7dPTBXvY4nCT60j9ZMDkKJO/k4oKdGQOx7m07QIkakrRi1nyY256
         rj28RPMNHQ9dSq9G0y40cq05TfBlvWFzlSrAfn6bhb80jNVuOdx/Zb4IelkxbaFXGoec
         1CqwbK7tEwLtk3S1jqqmmTqnZqiN8BnUrJzDZMpLnFPusjPNQ/HdrKr1pYXvIdq/o4MK
         ipq9WNhJwsgkAtPBxkpnHX5wgMDO4HNs+I5yH+rb3oIee7z9EGY4LXJEl7VNBAEtWzkh
         8koA==
X-Forwarded-Encrypted: i=1; AHgh+Rpyza8Vu7CN9ZOlv+mjsc3vDJZMrxdNvpq3ushjjeIn9bsq/ZXx1yu/CYpxBDrOMuQbKM9ltZ7jqt6jpia6mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2AEuHBwYs14WrGA1LDv9+VXu0cxTsgORINctHQkm/n9s6QhJ9
	LaywLTvIviAiVpeexnlqipfLmE/phVwz9tPxskMfCn1PUp8v2muWULvQ
X-Gm-Gg: AR+sD13X9l0nyHaMGT+ACpOJ6FzLRxH4RQoaJsUyhLl2FdPzw9e4/81GEqKES8qkOjt
	xV6kbLERi9lxo9qPYuMWp+HXg1HYd2KpQ0lvFfw1czS7Ibs1dheIJ2j3wZ1gaS3Uy7Ps0LBjrf6
	F1wuseiPsj2h04FkFV2yQkdxmkadE2wOBuk6WfV9epN7oCGj5ZxjmQmwS66uaqGlCWRpVcVYPph
	BgP5L434qi13ismK5IJxSy7IIsWCf8ODDmAe4n0t2uwV/IHg7P5OlFK+KvUFtuCoxyp/FFef1eJ
	Ye+R0hiH4u87KjCnp76LgiK7zqcqJ1NAiM4RkKUD6ggnHfSw8McN+skrgxdVTgnNssNt6iS/5e+
	zah6ZChxseIQo6+9RctOY0gzc3/5HA9PbWciOtvj9Wu3hfwFdZO1KK86ojV/6rJoUIDERUXHPiI
	ODATpsuDce6r/XwWh3LXrV3Gqg+FdrrzHfKoJZNtxsnQ==
X-Received: by 2002:a17:902:db0a:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d31790b336mr1668605ad.21.1786415323998;
        Mon, 10 Aug 2026 19:28:43 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec29672sm49536556eec.29.2026.08.10.19.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:28:43 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Ke Sun <sunke@kylinos.cn>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org,
	Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH v16 0/2] rust: Add safe pointer formatting support
Date: Tue, 11 Aug 2026 10:28:05 +0800
Message-ID: <20260811-hashedptr-v16-0-e21e70a58153@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260512-hashedptr-22469b930113
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786414719; l=7166; i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id; bh=6TcbRPngxB1/4Xd7SQvMRW+SPTd6Os2KhlrgSEuWTQc=; b=r6Td2CfOQQ+cOBfZ4/SfvdEdGk14Vh+BJV/IIIM4kzPsrAzth6tTY51mmMLQIA7F0fXGAeKDP 6NCVK1Hk2I7DVbFnpFdvnaLx9HRgrKuOF/uPchoktTah4H7yr+2pkxk
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519; pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
Content-Transfer-Encoding: 8bit

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

