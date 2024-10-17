Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E5187858
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195312; cv=none; b=l/Q08PPnhFJUxUdWamevluNkeS2/zmULaHqjnG0v1N4rDdG+/b0V0Fwk4U+QNfbL/roJYdOXDZvkCcSdS7VxNqb+W8FYU7uwk02oOMnYFCkoBQB/vwr3M/c/tOHYwYfsLVYK0t7MD/q6LgZHaQKbUU5VExTeFn7vZLmUYZjIXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195312; c=relaxed/simple;
	bh=7fNZThETAsZ+KPtAOmPafV1RUAaUrZ1Bk8Xp24nVtzA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=h3pcsY2A0zFQ4E9xl+1O/LpzGIEr4ZkZdGlR1vRI052tsqJh95oVOmTofbwFGcuJUuLLFBLCHAWptPhf1nqEE/bTRUf63iLTouiWVpeovNuXLwyyOYWEAH46wU2iHa+g2ESAxZ3lf8CEV4AAVVi3k+i633X8wPXXWBe6LVeqciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xybTic05; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xybTic05"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e3d74e5962so1643989a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729195307; x=1729800107; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N2Hn27ndmTHMGTAUOBpXV3hZypJtQOIDgriaf/PtSKg=;
        b=xybTic05mcBYMA/QCpFZIPl0/Q2hFz33gAtmXdQsxxEiDs9IK1iLsQEnYeX+ESLsm4
         9O4klBNViIrXNZFksKr+k+wmdopTcN6tuW++Zw6p7CA04rT85YEmm78Z9lvxgA9yITbz
         Pb/yJ5uHgD1SlqZa0ibpF+opcF6MUCkQl/Ehz9Q3hIMp4Vu/tKUitoI26tUuMWfdMz5F
         wzC31GEkLZ25JE03p8kDo+nGbsnTzTPsqLMIt7gNbKo/ndhCBxR2snLgzQn2fkfHWevt
         FAYpQ+NH41bdltaSDeIpBhGTId7PreAGEYjfYt8S7m4AcJK+IspsKiQJdz14dPuA2Uky
         Z6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195307; x=1729800107;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2Hn27ndmTHMGTAUOBpXV3hZypJtQOIDgriaf/PtSKg=;
        b=U1zcmwp9Bof/Kn4dufc/qfoKehGtnY92CxuHF5mVZIw8enklh95gUOo/xHpf4CS1Yl
         V/kddVLB6SFqho9PtD/BIcFAdLq72mYkF6Qdsc2rWUz5r7hLUCQexe4l0NeYVdz+rlbH
         z4hoOsQyrk2hu9pKHEgtBr0DguJaIMoxUbUOaNoE3CL5AZhy+rFFpC+aGwmzWJPeK5FH
         go4iTPSGy1jdLtWAnFXc0kRejG2R0nQyjHsqgcbUPG/sXq81YGwdFnuvEL1jT9yKuiD5
         MqtpEUo9tzE7t+w13idtp4FJpU8QaZMPnpqjctumjJq/an7V+0lEbFk0dEc1hjxThFpT
         dzqw==
X-Forwarded-Encrypted: i=1; AJvYcCUoCYvw/j+M3tme1Sw79M07paPawvZv13tpr7rO2lIv845WiCSdwopYPRnfg990gJgIZxnTs81AsP6mAf6idg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxyYe6Ud5A83FkKLnFVy8SjQtsQ/t/xcE+/Cj61N721OjzPKw
	C4gf2nEUsKbu2iNFZgTJFFIhgnRX+SAAh5bOuXZtMH6Fhq0vfmNUDS+1oY/HYqsHcu8DqA==
X-Google-Smtp-Source: AGHT+IEZoNiAbxR8ZMQcEg5fAoa+Y+b1EFMFkPmdhu+1szTwmvS4oU3/Ap192vBsPH4qMGzvcfKWvGeH
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a17:90a:bf0d:b0:2e2:9546:591a with SMTP id
 98e67ed59e1d1-2e561a46746mr1025a91.7.1729195306587; Thu, 17 Oct 2024 13:01:46
 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:01:38 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241017200138.2390077-2-elsk@google.com>
Subject: [PATCH v1] rust: add PROCMACROLDFLAGS
From: HONG Yifan <elsk@google.com>
To: mmaurer@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: HONG Yifan <elsk@google.com>, kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

These are additional flags to be passed when linking proc macros for the
Rust toolchain. If unset, it defaults to $(HOSTLDFLAGS).

This is needed because the list of flags to link hostprogs is not
necessarily the same as the list of flags used to link libmacros.so.
When we build proc macros, we need the latter, not the
former. To distinguish between the two, introduce this new variable
to stand out from HOSTLDFLAGS used to link other host progs.

Signed-off-by: HONG Yifan <elsk@google.com>
---
 Documentation/kbuild/kbuild.rst | 5 +++++
 Makefile                        | 1 +
 rust/Makefile                   | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 1796b3eba37b..d9866394bd98 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -91,6 +91,11 @@ HOSTRUSTFLAGS
 -------------
 Additional flags to be passed to $(HOSTRUSTC) when building host programs.
 
+PROCMACROLDFLAGS
+-------------
+Additional flags to be passed when linking proc macros for the Rust toolchain.
+If unset, it defaults to $(HOSTLDFLAGS).
+
 HOSTLDFLAGS
 -----------
 Additional flags to be passed when linking host programs.
diff --git a/Makefile b/Makefile
index b77ac70f8be4..89cdf0eca7de 100644
--- a/Makefile
+++ b/Makefile
@@ -469,6 +469,7 @@ KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
 		       -I $(srctree)/scripts/include
 KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
+KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(HOSTLDFLAGS))
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
diff --git a/rust/Makefile b/rust/Makefile
index 3678e79317f1..95ceaba35975 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -322,7 +322,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
-		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
+		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
-- 
2.47.0.rc1.288.g06298d1525-goog

