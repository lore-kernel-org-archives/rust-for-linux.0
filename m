Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A668326D4F
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320879; cv=none; b=bQjbvl9HeC+XR1+gbpWNYB70CRnuXCMhxaS4F243c9oJv3Yoo3alsX764s338l2FegWQt7JyrqcCS30LaWm8f1YSASfdRoHokIiYSylEOpGB31Xeh87wtTgVE1FKPc1CL1UKD2Ivo3RfUXwLCw/YJ9RMZqU+mrF5weAN3Gk4eBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320879; c=relaxed/simple;
	bh=sL0Xw4aPaeswNFK8xt5yLYh1DDP24VYjPSEke3Engqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftNx3chuvrFLFkP70MxrqRdPRS/PbAyzDeLZ2J4MaV7AOWuRIah877y4/8PJjgVTy/1vuRtOEIIn0VzsfVtEoEb5k1WfLZPB5WWw+gt93vQHuYQo/ttKdCiM+TsqDNWfeoaE7lPjq4o4+cp9cU1buZt6RYtkmx5d0yFnQtkiy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkj+vaiz; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkj+vaiz"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8923b2d9954so152674285a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761320877; x=1761925677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c98ABj3xpbRsZfxEiGciTaiLegQtoVpeIJalj1quNRg=;
        b=Fkj+vaizfaLHSaLDaHeYSoP/surjoyihE7S+porh765qkZX6yVkS+BTf9HIpcNXjnT
         aDnnZjMvajkxsF6SVJGAybUqQbsEFxOYqHNuBHXBxplBytvleKOZn9sBicmSiPmQCxUm
         zKHhk0jCAA4cLoRCNae5wWMJBAuHgSkdc8qKRjRrxswmzWpZUpFZidmLtvpCEe9QusiO
         2dD6lDxM3J9/OGPjjQ3MGi0+GKkwn/4501WJMw9kzxytzD/ElMbZp6ngcwf83znXyAs2
         CqSHO82ym5u3O0fQE5pmb/jCm+moSlZ8oo0i9YQDLzfkqUQHUZ5GkPU914vqlrywnVTj
         4bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761320877; x=1761925677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c98ABj3xpbRsZfxEiGciTaiLegQtoVpeIJalj1quNRg=;
        b=eoW20nlZ0BNMG5bFfXx0+L/cgf/Ynt3L7/kt3nDwNCbMEQVNTEMyhq3j5cHBeUd+ms
         raEIR1sseG/l4DUyNdt38BH4PDiRY7gTO98nSabeCNb8w3Zij0kXUADU9C3UugZsSipA
         61DRxxfwK8Xoe12NvAzyrGrpimfUfxlwdmGLo6PwJw5NfzCbClSl2NFywT5e7LJsYhTR
         0/p75VV2XKonH1dRt2CmQCUYwVYPtQgrYe5us/RSz9b2fF+llvL+4xQfEEybnLWNMWsK
         7i+kVtL6l4CfWN6AdeBSUae/cjmIU65lA7LBA7TVzdc8cHhdhM6xzYKrO2FXlMNX0Lom
         gnwA==
X-Forwarded-Encrypted: i=1; AJvYcCVoa8mbLkRb+oq4OfCbIpgCuP/KAZB/DQDC7RTNprQ9x2g+m3XhUISM4uprwYoJqCmRbyZ447mERo+Gh6Jl8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgkXVUzs5wmmCmMj/K3bF0MBR7CUGb7p4bLXUuJS3gHkE4EqEk
	QHEHaT34te8BLvn2YCmjbcfc1Rd+IP8I5o4kdPbVZHE+tonw5Y86EtMh
X-Gm-Gg: ASbGncvGXEKNSQeTEDV2thaRG1krJEb2IS+MCX5NcuJpsKXRARrHiquukNND9+Ir7cA
	u6mU1AqLfO3VgLilPsU1946glYgkPsPpLVe6rSUjCWsKxwbT+BawwgpWXzMo9wVv6pVs1wFlVkc
	43K3qvaA3jl7TdZ5S0e24IILPocbU1TRJ6ppSbYeWCyJSwoDyMWplwOeRB1a6Rcsx943s+QE6aN
	nmLUjvacEAYGSXdOTO5T70YSYmvHF4wjgdKjvF7NAhJ7bjUBiu4kCixBtfKX0WCLDC1MoPUwcrC
	TvcLjGZotWk1GKw03LmmZXXAKrhoRrDLJMNmwiE4n0Ujo6FZ1pwKyjoKHAvCZYrSSItBvdLvIuR
	cKHA/jjLJpC8aOrX91F6M1iQOf+E14z4RJgzVzfwZLvKPShnIzg3VkDU/JJ6NA1KNsyYJg2xj
X-Google-Smtp-Source: AGHT+IG5d/Igh2rAxkYnUO/bIk8iyTdOzyYDRKx8eTg9W6J7UzBtWd6Tm9w449auP/7WOH3xkBDGwA==
X-Received: by 2002:a05:620a:440a:b0:892:ac2e:39a0 with SMTP id af79cd13be357-892ac2e414bmr2692499685a.7.1761320877096;
        Fri, 24 Oct 2025 08:47:57 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eb9b8d5adfsm7365831cf.17.2025.10.24.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:47:56 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
Date: Fri, 24 Oct 2025 11:47:53 -0400
Message-ID: <20251024154754.99768-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
is enabled. This pollutes exported symbols namespace, and spreads RUST
ifdefery in core files.

It's better to declare a corresponding helper under the rust/helpers,
similarly to how non-underscored copy_{from,to}_user() is handled.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
v2: drop rust part of comment for _copy_from_user() (Alice)

Andrew,

Can you kindly re-apply?

Thanks,
Yury

 include/linux/uaccess.h |  2 --
 lib/usercopy.c          |  4 ++--
 rust/helpers/uaccess.c  | 12 ++++++++++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1beb5b395d81..01cbd7dd0ba3 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -152,8 +152,6 @@ __copy_to_user(void __user *to, const void *from, unsigned long n)
  * directly in the normal copy_to/from_user(), the other ones go
  * through an extern _copy_to/from_user(), which expands the same code
  * here.
- *
- * rust code always uses the extern definition.
  */
 static inline __must_check unsigned long
 _inline_copy_from_user(void *to, const void __user *from, unsigned long n)
diff --git a/lib/usercopy.c b/lib/usercopy.c
index 7b17b83c8042..b00a3a957de6 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -12,7 +12,7 @@
 
 /* out-of-line parts */
 
-#if !defined(INLINE_COPY_FROM_USER) || defined(CONFIG_RUST)
+#if !defined(INLINE_COPY_FROM_USER)
 unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return _inline_copy_from_user(to, from, n);
@@ -20,7 +20,7 @@ unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n
 EXPORT_SYMBOL(_copy_from_user);
 #endif
 
-#if !defined(INLINE_COPY_TO_USER) || defined(CONFIG_RUST)
+#if !defined(INLINE_COPY_TO_USER)
 unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return _inline_copy_to_user(to, from, n);
diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index f49076f813cd..4629b2d15529 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -13,3 +13,15 @@ unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
 {
 	return copy_to_user(to, from, n);
 }
+
+#ifdef INLINE_COPY_FROM_USER
+unsigned long rust_helper__copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	return _inline_copy_from_user(to, from, n);
+}
+
+unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	return _inline_copy_to_user(to, from, n);
+}
+#endif
-- 
2.43.0

