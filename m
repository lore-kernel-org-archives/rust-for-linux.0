Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0303D34A8
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768971673; cv=none; b=NN2prHBMPDytO7M4VkMP8/Y7tt9xSXFvIWRo6WMOCNCjaLn6fexWc5vcquP8dAuZw3V4ISowDCJ3owt28De8/b8KDLT9wQxqPLZSUahPp76Fz+U4LGyD2jMx9tjP+Gb8yYDVvgyTd6CNFblntB/E7NrIUmZ3SC+eL71C3FVUo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768971673; c=relaxed/simple;
	bh=dgVYcGh69+bNdjkt0PGIRM+wdibKUa7+SwHwRtoXmqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBColiJj4SatHTplZNlgOYttNvjC2tkFGTt3/24fBaYkR7PuE3+ThmJY9EMWWB3PFmtlt+1ClrGJ+GmCBfVgFYj5fJSJvRYdb5UhsaI7VWFbQMMUBLC2jbYp4Fj+49xwMF32ZkTMshDYUdYN+B3BAn+l6wksZJ1w6qL7Hu+XzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81f3fba4a11so5899080b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 21:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768971671; x=1769576471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH84HqRKItCCT9HzrLJQG9T72Dy8MmBc1u6gwKMNvmI=;
        b=Kk6KvjiVuQZyweqfQ8MhAUGSDvAX4DvlpY4HgrsfyxI+ZQOApyhV3QbTxEvbzOXb9z
         cgWM4sT8IzUxLyAAOkRnygnq3a4pzxmP+t1koJhjjbK1wmZQua9S5nlam2CjAoOtaRaV
         QMco22roPqe5OJsRk1hNvhzZOk9hwFwZ+papfykbNvuBVEd/D9D0JGAjdlKz52FRumPF
         AId/uVflYrqHjbDV/xi+kyqE5eTODZpzL/rsz2/BZt3XYUxbMQupeDJF3rNSt0T0k2kJ
         kVBYrHgrmGBKvGLAVqO5rS/Rjq+NtwOWJ62o/zGOD/N8s/wZZjlJ+mEJh3JUnkf7kx3U
         X7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUYkJaXvoYFwBmj+t/lCn4coAfYQcMJ9TpT0EZxbQRwb+by2AvFO5vz6vlZ79TOBXbN1BFy0uImfOzIWmQ1AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhf72NgQ0qxQTbDiyjQ9pV6MY5kKK9e5w+L+fi1Dk6VPL5xlb
	FiWnz372q49iOn9hdVhETwzb1ZUJMzztrFoLBiCeiwsr6vD83G/ZY5VI
X-Gm-Gg: AZuq6aLIASHarJeUtSbJF+hP4z7oi3YlUSqG+UXRPV1EVriuSyUAFfLVXarvqNqOgTL
	gGdeSL0QW4tr83IfeeCRiJ2qQLJgcDkLsvqLboFJX8o/H0y4f5LkMEp6GY8MyGbPJUWc5LJPvCP
	FVUktYdEJGsk2Iwe+GzGOPFl/jrgQJRCjsPPXItFlVby+IMbGfUH9StoYwFCT5TbkeBzBSaouj1
	HwHHkmM3sa/EGv3Nt2rFGDBO+BPvS0tzyGwiXpYoP9l/wycQLuf+FcVxdR38YGeDJMyGJTPkwH6
	bSgwV3wj3ZseyhostvEd70Tg226lQBQI+WxCg8QHlQZ7ghdppGNpEW2HE1PqaAFU39G3BYR+Vme
	87w4OyvQrbJJZzpoVT+agTaHRnWjrQagoWPyRlYHYtLa3xtRmrpIeBVODsFfCTyqvVjM6+MqBPY
	AwnG2HdFPKxhyvu4D4N3SlzPYHv0aWf4ez4urRedxvzcthQFrnMKjbea0=
X-Received: by 2002:a05:6a00:244d:b0:81f:3c34:fa78 with SMTP id d2e1a72fcca58-81fe87e8f59mr4221381b3a.25.1768971670557;
        Tue, 20 Jan 2026 21:01:10 -0800 (PST)
Received: from localhost.localdomain (210-61-187-173.hinet-ip.hinet.net. [210.61.187.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10be07fsm13628453b3a.20.2026.01.20.21.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:01:10 -0800 (PST)
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
Subject: [PATCH v10 0/1] rust: Add safe pointer formatting support
Date: Wed, 21 Jan 2026 13:00:58 +0800
Message-ID: <20260121050059.2315091-1-sunke@kylinos.cn>
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
v10:
- Merge all patches into a single patch
- Improve `kernel::fmt::Pointer` trait implementation

v9: https://lore.kernel.org/rust-for-linux/20260119033006.1453006-1-sunke@kylinos.cn/
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

Ke Sun (1):
  rust: fmt: add safe pointer formatting support

 rust/kernel/fmt.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 2 deletions(-)

-- 
2.43.0

