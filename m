Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6D2FF643;
	Fri,  6 Feb 2026 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412326; cv=none; b=oI8yIS5A8Ng5kp565FPHvAkgnRDcmm0j4wfF34uIQIz48lH6WODSJKvwow8qf8oDoQUC5FaFj//HFngz40Ydig8qgO4Va7EhS/w8IKdxcwCX3HncFNisXA86X39zfuOLOYJTFEqonPUbls9EPHMIo4z1DXtuEqdfpqSZ2K+KI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412326; c=relaxed/simple;
	bh=IuZIeAbMbsdgaivN59tt1avMvbqBct88rIBvqOT1fR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=luI7c1Z92qigXA5rCapg+BVPla6t2HNB/RDEZBEmdyaWlHW4HP4ZGEDhRxvRLNxb1THRSQAUP0lr1I+uPV3nviRkjq/dlEMs0EIvrnXuK4MYjKYMXpNsO904MP0LwmSXqxCSXRt7aDO0sacBYd8pmzVdRlMHSTiWi/dxQE+7DT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8788c6n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8788c6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12093C116C6;
	Fri,  6 Feb 2026 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412326;
	bh=IuZIeAbMbsdgaivN59tt1avMvbqBct88rIBvqOT1fR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q8788c6nMKGPWcNP4b2+qR18xaW8Tr47gxoIdCzt/HQ9QNbgn02ZkIsy0whEUEEmL
	 XmDup8ohqes/6Akzn/liPi022+7BlzIdHCUWXUCRzeRggwKBi6PWbjPjyf83FCnvgx
	 Dc3si3XQg1oA+tuExMpV2rN1rYidd/xwAhMFpmLYyiCwPg7+VyWmT4Mwuoi1DjdKKl
	 ugkeoaesoLobvTrG781Mlulr03iYw6i2v6tHW1Wq6YqBhYahXKzQr/8b18DH+h+Rm3
	 jlsKHW1CajbJj/0Rd7TLRMRQTeJRhi9WHTWvyq6b7+RqspA+YeMLKYxWW4lVNpD4Fy
	 2kBzkmOC6PLNw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:47 +0100
Subject: [PATCH v2 01/11] rust: xarray: minor formatting fixes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-1-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=IuZIeAbMbsdgaivN59tt1avMvbqBct88rIBvqOT1fR4=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljiegWf9WDKjbFzObfttbuYLpKDIPlIEsoq3
 +CZ3kDLd7iJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY4gAKCRDhuBo+eShj
 d7ggD/9afE2x+SSzohkJkdplmI+/vDaHHfcxt51QBr6DjxAKEAc4JG2ELyc4yuQ+qLvuvo0T2+L
 84en77vsujKqRfv2lgNkQn53NetFo6HwnLLPyUPfSXIMRctQ8L4owf0BR3XzWyl1nV0rGGgBqys
 4Q5rHf4RYBK7pA5uPSUvgEuzD74vemtTci7M3aybBCI+B+Emjn2Rqd0wqb3qY3x9WD05TuASXDR
 rRnoqC/oypLNz+34t8kv4zoH/aCvZkLdCdkz93epIP1opOEJeuRodV/vuuS6dis4NoQ+YEW3z1M
 /F2vx0aSN8+GLpkW7v5HKffRdifom0swnJt4R+0VxsRn/bSJtkx4557rw7McULZno4EtbaGLDOI
 Y9JFTLiOiGIxdTnxywukAQVLyUdWR3mJkRvow8A/S+kDpqfPhuy8Psf8YpPdz5fxHviizOXO9+z
 7eQv2lfdyG6Y+qcO6m7LvJUVYUV/MzMrwdnjtpYIsbKhdxT1FhVqee5gcmR6EP0HTDETgERT7Fm
 xdYsKfdwk2LdW7xACOjrM6Qg5K+ZTHlFQyaoKW7Uqd9g8zB8+qvZhRFh3lvCr5uZoO7tk3IA8TU
 DBcXItr+O/028jur8j1bXS4P5VDLnPu2SVWl3UBicUc4HkQpp8wE82KB/ppYA5KSGngX+lRDa3m
 M8yx1mttJZac7bw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Fix formatting in xarray module to comply with kernel coding
guidelines:

- Update use clauses to use vertical layout with each import on its
  own line.
- Add trailing empty comments to preserve formatting and prevent
  rustfmt from collapsing imports.
- Break long assert_eq! statement in documentation across multiple
  lines for better readability.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db288458..88625c9abf4ef 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -4,14 +4,33 @@
 //!
 //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
 
-use crate::{
-    alloc, bindings, build_assert,
-    error::{Error, Result},
+use core::{
+    iter,
+    marker::PhantomData,
+    pin::Pin,
+    ptr::NonNull, //
+};
+use kernel::{
+    alloc,
+    bindings,
+    build_assert, //
+    error::{
+        Error,
+        Result, //
+    },
     ffi::c_void,
-    types::{ForeignOwnable, NotThreadSafe, Opaque},
+    types::{
+        ForeignOwnable,
+        NotThreadSafe,
+        Opaque, //
+    },
+};
+use pin_init::{
+    pin_data,
+    pin_init,
+    pinned_drop,
+    PinInit, //
 };
-use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
-use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
 
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
@@ -44,7 +63,10 @@
 /// *guard.get_mut(0).unwrap() = 0xffff;
 /// assert_eq!(guard.get(0).copied(), Some(0xffff));
 ///
-/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), Some(0xffff));
+/// assert_eq!(
+///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
+///     Some(0xffff)
+/// );
 /// assert_eq!(guard.get(0).copied(), Some(0xbeef));
 ///
 /// guard.remove(0);

-- 
2.51.2


