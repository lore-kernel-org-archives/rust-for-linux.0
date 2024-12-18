Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BE4156885;
	Wed, 18 Dec 2024 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502871; cv=none; b=lGixf9iCK/sRkcc4yxRQEVXQLARfM7yIhStT/bBJ/u5lb5XbAegf+NCT8o0oilVY7N64fRxH2lRNHU3z/NZ8eCNDHppl8U17knxBhvNnkx6v+D+8PQFm9iyLT1/9+fBxaXWDnQTkwNn+Q4uaHIxHx1SqgyLEAIq1AeiP3Bxfvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502871; c=relaxed/simple;
	bh=Dcj41wgoErpyvv6rMccASWdZmCVr+BwsDARBxcvPC6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrYe17KyGLm3rN4nxHSOMlFmsNIfawX2xp/l+AF0gJzCzURkfwHzCbXZCVnpMGzMeij9N1RQiHw4Zuf5ezyLdZLMa+qEHP0BcexcQc963t8fJD0pZgIml+7h3GTrDGj0enQE78eDuF0fFDdoyKjo3DnOe/wtT3GoYG+MpUMG/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwbvkdHq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwbvkdHq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725dac69699so5362306b3a.0;
        Tue, 17 Dec 2024 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502869; x=1735107669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=TwbvkdHqFjpr3WW3LmGwhbr70uoXV9jjU4vmomqM4WXkazADdE01SrxRSZ/zkdHYgx
         JBySTBzF3Kz5BSO1NIvZejzBncD1QiH5dYhl31Xv2u/FKGE4KhkEsP/uEfiRpg6x0kGo
         LiyP5ok5gpuJZacjkdeDw8ArXNl+4XEf/POx1YIZWcpQ63QHyUA0bqKiOxqG6C3Po+ab
         MN77nfrZxBWjiw4wJlykXKl0PiRJ2A60eZ/aINv90RielHvg2rYG/52IAQeg9V4TwEEh
         TsqJgY1g2S142Hq5o0NaPZQOHq/JCqVdq0fLUYVHJrfuby7Sey/japzQ3u6xY7T6eTWt
         ND6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502869; x=1735107669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=dsr2Ld8ZUqMCFLA5y2TavDBOMfCce/LIUq5HclnnoiW1kVBlaKuDUkWhGXEeNCfDeZ
         P9q3bHe5Ejdriko41arUPFhkctm7Vm0DnmzOVKt+Qwltav64B57kJPGuSoB7PeLXb17L
         ZCuBmp6YCtIn1lbUYncnSr4ti190KsPtfSpeYlJ06vsAwwMlRxAO++sHoeHpkGfPn9B7
         zfeoxRhFnmIo2QB3foe7M+jUKw3aHjxU2FKBaJs3PB2jz2nkoulhSNmTiASlKazBaWtY
         DO7+YhunItH1A4tNTc+Go3h6MY8RozUzB0zgX0mGAzPG2lkyVnYM8+zOwR7GldGNH37W
         pb5w==
X-Forwarded-Encrypted: i=1; AJvYcCWemHrxf+9jRShyOAWr3S+A6PTMSaNFfj3KAwyUN3SocKokKM+6TeLmu4m81367iOFJNejRnLZcuerlNihFag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsOrRjAcHl1/vI6ZUhfOxLCELBYLw8SKn/JtwjHn4VERfPpcw
	2WdhF/xPuLzwe7SRQQxm6OOMcjAnEc2+73aveBB7oNc2nfEAtXngu+wDSsBn
X-Gm-Gg: ASbGncscS+2nCNYJhChDUYA31xp9S/wLtlexseftpgwkJSmnb1Nv52iXr8mTmvDGIro
	u1x1Pi0ovMQB9aKsAMpT7uuXKXOCRCjU6t1+9HijKzzGcmIFKOhe4+M0R1AXVETntLQz4t/mcL9
	6pFQcbQCoxziSTX+lQ/+ljQ/suCziAQBZVOdWCdYtLElrpCumDNY6ER3xHWlIzH6LLwaHLl60lg
	Q9rvEDC35NAzO+scLQcD1vP/ahsFPt5Xm9svtP98MHs9nTEu12ZElrlK42FWNQ7goAMVE+eD30C
	OAMYvFsMlb0Yi1C43w==
X-Google-Smtp-Source: AGHT+IH3lAAsImJoXUaublLviIawcjfOTs7NtBTxEZSyuiwkLzPj5BCveefFa5Kl5C1+gqt2KTHhiQ==
X-Received: by 2002:a05:6a00:130e:b0:725:f4c6:6b71 with SMTP id d2e1a72fcca58-72a8d2a0d11mr3266430b3a.20.1734502868748;
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v2 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:05 +0900
Message-ID: <20241218062009.2402650-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 806649c7f23d..71df68e2a731 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -28,45 +28,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
-- 
2.43.0

