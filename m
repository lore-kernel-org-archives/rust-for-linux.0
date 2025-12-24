Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A02D3221
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564010; cv=none; b=Vi9Nz9r5FbSXimtBqKuRmcHSlHqsRN0JpItDvciMgTjetUjbsVnZx+jMziAEz9VA5gNX4W9wiYYf1lHvPbiqmoXg1GkfUS2X/Y7uZUdpnAYD8A2JltQKopP+hNUwcaJMC60Qzlk2jOOJKVbS4rPyX7xWqa7v6a6Z0NhG0CzaYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564010; c=relaxed/simple;
	bh=9bB4R6Uvr+EwhlDPGinfjohN8ej7OIeGxDctzyVg/hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4scuyOLLXysx1sXZgE67qQ8JkwHpVtREk7CeJ9PUQ2HFXzHprvkkaR9VioS8uhr+JUPFqD2GRCJdqNF9r1+77qhOnuLeeRcifhmhQu3oFHK4+yQKov/bP3ExST16sIsog/PHyeqks6L/oV8HOszDgkN2IWF6Ji4ecxp3dkILBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a137692691so66073865ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 00:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564007; x=1767168807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU1onFcno9kv0sHduWAttEyOec6vU4Iz9skIwE5KZrs=;
        b=iyGDRngoTUBRh3fX+qc1V1o9Z9PmloePEsgvD5tbsIxXo5Yej1lFu4gCtOhujrAaDL
         p7whKMUKX4ZTdcxYxKh/LKhn92dPQ21CiLkKCMasY42hPFRt7i3PLJ6x7Z98boL4oL1g
         7ZcG+OGjEQm2FEj2C+QTcTA4XzSUffx+RTMfpy9o4RgmC/dEXIMUOntokrcO/e/38iUq
         iWiLQF1yx6q3zVnthsZjOgTA4znIPbkRx9OkntKvJaXXUz7gdG605IfBHgpNMEEopmZX
         uViEsoNFCuL0zROp7IQGjBD2S+UtXlajM26ZRblF761vXYDQFP5uIHrSuknpmDGmCfCx
         QKiw==
X-Forwarded-Encrypted: i=1; AJvYcCXhaBOH+H5+FGUQJc/JSgaElFSw8WxSwxDtI+E9DlHu1FRPTiYQuLWYpA1MCKE9Dslt86hhzpqxWUYNR8eG0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9T9PHHB4cu3rAIA9P7TJ38S+Jd2PJ3i/QyBpH97FHZkXjlL6l
	FJfZ1id9KwRtfaNlfEyleTQdnt5/b1nLjJdnHMPC78q2i0MdDwDblgVOsD4OSicOOQUlpw==
X-Gm-Gg: AY/fxX5LODingoZOtgkosY4CpRQOQVMaXateA3Zyi5ks8u0ClZRmvqPJdr1L8EOHnkT
	kndeL0x/fUAl9ozQr41Kblia0h2AwaNhy8mVFlO4Raq1J0gaXFJW4tA1wloxbZoP9WzZ9Gx+O/0
	MZSqv9/t2hkNpEqptNvFRikFX4Dc/D9XxYNAPraTU9a9WyvowWvoB8s9rPZ1l7Cq05s1zO2uaNU
	/2q+QhULJsvV2YErRKkimu9SnCXO06NqsPpa73Wq/0kqFD1N9BdTmxkxN1MyQ+h4n3QaS+ySG4G
	shnUHbP9Dq8jnk6P0q8cGrZbEI9U9UF7osz4oDVmTvU+ijdd0Axk+ay8KQmDt96cXcyB1zT4bbk
	MatotzD/oBbmMmWKi+2gbAsAlx7L7wCQd3hqd1ARM/zx4myLMhTY7cTthlqh6lySUC0QZAoy60C
	3ph5NAvy5IHajshELgeQEBHWblNcGSdrp4TPbitx0/cqBNvIgxwXquLmY=
X-Google-Smtp-Source: AGHT+IEw8VL1SZOTAhIhkUJ5nYhrIYnZGCCF3FkbKNP5h5sRbmVW9DmIeJYSGHlyDD3u5rZGKhCcng==
X-Received: by 2002:a17:902:cf11:b0:2a0:b438:fc15 with SMTP id d9443c01a7336-2a2f2202f2cmr177019995ad.11.1766564006622;
        Wed, 24 Dec 2025 00:13:26 -0800 (PST)
Received: from localhost.localdomain (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm146462895ad.40.2025.12.24.00.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:13:26 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v3 0/4] rust: Add safe pointer formatting support
Date: Wed, 24 Dec 2025 16:13:09 +0800
Message-ID: <20251224081315.729684-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds safe pointer formatting support for Rust kernel code,
providing three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) that
correspond to C kernel's printk format specifiers %p, %pK, and %px.

The implementation ensures that raw pointers are automatically hashed when
formatted with {:p}, providing safe default behavior that prevents information
leaks about kernel memory layout. Users can also explicitly use wrapper types
when they need specific formatting behavior.

Changes in this series:

1. Export ptr_to_hashval() from lib/vsprintf.c to allow Rust code to hash
   pointers for safe printing.

2. Add three pointer wrapper types in rust/kernel/ptr.rs:
   - HashedPtr: Hashes pointers before printing (corresponds to %p)
   - RestrictedPtr: Respects kptr_restrict sysctl (corresponds to %pK)
   - RawPtr: Prints raw address for debugging (corresponds to %px)

3. Make raw pointers automatically use HashedPtr when formatted with {:p},
   providing safe default behavior while still allowing explicit use of
   wrapper types when needed.

4. Add documentation explaining the pointer wrapper types and their usage.

---
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
 Documentation/rust/pointer-formatting.rst |  67 ++++++++
 lib/vsprintf.c                            |   1 +
 rust/helpers/fmt.c                        |  61 +++++++
 rust/helpers/helpers.c                    |   3 +-
 rust/kernel/fmt.rs                        |  60 ++++++-
 rust/kernel/ptr.rs                        | 186 ++++++++++++++++++++++
 7 files changed, 377 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst
 create mode 100644 rust/helpers/fmt.c

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.43.0
