Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C8531603;
	Wed, 23 Sep 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172437; cv=none; b=DduOvbJAWBIiIqBrmjMvj+NkiOY1knU4Vz+cFxrG9EKw97IjZGNlbAVUTKT+Tnzqy6iycDQF6XW+0Qa9Yh5yQcnLg71BOdzWVBtGa/5CSnZeZ5sSaeNdZX1cU7xS6a0o7ZOCkxv45Eak/kfCz4Y10b4z9Tp0pjr6uDSMuys3DDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172437; c=relaxed/simple;
	bh=j7WW7H/mKP08UJ1XvgfJdTlAJi/WRzbz9NXPO7+Q+gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVnnnaQADFiXHFrrAQb4UEaWLIcGcw77FSnfE8qw+iUgZMa7olkBET3WbRtGP7rpwxAUZbPMCs+dpIJFcMxlfg8LN6Ps+ANg+GfmUnqHW0CL7zfeH7y42ex9t4sruC4016dbjVyXyWX3g47MzwKPelqZebipTVg3Ou6OuPZt7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsGtA5+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsGtA5+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FEE1F00893;
	Wed, 23 Sep 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172436;
	bh=y8CF8XgKea84gAW8aqM80J/Px8imdjQ7AAdXrqxZkAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=RsGtA5+Yj9cuBhxfYCaBQ55l1G3yiracpRqKOiOQPGv4FdWq8TJwPyApuZ455wG26
	 a5ueBk80HPZ43IKelPNvJTbv5B5p5Jz1WJDHCezekw6qg6hBJeL7y7X0bfk0u5w2/D
	 6KrR+PqK+5csONLvf9SaAj51++8d1RJ1lWLhEGNIh+AeJywblgO3vihayNPhiDmWTo
	 S69JaogO8URQIb/53sFW3SKQSbJpUEvRHwqO6u7GnlgFU6PGKQQHfJ6fIgYavbgTri
	 S1PtIFuLsyPcaIQxxud5OGkilFpz4qGnRp9MItNBcwfL4g863KPPE7XPn263XZ+nsh
	 5sZts9laGwesw==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rust: pin-init: internal: improve diagnostics robustness against panicking
Date: Wed, 23 Sep 2026 15:06:15 +0100
Message-ID: <20260923140618.1978181-3-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923140618.1978181-1-gary@kernel.org>
References: <20260923140618.1978181-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently, if proc macro panicked, the diagnostics clean up is not
executed, and further invocation will cause the "DiagCtxt cannot be nested"
error. While we should aim to have no panics inside proc macros, producing
a sensible diagnostics message even when macro panicked is very useful for
developing.

Thus, catch proc macro panics and convert them to errors, and emit them
together with all diagnostics accumulated so far.

Ideally we would like panic location w/ line numbers being available as
well; however this is not currently implementable without overriding the
global panic hook.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/diagnostics.rs | 24 +++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/diagnostics.rs b/rust/pin-init/internal/src/diagnostics.rs
index efdcf45f40cf..e88e520e326b 100644
--- a/rust/pin-init/internal/src/diagnostics.rs
+++ b/rust/pin-init/internal/src/diagnostics.rs
@@ -4,7 +4,7 @@
 use std::fmt::Display;
 use std::marker::PhantomData;
 
-use proc_macro2::TokenStream;
+use proc_macro2::{Span, TokenStream};
 use quote::{quote, quote_spanned};
 use syn::{spanned::Spanned, Error};
 
@@ -77,7 +77,27 @@ fn with(
             });
         });
 
-        let result = f(&mut DiagCtxt(PhantomData));
+        let mut dcx = DiagCtxt(PhantomData);
+        let result = match std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| f(&mut dcx))) {
+            Ok(result) => result,
+            Err(payload) => {
+                // Robustness against panicking in macros.
+                //
+                // Ensure that any error messages are still emitted when this happens.
+                let message = if let Some(&s) = payload.downcast_ref::<&'static str>() {
+                    s
+                } else if let Some(s) = payload.downcast_ref::<String>() {
+                    s.as_str()
+                } else {
+                    "Box<dyn Any>"
+                };
+
+                Err(dcx.error(
+                    Span::mixed_site(),
+                    format!("proc macro panicked: {message}"),
+                ))
+            }
+        };
 
         let data = DIAGNOSTICS.with_borrow_mut(|data| data.take().unwrap());
 
-- 
2.54.0

