Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E10037BE7F;
	Mon,  9 Feb 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647927; cv=none; b=HN1IgLTMdGA+g8++TjCOoeR+KzVJ1RipGssdVozeV5wXXE2hOnoaHzUBWNi/SEg2yAe3rv9aEnht/9FUGKc5hEsnJUyyu63Uh28r5yX9IzlGFYmMCZ34p88oafIip1qq8T+yN2HHGbK/IHsat1JLRBJV3Kx10Bt6Ai9ED4fS8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647927; c=relaxed/simple;
	bh=IuZIeAbMbsdgaivN59tt1avMvbqBct88rIBvqOT1fR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbckW9P6YEcQzSanTVcJ2QuUZ/yUSvG0X2q+442kqndsEUqF+Serk0T/XTdDOCepcaoPfH95TApxH7HwY2bqPLaacgjDq55XK5kNnJU1/6f0IrZGizL9Ga8yy6ZL5AQAeQ/W6Yvov8JEQuoIl/At+IHcWU0AMKAsfjmU2rBqNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ej84H0zM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ej84H0zM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7670FC19424;
	Mon,  9 Feb 2026 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647926;
	bh=IuZIeAbMbsdgaivN59tt1avMvbqBct88rIBvqOT1fR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ej84H0zMEMGgPiMbNYWOo0DChrVkdP7DvC+nXkl3vvKX71T8AxtfNA8lGZqiX6vds
	 ReWeu7Hg0qUhCJFGdLXVHD9eO5jE9c7j1PvVrr5CrhkIxkBXm+ih5ylQ4gTq6q6/QO
	 RgERqiHV4Hn+XmdjDD0XOQaE5lDpmtDdKKt/ILzpzZWgjewqfRk3aC2qJI12LDzaeZ
	 0/OmXxf2Y5tE3x4xbZ6Thjw7e65CpneFW0dAuyZn9E9/z2PXQVQVb5Tf8QPshgs3OM
	 Pewd8FijlCH473aXx+2SQagSCXaE8Qxqw++NSgpHygGjUmYGDVeNqEY521s68ChpUg
	 JdHOEq/YOHbPw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:06 +0100
Subject: [PATCH v3 01/12] rust: xarray: minor formatting fixes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-1-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
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
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFVZvzAtSDsr+CZ/ZQXchk3O+6YaG5edPjg5
 +kyPR0aS+6JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxVQAKCRDhuBo+eShj
 d2b7D/9i4AnYsinT630ZGFRy/Kh8bYrxUBt/LUmTe30OOzGERcX8Ib50IC1qO3zs69GiuFbqRFi
 9QiIaBN/0HodwyMFQAtubXEGX8gOm5kXkl+4cMPkQLDIJ2oKaL2TfPMtVcECwU260gOp4t5u9Jw
 LUDhX8V8RR/W1v8ca7+hnqjwauXgTZkNy3fquLEDQwM9tIt+jLCxljAbiTJeaGbOSg/Qp4fse31
 sgOgNzjJxhYqbSM0oAAPh0okko/NI9FXP5RazyAA3wSwVMu7ep7SUm9p6uVdDQXS8rYb1AGX8qd
 iZwB+5mmnE5GBrg0wGnWtWYuyX93FdjL85boyY3seBWIrgs4mHT3v6/NGDXxe+ftwWFruGucANT
 fNaymZGF+JgIawTniS/2g+uEa6c5G4qFNtuIQhWp5cawKpGEgF9r9OcfR2XMzcXugW1kdYv3bmn
 xf8gevt43sKknTy6JjKRi+wAkSo796bG5FV2k5r+lQs6C31hooZ7qVUNP7c+F8753wWcd5UGejX
 RKwmplbzFCh6mou5NQBraIYiSTy66YyxqLYro9HjYzE9FqPQ9bRCU5QXObA2Mre4dNT6YWILRsu
 FM0tWtdOIZOuDlL0lOmr+6DUXLf9OjO7Aa9xL8S8Km8QU4O92D0C11RM3ffiNhY436oiI5sIOfP
 301iZwvcnhfZaOw==
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


