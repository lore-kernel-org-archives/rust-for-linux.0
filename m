Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B214D70E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183356; cv=none; b=XSapiSMWttDU0our0PNvbiERRJubzAtpEFb6fINlSJv358K6hTEtOYgjdY+ZY8EhCK9qWjkRf66oWwMcjdh9Y3QZxNJ7KpjZav/gbUYRdxHfVSsqDj3mKduc8VBE+q/ts89cK2JPyzZMtjXuuFYVnEufzrmLRvS3F7um8ZY6soI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183356; c=relaxed/simple;
	bh=gWvn3EqsG8i5kBjD+BMbfTLcXiM7MFTxitLqtZSYl70=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cPuMNhM/5Gw8vWX8UFJjMEXe1fOz0CWvlrGKEV0VIEaIilZ99Q7/1QIJKRfiVIwE0Y6yLxR7Vlr4mOcVTOMhQrOSKODn1eDPCL3MnYq2KznGd8gmmkRzqt8FkHb2VBwawecdPE3gFdARu38Zy8aTtbJSA/j1Rdb6nhUj6Z4mW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RY1U/oyO; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RY1U/oyO"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b8f13f2965so50518237b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183354; x=1724788154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZ/BWqyZRlCP7UBokATY0JI3r3d12PwUba1tdxpBJwY=;
        b=RY1U/oyO0o+LFCuhpQ+QMR0TVilWMnoy86dqzN3gqxBrbqpyLwmOsmgvUxAEaxjmxe
         NjvxWWpAPJT0WYLTsoiPABDY+ZwW9bP8brsFPZqhEnIeCWAzohUwlB+i7NMPnDQJOZrg
         jHp7bHSU8DuE/YKuur01JHyueEvCZuPkIwIZMlq6SOEpGbThOPcQE5QJjnh/0NmWGarO
         vV8c9RvRvOKkNCWpthZsSbrzGIhxzaIxWCBDh20M+GyH0J2wFbxo0t5UcTdVgAW/NX+/
         emsZIO2k1+Si2s+Hkcw3y1LW+ogHXw9hwEiHjH+x8vrUY1YB/pDGgn5xe2dzIgz9n8ho
         ym+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183354; x=1724788154;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZ/BWqyZRlCP7UBokATY0JI3r3d12PwUba1tdxpBJwY=;
        b=wNDNLMcw5Xn4jVPiQBc4qO0KBPlBilJ3O/EaAs2tp84yqSuTVbfw0K3dFpDLc0AIAj
         b85I6vxBCRf2pE0/IXZCXDm7tQ8uZUgXwxhPDb1EbBrANGhJpXkubrHAFOEYEBI7dk74
         2x6yMX5fka5aMkN5mnOgKXLGBzYIyX8F/LU591y0aJ1Gy5SyEkqJSgQT55vJMc6ckbgj
         kWUPv3c9Z7wcD4lV7zAYWYZq0VYeVn2HbjFZ7rFxPEaTMDbWsX7j3+7g2yLWmdiiblzp
         X7Yexclni4xRz8t/6ouLGynU1ePcdnL4hslYS9TT5FxpUdWbiaRl0uLE9ForWLBhLzho
         LZsA==
X-Forwarded-Encrypted: i=1; AJvYcCWepifKFI0rTTyglTLOkqa4X5gZgDXjyGhBXsK4CXYHWYWzG/yQ1A56BbVko0e+VyhFNuKt2rZ61Z1hVuZ54A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpexWo4nv92SaLz/YjMUIjjSlbdti1jevGxFL8DhsE8/q8NhwM
	sFfsQjtz1EM7bHO9U9tfu/4jvys2R/hdg6xakCsechJLsG/B9KkuEUsuuoybpYHKZ14YkocVKSa
	Fj+rtvg==
X-Google-Smtp-Source: AGHT+IFp/nm12VvtMz6NTjd0kIpucSX0HE9Tww56O3We2qIoUG3Oc6YRA1DbTDJEzjcCHwu/hP0I6l7HF/pp
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:600e:b0:6b2:6cd4:7f9a with SMTP
 id 00721157ae682-6c0a09f33ffmr115947b3.8.1724183354122; Tue, 20 Aug 2024
 12:49:14 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:48:55 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240820194910.187826-1-mmaurer@google.com>
Subject: [PATCH v4 0/4] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: dvyukov@google.com, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Matthew Maurer <mmaurer@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Right now, if we turn on KASAN, Rust code will cause violations because
it's not enabled properly.

This series:
1. Adds flag probe macros for Rust - now that we're setting a minimum rustc
   version instead of an exact one, these could be useful in general. We need
   them in this patch because we don't set a restriction on which LLVM rustc
   is using, which is what KASAN actually cares about.
2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
   integration.

This patch series requires the target.json array support patch [1] as
the x86_64 target.json file currently produced does not mark itself as KASAN
capable, and is rebased on top of the KASAN Makefile rewrite [2].

Differences from v3 [3]:
* Probing macro comments made more accurate
* Probing macros now set --out-dir to avoid potential read-only fs
  issues
* Reordered KHWASAN explicit disablement patch to come before KASAN
  enablement
* Comment/ordering cleanup in KASAN makefile
* Ensured KASAN tests work with and without CONFIG_RUST enabled

[1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/
[2] https://lore.kernel.org/all/20240813224027.84503-1-andrey.konovalov@linux.dev
[3] https://lore.kernel.org/all/20240819213534.4080408-1-mmaurer@google.com/

Matthew Maurer (4):
  kbuild: rust: Define probing macros for rustc
  rust: kasan: Rust does not support KHWASAN
  kbuild: rust: Enable KASAN support
  kasan: rust: Add KASAN smoke test via UAF

 init/Kconfig                              |  1 +
 mm/kasan/Makefile                         |  7 ++-
 mm/kasan/kasan.h                          |  6 +++
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 12 +++++
 mm/kasan/kasan_test_rust.rs               | 19 ++++++++
 scripts/Kconfig.include                   |  8 ++++
 scripts/Makefile.compiler                 | 15 ++++++
 scripts/Makefile.kasan                    | 57 ++++++++++++++++-------
 scripts/Makefile.lib                      |  3 ++
 scripts/generate_rust_target.rs           |  1 +
 10 files changed, 112 insertions(+), 17 deletions(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

-- 
2.46.0.184.g6999bdac58-goog

