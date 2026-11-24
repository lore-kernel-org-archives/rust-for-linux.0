Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558592;
	b=OQDoZcoDElQ649JnQnBdZBpcb8IMH4ziEKilkODmHcgy7uU6nRCjuTk4qzpMo7SfPULO
	 PrcAk/PHcBwxAC8bpAnnC5JpvhvjsjgdJnrM1YPvWsqX6situET9NC/cMGrQjFCYTOnfC
	 5gHe2aR/EcJX2UXV9HVHiiwdGaRitN3nJU6G0F2DiqatF/wvYhgS691gyhHVKArVM+DFh
	 LwKdv9n4ZmGoSIzR/Uom4RxuwtTO3ust4mY1H83iYARFZdtgIFDqscJtnGWiwSeYLehGJ
	 7F1qNj8u/fozcXKhFWg12QvRhOqi0iURHq9EK1gMab/CAtP9w5NWuXZvH+0owLnsyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558592;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wtl73C5SEX1kxHGsDVwwCxIwiGSmiFjRPEk/ob0WG+M=;
	b=z7NywTjNN2FUj9RxrcLoo8bCG0Xv8/RQJBzH8HfDcVkboO6LWEkQNWVv3frTsADn+FUy
	 mSBJnPEghxk1fsQHlXJNhvAURtTrpVRnf39wjs8FL9CAO02EgO/b5A1GdC5VAOlH57hOa
	 YLwvWHvVDhvtNAaUUf+FgUk8TbM1/aJ0WhS9tQXDMXhNANicydRCuLgloxgJwj+4sI/lP
	 fuSsXSFnPs3TwaWcJBTtnEG9Ma/1FrfuTfEOYo6GPbcJZyI9y+JnsQhk/u6pjbkPBiXqw
	 0WeFP7znr9IdDJmGjbWd2XYb+Qy+qTfprF55fh2A4kG9bmwCCDwd5a5stGX6ITN5yLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kKZ/r392";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B87606A326;
	Tue, 24 Nov 2026 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKZ/r392
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860241F000CF;
	Tue, 24 Nov 2026 22:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558592;
	bh=wtl73C5SEX1kxHGsDVwwCxIwiGSmiFjRPEk/ob0WG+M=;
	h=From:Date:Subject:To:Cc;
	b=kKZ/r3924Yqofd1h5L5iWTz8o9Gv5cljpuL84u7Vf1it5dUOVD9xFQCqUCPdzrhZp
	 P+jrogOKKdKiGClD9zSV0XgFzRODy+ZPK5FDKcTIl0UhCZRtmx0Z854BfW2rsXF9yj
	 NhFGDuANYVM+40Sxj13TkxfaEXtdt7GHvdn7JDQuCSucsYW9PMBxip/aL7UoJOvH1j
	 Dla7OZzoMKZ5jDpab29sDRm2PIyDtB9xF4OKpSnIT/lzNQ8LloxcdmRFqLa5ZWl9JQ
	 Sf1sHYokgoDQ1OGtwbG4wIF7M1ZvTsOdt124AbELr5GC/Hrnj5oIL+Jbtb3AVJVYzS
	 nAhWpEC+FT0xg==
From: Gary Guo <gary@kernel.org>
Date: Tue, 24 Nov 2026 22:16:23 +0000
Subject: [PATCH] rust: pin-init: document self-referential feature
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-dev-pin-init-doc-v1-1-dd0a3eda9018@garyguo.net>
X-B4-Tracking: v=1; b=H4sIALYMBmsC/z2MQQ6CMBBFr0Jm7UTbEClexbgo01HGxUDaQkgId
 7fVxOX7+e/tkDgKJ7g1O0ReJcmkBcypARq9vhglFAZ7sVdjbIuBV5xFUVQyhomQWudc13tDXQ9
 FmyM/Zfsm748fp2V4M+XaqY/BJ8YheqWxTjkyn/9J5S3DcXwAot8gm5kAAAA=
X-Change-ID: 20261124-dev-pin-init-doc-c488879a1c79
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558589; l=8688;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=pPpFK93jRfiiuVjYa5/Ert5vNlHWDFAHtfWNIH/Golo=;
 b=/6lTmoNs+n727fqNyAY6s57EHHFBG4wtfNsJIZ4/H8kdvOGhfX6aOE8JWu/m75hRCCcKb1tYW
 B3g8tDHj+Y6Dd299D1fquJnKmTaa1XWS13mLOcen+8BYVsdaCoasM2c
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=

From: Gary Guo <gary@garyguo.net>

Add a section to the documentation of `#[pin_data]` macro about
the safe self-referential creation feature.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 176 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 171 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 9ffa76434310..c0e87586b072 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -307,6 +307,9 @@
 /// Tuple structs are supported as well. Their fields have no names, so the generated projection
 /// is a tuple struct too and its fields are accessed by index.
 ///
+/// Self-referential structs, where a field borrows another field of the same struct, are also
+/// supported. See the [section on self-referential structs](#self-referential-structs) below.
+///
 /// If your `struct` implements `Drop`, then you need to add `PinnedDrop` as arguments to this
 /// macro, and change your `Drop` implementation to `PinnedDrop` annotated with
 /// `#[`[`macro@pinned_drop`]`]`, since dropping pinned values requires extra care.
@@ -376,6 +379,170 @@
 ///     }
 /// }
 /// ```
+///
+/// # Self-Referential Structs
+///
+/// This macro also supports structs where a field borrows another field of the same struct. To do
+/// that, use the name of the borrowed field as a lifetime (a *field lifetime*) in the type of the
+/// borrowing field:
+///
+/// ```
+/// # use pin_init::*;
+/// #[pin_data]
+/// struct SelfRef {
+///     part: &'msg str,
+///     msg: String,
+/// }
+/// ```
+///
+/// Here the field `part` captures the field lifetime `'msg` and thereby borrows the field `msg`.
+/// A field may only borrow from fields declared after it: fields are dropped in declaration
+/// order, so the borrowing field is then always dropped before the field it borrows. Structs
+/// with borrowed fields or captured lifetimes do not implement `Unpin`.
+///
+/// When initializing such a struct with [`pin_init!`], every named initialized field have a
+/// binding generated for it (as `&T`/`Pin<&T>` for fields share-borrowed, or `&mut`/`Pin<&mut T>`
+/// for fields mutably-borrowed), so a field can borrow from the fields initialized before it:
+///
+/// ```
+/// # use pin_init::*;
+/// # #[pin_data]
+/// # struct SelfRef {
+/// #     part: &'msg str,
+/// #     msg: String,
+/// # }
+/// stack_pin_init!(let foo = pin_init!(SelfRef {
+///     msg: "hello world".to_owned(),
+///     part: &msg[..5],
+/// }));
+/// assert_eq!(*foo.part(), "hello");
+/// ```
+///
+/// Note that `&mut`/`Pin<&mut T>` bindings are also generated for non-borrowed field, but access to
+/// them are limited to within the initializer.
+///
+/// ## Mutable Borrows
+///
+/// A field is only shared-borrowed by default. To also allow `&mut` borrows, mark the borrowed
+/// field with `#[borrowed(mut)]`:
+///
+/// ```
+/// # use pin_init::*;
+/// #[pin_data]
+/// struct MutSelfRef {
+///     part: &'mut_msg mut str,
+///     #[borrowed(mut)]
+///     mut_msg: String,
+/// }
+///
+/// stack_pin_init!(let foo = pin_init!(MutSelfRef {
+///     mut_msg: "hello world".to_owned(),
+///     part: &mut mut_msg[..5],
+/// }));
+/// foo.as_mut().with_project(|proj| proj.part.make_ascii_uppercase());
+/// assert_eq!(*foo.part(), "HELLO");
+/// ```
+///
+/// Shared borrows are inferred automatically whenever a field lifetime is used, but they can also
+/// be requested explicitly with `#[borrowed]`.
+///
+/// ## Variance
+///
+/// A captured field lifetime is *covariant* by default: just like a normal reference, the field
+/// type allows the captured lifetime to be shortened. If the field type does not allow that (for
+/// example because the borrow is stored behind a `Mutex`), the capture has to be marked as
+/// *invariant* using the `#[uses]` attribute:
+///
+/// ```
+/// # use pin_init::*;
+/// # use std::sync::Mutex;
+/// #[pin_data]
+/// struct InvariantSelfRef {
+///     #[uses('owner: invariant)]
+///     part: Mutex<&'owner str>,
+///     owner: String,
+/// }
+/// ```
+///
+/// The macro verifies that captures marked covariant really are covariant. `#[uses]` accepts a
+/// comma-separated list of lifetimes, each with an optional variance (the default being
+/// `covariant`). The special lifetime `'_` stands for all field lifetimes mentioned in the type
+/// of the field, e.g. `#[uses('_: invariant)]`.
+///
+/// ## Existential Lifetimes
+///
+/// A field lifetime ties a borrow to a specific field. Sometimes a field should instead borrow
+/// from something outside the struct that merely outlives one of the struct's lifetime
+/// parameters. Such lifetimes are declared in the where clause of the struct using `exists`:
+///
+/// ```
+/// # use pin_init::*;
+/// # use std::marker::PhantomData;
+/// # use std::sync::Mutex;
+/// struct CoherentBox<'a>(PhantomData<&'a ()>);
+///
+/// #[pin_data]
+/// struct DeviceBox<'a>
+/// where
+///     exists<'x>: 'a,
+/// {
+///     #[uses('x: invariant)]
+///     m: Mutex<CoherentBox<'x>>,
+///     p: PhantomData<&'a ()>,
+/// }
+///
+/// // The struct is covariant in `'a`, so it can be shortened:
+/// fn shorten<'long: 'short, 'short>(f: DeviceBox<'long>) -> DeviceBox<'short> {
+///     f
+/// }
+/// # let _ = shorten;
+/// ```
+///
+/// An existential lifetime is not a parameter of the struct, so just like a field lifetime it is
+/// hidden from the type of the struct. Unlike a field lifetime, it is not tied to a field; the
+/// only bounds placed on it are those written in the where clause (here `'x: 'a`).
+///
+/// ## Projections and Accessors
+///
+/// Since field lifetimes are not parameters of the struct, borrows of the struct cannot carry
+/// them. This macro therefore generates several methods for accessing the fields:
+///
+/// - `project(self: Pin<&mut Self>)` — the pin projection: `#[pin]` fields are projected as
+///   `Pin<&mut T>`, all other fields as `&mut T`. Fields that capture a field lifetime covariantly
+///   are only projected as (possibly pinned) shared references; fields with invariant field
+///   lifetime capture are omitted entirely.
+/// - `with_project(self: Pin<&mut Self>, f)` — calls `f` with a projection in which every
+///   visible field has its actual field lifetime, so even invariant captures are visible.
+/// - `with_project_ref(self: Pin<&Self>, f)` — the shared version of `with_project`.
+///
+/// For all projections, shared borrow fields are only accessible with shared references, and
+/// mutably borrowed fields are omitted (they are only accessible through the fields that borrow
+/// them).
+///
+/// Every field (except those borrowed mutably) that captures field lifetimes also gets an accessor
+/// method, because they cannot be directly accessed. `fn field(&self)` is generated if all of its
+/// captures are covariant, otherwise `fn with_field(&self, f)` is generated where `f` is called
+/// with the field at its captured lifetimes.
+///
+/// ```
+/// # use pin_init::*;
+/// # #[pin_data]
+/// # struct SelfRef {
+/// #     part: &'msg str,
+/// #     msg: String,
+/// # }
+/// # stack_pin_init!(let foo = pin_init!(SelfRef {
+/// #     msg: "hello world".to_owned(),
+/// #     part: &msg[..5],
+/// # }));
+/// foo.as_mut().with_project(|proj| {
+///     *proj.part = &proj.msg[6..];
+/// });
+/// assert_eq!(*foo.part(), "world");
+/// foo.as_ref().with_project_ref(|proj| {
+///     assert_eq!(*proj.part, "world");
+/// });
+/// ```
 pub use ::pin_init_internal::pin_data;
 
 /// Used to implement `PinnedDrop` safely.
@@ -664,11 +831,10 @@ macro_rules! stack_try_pin_init {
 ///
 /// Arbitrary Rust expressions can be used to set the value of a variable.
 ///
-/// The fields are initialized in the order that they appear in the initializer. So it is possible
-/// to read already initialized fields using raw pointers.
-///
-/// IMPORTANT: You are not allowed to create references to fields of the struct inside of the
-/// initializer.
+/// The fields are initialized in the order that they appear in the initializer. A let binding
+/// is generated so already initialized fields can be read. For [self-referential
+/// structs](pin_data#self-referential-structs), you may also use such generated bindings to
+/// initialize fields that borrow from them.
 ///
 /// # Init-functions
 ///

---
base-commit: 5eb5b404e6e7631a986333f00e7b3b18aafcfaa8
change-id: 20261124-dev-pin-init-doc-c488879a1c79

Best regards,
--  
Gary Guo <gary@garyguo.net>

