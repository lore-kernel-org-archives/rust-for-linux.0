Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23131691C
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992935; cv=none; b=OkuKp7wAeypzHQWLKG6cxANe2+87PwH6bAQmhxwuX3kpDha20kIZYQrfZ90XT+yf889xEQnefk0t5jXkoo+NKrvlC3qsG0IQEcFKOc9ObQuFOl7mBi/ZKRj9H+T3qM7tYDo6xWo5koxavf+vEWckcdH0wDUl6sE4OdESFdPPlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992935; c=relaxed/simple;
	bh=ul7Wiujim7+rV2A7ioKw6ImD8nffjLp2m3u9GiVUeeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/4zkJJ9LsWNINyrYm+tjID2FcK6dg+wAdSvXMgGk/U6bO819rnja/QyFeBzNR6iT2bRjGTcBYHdzur6H/d3fuUkhcePTcsqQ7wm8ngxFLAuVA0hiE0XXWrjfhbkYGKDh06JqlG4amsnHAZBWvKVOT+Zlg3I2x/MDCrbNFHN368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f121c00dedso11985834b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766992933; x=1767597733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L11gt5PUby6hukuI6bKQO2lIYo88sL7kLpRD3+14nL4=;
        b=qRWPR07BJKfs9g2GTho7BvDRh+0A63TL/TBRGVliMAtV1WeUMrsP7YovquLY3mmT3U
         wKqFBjripxnrYFjjx4rzKVEb+DNODIkatxAHBHuOqLe95nzcJBk0bQkbtzT2sRi2xvEN
         WrySAoOkN40giShgCaQicV6AQJDUW1dGOZiME5rrXzoYT3qZ6QMxjTG13NmWNUlWDeAz
         TpNmSIZmCaRwGvw/hzb6mI3Dq8xT6Gzo0B0Z1xkTP2AiM5GnN4jpTFN4xe89qJc+R5RX
         0SO/cQuLeJ6O5Xb0CHTRzHWYfxQMq2R+CAf2haqztJciWxs16alqIRVR5AmJ/kgl2nY3
         c0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqJIJtCdbaVYOHd/Z7NYGuM41tLp0+74c1Dn2Uuebk7pXWmD73NVL7QLVw42Dr7p/s+JaDxF9tYLLIxh5E0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPfCqFsfoDRvgACr1W08UA1TSMc0s9Ytk9gEDsNXprSYHu0Hy
	c1MmT895AT5oE3Pry61sOGC8Y0hS5fzcogEoqyq7pLVpk9pFLvtMnm9S
X-Gm-Gg: AY/fxX7qAKqkhE7EU3PTbB92ygL/lUlQHswMaS6Fx2voVenbPU292us+gnhaRYheHsA
	Y4U4+o1kwUqN7Vb2N8thuwWP23OutFBvcQiPkP+Y14f2YW3GCEu7I/53osteRFyaUrVvARnIuLZ
	MQCxR46qV2EslTY3pM01H7zbVMaHvFK5iV/EW+2fZJtyymUSTTVv9Wdn082Bk/jw1Q8+z8YDABm
	bS6rRbERS5NoJ3JpG1GUPS+1g/tSrHrPigpPI3W1JGxOKXsu1kR0y9QTtDuLJhZvJc/eoyAHCvF
	8eOlyhTXmyRPN4dI/oaLhrYBW8OKKQwaFVqxrDC5d/oirY/21D4eUIqFk/sK4rLONcXMboMYYSn
	9vRORWOsxlvlQsItmxL3PKS2ypGTWWqvjckhhGcWDvtxXzb32Wuc/yiiCzdyPkflRZ7fqrd/k3i
	OmuSc1R9rCCtKDY4bTInndNxlhLyTW88suejqfsVJnKN0j7ETXgWk7O6I=
X-Google-Smtp-Source: AGHT+IGjfBZ7nKHDTBoUSuRWX6+j0MbSCh5Aadh2sPaU0eES32179xrR7UzjfaQZyVcEQP4YJ7rGqQ==
X-Received: by 2002:a05:6a00:e15:b0:7f7:4dc8:55e with SMTP id d2e1a72fcca58-7ff646f9556mr26941764b3a.7.1766992932906;
        Sun, 28 Dec 2025 23:22:12 -0800 (PST)
Received: from localhost.localdomain (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm29021863b3a.45.2025.12.28.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:22:12 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer formatting support
Date: Mon, 29 Dec 2025 15:21:19 +0800
Message-ID: <20251229072157.3857053-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229072157.3857053-1-sunke@kylinos.cn>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ptr_to_hashval() and extract kptr_restrict_value() to enable
Rust code to use kernel pointer formatting functionality.

- Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
  This function is used to hash kernel pointers before printing them,
  preventing information leaks about kernel memory layout.

- Extract kptr_restrict handling logic from restricted_pointer() into
  a separate exported function kptr_restrict_value() that can be
  reused by both restricted_pointer() (for %pK format specifier) and
  Rust code.

The kptr_restrict_value() function:
- Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
- Returns -1 for error case (IRQ context with kptr_restrict==1)
- Modifies the pointer value through @pptr parameter when needed
  (sets to NULL when access should be restricted)

These functions are needed for the HashedPtr and RestrictedPtr wrapper
types in rust/kernel/ptr.rs to provide safe pointer formatting that
matches C kernel patterns.

This refactoring:
- Allows restricted_pointer() to reuse the common logic while
  maintaining the same behavior
- Enables Rust code to use the same kptr_restrict handling logic
- Reduces code duplication

Signed-off-by: Ke Sun <sunke@kylinos.cn>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
---
 include/linux/printk.h | 10 ++++++++
 lib/vsprintf.c         | 55 ++++++++++++++++++++++++++++++++----------
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 45c663124c9bd..91380b1eff1a1 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -385,6 +385,16 @@ extern void __printk_cpu_sync_put(void);
 
 extern int kptr_restrict;
 
+/**
+ * kptr_restrict_value - Determine what pointer value should be used for %pK
+ * @pptr: Pointer to the pointer value (may be modified)
+ *
+ * Returns:
+ *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
+ *   - -1: Error case (IRQ context with kptr_restrict==1), *pptr unchanged
+ */
+int kptr_restrict_value(const void **pptr);
+
 /**
  * pr_fmt - used by the pr_*() macros to generate the printk format string
  * @fmt: format string passed from a pr_*() macro
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a3790c43a0aba..29d2e681c6e73 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
 {
 	return __ptr_to_hashval(ptr, hashval_out);
 }
+EXPORT_SYMBOL_GPL(ptr_to_hashval);
 
 static char *ptr_to_id(char *buf, char *end, const void *ptr,
 		       struct printf_spec spec)
@@ -857,14 +858,28 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
 
 int kptr_restrict __read_mostly;
 
-static noinline_for_stack
-char *restricted_pointer(char *buf, char *end, const void *ptr,
-			 struct printf_spec spec)
+/**
+ * kptr_restrict_value - Determine what pointer value should be used for %pK
+ * @pptr: Pointer to the pointer value (may be modified)
+ *
+ * This function determines what pointer value should be printed based on the
+ * kptr_restrict sysctl setting:
+ *
+ * - kptr_restrict == 0: Return 0 (use original pointer, will be hashed)
+ * - kptr_restrict == 1: Return 1 if current process has CAP_SYSLOG and same
+ *                       euid/egid, otherwise set *pptr to NULL and return 1
+ * - kptr_restrict >= 2: Set *pptr to NULL and return 2
+ *
+ * Returns:
+ *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
+ *   - -1: Error case (IRQ context with kptr_restrict==1), *pptr unchanged
+ */
+int kptr_restrict_value(const void **pptr)
 {
 	switch (kptr_restrict) {
 	case 0:
 		/* Handle as %p, hash and do _not_ leak addresses. */
-		return default_pointer(buf, end, ptr, spec);
+		return 0;
 	case 1: {
 		const struct cred *cred;
 
@@ -872,11 +887,8 @@ char *restricted_pointer(char *buf, char *end, const void *ptr,
 		 * kptr_restrict==1 cannot be used in IRQ context
 		 * because its test for CAP_SYSLOG would be meaningless.
 		 */
-		if (in_hardirq() || in_serving_softirq() || in_nmi()) {
-			if (spec.field_width == -1)
-				spec.field_width = 2 * sizeof(ptr);
-			return error_string(buf, end, "pK-error", spec);
-		}
+		if (in_hardirq() || in_serving_softirq() || in_nmi())
+			return -1;
 
 		/*
 		 * Only print the real pointer value if the current
@@ -891,15 +903,32 @@ char *restricted_pointer(char *buf, char *end, const void *ptr,
 		if (!has_capability_noaudit(current, CAP_SYSLOG) ||
 		    !uid_eq(cred->euid, cred->uid) ||
 		    !gid_eq(cred->egid, cred->gid))
-			ptr = NULL;
-		break;
+			*pptr = NULL;
+		return 1;
 	}
 	case 2:
 	default:
 		/* Always print 0's for %pK */
-		ptr = NULL;
-		break;
+		*pptr = NULL;
+		return 2;
 	}
+}
+EXPORT_SYMBOL_GPL(kptr_restrict_value);
+
+static noinline_for_stack
+char *restricted_pointer(char *buf, char *end, const void *ptr,
+			 struct printf_spec spec)
+{
+	int ret = kptr_restrict_value(&ptr);
+
+	if (ret < 0) {
+		if (spec.field_width == -1)
+			spec.field_width = 2 * sizeof(ptr);
+		return error_string(buf, end, "pK-error", spec);
+	}
+
+	if (ret == 0)
+		return default_pointer(buf, end, ptr, spec);
 
 	return pointer_string(buf, end, ptr, spec);
 }
-- 
2.43.0

