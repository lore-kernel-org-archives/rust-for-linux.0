Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C817D2
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763183011; cv=none; b=cEwsI4mOq+0krleoRMykgWXdjFj+UMEJIMV63hrW3xkPETVyjWYWRS1ak/pYWpdTncKs7eh2mYbdqnXqo82ZNwbtw/rdQp7yHPI6gbdR5NKJ4HXZ96P++Lb4MsAgGiSJFd3yj09khdVDdmy0+PhfkRfm5qXCuM16x2Kj2e7ghZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763183011; c=relaxed/simple;
	bh=5wHe2X6ernH4B0Hgz1bUMYnwF0WlJLdDfpVufa0ZVxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CI4tLLERd3AnYteM5r3Rl3OEiblyXus38/cDqfrPYYEQlzXKFaaz+Q5tGQI7cc9u4yTJWgfRbfdqqy9/xukEdRwY0JWsuNe90w64sH6+/NQMmlXSadpiU9PNY6QM6XFJSfvjKpQER4WyfVUr1moH82K38+ab9CBFy/UXW94PdfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNz49P5e; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNz49P5e"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29568d93e87so23994215ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 21:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763183010; x=1763787810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ptDTUA1nPHRMVGrX+/+/FlWqDOB8/YUhBbumC7ABk=;
        b=YNz49P5eePsr9oQxhqAkalH16nJ3z3ura5ZLm7KK1y+2L6Hs31HSdnMkLB95kH71JF
         QlbtuPkdjSWnsY3zB7n7Ul2CqNbYHaHGq6x4F+pQE464JlV88DSqmsnStmoPJ3N19QG7
         LoKVoV46owUBKPwbV1lwIog0r8YXddu+M8YCVMaQ6DVXnQ2Yyve4gHTuRwMvsiR6QNCn
         IdwbLdeESp8XC02o7Mgwne8YzYZn30vH9+9/r3IYZjCUZ87KsiGRQNggIbhD2uEiWxf/
         dQHh1uvRWy2Iyd+mZ3lfhFBfgT/7TOYE6jHA+aDc7S9VQUqDH1vOBfdoR6flU4onsgiX
         eyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763183010; x=1763787810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/ptDTUA1nPHRMVGrX+/+/FlWqDOB8/YUhBbumC7ABk=;
        b=Tbw2tEs7bQvK6+aLB+Y0SdVpeiDlqeJLIIegTydeKO51SgZmqgUesHdapLl2s1TGdW
         PFeyWDFImdxCwmrOU2TiDY0ni3kAeB0vogIcEM8KxSO2zZmd4o+PuqLrlIPYRqCmpHQS
         JrLRAga426W5PEaQWZSRMccAziyTnHJq0fkypeBOFKowd1RaQ6iwANDbp2eNFikUGmlu
         VMgHXEtdw2DcuGCJIHaTf158Aa/ft/kzIiFV19lP3nHQrdC6ryGkXL9Q0EyY2n89YIkX
         2+iQgC/OeqE1pa0Ax2ekpIafQVRN34lEjW9mifLr45jhtCiNyNUkv4UQKA95DRkqxjDu
         ckqg==
X-Forwarded-Encrypted: i=1; AJvYcCVA6lGgwUJX0p/wq3Wvj65N3RO56YUInwjhlzilTI1fc02dc36pKFNUOO5hmVYzeKNW3N5HYUMjYf4T0QE5PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ByaO5rkCtu4irsN6KqmXmYb1mO6+qVf6cfSw8BkuV47hLGJC
	4mQjQOYU/iXGOc/FDQeyY9wGFz4qi9zRNKkyoky3oOQVVA2+MhU1sM+v
X-Gm-Gg: ASbGncufPKQvOT1D5amH/0fDp0/GpGA1HtjMGpwuQCl3oljP/jGt3L7lD58EH4ABl1o
	9pv8/f8oG4b5JG1S1LQYWXzX7ohLSLKxz52y5e2e4raY+dq7GzMDUPM9QNiZFpcw72cd4nnly9x
	3ZiDfXtw0HEqn7uPZQioVurqjErMhERXFJKLMOkT7SuhWlkz+0RWA3GVaP7eM7JAX6WoKy2s4ls
	tinlYrlJFRUpNcDjX6V2TPunKwto3aYAa050cErxuEwgEfR8e/16XrBY0Arxc9Xcs+hoZVRGtyr
	UDCJQPQbC3ASNvIVqixSNQu34B+4hA5i8VjQARmAR9AU8svEBdGpOGfMtYFyxpftGboDfaUJjJk
	cnUK8lqdC8EgETf8EoMBhbZjPBmsVTA3d7WwdL9YI+CdAfIdXAtQtbejEJBjZm7Acauee5QYKUn
	L9LhCm11UxL+3ODyKVVPsYHWlG1eVkODeUhPE14D1mi+Qe5ySZ
X-Google-Smtp-Source: AGHT+IHM/7GQLmIDsHy2/VxD4gT9y0dRNaNjFP61tvSBfF2e1BbNOEvF9Oc5NC1Tqz/iGMMfbuHX7Q==
X-Received: by 2002:a17:903:40d1:b0:297:ef11:b504 with SMTP id d9443c01a7336-2986a6cfce3mr55104585ad.24.1763183009668;
        Fri, 14 Nov 2025 21:03:29 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245c4asm72261935ad.33.2025.11.14.21.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 21:03:29 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1 1/3] rust: sync: Add smp_store_release/smp_load_acquire helpers
Date: Sat, 15 Nov 2025 14:03:03 +0900
Message-ID: <20251115050305.3872412-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add smp_store_release/smp_load_acquire helpers to support
store_release/load_acquire for i8/i16.

Both are implemented as a C macro and type information is necessary so
the size argument is necessary unlike the C version.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/barrier.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index cdf28ce8e511..b66ef792c7be 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -16,3 +16,27 @@ void rust_helper_smp_rmb(void)
 {
 	smp_rmb();
 }
+
+void rust_helper_smp_store_release(void *ptr, u64 val, size_t size)
+{
+	switch (size) {
+	case 1:
+		smp_store_release((u8 *)ptr, (u8)val);
+		break;
+	case 2:
+		smp_store_release((u16 *)ptr, (u16)val);
+		break;
+	}
+}
+
+void rust_helper_smp_load_acquire(void *ptr, void *val, size_t size)
+{
+	switch (size) {
+	case 1:
+		*(u8 *)val = smp_load_acquire((u8 *)ptr);
+		break;
+	case 2:
+		*(u16 *)val = smp_load_acquire((u16 *)ptr);
+		break;
+	}
+}
-- 
2.43.0

