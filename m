Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BFA19005A
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331591; cv=none; b=SiAte2G7kAzeOe0g3ex0U+frwNSI9MdXhYEGsTUyUmJ5uOPS6ZRi4FpGA8QvJcebxGZbIUeAViyCRcIiMlPMJ2z2+EPbVaiRQmoTvWQvMMY8gsp8EkJFwLif/UClEP67jOIMECKeS1z8TlvftA1H3M6iAgFcieu7MfVpm/czZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331591; c=relaxed/simple;
	bh=DNng86m/nG7eKCwjjSfaE0C/CmytQ2Vd45z8tD7bi4E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=W7eD2wnCgLctBD+5QF2GzJL+SuysojTlwyMyr/6bh9RX1VGv8pugkUGT41M1bM9PK4DDJo/nvIkxLxUYfo6CVCnKSUG5+0B7m2B2t9c4QQiSGlQ4O0LoFMPueAKOfQ+O+Cz4TDIELcQRVpNpjWgGM6B+ES+JlaFF+1g9FXzqJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cV8MjE+C; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cV8MjE+C"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b3d35ccfbso4643769276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722331588; x=1722936388; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VML2HbGiUTKZhi3Ueqq/TeMG//3EarZJVerpVJbBcDQ=;
        b=cV8MjE+Cma1wbBhIN0gSSwUeCJjIx9e9Jud77R/cU+Cm6htbEIHC/Hsetka8gf2KQl
         K0vhLa9r3N3rB+9lOwEGvsZO88FoTmyno7l4E7BMTCZFg6I1oUYh7jioz3394JUwEXwm
         Oo5rmCsJUJS3mF6lHGezN6L/uhpIc3o0e4/JhevpR4jQVBOCEbDF+mbgddiDoEp+Pxbq
         QciEwleDaPsrIVwSbBwDFNh2zCUlUTuZ75kW2RwTFaVwXWBkdWw/PIQw1pXazH9fPSiZ
         ASs0rv3Qz7zpXd2M02m5pxs7E2EAnpsbbEXQNbEhxfCZnlXcgtKeonZUBAlV2027Uj7O
         B4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331588; x=1722936388;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VML2HbGiUTKZhi3Ueqq/TeMG//3EarZJVerpVJbBcDQ=;
        b=d/5hPsa6/KnY39r6STXmW/OQFbiFe/pFLDjRb1CjxXi8aGXSHf0Y2BvOMTEVclKp1H
         zOnS6MUwROZXoysh8x16eDEeIyKlNghWBoCf+ZiJPdjKYXElsdX42cOLPq6/klblf/uG
         qKx+tZXTSB5GA8Xy16sJZc4QIrFc5el1Z2DROgjq+2lehxAbV8+zPcudtcvSBwMVzikL
         85IvphBL3ga4eDA0biBASF78aBZZazr71RhiDCZ/lG5QZJbxaHIjlsYEFFDLwHD/H6MC
         AS1PXNT4UQvj26siUqGFHmOZ9sqO3S33ezEQJZJFdTtXlFidE8FCI30wQd7EadiFhem5
         iCNg==
X-Forwarded-Encrypted: i=1; AJvYcCWAautS0ArjDEKtOsgPVldXyfpcc8Pt82bsbJLd0p6o7jOwg9i3xciZP/Bmb9dn+OgfKpM4jtmNZMMpM6o6abMrHFzLOmSfC0tjFiSOIGs=
X-Gm-Message-State: AOJu0Yy4/VTuYHz88Tfwv+cz1TGIyjWilxTy4Pl43sCbTrUjY3ieJOAb
	W2jSo+YgPVY5zek4BOCmUBKCNY1W59+qsvaC+RFq/p2LRAha0vs3Og49IaoWcZS1KQXuSV6I/RK
	8tk8stPvUIbOJbw==
X-Google-Smtp-Source: AGHT+IFRabzit2U8MQ1AhYZVNcAtf+V05lxt2Mhbe36DAIzEK0X8ZTykDoIHEYIJazhezM9vrrGeZDgmzK8JjiQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:2b8f:b0:e03:59e2:e82 with SMTP
 id 3f1490d57ef6-e0b545a3f3dmr16655276.10.1722331587758; Tue, 30 Jul 2024
 02:26:27 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:26:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6f7uSFok43hFyVxJDFLBZ+lpJfu275jOWZwnwhrCUMQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmqK5BQcw5lb0StHJAmTTpGoGCT6xllWbl3/SZI
 p/9XiRWnD6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqiuQQAKCRAEWL7uWMY5
 RozeEACF3hdtBDVwCfw7llMzHFTre08sQJgsY9xzFZmjF2Pkf9FuouJbPQrme+NMkNS0368suQs
 al0Ach4WVkOU5vvRG9aFcrp7+Aa+1qRmYEZGJBUulPJWqUU4RakCx1PwlIz2LtaDAeWz762mKgw
 2DySuDxnqf7NhihXDDSkcZU3GbTNn4BOowPhhN6SXZbOBxBSyxj8R/6UtIpqfnkh1BDoYjjSOnk
 eX/e4IZkl0ud29VRKngVNjqimclTF3xPbuE4fJHWMKzobQlRCa0zfdlnZkg6GwWeTazkwgnwZXA
 Vhokp1PRpcT67a5iNyRlGS8B7g6xuZqyogdGgoij+h2ZTA0/uYZIgCJ3GtP0fvvxk9fkhZvsEvB
 PQ+1zZ5qbJoZKOe5KwgWjJzYOFRw8wa2aeW77c5rXkb39nMi46Jhsp363Kg66ZU9on3U6Vc8cO6
 b4GjsoDqoEVKGRTPoNWJ+9lmJqBkfezutIfantd7sl3DSN73amlPTss8346G0p0Dm91ru87QTQb
 3Wgd0Igm/UqEf2Z1x5Zmk5txJNvK87w9GHFTtbTCxB7lblKHblR5JfESWckLReVClbmnL0P3TUk
 RU00M2B2DFl+RlgLaANy9qheWSq0ZY8E6wggZVTsOBMpa4TbVbdlF6iGCDvNRy12+ZwJ/nTWIvG mw5JEKLT6xJXYVA==
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com>
Subject: [PATCH] rust: support arrays in target JSON
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Matthew Maurer <mmaurer@google.com>

Some configuration options such as the supported sanitizer list are
arrays. To support using Rust with sanitizers on x86, we must update the
target.json generator to support this case.

The Push trait is removed in favor of the From trait because the Push
trait doesn't work well in the nested case where you are not really
pushing values to a TargetSpec.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/generate_rust_target.rs | 82 +++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 29 deletions(-)

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 87f34925eb7b..c31657380bf9 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -20,12 +20,28 @@ enum Value {
     Boolean(bool),
     Number(i32),
     String(String),
+    Array(Vec<Value>),
     Object(Object),
 }
 
 type Object = Vec<(String, Value)>;
 
+fn comma_sep<T>(
+    seq: &[T],
+    formatter: &mut Formatter<'_>,
+    f: impl Fn(&mut Formatter<'_>, &T) -> Result,
+) -> Result {
+    if let [ref rest @ .., ref last] = seq[..] {
+        for v in rest {
+            f(formatter, v)?;
+            formatter.write_str(",")?;
+        }
+        f(formatter, last)?;
+    }
+    Ok(())
+}
+
-/// Minimal "almost JSON" generator (e.g. no `null`s, no arrays, no escaping),
+/// Minimal "almost JSON" generator (e.g. no `null`s, no escaping),
 /// enough for this purpose.
 impl Display for Value {
     fn fmt(&self, formatter: &mut Formatter<'_>) -> Result {
@@ -33,59 +49,67 @@ fn fmt(&self, formatter: &mut Formatter<'_>) -> Result {
             Value::Boolean(boolean) => write!(formatter, "{}", boolean),
             Value::Number(number) => write!(formatter, "{}", number),
             Value::String(string) => write!(formatter, "\"{}\"", string),
+            Value::Array(values) => {
+                formatter.write_str("[")?;
+                comma_sep(&values[..], formatter, |formatter, v| v.fmt(formatter))?;
+                formatter.write_str("]")
+            }
             Value::Object(object) => {
                 formatter.write_str("{")?;
-                if let [ref rest @ .., ref last] = object[..] {
-                    for (key, value) in rest {
-                        write!(formatter, "\"{}\": {},", key, value)?;
-                    }
-                    write!(formatter, "\"{}\": {}", last.0, last.1)?;
-                }
+                comma_sep(&object[..], formatter, |formatter, v| {
+                    write!(formatter, "\"{}\": {}", v.0, v.1)
+                })?;
                 formatter.write_str("}")
             }
         }
     }
 }
 
+impl From<bool> for Value {
+    fn from(value: bool) -> Self {
+        Self::Boolean(value)
+    }
+}
+
+impl From<i32> for Value {
+    fn from(value: i32) -> Self {
+        Self::Number(value)
+    }
+}
+
+impl From<String> for Value {
+    fn from(value: String) -> Self {
+        Self::String(value)
+    }
+}
+
+impl From<&str> for Value {
+    fn from(value: &str) -> Self {
+        Self::String(value.to_string())
+    }
+}
+
+impl From<Object> for Value {
+    fn from(object: Object) -> Self {
+        Self::Object(object)
+    }
+}
+
+impl<T: Into<Value>, const N: usize> From<[T; N]> for Value {
+    fn from(i: [T; N]) -> Self {
+        Self::Array(i.into_iter().map(|v| v.into()).collect())
+    }
+}
+
 struct TargetSpec(Object);
 
 impl TargetSpec {
     fn new() -> TargetSpec {
         TargetSpec(Vec::new())
     }
+
+    fn push(&mut self, key: &str, value: impl Into<Value>) {
+        self.0.push((key.to_string(), value.into()));
+    }
 }
-
-trait Push<T> {
-    fn push(&mut self, key: &str, value: T);
-}
-
-impl Push<bool> for TargetSpec {
-    fn push(&mut self, key: &str, value: bool) {
-        self.0.push((key.to_string(), Value::Boolean(value)));
-    }
-}
-
-impl Push<i32> for TargetSpec {
-    fn push(&mut self, key: &str, value: i32) {
-        self.0.push((key.to_string(), Value::Number(value)));
-    }
-}
-
-impl Push<String> for TargetSpec {
-    fn push(&mut self, key: &str, value: String) {
-        self.0.push((key.to_string(), Value::String(value)));
-    }
-}
-
-impl Push<&str> for TargetSpec {
-    fn push(&mut self, key: &str, value: &str) {
-        self.push(key, value.to_string());
-    }
-}
-
-impl Push<Object> for TargetSpec {
-    fn push(&mut self, key: &str, value: Object) {
-        self.0.push((key.to_string(), Value::Object(value)));
-    }
-}
 
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240730-target-json-arrays-17c8d1799f9b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>
