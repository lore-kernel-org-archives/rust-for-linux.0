Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112ED18BC3D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764645992; cv=none; b=I3YoO3nRNvxclzdtNhrAJ+TsE3/nqkqMXouX3TADjVoTA25MgZJnlg1/c4LI2Evzi1Z9x6n+EjB6coudE5WdMGV8KFHq0AwG2Ragmz19nCet0nHOXatmZPc54AZ57dPyJ6qs9lInR2F9lQC2BZaVopf0p0CXbdDP80xAA1/z/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764645992; c=relaxed/simple;
	bh=ZAcdLTGsmjWXNxr63u1bgQhOKcSGgyz7fqHJekkeHYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKz+kGZQUD6KOf0N6+5xxyQ6uhwZZU/Y+wqqvg+Ir7MwNyx8G5xN1LrPw9Ky5IvqQzpwc9tthtyz4zmP4LXaZF3LGaTJf4ATkl33h49ShC0xWHXtSOKCixmD9mHQqKnYZSQ29GVYhZjMkiam/7/FlOCWW13vkXZrnBb17lOaYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nc3Jp3kT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nc3Jp3kT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2981f9ce15cso57420695ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 19:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764645990; x=1765250790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DS793+wdpeuFJcL/JDji6kRr/gbz6UaiXbYfn3raMkU=;
        b=Nc3Jp3kTJqkgHdPehwkV2/pOHaK50SKBuWoIJdGNQZmMMuDbWQGj3k5zpz1uhLsX8w
         MT1iejd5QH4ugG6+1VAw/yvJrecobCroT6q2EAY1Af9WABeyaEz2tbRVu5OFoo0vUoEO
         AVNrocumKzkAhK4jtxg2cLkxA57oOJJ5ry02b0sIOYjZeCG9KyJks2HUlh4IwCGw0JN7
         f7BByR1epec4Us4X6UJZSPv2rRYI/mTi3rraa/4UnHzBdpcElbytJJAOyn5Ojr59PvGF
         KxNNPWPaWa2imITKqTbA5jwJLX6k90ZBbg+KoUtisYMzsaLAvQjHQJH/9Z7ZC2ka93In
         ma+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764645990; x=1765250790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DS793+wdpeuFJcL/JDji6kRr/gbz6UaiXbYfn3raMkU=;
        b=nj8pDgK9FvEpcROND1ufKuDwN7w1dUzKX425wIvgQO+vA9e/j/u1Po6SOagVWp7OLG
         NgTx/YJR0NU39gMSRfgjIMnVjEC9oAnlNufcoTkD6++m5P1QvzFXgQ6zHswewRfdomQ5
         TNDrp1c8OP9UDhs0F9VdmMcmNIuSRFUEHXFV86xXCcMlHypwCEigK4kKOLNQvB7dmlDA
         gnZ+4NgOAcA419meT9+iR6ZPvVJ0Pe00ktZBmL8gfehMZ05pQBYXzDF/6sKAaOj+irqo
         Z8jZG2Gtt37OdGeqZpWzx8iLA2Ym/222E5INjXBnAnCz5hxYcDpe1J1nckqDwKw9s0rj
         FeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3+t2DpSyySMTrdhOnotptge5O3CjxkXwJyQuaou5J9rviV3Z8w48V8PYB9F/IKfCkzfM707YhiFuOpYXXhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+VFpVtYVA9Me5oWZe0PVLwe02cq99cKlsrYhHvDWcJrRuBng
	ZlABPIKng+aUQYKbFcg6pbQTxxcf2vGSwlqHVttyUr3N2KsI5czJDMpH/wlGhxSy8pg=
X-Gm-Gg: ASbGncv8pYXNxNZcwWCDChbFQ2FBaVmLYrRqwNgDLIrNxvc+kpsvpWLEeKSVCAo7enQ
	yW6PzfOkEcOjzSxXghZEZyxiBF/aoIfgbqn9KXyVoDV6cxVv0Trm+2a5mY7o5TOb/nbIFGjTEkj
	9uN9SsB5j6+fMgre8p595+aN8gIjRGI2yiOYqCnOFST98C9Fh7d6hANDHKO5mws4fmGfiNpSiTL
	3ggS8cpOgyvBoOrUw2Uopla+IHM8ijunupn47Kn33c5SRxNz8N+lweUlLl9X7Q+l+rZu42EgtUZ
	gbLnzNTmuStw06FnxrGFhQ7MHsYIRiN6Y8Hh9ri0tzOqUus00eh6e4gPmYiCEC39+siTDsQ17HG
	UYlchdpXHIM4sXFoRXStdV5bPVKNd93GIZM+H4NCKilBPD8jH67auA8lh7oehqENQhGljPQL5c+
	wfnm810izMJ97oeobQSiRjwO8RaRFHHQ7GLvA=
X-Google-Smtp-Source: AGHT+IF/MCaBcPJ7oEdSsQvd8l5V5u3QJuyHglI1NZ/A5yZoIbJRAaG3S7Zo/gbGQ7o9MBQPinfbXw==
X-Received: by 2002:a17:903:298e:b0:295:9b3a:16b7 with SMTP id d9443c01a7336-29b6be8b678mr456619935ad.4.1764645990203;
        Mon, 01 Dec 2025 19:26:30 -0800 (PST)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbdeb242sm13392245a12.14.2025.12.01.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 19:26:29 -0800 (PST)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2] rust: num: bounded: mark __new as unsafe
Date: Tue,  2 Dec 2025 11:25:40 +0800
Message-ID: <20251202032541.78497-1-yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Bounded::__new()` constructor relies on the caller to ensure the
value can be represented within N bits. Failing to uphold this
requirement breaks the type invariant. Mark it as unsafe and document
this requirement in a Safety section to make the contract explicit.

Update all call sites to use unsafe blocks and change their comments
from `INVARIANT:` to `SAFETY:`, as they are now justifying unsafe
operations rather than establishing type invariants.

Fixes: 01e345e82ec3a ("rust: num: add Bounded integer wrapping type")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1211

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
Changes in v2:
- Mark `Bounded::__new` as unsafe and add Safety documentation
- Update all call sites with unsafe blocks and SAFETY comments

Link to v1: https://lore.kernel.org/rust-for-linux/20251201062516.45495-1-yu.whisper.personal@gmail.com/
---
 rust/kernel/num/bounded.rs | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..5838c84f8a53 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -259,9 +259,9 @@ pub const fn new<const VALUE: $type>() -> Self {
                     assert!(fits_within!(VALUE, $type, N));
                 }
 
-                // INVARIANT: `fits_within` confirmed that `VALUE` can be represented within
+                // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
                 // `N` bits.
-                Self::__new(VALUE)
+                unsafe { Self::__new(VALUE) }
             }
         }
         )*
@@ -284,7 +284,11 @@ impl<T, const N: u32> Bounded<T, N>
     ///
     /// The caller remains responsible for checking, either statically or dynamically, that `value`
     /// can be represented as a `T` using at most `N` bits.
-    const fn __new(value: T) -> Self {
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `value` can be represented within `N` bits.
+    const unsafe fn __new(value: T) -> Self {
         // Enforce the type invariants.
         const {
             // `N` cannot be zero.
@@ -328,8 +332,8 @@ const fn __new(value: T) -> Self {
     /// ```
     pub fn try_new(value: T) -> Option<Self> {
         fits_within(value, N).then(|| {
-            // INVARIANT: `fits_within` confirmed that `value` can be represented within `N` bits.
-            Self::__new(value)
+            // SAFETY: `fits_within` confirmed that `value` can be represented within `N` bits.
+            unsafe { Self::__new(value) }
         })
     }
 
@@ -370,8 +374,8 @@ pub fn from_expr(expr: T) -> Self {
             "Requested value larger than maximal representable value."
         );
 
-        // INVARIANT: `fits_within` confirmed that `expr` can be represented within `N` bits.
-        Self::__new(expr)
+        // SAFETY: `fits_within` confirmed that `expr` can be represented within `N` bits.
+        unsafe { Self::__new(expr) }
     }
 
     /// Returns the wrapped value as the backing type.
@@ -410,9 +414,9 @@ pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
             );
         }
 
-        // INVARIANT: The value did fit within `N` bits, so it will all the more fit within
+        // SAFETY: The value did fit within `N` bits, so it will all the more fit within
         // the larger `M` bits.
-        Bounded::__new(self.0)
+        unsafe { Bounded::__new(self.0) }
     }
 
     /// Attempts to shrink the number of bits usable for `self`.
@@ -466,9 +470,9 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `U` and `T` have the same sign, hence this conversion cannot fail.
         let value = unsafe { U::try_from(self.get()).unwrap_unchecked() };
 
-        // INVARIANT: Although the backing type has changed, the value is still represented within
+        // SAFETY: Although the backing type has changed, the value is still represented within
         // `N` bits, and with the same signedness.
-        Bounded::__new(value)
+        unsafe { Bounded::__new(value) }
     }
 }
 
@@ -944,9 +948,9 @@ impl<T, const N: u32> From<$type> for Bounded<T, N>
             Self: AtLeastXBits<{ <$type as Integer>::BITS as usize }>,
         {
             fn from(value: $type) -> Self {
-                // INVARIANT: The trait bound on `Self` guarantees that `N` bits is
+                // SAFETY: The trait bound on `Self` guarantees that `N` bits is
                 // enough to hold any value of the source type.
-                Self::__new(T::from(value))
+                unsafe { Self::__new(T::from(value)) }
             }
         }
         )*
@@ -1051,8 +1055,8 @@ impl<T, const N: u32> From<bool> for Bounded<T, N>
     T: Integer + From<bool>,
 {
     fn from(value: bool) -> Self {
-        // INVARIANT: A boolean can be represented using a single bit, and thus fits within any
+        // SAFETY: A boolean can be represented using a single bit, and thus fits within any
         // integer type for any `N` > 0.
-        Self::__new(T::from(value))
+        unsafe { Self::__new(T::from(value)) }
     }
 }
-- 
2.43.0

