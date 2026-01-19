Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3389C23EAB7
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793433; cv=none; b=bdZm0RP1MPK4+VcEvB4YYUNJ0X0hSZGTGbGD1GUB3fjYWrmh42Alf8FduHRI8MUtBSNzrRHZxtDW1E4fDP9IJonMuSKlwfkZq+W3baM3SWLjIT6oB136u7RkJoWL3ntFYhcvTz5JuxWZGVUBnEOi5Sb3LBaw+4ZSamfNKgr6ca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793433; c=relaxed/simple;
	bh=0BGdN39VsLE8UOQ7Zv7bHsECbITmRMiqwji64PfdPco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBbZVF1Vn+RjnUA+I90QJ/aOZUFktMfadLnjMYjN/hJfhPXlVKxMZZYLHLkNBWLOLX3u+Mq06Wxnfp8buc8OUb0d+8Y13B3QpZAMrredVhaN7MwJlJ97MyIuyAXKbo7uJf5dFplrP6kdWQ4IpfA3Lj2TLFb4ooh9yAzeHd+JmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso2145254a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793431; x=1769398231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Go2MuSRgyRX7QG3VhHx/bPGBD+aFtk21+zroHElYj5k=;
        b=H+S+faDyoohVH+9T/a6MDMyMgLVJ0yYSQPZK5Y5RrV+8Sx+j8JsWPWd4M3Avgy25us
         FJW9Evasj4OlT+mCNFQBl7hODjBRcuzGjay5fE5pQHWMLwhIh46kpyINo2LMAMvVWqVm
         qIs4B117HnRIJpUqGYgnZsE+1luouljQxxS/pww5fVDRp1cmv24HcYDEGN+K+ic0gf5K
         JsRRavcxeoNlc5kZhcyh0KmPXLwITlFHJ/rKI6ERlf5Qj0czPYn4YI+ILTSp5zBOMMXl
         DSUkGHLwMsbRL6rGy4EB8j3Sf7dy8BM9U5Z0MuxsOYDDZ7rBC+pauIcIqUKEJGzyA33l
         Ctug==
X-Forwarded-Encrypted: i=1; AJvYcCVsjPPQ7w8e+aLY5Ont9YcBT5ww4sBkBAXDJ9Jc4jhh1CSv7ZIJWtxMV94lZPk8/OB/1MTHcD3B4vCzHcLKpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2tljuVjSvZ7W/Ak2LOrUryEZCIKEGFqnoFjDKLeYzez5BNJm
	ERNlYARBYTSgWbLEgTrLdybBlSXgDS3Hd1r1iViYw8aKgkJ95z0re0v+
X-Gm-Gg: AY/fxX4YykMgUohbZmtrN14J7W831JWhzx/bubqzcx0Lm0LaC8N8G2BmsmjHclSKgyu
	quzygANsqEoleMGKRWChp1PgZuyWiE2ypD2p8g3N2MxAYbHC1FkkaPq3yBFda/8jraRt6aGVXm9
	FEJ79KClop7MnjJoj9d2dbpF4N9VSQnEtU8MWirk/YbS2YUu+FP16bEXc+KLyYr39tfbT7AsWEu
	gaiEBIZdBn+VsUoF4kq6DT4eXsk4DW5+Boo8/4jHpWRQKBVo2VtlqPpCD23bvLK4x3oiPDgriRz
	eSZ7I7o0W/yCoMmso+KAlCu04ajFJgFxTqrQUf5NH+rUNTF9JWcmD+2CZOqhw8a8OuvHe+pp9ua
	lvg1vbz2cioFdbgieOFJvCpGiog6jaF0THewG5L3OhWa6iWiN90c1vypgquMoIK0Z+slXg8RgUP
	kW+ptqusyWlK9WK6DMkfLUZ3zguYvCuWIa5TV3Mh7wOvKmTzd6kB3p4BY=
X-Received: by 2002:a17:90b:2b4b:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-35272ec4d5dmr6981021a91.2.1768793431475;
        Sun, 18 Jan 2026 19:30:31 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm7656972a91.17.2026.01.18.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:31 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v9 3/4] rust: fmt: make raw pointers default to HashedPtr
Date: Mon, 19 Jan 2026 11:30:05 +0800
Message-ID: <20260119033006.1453006-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033006.1453006-1-sunke@kylinos.cn>
References: <20260119033006.1453006-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement Pointer trait for raw pointer adapters, making raw pointers
default to HashedPtr when formatted. This provides safe pointer
formatting by default and prevents information leakage about kernel
memory layout.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index b3501a11c7a3c..6052d9f8628bb 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -192,3 +192,44 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 impl_pointer_forward!(
     {<T>} HashedPtr<T>,
 );
+
+// Special handling for Pointer: default to HashedPtr for raw pointers.
+// This overrides the default Pointer implementation for raw pointers to
+// use hashing, which is the safe default behavior for kernel pointers.
+impl<T> Pointer for Adapter<*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(*ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(*ptr), f)
+    }
+}
+
+// Handle references to raw pointers (needed when pointers are passed by
+// reference in macros).
+impl<T> Pointer for Adapter<&*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(**ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<&*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(**ptr), f)
+    }
+}
+
+// Bridge implementations for raw pointer adapters.
+impl_pointer_forward!(
+    {<T>} Adapter<*const T>,
+    {<T>} Adapter<*mut T>,
+    {<T>} Adapter<&*const T>,
+    {<T>} Adapter<&*mut T>,
+);
-- 
2.43.0

