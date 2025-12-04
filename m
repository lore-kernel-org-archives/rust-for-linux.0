Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91930FF30
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834925; cv=none; b=mq3PID4PbUbv3KMFsMpLL3R/kBjfNwKVHwFXcFxSXbhw2PjWCh3ZkbWBkHYdlMnvGkS/WVAQogiqUdu8+bJO6Nu2YCFsIB1WuBMzBIZ9Pa7RHTKFzCisr+yfd3p6lxt3bdPjxFlNKQ5RDwzoxK/BME/xbXUPvyFJg5lUZD4ufg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834925; c=relaxed/simple;
	bh=gAqTIa/FjG6cAUC+EuJL20860zY+3jWZZY86tAyZUAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOE6hbe6QhkSW55Q+M6i2Tr+plS/r09adGfYQJOdeqTlLgpnqncolOaS/sYU1bkdmtzDbqtjB6xTKGvwiYOaQzXw4KZURdaoBYXpII6LXs3v73mat86DbuZnB6IR8bDzzhvcAo9xUjG9BmXX5xv72jwNtsZixEFbR6py6mJV+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjEBQjxO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjEBQjxO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5958187fa55so453852e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=EjEBQjxOlXOY42LENED3rHo6KrTi3dKuZHtKdl7RHAbEBSVNxco28Ye7K22DbNq3Wx
         Z4X73LpdkpC0vZtVHOg94Ya0qGfmy1oJCzrmbmuACyTM15nonk66hL3eax2HW3xjtfQb
         oJDWWuVtVQ0caVp8UPFbe/9RQCwXX0PjXqKtTjQ4QNdJ4OlwSRsQBl2/x/xXEAvYOPkX
         ubQv/p0W0Bl0lcPpe0umiGlSNgaI9oJb2jfTHUYzFeDd4YLv+BLk3u0Q9uODhE2xb+Pd
         Jk4lxm0RJMpD1e62UHniX/4cI7NE6mBaPDo5vlf7vFpVD7LNv/Bu9Z+UhGpBkaqoJTPr
         hUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=Crw+fz/uEacyZvFYBENIQvBwdySyZgc+2aXUUWrLQMuufEjQDB9MW4trqr7i9qAR06
         9hHjd2yNknsGS6TZk6j7rzBPRsMHV0LS+4FlPURKOVOQeeJQYwhHSLnk9ULkPs2Xk3zs
         PLcOS1MDqy3D2h+/1KC3vcQrN91/GzoGVkrFUpfm800lC5HIq4vHpACYN4A8s0H4s5y8
         KJNNB5R5/sIo1inRII5P1ZT5qwEDaO1PRVj9kdODCIuw0Vc3Pxy3P5xPRrSKNah2DbLv
         Al2e6tqAv7BPV1PKgiTWWEg4d7vQU3NFse3bVOYoPefwQbzL+niPRlNunrQKRjf1I3Hi
         cP4g==
X-Forwarded-Encrypted: i=1; AJvYcCXX+sowsIA08ctagmbIT/S0SMykvtWXrIP/R5CPJPAGYSwCr0Y7X1sNZoCPgANJAXz+HwFi2/wiyZRgAmv8eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB5hjwPXZ2U/qG8nP67FZYFZJu6SGJcuH5MX/Q1PwCj4N7VUdm
	bzBiGvLSFG1fCeXdJQDxDxG6BXYslIAn6xLXF1XHP4ZgAqCzSTWFaif7
X-Gm-Gg: ASbGnctdJFEqxP9RUzk+l0TMdanB/78+jE6lLvb+L7eFnilb0VEcwr/IA6fWm8LigLO
	LnZfpHy1KBt12woDTDcKWEG5qKPVMmDDd6TAXt5wqlfKucBsYYqjMpe9iYmfz6dT9VNsgRwbgbu
	rMULw7ZRMPfg6EfZniKxlPc9CMxDLTJXQ4s2Yn79rf6j1n+hItagP59RSrc8H0pdDwDRfeOxKCY
	bqKiQuZ9oopTOYkLgiOm+jdBiDxTNszB+ndwtmksPs4I6RLt5gURUlTyFJ626lXNyuJDt0jVFds
	p6BMB7QzI6jSMFJSouqqqvhlRnwru+jw6ItHjINjpwuoE5LFKJfg3RZydgZhCDr1PiEwYEQEJZ6
	XC6fJY4d3aTsbzvEU87i1NO2CDmxCyoxSo44nGg4COSd7RSsIzwboXt7xo9JWOZPU6DO67w==
X-Google-Smtp-Source: AGHT+IGspx1iBq0l/KYW0BPXnBTjQSmqu1QYrFO2QolLF61uEAVSaqBKv7zpWcBgOHbRwa9f2MaI2A==
X-Received: by 2002:a05:6512:684:b0:55f:4f1f:93fa with SMTP id 2adb3069b0e04-597d66f8a45mr630014e87.42.1764834920536;
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:52 +0100
Subject: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
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

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Before this commit, error messages might look like:

error: unknown argument: '-mno-riscv-attribute'
error: unsupported argument 'medany' to option '-mcmodel=' for target
'unknown'
error: unsupported option '-march=' for target ''
error: unsupported option '-mno-save-restore' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1

