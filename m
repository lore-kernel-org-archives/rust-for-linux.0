Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FF2E370C
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993619; cv=none; b=M3aQFkHO5Pkv28q5yLA8RAnibSisAZRrQBUy4A8b5dlVBnBPvzbxCQyDHKeCBkrzs3ZAF1/2WL/nQws9NN/n7JK+Bk4qhchYET3X5nO77Tff7rGLD6YsTCi/d4hSC2m7sBqhuPFFQ6i5D1+S0KzlA913elukS9kmwn1A0aIsaKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993619; c=relaxed/simple;
	bh=pkBAvc0IieGGas1vvYQtOkKUWHcQF724uRmRqVMGgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUcXo0wJQb2vxQIqCgYoLIXXOcDo7dMePAKlLgaGTzuYwpkUeMfuIymcb8RRIP9cZ+xHwipNPptLIVf5geX/VWUBw7KOsHkGVvCXfrNxfShj236Iojl32qHwlJsXpssZw66uq4ucHYLlHKQEws3aB4O7anlKcSnoeDAB37S/LRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=dtLMU1ry; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="dtLMU1ry"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3925868b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993616; x=1761598416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=dtLMU1rycyARKWQIVOYGO+jYNn9U06eJs37DrBRdiCCa99/bUWpjMB4tbiCEeYMSfx
         VKlH+jOF9a5rgNxoQwf0w7mC0ddlVQsk7JlXLp+FYH9Tm93UzxvRPCjcEzii1GTHN0UD
         YBuIgifsH7ulKg5RuFgn7Q/XT3AfHWefFyiwRoOPrEXvg+3jiy/UgR3C6YL+TxB0zz1i
         qhP2JdroZ3dAe/5YEBBpk335TG4U3dlv2ug9/W/kq85yjAjQYXAsAyBNufozxL6xPzwo
         PYqjYFLPQEgekOMlmJcm02mrxoY9MMhS8h3ZHpt8cOVFdj3FsI1wl6ABAqMnAJB5SLiT
         seYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993616; x=1761598416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=l/CxJXm7wst+ktjqDdE4IwyghY+2uOpIh6NeAXhVhLLlug7X852jIl4dCuwpeXR55B
         eWTem2YO48A+VrU3aEybVRCQPOsoRh3B5wvD5pX0kWnyKDl2NaVCBDTHIHnau1X+wufI
         Fw0CtJvu9m9zLs2FXT9Cx3A081zStriYSpPfic+tcKaHdiH/dtQRRk4KiDgy44RQg2ue
         5MaU0dSZyH6YU9ZvyfHWjiPfDasv4muGrtOqgrEEOm5NxMc3sBeaqBpO3aIyhTVxlo+Z
         Qxsvb8j6i79zP/7NDOFvPerZDNUZeLjErUUWo81ki57r9dUYdPiYCZ2/0kzwV+tCmdYa
         Doig==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8bSwDp/JYrtc5ASZpHiOGBs1ZOGxB2RrVW0jMTRnpkfT3uSK2IndLYVUOqdqoJl4r5i+Wyld3iQaVvroaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BlzFynZ3pDCu5M/S/oUALBPXUz8PYDBYgMPWrAR8mITXmrxk
	Gm5TVXlTr4A5KOfr5T/IazulsphM1vNBdJJt13YFdsDCxxl8Vv6Fo8AuCCXnEMim57s=
X-Gm-Gg: ASbGncvWd2q3pdJQDgsjrTWizL/R97kE8aywknE40lFpvysXKeeaYr7RXmT3P37q7KU
	VdanqiTJRJNvcEoUftaRN2rimTGMQ/mCbB1sj6Yd5dNG/LYNd1Son0U86UFEs6rI9bPGvJIyxju
	F4yX027in1Zw3TLaYup2lBMHFHIYx5Mw6BYc/QO082y3CpotAnjaUgt4QU6KLEFN4QLRHrOqgU7
	b5J+iMkkSj+6sLU3x8GmKdIttMY6Z6iDW2wirBeGx0TTPE1qkabM/un37tMQ2kNDTD8oviAwWir
	nDQXv3WpsNovZVNZa0RT52aT+EKrN/VVntVTSllglmtgsZt650vdxev2a85eFsXY5exUf5HQ/Nz
	Bmsd6l9nF5NU1IPBPjSmNJUpFVF7IEUI3V1PEyU6wiqHHMQ+KRKg8HkC1wyrB2Ul+b0IKjoPcrb
	F6XE2w/uT7Xw==
X-Google-Smtp-Source: AGHT+IEsg+UZtjwN6GyVBaH9enzTC3xW7GiUIy1dtvM7p6mWAAST23WNYHXDrDm86KscnwevzOzJsg==
X-Received: by 2002:a05:6a00:a8f:b0:792:574d:b2c with SMTP id d2e1a72fcca58-7a220acbcabmr20617941b3a.15.1760993616488;
        Mon, 20 Oct 2025 13:53:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:30 -0700
Subject: [PATCH v22 01/28] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-1-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..2032d3f195f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -380,6 +380,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0

