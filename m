Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D53164C3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992930; cv=none; b=Ka/bekNAS2/w2iSf4SMk/ZTVCMow8uYaJdGQfhT2y2FFUaHvxf6PXyuxY9po1U8cW3QjvHDgJkmSLrCPwcoFzf1a7FfB0Khu/wHNUgWn6tGWH/hGMuqT0llfLqF+UXbwbVWka+vhuigdUDziEEKb7ZFWFwpR5lKqFNf/Hjgyg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992930; c=relaxed/simple;
	bh=+QBBospUccZfmTE6v0wFI2D4DXbxVcfvlJqQa4X44JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cW8Fc69ZyAHbqZn13XlxZCQh0Q3shv523rzGJT28fz0/PaKHg1iHQXBMsKtrLF6GlSt2+azUChbu7lZVt8rl54+EOHdMcbJMdjABDVjWeuMBIcZzXbPu23E9C6Apfo3wtztZvSwAW3ZP5HzKSGKJbfmVhSz0GAfAXjui82cclrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso7180322b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766992927; x=1767597727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qLsJYY7/xaBI6CP6wVdCxOjq3mGLiNZiabgyk3klCs=;
        b=Z2TkisYLcQA/jrlBXw0+5hQpeSyWUdoxp1nAJWt7KxbDkF0TEVhT4vbc9xOyrKl4db
         DC34RAEGMYaQCddCR4/rjRelT9b+yWdR8HH2NsdbuO2v1WcPbT+AxAsMlbrH3Rd35gs4
         TLGwYKeXqBnZLAK+TVCqqUO/xv2+WMwPvjHFNEOeAnfiW5H1orBFdOL7pHqFHL63JmfW
         /UzWYLru7UVaxxviNOyyB5cteYpiE8IMNqTAVELUxSgk8jeAwwC98ScK4J//Y/JlU1/H
         hBaPoTG+y2/pqvnaa/cTRdYl2ySFd4gbpBeOHiuDVaDwcfKQJwQkOPgGiniDFZDlZpe/
         +Tcg==
X-Forwarded-Encrypted: i=1; AJvYcCXJHYYDRrfORhf4kkdRjZ2B7hICFgtDopmxht6Y2gYeCJ/tGWZqhnLr4VSUkcR63RpAwbYyDEaol1hy9u9cmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvCTebqno9myiD5fLh9XW5ahbOLoR3h/6vLHz2qoysH3mqUsV
	Ge3pqXlITS6WBZ3jSJHvBnSkuv+iqwyF4U4/f/TOM2ggcqjk1JDIrdmf
X-Gm-Gg: AY/fxX62Te8ghIw3ZNXDRLNPjNFdai19Vmh1WtUIXmsFQGMrlbFrwX1E6zsP8bG+4Gs
	6lIyH89X1IwJwKO7LgwaqS16KiMXt7sfEO9vo1pUYgMo9e4BCi1td+8kTpdJJ8fhWEJKkkDw09S
	6RHkXfjfvMGbQnDsmJJ+OSZH3tTjjlqSo4uctHDSK1uuG4lcfMvApObN2i3pnDZn0U3deVeIzNS
	88Md8D5qFOlPF5YIJ/TFVY/kx5fwNlDIgdg6vAr0whGELvfJONzhhrBg0Qv3SUDSJqIrr3ojYXe
	S7ggqIiVgIV2QHg1EejADKbLsqcOr1sMiQsVTssmZKFHiQ+0TCN9hIkn3QAwTp2nk1olNd3J2mw
	F2s5GuFKMlVhCZAqhTougVmSGstyklG1HQ3T50Kpsdua0cFHE+hfKIA3KbnEnT/W3rLEn6MeqRD
	noP22lMTKq8wRD4lNrKxCvaYpNBEEJjYGhHEgwut7St/K60UceVFe4cRQ=
X-Google-Smtp-Source: AGHT+IH5EMMPQ3wJR60htE4ZeVfM5tMvoZI5PHJyxvjzm/cm4iZOFBZNemFocQtVSVn6/9FxO4I4aA==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4471:8c9 with SMTP id d2e1a72fcca58-7ff66279645mr28250788b3a.42.1766992926974;
        Sun, 28 Dec 2025 23:22:06 -0800 (PST)
Received: from localhost.localdomain (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm29021863b3a.45.2025.12.28.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:22:06 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v7 0/4] rust: Add safe pointer formatting support
Date: Mon, 29 Dec 2025 15:21:18 +0800
Message-ID: <20251229072157.3857053-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds safe pointer formatting support for Rust kernel code,
providing three pointer wrapper types (HashedPtr, RawPtr, RestrictedPtr) that
correspond to C kernel's printk format specifiers %p, %px, and %pK.

The implementation ensures that raw pointers are automatically hashed when
formatted with {:p}, providing safe default behavior that prevents information
leaks about kernel memory layout. Users can also explicitly use wrapper types
when they need specific formatting behavior.

---
v7:
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
  lib/vsprintf: Export functions for Rust pointer formatting support
  rust: kernel: Add pointer wrapper types for safe pointer formatting
  rust: fmt: Default raw pointer formatting to HashedPtr
  docs: rust: Add pointer formatting documentation

 Documentation/rust/index.rst              |   1 +
 Documentation/rust/pointer-formatting.rst | 101 +++++++++
 include/linux/printk.h                    |  10 +
 lib/vsprintf.c                            |  55 +++--
 rust/kernel/fmt.rs                        |  69 +++++-
 rust/kernel/ptr.rs                        | 254 +++++++++++++++++++++-
 6 files changed, 473 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.43.0

