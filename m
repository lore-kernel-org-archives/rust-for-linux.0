Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96EE156678;
	Wed, 18 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502883; cv=none; b=Hvv8qwDEj5EMSGLrJvJHj7GkmxknJscLkg61NmylDCTvIw6H1sXHktE85hcRIKOiffM2qMzSxfNyc8rspKweCufOYic+ZtMa469emGtciGZ1+Dhhu7vBOZg2gSK/4/VKfGwtSyZ+mVMeWpSS+Q7n2DCJcZ6ohs9MXQgtYh1Ke94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502883; c=relaxed/simple;
	bh=/K4eSvI1Ipf4Aur9iVP05PUVjTwf8ShxKmTB6bwov2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsLY/TbsU4fd/arxp/VOISz1wvbh+c7ACiQtSXdda6eYkLgK+zUfuzL6NRw8Nj3Eou0ov3Etqj+wDo7E4+EmnTZ3sHylCA8NOjAB5fuEas5K9D8LlWsGS/Nv+r9b7CXvCNMjrpZvTVq4fFnM6GY6jDCDYcZAD/zGUiZJa9tf/rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRbLC65I; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRbLC65I"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728f337a921so6352291b3a.3;
        Tue, 17 Dec 2024 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502881; x=1735107681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=DRbLC65IGHr0B2nd5K6XZVcAlANgVoqaZhgNwO5ptv9w8xhp0hGkkVX26SmAamm1h/
         8pFmtRFEhkthzLjIpG6nrls/hZ5Ub3FJHV8Ih/mfB4uNkGK4fvVTGsDTQqBj3ZBedAJL
         BLEeoYG3QK85SrDKbH6is2r194woU+aqJFIjV4/Wd2aAIVadAP/Rffu8kwsu7NmZozDY
         ReJYGcpvm1fhIikQr4ZeUUzkultKzQ0eyRWmJE/uGGiRHsltrqnNo/le+Al91q5V1Ctg
         5xGU5wC1PVMxwEhkkfHO/ZmymOTIIKRxTVnmb/GHeD1OIEUNHr1kkHELCTndaVo+aMof
         Q4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502881; x=1735107681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=mQ7yigCpdzjakMcDGQrzjGNjFgzMLNkhwkO+XXo+8xulinQ9Q6t1IrjiOUj9RY7Xmy
         8UIZCZx1hDS2Vzn/oTzK80PL9+dDTpffvQDvjmf1qCzdFlFq9aji/gDi2PdWP1JYIxIG
         NA24TfWMqLVybHvrEQ872aQUFOOp2yhVaqf6nLBpKutAsMWJ15UWoU56Kpzgn0EmD9v1
         /xIs7TZ3W3rU2KJh2HG2+lDDEXPh7LsyJFE28+w3wn3qQIo5N9q2/Y/F/bZSlOSAnujq
         ayAYbcxwo9jeF5SvYcwtJTTnGz+aA0H2YumBxQYcdPFgtK+uijPPCqUuNORxgJH8SaI3
         z8JA==
X-Forwarded-Encrypted: i=1; AJvYcCULCpe0kGM75csX/ZA6VXLZtGmIUc8ZKFrJrGjnXpCfWyvfl3/w1VFxI4dopb5ylyesLUp2Uv0aBC+reHYVNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyBSMohmxMda4lR2C68KqziGg6X8QU79VrFKg1G2p+t0ok/ZM
	zXX1EJSWgVsl7k9e0lkduED3KWLO1gSQY+DGuxXaMU2vb7qifHVYhx5yQWEY
X-Gm-Gg: ASbGnctuG/EknQ9IHVwuDerBc9AnO3wsmPs9JR4hYrNgXgO/H7KcIdxwJE+7wWqcL6j
	AdMHDhJjA90amyKWAi6QIhSC2EP0vJn9xODeX32M6t+/aFaGHXrpIX9t8XPCiB4cAIy+u2r7QUQ
	OSLhvVLpcuAR42pEDQTepAb4pQ8QnOayDk6N1eDH19svteCTng3qRuu07/Xd4GnjB70oWKmbUr5
	ixokOH04b/Dl8KRkVudO/bEs2hWSNB7Oxz5FE1h5U1mdKyeZQbOeBahMM3ghDs92PRylIpO24ZH
	2VTbeRUGdBGlkT+aYw==
X-Google-Smtp-Source: AGHT+IEuE5RibS/0PE8QGo2Gm9cyN9hV9VQKXrPoGrTJF/gtHBVwLDycc3gJhMqxVgMQzkxuMYzzBg==
X-Received: by 2002:a05:6a00:21c6:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72a8d26988emr2575186b3a.11.1734502881056;
        Tue, 17 Dec 2024 22:21:21 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:20 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:07 +0900
Message-ID: <20241218062009.2402650-4-fujita.tomonori@gmail.com>
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
 arch/arm64/include/asm/asm-bug.h | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..822e9d51d3e9 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,22 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

