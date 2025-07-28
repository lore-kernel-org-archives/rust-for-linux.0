Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA992561A2
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695789; cv=none; b=nJhEfn78bjEwZGDiUJvQbUaHi8auxx2kHTUIhVBah63i5mw0VRkaGyeJAVtlYLzUuEvTf3YI4N8UbwoSdQ90wVhPaGHEZkKSaoYvvGKa5ea0lF/JPEApDZKuqfH1rpdsvKO27dK8zLoF4xTQLHhPBwPvT1klKIdRpy2/UTLH3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695789; c=relaxed/simple;
	bh=0eVkNrzPFJGzVOngpFcJmZHS8eIgg0jNC6gMVEMtWnU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJnFM4pZ0p7wLxXrbj6nEelAaJ9D7jMBajO9tF8W8tt3dFYcOA9cSuATuFhd4oLIq7iX+MTXla67hUQkS2HGr+M2XtPQuUBahmux4X21PB9hrIGxfIk4zBR5WdvTNhOXT8rzQjTtgfZRLrulBJJtfg5wd/kAuAbu97RoiUT9i9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b96f3yGE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b96f3yGE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so19232775e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753695785; x=1754300585; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoseXamUvXXGE8heVA1E+IY+v0GgDCwwey/7g0eIgn8=;
        b=b96f3yGEO6Fl9o3jpxNF24Y93fFBChnjfhm18XgsjWHNVOk/5YkpcA0Glcw4XGdbmn
         Eer6mKpOzqyk83SuBII5gFqfmJj70a3JZtw5L238UKCStLvRDqFHQASk2IEHGQ+wmjas
         cveNrQGW7eM8yozUTwT/4+4vccG0QPDUj5xC3IMYrE4VWCiWfk+d1zK8A4EfTb/JpfEl
         UGB3gtCAbCZH4T1rpLAjddnPZ1ihHRqMhjdjbVmTS2320FpHZsxaYasBDVEfvaH30rDI
         6zUcl9mV9aleEiQtCO/286tUCCaJmsQvH7h/QCE+CLL5pqvlfB5/Nl0Cs+Lb2zY6HTuP
         3VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695785; x=1754300585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoseXamUvXXGE8heVA1E+IY+v0GgDCwwey/7g0eIgn8=;
        b=Z8pkU0OphwCz0hV11dttHYHzX3W09gs6yGSgTdA4U20V2Iui3gnLXjfSUxjNXhEl9C
         0aT4rJXcIIPFBJGYGoGwEbIJgJr3mxlxAtgoAnOhdiroN3w3xOaMOuQO2a0bexcSBjDn
         rKU5kzOSApliom5E39svcMTJ64pzlDkpUsjrj/4KpxICcckjI1J3MO4jIsrCAG+nhL72
         svYqU+PPIBOu1a/DrFwttney94q76nVT5uzrhyVp1i4vCpEyhCi123wnizW7Uta+xJPD
         fxQQQAMVTWcvYpoGU+inx5AMut0h5VN5N+jFWRwxlWOCwsj0UUKgNjiP0+6wbBJ+oTQl
         P64g==
X-Forwarded-Encrypted: i=1; AJvYcCVRsj+4yjV0wJe4LRkS5IAE+Mf09QA5V49Y7Ux5D1TQwNVl4cQQv3ioskmzBysqucrxb0S0GtBel2Z05voA1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKH+h7nFpqIRhEZhett9QACoaFKU0BbS1wnSVHGjiOpnUVwtBg
	1cKsmD/n92GHLThjOvaLhyqY/94iZQolMt6W7cZgbzloCdkDqy8raQE+RpBskNzrv4x9QkKt9/i
	iQDtBX8bXjRpjj+aRHg==
X-Google-Smtp-Source: AGHT+IG5AXmhm+TDSDOVfx/3JPAhzl4emRLD4RTTA8oMoIbHA7wwz9Gl5Pd+RD4hak6Ev3lQlrbocBRfuzkAt/Y=
X-Received: from wmbds6.prod.google.com ([2002:a05:600c:6286:b0:456:1c99:78b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed1:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-45876304c42mr95616395e9.3.1753695785555;
 Mon, 28 Jul 2025 02:43:05 -0700 (PDT)
Date: Mon, 28 Jul 2025 09:42:55 +0000
In-Reply-To: <20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=0eVkNrzPFJGzVOngpFcJmZHS8eIgg0jNC6gMVEMtWnU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoh0YnMXCsvyvIE04yEk8xUzINQpBoi9PPh8OKp
 TJVMcCR3vGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaIdGJwAKCRAEWL7uWMY5
 RqOnD/9joDL3i9Ni9s68Pn6N/SDUtCcGCg3AriD//KmL5xv5h5DkHyixsmUN8CyBhGOvRqwAWIc
 qlMzhILPfV1Z7ru7DnfdxXRgigHbLSVoQTPlE/HL3hKfXfCwhapc89zLNjRXnrsBiT3XL7BiGSG
 dWrjJXH+H14pM4bTgMSU5608+jAap6YLqmDkFojTXnFFT8k4hNqOE+pWfPzNn9694Sx3o5Kikdy
 /jQ3pWjvlvKyTcJ3jBDCV21SmeQuhY6ICahgLdfHWEkbdbupiefjoFBZgpbZY2Jp7+W+VRcgz5R
 vKpuQ6O+2dYsiBvtd1fczIxC7ZtuWZvoArzcgiyRAP1+qQUojJXIyZf1obu7HwTu60eaWv2632r
 8PJ2dAoo8LuJqgZEWQIeTpeKCSkRP1nkivQ2yb3VlegYmhV/zV9KKodlkw6HiPSGqpN5fUGCslE
 z/0JRStEPIoH8dVdKjItx2Q2EuZ81WYSfWgSNga7hpmAiCchjsLu/cwfkUJ7QpeuWQEzGRMl9wl
 Q3jDRVMTMKwk2mCa7JXD16+Nbabw7dQDLEPQuAc90++Jek1D3bR+gKlskyFRKXBVhQdE/OlowI6
 TR6/JehZM8JDV4E8TQlBkPdu05LbKBwovKkKUott28+Xu5rDelHj1cvSO0hq+sonzFkx4SEDTWs sbcxiuobTGzdn2g==
X-Mailer: b4 0.14.2
Message-ID: <20250728-lock-class-key-cleanup-v2-1-ad02b80c69e1@google.com>
Subject: [PATCH v2 1/2] rust: sync: refactor static_lock_class!() macro
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

By introducing a new_static() constructor, the macro does not need to go
through MaybeUninit::uninit().assume_init(), which is a pattern that is
best avoided when possible.

The safety comment requires not only requires that the value is leaked,
but also that it is stored in the right portion of memory. This is so
that the lockdep static_obj() check will succeed when using this
constructor. One could argue that lockdep detects this scenario, so the
safety comment isn't needed. However, it simplifies matters to require
that static_obj() will succeed and it's not a burdensome requirement on
the caller.

Suggested-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync.rs | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 00f9b558a3ade19e442b32b46d05885b67e1d830..2c04a3806ca885637583fde336d054426f569fe5 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -39,6 +39,21 @@ pub struct LockClassKey {
 unsafe impl Sync for LockClassKey {}
 
 impl LockClassKey {
+    /// Initializes a statically allocated lock class key.
+    ///
+    /// This is usually used indirectly through the [`static_lock_class!`] macro.
+    ///
+    /// # Safety
+    ///
+    /// * Before using the returned value, it must be pinned in a static memory location.
+    /// * The destructor must never run on the returned `LockClassKey`.
+    #[doc(hidden)]
+    pub const unsafe fn new_static() -> Self {
+        LockClassKey {
+            inner: Opaque::uninit(),
+        }
+    }
+
     /// Initializes a dynamically allocated lock class key. In the common case of using a
     /// statically allocated lock class key, the static_lock_class! macro should be used instead.
     ///
@@ -95,13 +110,11 @@ fn drop(self: Pin<&mut Self>) {
 #[macro_export]
 macro_rules! static_lock_class {
     () => {{
-        static CLASS: $crate::sync::LockClassKey =
-            // Lockdep expects uninitialized memory when it's handed a statically allocated `struct
-            // lock_class_key`.
-            //
-            // SAFETY: `LockClassKey` transparently wraps `Opaque` which permits uninitialized
-            // memory.
-            unsafe { ::core::mem::MaybeUninit::uninit().assume_init() };
+        // SAFETY: The returned `LockClassKey` is stored in static memory. Drop never runs on a
+        // static global.
+        static CLASS: $crate::sync::LockClassKey = unsafe {
+            $crate::sync::LockClassKey::new_static()
+        };
         $crate::prelude::Pin::static_ref(&CLASS)
     }};
 }

-- 
2.50.1.470.g6ba607880d-goog

