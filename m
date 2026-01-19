Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8927D786
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793417; cv=none; b=T9PIiFi4EIX9y1UbIgp6HUgf+QBWr6Od8pd/bCKJyi0xSFVBVBtgDI5X+zPEr5xP1pHl+4IjDJ2VCIGlPbe8xdCRM6oWds1s5zL0PBJcaDCYVmWnc2vOQJefDJzf7ANQUt0FOyytVsW7dcsgN7JzoW1bruUyB/P7Q0HJI57BM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793417; c=relaxed/simple;
	bh=vUk9O36MXW2fREYdFa8vRs7HsaJ3sW4d3QQyB+C1eH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTsX/ApjDF1aLIjVzy4aNINZF8VWvKO/cDCxBGkV8fRyHJ7UQIpHQ/5klelcCrBBhAIdAOZfyuiVPjfLRZ4Nq0wJFXBGYDyO6FNxlnjgOpursDpWR/Uk4pOVi6oq/Tz+uUrdO9XClsar3IMH8Cozhkn0U2Ln/2hOvU3zMdkl2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1313606a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793416; x=1769398216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSeBgzmgVN7AkI3QNecu/jMSVNkZd9N7rOXeVNZWTUo=;
        b=f6VNvT2cShtijCziqL1O8bHsajqO8YH6pmqCdam1hK5Kodba+2G8R7NTC/q33AFEI5
         VWKRBUDIAOD/ahp23I49wC4Tzb6R2VaDF4JZve3lnL7KDhsmF3jX6m/PYgTuAsEkG7wC
         XgpKJA14XxbRlZExHDzL/HBqLyD3TY9vYulQ8BmZg1Dh00BzDuuetixS7pXC/ChVsemJ
         ZgPn5DwXkEIIyUoBnXCrq6xElHNVTzmg6xPvH+1oyPHntEx6MK2i6DIRvTrfXyhyGFFI
         hNP/rngx85J/pSsxRp/3hIeFrJ9NIyr4yDuTJVc+5fR124hlH8gUFjIHw4d0MCPigtxI
         y63g==
X-Forwarded-Encrypted: i=1; AJvYcCWYaX1crjeFNpmsDRDIy7K0CkHzceklg7GCVOg5Yz/LgsOTin3wi5N2dqeaydkDoyytGjdGocSPPNTMdtfFmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBxuBStWUluU5YE/geyfOaBEW3ooGJMjWhCiR30lyfRZ9nnnM
	4N1Yx0cHGx42/Q9jhyELHeFD09m7tNH+wZuFwogeFt4nxvqRITjzFnLp
X-Gm-Gg: AY/fxX4ZoskpIJ8vg/XIo2/kaIgv2CuXWATAwQ/zae2eV7Pu+24qekf7LZ5nMoqL6qc
	3PMrmPXVpT2SgrcGsVnLHwvTP7/p9PMjIZjXTrFnAFWpktnCVIaYGTOpB/brV9HVPfZP8BIj4RL
	rGwVdY6vQsKIqaPUpSdt2ZmYcZN+PsuvH6Vir+ZZPLM7wnjGI2WbEfMseUc0+HQVehl6AFZUZUc
	DYNxGKkrfJYOP04ATdpNHDBnz4IPp16Vk+hLByflUOpboQJKPbbOVBXawr/dL17nofgdKF/nGX4
	Da5MtFqAe8zKtXWW1w0cVOpPPRkSYJXUx6S9K1il+Kz/ojRlyrTBCSTveQOtXavqUzGMKWJ5MMH
	ajcf6X+3LdvX7U869rIHFIwMAs0uMnQgYoIPTUTy4brm9TYnSq94RN2ToGyU6Xcobm1/V9IBMVP
	pWTsjEKwtBEyyutAVJFuXvT1BFV050gCdr2J2MEco04cDj
X-Received: by 2002:a05:6a21:9201:b0:38b:d9f5:3c4e with SMTP id adf61e73a8af0-38e00d5be25mr9014088637.55.1768793415755;
        Sun, 18 Jan 2026 19:30:15 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm7656972a91.17.2026.01.18.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:15 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v9 0/4] rust: Add safe pointer formatting support
Date: Mon, 19 Jan 2026 11:30:02 +0800
Message-ID: <20260119033006.1453006-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds safe pointer formatting support for Rust kernel code,
providing two pointer wrapper types (HashedPtr, RawPtr) that correspond to
C kernel's printk format specifiers %p and %px.

The implementation ensures that raw pointers are automatically hashed when
formatted with {:p}, providing safe default behavior that prevents information
leaks about kernel memory layout. Users can also explicitly use wrapper types
when they need specific formatting behavior.

---
v9:
- Refactor implementation to use Pointer trait and Adapter pattern instead
  of exporting ptr_to_hashval() from lib/vsprintf.c. Use scnprintf directly
  in Rust for pointer hashing, eliminating the need for C function export
- Move pointer wrapper types from rust/kernel/ptr.rs to rust/kernel/fmt.rs
- Split implementation into more granular patches: Pointer trait foundation,
  HashedPtr type, raw pointer default behavior, and RawPtr type
- Remove documentation patch, integrate examples into code doctests
- Simplify API and improve code organization following Display trait pattern

v8: https://lore.kernel.org/rust-for-linux/20260101081605.1300953-1-sunke@kylinos.cn/
- Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
  EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
  pointer wrapper types (HashedPtr, RawPtr) for %p and %px
- Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct construction

v7: https://lore.kernel.org/rust-for-linux/20251229072157.3857053-1-sunke@kylinos.cn/
- Refactor kptr_restrict handling: extract kptr_restrict_value() from
  restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
  improve RestrictedPtr::fmt() implementation to directly handle
  kptr_restrict_value() return values (0, 1, 2, -1) for better code clarity
- Remove Debug derive from pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr)

v6: https://lore.kernel.org/rust-for-linux/20251227033958.3713232-1-sunke@kylinos.cn/
- Fix placeholder formatting to use `f.pad()` instead of `f.write_str()` in
  format_hashed_ptr(), ensuring width, alignment, and padding options are
  correctly applied to PTR_PLACEHOLDER

v5: https://lore.kernel.org/rust-for-linux/20251226140751.2215563-1-sunke@kylinos.cn/
- Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs using kernel
  vertical style with alphabetical ordering
- Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed Clippy warning)
- Update type ordering to alphabetical (HashedPtr, RawPtr, RestrictedPtr) in
  fmt.rs macro invocation

v4: https://lore.kernel.org/rust-for-linux/20251225225709.3944255-1-sunke@kylinos.cn/
- Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve formatting
  options (width, alignment, padding characters)
- Improve code structure: reduce unsafe block scope, use early return pattern
- Add doctests with formatting option tests for all pointer wrapper types
- Enhance documentation with detailed formatting options section, including
  examples for width, alignment, and padding
- Fix RestrictedPtr example to use pr_info! instead of seq_print! in docs

v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@kylinos.cn/
- Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
- Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
  rust/kernel/ptr.rs corresponding to %p, %pK, and %px
- Make raw pointers automatically use HashedPtr when formatted with {:p}
- Add documentation for pointer wrapper types

v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke@kylinos.cn/
- Disabled {:p} raw pointer printing by default to prevent accidental
  information leaks

v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylinos.cn/
- Initial implementation that directly printed raw pointers
---

Ke Sun (4):
  rust: fmt: add Pointer trait for foreign type formatting
  rust: fmt: add HashedPtr for safe pointer formatting
  rust: fmt: make raw pointers default to HashedPtr
  rust: fmt: add RawPtr for debugging pointer formatting

 rust/kernel/fmt.rs | 190 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 188 insertions(+), 2 deletions(-)

-- 
2.43.0

