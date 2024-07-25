Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40014900B
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 23:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721949706; cv=none; b=AsDU5RHLLl8m8Tn6pIevs3GYHg9jBxX/1d5oJDfS/k1vXKduiierhFaMpuC9w+hh8vplUyMbDQ44tqfu0co79QADQaXrJlm0H/L+rCkIChb6KdVy4YeKs94JTpbjaCJuV28vxg7OxbU8deVp0lkUNSGOhyT+dYjbBKCVoWIs0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721949706; c=relaxed/simple;
	bh=ZKaF/D01LQsHjAvoedlEW93oVhWFVCMFh6KAZt0Po2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HzfqRmW9/L2YwvL019j+vCMmX9jRK1qBlzInQHPupxl+YkL9+Lk4GT+OMKnbGB3bOtoYz+niVUXd0Z60c6GKcCiafgqY6BecrRCwUCH8nKhwB6dU0PqAvxmhRfhKsh2ZunsDywG9iPJk+8duqXNNSbqO6E9DThIFUSItwahimK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iUB+V1cu; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iUB+V1cu"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7278c31e2acso367054a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721949704; x=1722554504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y13cefxKDwFOzGl/kd1oLgkzNPir8kAC6sYxj1AUEz8=;
        b=iUB+V1cuhhXYq3f6SYiCQbmKSti7ZtfmhOWJ0f1V2RSD/TYW96twZxMgJGY9EPU3Jx
         rP1LR3jECrGu1uEgVFP3gAnkbQuWtqE9sZgAzadj4pMtLe3bx7NxHsWoMMTot2kaPY/l
         /AO0E3uJiqqGSvGTNi6hjUsPESUCjpkq8qOuUSDpCYPnfdsrpyftEbwNthIUrFeiDmVW
         4jxL0YS2jYL2FjeHyheDFVY04DTS6pxFuktE7nFapDxsN3W6O6KG9xAkIVwjZnWEUH3N
         7Daf9E/bpET7cHUb9vRA4CsBDRQNnqDue9aVy+7B2DynIXqaQZEzlTk2+8SKnr4v4snM
         JnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721949704; x=1722554504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y13cefxKDwFOzGl/kd1oLgkzNPir8kAC6sYxj1AUEz8=;
        b=a4u21XmlvkbDLCR2+CNjqpP8POjVBKzmeOVYVvOwMMgqXKRdqk6hgS4ixJagrUx7s5
         UZlM2saAmvlrhhoZtEIBydEuwB4CdaNeZamlgzkBQ6K0b5Mjk/vRk+n8rkWleBoiQQ8p
         qujRVab1ng3uM7x0NZglIOFAdUsJOuBkmsWCnA7I/PhDGaTamfK9ZXr0qZfxQBUAs8Xe
         HRGZNHvXb5aH+nCDQChZQKN8WdKBEdGxfWH/Z51LEIAQf3nJZFY/MrWrJcC8wtkwP7NW
         N56qM2c8tPrG7iJ3AgImWmlsoaOEHr+nguGVZBFJwZJP94UZ7yu2E+sP+9IWBk1BkQRK
         3zGw==
X-Forwarded-Encrypted: i=1; AJvYcCWZSkWDHO/EhmtskZRBrRA1Fc864hBGz8tElKyRVgGrng0yvyVt2+YvMgI4o7PQSsopQqTLgTfjmUE9hFEeMCzRrN4qeTo46FK+sP5CpTs=
X-Gm-Message-State: AOJu0YwjKlQqNWRZy6jS4jwqMJskcvkbBCCMZ3SG8FZSFoPuUrP3Ul7J
	Jd6rtkd5oh4EWgowEkvNlkVD1VXmix8IGoqe6zlkMtcHuQKYeo4+BLO4klSHK9kV1/gvk7IsZXC
	3v40Xug==
X-Google-Smtp-Source: AGHT+IHjrE954mcIGIRH54e2mts+0YSZZYtNHD5+2mBbyQ/nTzFDy9aH2ICIt5W6uuPPduDm1v2e1Bn5ggyW
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6a02:488:b0:721:414f:189a with SMTP id
 41be03b00d2f7-7a9c7a67420mr8182a12.4.1721949703919; Thu, 25 Jul 2024 16:21:43
 -0700 (PDT)
Date: Thu, 25 Jul 2024 23:20:46 +0000
In-Reply-To: <20240725232126.1996981-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725232126.1996981-2-mmaurer@google.com>
Subject: [PATCH 1/2] kbuild: rust: Define probing macros for rustc
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Creates flag probe macro variants for `rustc`. These are helpful
because:

1. `rustc` support will soon be a minimum rather than a pinned version.
2. We already support multiple LLVMs linked into `rustc`, and these are
   needed to probe what LLVM parameters `rustc` will accept.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include   |  8 ++++++++
 scripts/Makefile.compiler | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..ffafe269fe9e 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -63,3 +63,11 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+# $(rustc-option,<flag>)
+# Return y if the Rust compiler supports <flag>, n otherwise
+# Calls to this should be guarded so that they are not evaluated if
+# CONFIG_HAVE_RUST is not set.
+# If you are testing for unstable features, consider `rustc-min-version`
+# instead, as features may have different completeness while available.
+rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null -o .tmp_$$/tmp.rlib)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..485d66768a32 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -72,3 +72,18 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
+
+# __rustc-option
+# Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
+__rustc-option = $(call try-run,\
+	$(1) $(2) $(3) --crate-type=rlib /dev/null -o "$$TMP",$(3),$(4))
+
+# rustc-option
+# Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
+rustc-option = $(call __rustc-option, $(RUSTC),\
+	$(KBUILD_RUSTFLAGS),$(1),$(2))
+
+# rustc-option-yn
+# Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
+rustc-option-yn = $(call try-run,\
+	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null -o "$$TMP",y,n)
-- 
2.46.0.rc1.232.g9752f9e123-goog

