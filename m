Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55930FC36
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834925; cv=none; b=GCoQJDgcXwQNYyaCD80f2omcHFW77dppJTzhyjGyUL/p2jCAalAQvxu9bAJtotZZZ6XnQ3gbMLK/xkpr8P/z7YM+Q4zQRf+wWNs2QrrisTkxuOiigvHirDmNCTauHApn/RG6CmA06k+xsIoLxHIoZ4MSYgRY24JbEtTEststoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834925; c=relaxed/simple;
	bh=djzz99/Nqr+mam54feyNiv1NIFjqDBU6RJYwqgkk4Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjgmtK89/1eAV0o/mrR46Vw+xiTIj73ADONjQutdAESYzlAqGkXlXezSg+ajdfk7IhnhSO/OtLJB202VuxRL7QhQoDAL2Mfek0ZVjeoww4tTw3/FzmH1Gx/n6mHQBIMczj99TQbeD0I4hfYLB2H4jHQGrTF0FW0gCW6I6wUWk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMmZMkhV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMmZMkhV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957e017378so828602e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=gMmZMkhV3vs3n0FzsHdafB2Msqyg9ZJ0fYcxNrh6CCd1JJO0wmLYPlkeHxCrOESGxj
         gpYHcTzstePF3OyQBeLzh4J8xUrUtRPRBHtgbH3q+h0joO1xUGRu8lUbJ2M22LmvojSL
         Ma9n2w0UdDeDTbZSbSQkxtsJINRMCa3EVdLaEVLdKQJw0ioTg0iWrTJn/Z7QfTRBqXn0
         8v3aZXApN6JlkNOJ7djlKftiv45U44scS6biKtYhhb6XGb78XeUyiRBvaDPbOEFdx6oh
         RzixmN6xb/NLTtm4EG8XXxjY32pzmbDJixcaHmRQ3Ta6lvJ0vQmmESwlTlIB2hwRGH6f
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=Lig9zKlo2paKrdG2baRmiZ72My5eOVU1ucHDU8ncb5CYF3vJgQbjKRM9XkNBTQF7nO
         XNEwifCFs4hvPwYgBv2FGhZMmDnS/WEjAeCdUom6uL6/W+K1Aa7bD7B+7OyhW5swYQkI
         h8VosT9iXtouKMkRSMKTUwWpdwwXkXCVzpayBuR1/7Q2gtpRq1jSpM2zucw/GHk9KGjy
         vEWRBB3MWqPP5t9XrtR9p6ZKmTs8+hyxf/3WIaZMumt5134+V6/oiBwEemgckry6B239
         MSW/SfxhzbIYufaAb9asRCvD25uyMJ2NQ2MNZmUdgZgVR8DjGLhYr1mmCbznJhYtB8r5
         MzEg==
X-Forwarded-Encrypted: i=1; AJvYcCWJSaq3rA1i8ql9JImKF/Tf0qg41cN6j9n/MQVWgAPg67LiJnvd2a34otCVO1TfCB3TIjMywcoPH4wDw5Us9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7qrOhFHJnErWTZ+btXwh94qeDCK2QD/g/EAegi4t+IyD6+FN
	74BVB8MC7vL0Jc3jKSSdbRhk6aDWB4tPGdvhF4KYsdey7AFDpSxwdmRj
X-Gm-Gg: ASbGnctTBxVwzTbF148p+kBL/BNg8tQkmVn1LfvPUCd2jmxJgNsZNzKMpLbcwlHk41o
	QjgM8nWODVYGHWKG6i9Wn0YboscjzwxAZVQsbre2NG0ZIyTTVq02zhICZSf4QLLZtDqheZpZ5Bm
	y6XFwN2fd+VvyeHdP5bGQdqVGzF48zLHOpqe+bhIhnDNSvfk8F5uiIXmPPgtd2rqfBcaiUqnBXU
	2DqSQ++1OMKqM7wYcEVz3s3LntltlKS9wpY/YIr1Gl3fkQTOkYlgi+D9ds437sdMLUi4Suh5OLb
	M3x2/LPGW2Zt/hbHOtj8S53HzdfLQoMxK3qt67G38H6czesr+4MSFI5ovv9dnVJdHsR9fxMVL7y
	mOvXi/44Ue001/icFpTjwwBNJCN764JEFByF2UhasqFKkcyFrQwOLx89vYTtBIsNEgFmibg==
X-Google-Smtp-Source: AGHT+IEldMEBa+Y+2+8e9BBmMa+iraf8wmEl/ZT2sdU4A9p2jyG2tZG76w7egCqyyaaevWjMOuPaow==
X-Received: by 2002:a05:6512:3c9c:b0:595:9d6b:1175 with SMTP id 2adb3069b0e04-597d3f27914mr1982243e87.14.1764834919940;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:51 +0100
Subject: [PATCH v5 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-1-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

From: Asuna Yang <spriteovo@gmail.com>

A subsequent commit will add a new function `bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Therefore, move this variable to a separate new `Makefile.rust` file and
include it from `scripts/Makefile` to make the exported variable
available for use in Kconfig. Place the include in the `need-compiler`
branch to avoid including it in irrelevant make targets.

Since the new file name is `Makefile.rust`, it matches an existing
MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
file is needed.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 3 ++-
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index e61f1300fea0..bdbf2025e68c 100644
--- a/Makefile
+++ b/Makefile
@@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+ifdef need-compiler
+include $(srctree)/scripts/Makefile.rust
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2603b34f9833 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1

