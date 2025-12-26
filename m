Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6957A59
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758085; cv=none; b=rXqihGsCSIvXLToDIvLtDP6iqDnaAjSlhan+hXgilZ7g1Xe7vp7rw1KHY4GP7VAYjfjC6W4Vxyljyr8BSf4SRFd+odI7oroETi8SeL3SFMgFgmMHE+6Uw1qrrBGnDYMRBUjOQoP5pZU5J/OhSJGECCcEUAujcwrAby+L24PCgIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758085; c=relaxed/simple;
	bh=5yy+U0ZRyZ2bgmgh/blgIV9iJdyV+r584KQ/8a/zJqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVfRWENjgytYv70UHTrG1bRCYpCM+XsYqZBHPPnCCmeatnqysJIi/E6K/piZjNL08y508vQltPFB+Epig4mwrCC73Uu9YghPbENUUJfOXYJqXV8ZtLdMYrSrIPPo7hvueDAI8mBCarXuIyvWef7tOxvjz5uid5J9P0n1E11sLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c2f335681so5560171a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 06:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766758082; x=1767362882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZswNkirYs39aVA+HwrS1AZnMXr5GzQabcwqwTeYJ26Q=;
        b=eQ4M9swv3eJ/NsrVn0jWL7qa7eL6AJe7LO5LLDI/tSF4X09FmDE1qFq3Qwe1AKbm/A
         sV55TySFGLLE50wsRKMS2eCKYL6mgLx7wfn7HQVGvNmge2BGfrcUdcSNY0/mYWda0y69
         OdN18NAHF5CyhzfNfz2P1w5a2lwiCXf403JiGyhJyouHmyf03qZzKjnmFagM6c7feZXr
         BDICj4gkW3v9HTpxKw0IsWYIcRH2/sbU6l9jehTCGHn0bmoeoMESpyazjFvDa5E3tXmO
         ICMXoRwpFzwM6fUthfLvyYZoY6R8Kz82e8CLLmy5KD4vhO3x9dtwWi1fzNy+EgWWsqWM
         Hwkg==
X-Forwarded-Encrypted: i=1; AJvYcCV6dII8qs4842shuX7HBcaQNSnOeq9IAIORxP+zFY6RSZ1fw28GfOMvvv4d0rO14gOlduZzMdjiCENqQhfkuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WCLuqJxmXwwgReo1WAukj8j5nAoe/h21Ky1dyUzMbbbsJ+To
	XOZmsXsN7TkGbmhRme7aAblPYBlPyqTihJf8YYFAmbfkWiy4jDKMPrgl
X-Gm-Gg: AY/fxX4QwsymbhYjjMjqdwa0IXr55I8OvqpWDgHuKfdo06Hg4Kbmy2glhWDS17Ebzey
	hzYa+xbCrTk5TeoAgPyqOYdoqpmOZCI9FTno0EfK4Wox+pR0tOE8GZrL2b1WFrU8esl7cZPwyX2
	Oy6Wg3kYykSKFnyX7RvGyT5mn9VHwHYTuAmSWyVBS49XC0HkOLPmZHf6hqIuasA8KnHHKndNPD1
	N385/pqWKlYHK/t4aFemuy176+0hJCcd6f09ja6pzwX+huOGhlcoCN5m3mNEEqXfW4sxUDoteZx
	qMMZ7z1kRouZuVH5z6tZMK2U1NrmenNLrpXX5oEjsXijwxVRpYHCMJ98X8Wm1XhAgorBmZtyK5F
	GcukXlY4WQaFVrAzKPEw4tJenhBsdz+prUITGIToI4O8s0B6xNSEYqgy1gqxbzAEl6MQNdqGSJo
	O6Ljn+QSlA3CnJ8xnylQ3t
X-Google-Smtp-Source: AGHT+IF7QSX/JLh0RScLT01pv9nl1fr7NPY0JKyy3csZcu21Q0PXhZktEzjkQgF0ulRqzKu0SNVAuQ==
X-Received: by 2002:a17:90b:5804:b0:34a:b459:bd10 with SMTP id 98e67ed59e1d1-34e921bf172mr20251375a91.24.1766758081939;
        Fri, 26 Dec 2025 06:08:01 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm11460886a91.6.2025.12.26.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 06:08:01 -0800 (PST)
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
Subject: [PATCH v5 0/4] rust: Add safe pointer formatting support
Date: Fri, 26 Dec 2025 22:07:46 +0800
Message-ID: <20251226140751.2215563-1-sunke@kylinos.cn>
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
v5:
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
 rust/kernel/ptr.rs                        | 240 +++++++++++++++++++++-
 7 files changed, 475 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst
 create mode 100644 rust/helpers/fmt.c

-- 
2.43.0

