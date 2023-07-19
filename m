Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C083156D3
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 14:21:34 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6093D270E
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 07:21:05 -0700 (PDT)
Date: Wed, 19 Jul 2023 14:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1689776463; x=1690035663;
	bh=ocaw+Jg23eMbqrHzK2iWdBrvi4VvFs/SPBCP4KfLQJI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gK1ISIfeWnjFtMpoaYRH7GnrQ1vT8LMld6UrLQmh9V7bcBAA6Bn2dtmYxpZrTSclX
	 oT7nEDYzQXAJMcvgCJ3c1GPr5LVwaiYcvuZeAPgbWWlXEyZNTQNK1t632sK8JtBm89
	 AsPMCN4Z3uN/lJR9oDe9RYcluSFZy696clmyjDdgfHZX7AExnKP5pqooI2+zDO9iLY
	 oZG0w0GZ48nKTfoo8BKV/2dvfMsZx7Z3SngYAydmsNQ7Rmzf8woa3OP2f9BwUMxI2q
	 Dt0v5ZK1F11b7pL5nf9sFhV5e61Y7Ub0HeMpTKtPnpY6Lr93AoDDwYBegH2d/MJGJZ
	 IbVZL2LIyggnQ==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 07/12] rust: init: Add functions to create array initializers
Message-ID: <20230719141918.543938-8-benno.lossin@proton.me>
In-Reply-To: <20230719141918.543938-1-benno.lossin@proton.me>
References: <20230719141918.543938-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add two functions `pin_init_array_from_fn` and `init_array_from_fn` that
take a function that generates initializers for `T` from usize, the added
functions then return an initializer for `[T; N]` where every element is
initialized by an element returned from the generator function.

Suggested-by: Asahi Lina <lina@asahilina.net>
Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
v1 -> v2:
* fix warnings and errors in doctests
* replace dropping loop with `drop_in_place` and `slice_from_raw_parts_mut`
  inside of `{pin_}init_array_from_fn` functions

 rust/kernel/init.rs | 86 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 460f808ebf84..fa1ebdbf5f4b 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -875,6 +875,92 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> =
{
     unsafe { init_from_closure(|_| Ok(())) }
 }
=20
+/// Initializes an array by initializing each element via the provided ini=
tializer.
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::{error::Error, init::init_array_from_fn};
+/// let array: Box<[usize; 1_000_000_000]>=3D Box::init::<Error>(init_arra=
y_from_fn(|i| i)).unwrap();
+/// pr_info!("{array:?}");
+/// ```
+pub fn init_array_from_fn<I, const N: usize, T, E>(
+    mut make_init: impl FnMut(usize) -> I,
+) -> impl Init<[T; N], E>
+where
+    I: Init<T, E>,
+{
+    let init =3D move |slot: *mut [T; N]| {
+        let slot =3D slot.cast::<T>();
+        for i in 0..N {
+            let init =3D make_init(i);
+            // SAFETY: since 0 <=3D `i` < N, it is still in bounds of `[T;=
 N]`.
+            let ptr =3D unsafe { slot.add(i) };
+            // SAFETY: The pointer is derived from `slot` and thus satisfi=
es the `__init`
+            // requirements.
+            match unsafe { init.__init(ptr) } {
+                Ok(()) =3D> {}
+                Err(e) =3D> {
+                    // We now free every element that has been initialized=
 before:
+                    // SAFETY: The loop initialized exactly the values fro=
m 0..i and since we
+                    // return `Err` below, the caller will consider the me=
mory at `slot` as
+                    // uninitialized.
+                    unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_=
mut(slot, i)) };
+                    return Err(e);
+                }
+            }
+        }
+        Ok(())
+    };
+    // SAFETY: The initializer above initializes every element of the arra=
y. On failure it drops
+    // any initialized elements and returns `Err`.
+    unsafe { init_from_closure(init) }
+}
+
+/// Initializes an array by initializing each element via the provided ini=
tializer.
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new_mut=
ex};
+/// let array: Arc<[Mutex<usize>; 1_000_000_000]>=3D
+///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i))).unwrap();
+/// pr_info!("{}", array.len());
+/// ```
+pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
+    mut make_init: impl FnMut(usize) -> I,
+) -> impl PinInit<[T; N], E>
+where
+    I: PinInit<T, E>,
+{
+    let init =3D move |slot: *mut [T; N]| {
+        let slot =3D slot.cast::<T>();
+        for i in 0..N {
+            let init =3D make_init(i);
+            // SAFETY: since 0 <=3D `i` < N, it is still in bounds of `[T;=
 N]`.
+            let ptr =3D unsafe { slot.add(i) };
+            // SAFETY: The pointer is derived from `slot` and thus satisfi=
es the `__pinned_init`
+            // requirements.
+            match unsafe { init.__pinned_init(ptr) } {
+                Ok(()) =3D> {}
+                Err(e) =3D> {
+                    // We now have to free every element that has been ini=
tialized before, since we
+                    // have to abide by the drop guarantee.
+                    // SAFETY: The loop initialized exactly the values fro=
m 0..i and since we
+                    // return `Err` below, the caller will consider the me=
mory at `slot` as
+                    // uninitialized.
+                    unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_=
mut(slot, i)) };
+                    return Err(e);
+                }
+            }
+        }
+        Ok(())
+    };
+    // SAFETY: The initializer above initializes every element of the arra=
y. On failure it drops
+    // any initialized elements and returns `Err`.
+    unsafe { pin_init_from_closure(init) }
+}
+
 // SAFETY: Every type can be initialized by-value.
 unsafe impl<T, E> Init<T, E> for T {
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
--=20
2.41.0


