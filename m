Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007103CD8CA;
	Thu,  4 Jun 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603216; cv=none; b=tnmmcpuux1mJteHUYkmzPL2Jtpvzf3R6lFe2m/B3jGQQZnyLzf/Yw9W+giF00d9CdZegRCN1m57TQH7GFuIsXV4UmRiiViXvLtRQPtJiCRE4A8IHD4cEwO61RmvBVS0EDAgxaqOgIrNFJLEiXnpbsBi4CVQ9RhwmFvEFvXKz0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603216; c=relaxed/simple;
	bh=ZnsSmRIcKWyPnQt9XJSezr7E2APtrOKIkUlZBJgDeoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGD/jmOz1d8HBrVewCxbu2boM7cJIKJFFHFkXpv2alAkNYxGlQGG7UXq0mK4YZQ6O75uPC4UgSW5+A05yIJWc1qjaMiVR0dOxW/W71qQRYG4mCwxqgIB87YfAdEw6BO+6ZLT/iStz1RAhl3/YHcXn/GEOBgULRQ/DWpIyvLvytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGPRnclD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGPRnclD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4380D1F00893;
	Thu,  4 Jun 2026 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603214;
	bh=ErazmYbt0dY2iWxeKQ4eTQoLenALnLYrFj4/sdzoSv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EGPRnclDRb7Z9n3MYzg/+aOk861bUXrEPXeCD0IpfKGvkZvGZJpWXXxv21qHrHTE6
	 Zfhc/lITsreP0PZ0Vw2F3dyoz0+3WzZCgzVRnRB/GQED2Mkf0XXhbrcA9di4hr/3P2
	 Ip6TkTrxUliNGkyuAJ1TxsrweGWcLHhQQeBnL8oolyYCxFJqi0yWxEaP8MTAulUebs
	 UPlWpxafvWN1CqGARcLZakFlWG5cODPk3HEa4NtDRbWBYnls5TEmURZX9W755QrO69
	 l8DoU2YSjP5mboEwABopMrXamnSmpTSOMcfoCJ0TeZYzQfctRnEC6YRukLyH4UtRzH
	 zG6K6Q36ZM81w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:07 +0200
Subject: [PATCH v4 01/11] rust: xarray: minor formatting fixes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-1-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Daniel Gomez <da.gomez@samsung.com>, 
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2328; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZnsSmRIcKWyPnQt9XJSezr7E2APtrOKIkUlZBJgDeoc=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIdjqik1u79zxxTS5iPXhIesPlF5+ES1kJPa6B
 cllYqDV22OJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiHY6gAKCRD6UCkIqsW9
 0Mm/D/44llvOJsB8w05qq4AFJIZ2dQ5QiIf7ylxkQxemH6eQEz6OmLBUQFpDQKj293/zgmGJrwH
 DHg2r5nYszcCQmqUN7AGK8n3XNql6jIXgVEf+z6Yn07CRb0mHnTuC3jDHlgP2ty1EiBkSyVJiYV
 HumYv9quQv3Y6JJ/rgVNrcWKFbjWYCoqvcc4TM23V0SdtWw8nUZ1g+FWKm8U86OAfuE5uWdUE3a
 QRc9Ez86w642m7/r+ZTQ2befa7Sb/Q5VpEYTLHCvF5B4Ts/AAAwrlneWFAWncbTK5yqm9mgXsi0
 ETbNTGD06G+Wh8U1zSoYLHwQGY4J7uw0YmYSKCwEzsktAHtk3JN+91suy7X1LArJ9Foy60W6Sdx
 b1SPv54GOLGFSnayzByQnpjj+j6DQxu29YHG8HTRxBM+d8RLSYRhj9/mnzWAS2G56krVuLnM59T
 LbOcC5PtvMAu8otev9wOVVlBqAxBkPSFgYaG59TaCs1EMTbNf9VM+X8Q1y5H/UiFkY5m0diHNWJ
 FeiQd+24c25yQu7WRrlF84lSJrDjsrjW+C4RTRXGI2sWkSJDCiP/sEqsmsSUOVm55gq6vONkeuk
 6bsx0I3/xAme5YJewuipS0ThYJUqdnStwsym6IMeijycAgbCr//UscgAsya0XZAe7Zokyf7h0gq
 Y3zuGVJR+u6FDEw==
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
Reviewed-by: Daniel Gomez <da.gomez@samsung.com>
Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 46e5f43223fe..b80fb7a262d0 100644
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


