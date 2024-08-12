Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF88C170A22
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505358; cv=none; b=kafh4pee9ISbaKrBx1XSCORqeoui7vg+UN6QXgJQMiH2stdImilM0YSbQXMO5P8Dxfx07wJIEnVST193oH7+nEnNLiKt4QwdVUvL8PouQlc26plI6EWDkPts8GjZUkOPHuiJoDVavpaZoL05HU8rMeqqXT/eZVnizQcoZ39WYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505358; c=relaxed/simple;
	bh=C1Zz0ScPP1mFsCHtubcJdynvh3BR6CmJLqAON/Xqs9k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QXQC7DkRb0LRrjd9WIjEf+YCKItH82rXxHMfKAWkAcHXDHmHlWPn3ktDArdIZ5zbC0o1Xp/Y2MCIUbRcktMNn25nmlEo6rpTzUoVpyCpfkj0sSQxDhWkxyQZY7Zvmsg45c27CDofftrg/Ro9XnHhhtd3cS36QjlQSy2VWsuukSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhSWjwLQ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhSWjwLQ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6643016423fso125740787b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 16:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723505355; x=1724110155; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lfUjMO5M0SniqX/0k9KLAB5KRodEfFiCSNK+c2KjkqM=;
        b=NhSWjwLQ5Bg5i0vkfdAbtcnW5wDv4yIJ8do4us6dYnOG1JuCvvR1/KScxyrC1X2WDg
         /anXF5uwz14dzZ5xRj6LbRsnaO1VnezTjbBs8RsqUafT0UoslYZoZOEA4Tz41GZU/NKH
         76odPlXl5zPoyKjMG9ZkKAtR8V6hfLTvgDrHjcVWmm4OQ9kqg9c6fpyxGiCIS1amL9pi
         hY46Ha34FoCrfd6kBP1NlmNzTD/QZGkGr1IQzeChTlDOk74kx1FcAKj8RcF8t+2lNVNY
         Id38+ZLd8X7xW/Qkz+a6kGeXlv3r3p3KDIaZXUeSN6ZwwTzZXrNb5HQFHtixWkhpi2Uo
         bLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723505355; x=1724110155;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfUjMO5M0SniqX/0k9KLAB5KRodEfFiCSNK+c2KjkqM=;
        b=hlul+MzDXvqDdkYXIr4IBdt+GLS3F46Ls7NFgCLz92lUhPAc9wsWDJ3lZ0DfHZf1At
         6SuoWomHaGzcU8cpqFSjbt1he4SNkd0wIkdn6bPYyR1DGcQtduMEu1AyF0XXemeMvlGv
         nkLbFJrGTk72ZTCQFMca4mHTfMCNWoHDXncjnHOhCaR4Gr2+08Gl6kRQVZTLEi8ogv/g
         8aglXv6/2ISPlYzbJ3liPxU4h5P6xP/Zw4WvMzoErf/4KkDXJ66sEtoI3DFx3Chb5+AH
         nAz19YdBQSQ5Oly5uDSrlObcuMzFzt2SlOrIj+Bo1gNn+0QHUSsX5RXj/YVsOzWvhufn
         wSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFb7jJs+SQbMm2PXbKeviXdhHQ2AiCCHC7yd6kyfmnybFNeZV4cpa2ZTgmDO5IgbYcgjZ7/ozOkQ/NFcD9/UEJWeOjxlyGw3AxcwEQBfU=
X-Gm-Message-State: AOJu0YxePQXKBNDDAFnKTlgBvUXmrFoHrv2Z6TEME1saymEE1NIR8/Mm
	sA04qwZUx5EFan8KBwkgjdTy/j054/uQ56By/vfpoFUH1nE32oSrbojiG34KyPPrXA0+LKq247v
	YNKyNag==
X-Google-Smtp-Source: AGHT+IEtuA7T7bE3cMa+Y4GHIfGRVLpMnVTFC18O4stjZtcv2quBfVTmtnD2+DUMiz8gWjxsLfiWTH/j2Jqa
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:b9e:b0:66b:fb2f:1b7 with SMTP id
 00721157ae682-6a976751ab0mr1067257b3.6.1723505355655; Mon, 12 Aug 2024
 16:29:15 -0700 (PDT)
Date: Mon, 12 Aug 2024 23:29:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812232910.2026387-1-mmaurer@google.com>
Subject: [PATCH v2 0/3] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
capable.

Differences from v1 [2] :
1. Reworked KASAN Makefile to avoid repetition, as requested [3]
2. Added a KUnit smoke test to avoid bitrot, as requested [4]
3. Added `kernel-address` to the target.json (my local base-tree had this
   from another patch series)

[1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/
[2] https://lore.kernel.org/llvm/20240725232126.1996981-1-mmaurer@google.com/
[3] https://lore.kernel.org/llvm/CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com/
[4] https://lore.kernel.org/llvm/CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com/

Matthew Maurer (3):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support
  kasan: rust: Add KASAN smoke test via UAF

 mm/kasan/Makefile                         |  9 +++-
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 13 ++++++
 mm/kasan/kasan_test_rust.rs               | 17 ++++++++
 scripts/Kconfig.include                   |  8 ++++
 scripts/Makefile.compiler                 | 15 +++++++
 scripts/Makefile.kasan                    | 51 ++++++++++++++++-------
 scripts/Makefile.lib                      |  3 ++
 scripts/generate_rust_target.rs           |  1 +
 8 files changed, 101 insertions(+), 16 deletions(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

-- 
2.46.0.76.ge559c4bf1a-goog

