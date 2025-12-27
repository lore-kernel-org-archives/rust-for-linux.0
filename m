Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482CC3A1E96
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806816; cv=none; b=DFTvO0GbjKtLyg4qUCwScPQ8we+9exNov73oeDUL3cC84Uqflf0QLlilgHjMVNZbml/qKV+wqg0NrVqvLc1PO+Nvx1sIFFNJXq5Ck8pZoBrO4Dl7Ew3+B/oEbLsuKDG3B7YnexB/Bywoj93G2tmCt+I32dF7f5TjT32UVsfFB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806816; c=relaxed/simple;
	bh=OYNjGbAwEFadNihNuAIE8LvJz9YdNjzuFlj9l6FtjvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dR5CjSnx3e8dGtaJqGgTHPJgBj6C0oa1a8jXyMN4ZhkTf9d4nscOLv9vIKnBgidkpZzLTisC/4aoYsf7YAJ6fk8x1VTDXPrw310kcOEi7H67R5iXBiaeKYx8IhyPSDXBl+48yByUCRkETx8NdPJn9Ek7axBGlbQlOsXGzyBzO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c20ee83dso97258335ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806813; x=1767411613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IIaFk57Te3kyNiOjlJav8HbZDw9KnJgSrFjkFsPAY0=;
        b=psmfgvdKDR1OLc2jloxWZYoGTkHxZ3wpPfbcx+8jsu3f6c0QIOl4enWk/t0B/iZ74E
         ub+ugHt5lepqB17pzgjfHhO74HYC0J6W9PVnTpUAYczHcasrOtAqhccEqJLETco/WuMJ
         ELOPV4r9Bdprz9MFbGu9GQj8emixMCWQVbvTaSbNz3JSEj3Z6PlgSzrpCXMCVy9McwVo
         gYbaXVQqrEBI+bftzdduxNoQYGzNSsuVpVBIryNaOvBXDpLBKdySRs7F+9u7/q4gRyW9
         MsHLPhj6epUJzcVDTJIk4FmaOh+moIblPgGCSHo8w/SbTxm30UdzAVhZ7he7UKJTpyS3
         T8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWsPiO0n6ZUS3aD1TveYdlnvFF8HERrrNYdZLVpVq9C4Uhzlw1zq0miszGpm7wzdGrFX1URxYWMssOLpCfgQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZZfNRqRfoWPAI1zYo+vWsoFxjTjPPs0bnHsnAnPqzjvnXSTx
	jox4NbS/9ZO/XUMd95QOfJl1pGfalWy9mL2yjYnlYmfTm6PBuRdKlfMw
X-Gm-Gg: AY/fxX6cqau+8kKWIQPl6JQtQ7NovoKoWDd5IGF0vFb72eZIm6YPRxtoQ0st5nbD9SL
	LsSIdNlLbJ1avJi/hy6H45nXfXlUUUAAEA5V4jmKHuctqNXaCvtiuuAZweD/CkskH8Jn71oVy8J
	75oxRRSWQpFm+Lm/mEsyDtLu6PwaH3HDNq7c6+wKCIRjLAizOQAA+ZIkuDD7x6FMk5XZsLAi7/7
	vsSAJIQZck8FQUMHLR3q2tY79gxnoOqia/zL6tgIJBLW91r+Lvu00YkxKiOC0XecspKQrFdkzgy
	SxRCbo/JSiwQxClgHwd+VPfc7/2u4cAEUHlsMUnblEtLcMChvMOFxZ1lWILYltXubHqivJMQBkw
	X7WDndOgMAG60ob5ZhJBiYZiZVZ0ghk/uUM7QpSrvVNnAEA06wufH8j8PpFGVAPEcLjHCgfI1gP
	U9z4XWyv1SIHPee+6vxAx24CdYUiXP2guvWw9dbERKKuhDUfVGvUfaK7s=
X-Google-Smtp-Source: AGHT+IGi8xY6yC6dBPeDsmHnDgx/Zc1FPRDGf0L6Qsm//SawUP2LShckbIihts/hbrsLHFzVgV6hXA==
X-Received: by 2002:a17:903:2a8b:b0:2a0:d403:a2e3 with SMTP id d9443c01a7336-2a2f2a3584cmr251098055ad.37.1766806813467;
        Fri, 26 Dec 2025 19:40:13 -0800 (PST)
Received: from localhost.localdomain (61-221-120-112.hinet-ip.hinet.net. [61.221.120.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm215323135ad.44.2025.12.26.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 19:40:13 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v6 0/4] rust: Add safe pointer formatting support
Date: Sat, 27 Dec 2025 11:39:51 +0800
Message-ID: <20251227033958.3713232-1-sunke@kylinos.cn>
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
v6:
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
  lib/vsprintf: Export ptr_to_hashval for Rust use
  rust: kernel: Add pointer wrapper types for safe pointer formatting
  rust: fmt: Default raw pointer formatting to HashedPtr
  docs: rust: Add pointer formatting documentation

 Documentation/rust/index.rst              |   1 +
 Documentation/rust/pointer-formatting.rst | 101 +++++++++
 lib/vsprintf.c                            |   1 +
 rust/helpers/fmt.c                        |  65 ++++++
 rust/helpers/helpers.c                    |   3 +-
 rust/kernel/fmt.rs                        |  69 ++++++-
 rust/kernel/ptr.rs                        | 241 +++++++++++++++++++++-
 7 files changed, 476 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst
 create mode 100644 rust/helpers/fmt.c

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.43.0

