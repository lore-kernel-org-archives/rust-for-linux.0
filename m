Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6553E47B
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943810; cv=none; b=Bugwz6T2LVk+mw6XiugzTNwUqBD2Ha9mqF5ZShKe5ha05d64GLahwz09mVeor4fJTRktDo7qKT+BrEet+U6C6Jb/0BjVy2/D6S+hWPp59PR1Uq2m/wz86fxaYa/TuHCBiM5atxVC2sw44WzhIZL6pPrqnLFa1/g5+BmWEQCrbgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943810; c=relaxed/simple;
	bh=sTkBdKF2Bl395/5OqRTBusVdJ6qB+Rw9uaO1n0TJDaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8vVYHlO0P2TfwIV4Z+0jhbFkc/5kUCqBKKHo0oJBBktYvkTF1kBUgueJrnf1TBULKt6oTcrya0WzHDC/7unBVkeF5P/sTHShtlRs/uJ5neq4dNAHUEh1Ub2hgwSZJ+eGrWaB1SzsWYwzaU2ioUUI4qxDZOEboRW6ID4Z+ldVxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxJ4OgUv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxJ4OgUv"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-596a055b1b8so3245386e87.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 16:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943806; x=1764548606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=MxJ4OgUv1qC201EOX+3Aj/psHUa96b89BKpFq3WoQDRGW3KqnaU3M/9nxOgIcoJUIi
         InigXf27PljNPhwGlp91tJ+6Z/YHuGwZJha04wGqNLJFeye8VRr2Z0/LRLv5BxzDkRXQ
         /EjxmpXEW/96qe0nu3Idg9GKOn4yPBTB7HgAYG1epoGkuaLcWYmI515aXhfpE/kravM0
         ziY+2bz4eqEiecV5H4dAgZgSx4jAKJ680FU5DTF3LAUYs8/V1vOaZHQ4gwu+UUnW2ej4
         WKJ1ef1sTZfnEcaxpRmtrqj8TdKzNN0J+bzC3N1i8E4VKzX4t2IJYjvcwQKVOlrmEkYo
         TUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943806; x=1764548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=h4HvTDIvMUd5dZc9i4FOw4t788jC9WqtjTcTdXPIxykNWcAUGHFbODUtHbJGXfXpJo
         a26cZba0k5+Acjje6/Hgn5VMhSVvjhbEzv0PHyBWdZcS1QHyio/BwxMHxg/9uApbYvT2
         0KVghvUZcJmkroQ7OVEd2zO2C/cYjlfmKaeRSJ5+cd3l8If9B6qTB+I+BlTJYraXlSnz
         9uSIII58Bupwhik8n6/qLJZGTmCY+BY0E5PRDtwSucDxxzncfpNWxgoCE6abE8marRbD
         TTXzue9QotZ0zOBCgg/YzievF38x6eGg4Oy9XqfEh0HSzeCZMGlzS25Nk0ad8lR6iIUn
         TmVg==
X-Forwarded-Encrypted: i=1; AJvYcCXvI5WeDHi4TUIr2SjMqAlRJMH4J6ML5dDVZYYrssPTuhRNFiUDxfHm4dvzQJB0yjBo7tUNuakEZ/kSBbWn1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjG8U6xVEUQPrwUwsXMmm1l6yPT3HoViE24PgIiJmplh+I3l/
	k4chLwofr3gtOlB0yd/5qT489ttB+tOVbJDonA/uQSPWJ/hexUhg2SYY
X-Gm-Gg: ASbGncsx1k8Csi2dJValR8keI316KklFPY+0P8BXZju7BzfxXovI03zM1XuBwL456M4
	15K1yWfGrtf7v9Gsc01oiLb8hcRLC1l/CqnkKoFHdmdk3Yfbdn+pqxhtYfnunqZkI1rKQMit9zz
	ciNB1H+1EDpbelisvYbOdmh1JyGNHj6aJKQKVMBHJPOiIUF89KrmlNKwY40DaNijn7JVOGyIQgk
	zhXiGQQPC2wo7NT7X3u43ZN9xWxU28tfUZp8FUefE0M64qFGUdRWb3rsiGTZqhJvYk61sG90qP4
	APR6aLOTmFhgkRFTBlTQJ9xqInkP6uuSx8ReDT/OsTy80hEwoUGqpdWFrav6GKKAtk3V4Q2Qm0m
	5iS6KGPFwLjY04fN4CgG066UHFS9FpcSqaY4HV7V5XeQLpfGjGFv0PKdXXh4FK8Bnhimhfg==
X-Google-Smtp-Source: AGHT+IEWwT4/ncaiOLuV73qylxP6v1jd62XgFGSBRwTlD52FtVaOl9gnPmEY64M2GGXzMxQbpMXxnA==
X-Received: by 2002:a05:6512:3188:b0:595:7e9c:cdfa with SMTP id 2adb3069b0e04-596a3eb5e25mr3770473e87.6.1763943805776;
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:22 +0100
Subject: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

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

