Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A61A3160
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764819575; cv=none; b=Ra4R117z/f7XUOO34Q//AZuN55GiijU8f6tpjEmfiCdCWNhUCn7v9VJfd5UV/Tn/QlYX+b47i2gnRkRw2yhuNu1XCM10LaOWVl7sYJ4It7G/Ye/oFxSf6+CYZJVvoRU/yiapvyU6Mp/EC0hCeI9c73mk2VKpwAyjnXPk/whh6DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764819575; c=relaxed/simple;
	bh=+ybGsYf0RBQnvmp00NouKd8iAMMDnOtZX6WTXbrq2Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnspiJ3KkI0vgkBfTOjUVWEjDu07gtdDQMf7+cve4SNTef+xLjxW4oowjdKA2qw0qMqleWEd2lcdGJU1V45QtUbIHxnLsr8yh6tE5ncaxnzXXWwYR1JBvrQNApBeawymJvVyIwTXI4X1zkGG6h6y8aY+Riv0Tg5M+tlC8zFx9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5tH7CBA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5tH7CBA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3437ea05540so347155a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 19:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764819573; x=1765424373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smF45H3fLH7PutWmWCdb2k238cJntwhvu4VjXij7QU4=;
        b=U5tH7CBAXuUrT5niC4fyYAofELAsqU7lMq4cCkCBicYRu1p/sl8shi74jH6ouM7FZ9
         p8vBW/IB9vAoBAWaK9G639YdT7gFGenAi3RadsUmiBlrGRt8zIcct+uEfMxYitB0SO4F
         us3dBtWVZVIGkbQiP+JLihg00dnZ/Qf9mEBuD2aOG7Ljt8xthED4wTLrKLR1RC1CNomP
         prQ6SSAGhkvltGs5Zc7psZ2b4247/RLIKLk6YyUUZKlpx1jfcpfkyzhEkL8PycSSaEsN
         DBBm7GsCTPHo3BUeru0IMzg7eaXFaNU9GMWGadL0sBz5npMXayXe21CjDKdTewhriSMI
         loyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764819573; x=1765424373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smF45H3fLH7PutWmWCdb2k238cJntwhvu4VjXij7QU4=;
        b=EGDxioia+Y8f2Cs31Qizj1VshPHiS0odJ7IDFCxFeqixUcWOpeFppu+GBqb2gCLe+3
         8ggrRLTjx1Zq79oJ5g4KuFowCFH40ktkx8FvOG6Z3kA7+3ktD5MGJme1a18hVwrp0Yi+
         5Vyqy5mINLkwiJR+PxHKaK5CAZtjGJLLRoQwEl8F1Mp2rucAet8Z2tLq7o22jOsUsAr/
         JM+w1R7xmrRiyewEg4Da7se4yPdg/FkTym0WTqajx6vNN/JQhNx5UKH51NazduO0gTtQ
         PxxMJpAzCmO/ihGJI/nWXkbgtNQq+QSfaiTbrwDZCY5uI2qmi2L3Z/OJRt7xZZxGsq+m
         Ikpg==
X-Forwarded-Encrypted: i=1; AJvYcCWrf4z98grrpIRlh/yibDGY7712N61zEpK9TrlAm9FAzwPWIlUhXxSwj+GKUL080JNn9fp5r/QV6JUAdShYkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxjp9rG2XRT5pYI2I3dZz+WUI8xQV6XEcvNdwK40dS3J0ddgSt
	tq8beb4kKDclod6iKVeLTDFJASfDndQfENPYe4bQjtMCsAtANaPumDj7
X-Gm-Gg: ASbGncsDnifj9jlIspjvZMJ1gh9rZd+gO42K3NwDilYJYsnSiPWSWzT0smzQhOLBKao
	iihhbyfHard3sFmRCdufNEWiBD55y7YHjNNZ/UDR1Kil5Zlt/X6S92fbHvTu9Uq7Wq5Xw8gQHH1
	HXl170mgLobQnji95wbBqlQdzAwq7YCel5n81LR2RHgSWLYWT3rxnZpozArz9vThCmX0DC/z8r7
	avjdLWt05XPJ+BjsF70n4NnUJp/JR9VL/T2KzLJkiQqmeWng0DD9jFKWM4yo88udLoa191Y8XKk
	kzwPsJrfuNXhkt6hSqrccdc6NTwbgUc1XZ4np4kceh0mT1cK7VzzbdGTvwkvyU5pHDMjH3v24nt
	jGwjEhhMuBTsxz+1yFJXYTSL1tEWx6fYUSDNcufsxXgVFqpcD3Xwxpnzu2vCGOK2GLHO3BvSLDx
	wqMqFDeU1ynTCuSSATeESVM7GJy6j6KrrJ4Uo=
X-Google-Smtp-Source: AGHT+IEcITuVheRBjkWopaK77Fb+R3+oNTtSfEUsOQkBlkV058WKkMu3hDPDBFPZubIbL9lBUJsr2w==
X-Received: by 2002:a17:90b:37c6:b0:340:d1b5:bfda with SMTP id 98e67ed59e1d1-349125c1912mr5112173a91.3.1764819573468;
        Wed, 03 Dec 2025 19:39:33 -0800 (PST)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-349129c44c0sm1922954a91.1.2025.12.03.19.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:39:33 -0800 (PST)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] rust: num: bounded: mark __new as unsafe
Date: Thu,  4 Dec 2025 11:38:48 +0800
Message-ID: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
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
Link: https://lore.kernel.org/all/aS1qC_ol2XEpZ44b@google.com/
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1211
Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
Changes in v3:
- Add `Link:` tag (suggested by Alexandre Courbot)
- Remove empty line before Signed-off-by

Changes in v2:
- Mark `Bounded::__new` as unsafe and add Safety documentation
- Update all call sites with unsafe blocks and SAFETY comments

Link to v2: https://lore.kernel.org/rust-for-linux/20251202032541.78497-1-yu.whisper.personal@gmail.com/
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

