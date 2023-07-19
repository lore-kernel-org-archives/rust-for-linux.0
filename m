Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91447156CD
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 14:22:01 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53E626AA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 07:21:36 -0700 (PDT)
Date: Wed, 19 Jul 2023 14:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1689776477; x=1690035677;
	bh=YIuxWzFErHS/G2fc91GDnhwDMG2gDHUgDWefQ2yWmME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bfuufCxGbBZv9CUYoDr0RrvLhYTmm6dmIHOS0Z2bDUwUcxyV6I0hjWszLTaF5Vx5W
	 HrUqFylFnj4WwjhZTlCVCKQvs1YRGQCwXprm5Nr0l/mz1Nb+324CqE2J/mGkCUR2Gv
	 gpE139ybVE5a7d0kjaeMQrhdtjfHDT5JBHlcMsC2vN2/OMhcj3iW8VepYvKzet2/7j
	 cOjROJaG5Rqy8P4ntFLseemzGm9YQwtsnmDBDSfW7lOTWfFosVxG1GsbCnlqPZF4Gn
	 c6YXXZhp5uNYg8W/2TLIjYTI1qdc4wtStblB/YSAdFAeBUjhUpU4PaYgfPR2J7v5Bg
	 /KeRmfHZMiw/A==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 08/12] rust: init: add support for arbitrary paths in init macros
Message-ID: <20230719141918.543938-9-benno.lossin@proton.me>
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
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Previously only `ident` and generic types were supported in the
`{try_}{pin_}init!` macros. This patch allows arbitrary path fragments,
so for example `Foo::Bar` but also very complex paths such as
`<Foo as Baz>::Bar::<0, i32>`.

Internally this is accomplished by using `path` fragments. Due to some
peculiar declarative macro limitations, we have to "forget" certain
additional parsing information in the token trees. This is achieved by
using the `paste!` proc macro. It does not actually modify the input,
since no `[< >]` will be present in the input, so it just strips the
information held by declarative macros. For example, if a declarative
macro takes `$t:path` as its input, it cannot sensibly propagate this to
a macro that takes `$($p:tt)*` as its input, since the `$t` token will
only be considered one `tt` token for the second macro. If we first pipe
the tokens through `paste!`, then it parses as expected.

Suggested-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
v1 -> v2:
* use Gary's `paste!` macro instead of `retokenize`
* remove the retokenize macro

 rust/kernel/init/macros.rs | 54 ++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index f5d7f0943f60..345cfc0e6d37 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -998,7 +998,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
 macro_rules! __init_internal {
     (
         @this($($this:ident)?),
-        @typ($t:ident $(::<$($generics:ty),*>)?),
+        @typ($t:path),
         @fields($($fields:tt)*),
         @error($err:ty),
         // Either `PinData` or `InitData`, `$use_data` should only be pres=
ent in the `PinData`
@@ -1012,7 +1012,7 @@ macro_rules! __init_internal {
     ) =3D> {
         $crate::__init_internal!(with_update_parsed:
             @this($($this)?),
-            @typ($t $(::<$($generics),*>)? ),
+            @typ($t),
             @fields($($fields)*),
             @error($err),
             @data($data, $($use_data)?),
@@ -1023,7 +1023,7 @@ macro_rules! __init_internal {
     };
     (
         @this($($this:ident)?),
-        @typ($t:ident $(::<$($generics:ty),*>)?),
+        @typ($t:path),
         @fields($($fields:tt)*),
         @error($err:ty),
         // Either `PinData` or `InitData`, `$use_data` should only be pres=
ent in the `PinData`
@@ -1037,7 +1037,7 @@ macro_rules! __init_internal {
     ) =3D> {
         $crate::__init_internal!(with_update_parsed:
             @this($($this)?),
-            @typ($t $(::<$($generics),*>)? ),
+            @typ($t),
             @fields($($fields)*),
             @error($err),
             @data($data, $($use_data)?),
@@ -1048,7 +1048,7 @@ macro_rules! __init_internal {
     };
     (
         @this($($this:ident)?),
-        @typ($t:ident $(::<$($generics:ty),*>)?),
+        @typ($t:path),
         @fields($($fields:tt)*),
         @error($err:ty),
         // Either `PinData` or `InitData`, `$use_data` should only be pres=
ent in the `PinData`
@@ -1062,7 +1062,7 @@ macro_rules! __init_internal {
     ) =3D> {
         $crate::__init_internal!(
             @this($($this)?),
-            @typ($t $(::<$($generics),*>)? ),
+            @typ($t),
             @fields($($fields)*),
             @error($err),
             @data($data, $($use_data)?),
@@ -1073,7 +1073,7 @@ macro_rules! __init_internal {
     };
     (with_update_parsed:
         @this($($this:ident)?),
-        @typ($t:ident $(::<$($generics:ty),*>)?),
+        @typ($t:path),
         @fields($($fields:tt)*),
         @error($err:ty),
         // Either `PinData` or `InitData`, `$use_data` should only be pres=
ent in the `PinData`
@@ -1092,7 +1092,11 @@ macro_rules! __init_internal {
         // Get the data about fields from the supplied type.
         let data =3D unsafe {
             use $crate::init::__internal::$has_data;
-            $t$(::<$($generics),*>)?::$get_data()
+            // Here we abuse `paste!` to retokenize `$t`. Declarative macr=
os have some internal
+            // information that is associated to already parsed fragments,=
 so a path fragment
+            // cannot be used in this position. Doing the retokenization r=
esults in valid rust
+            // code.
+            ::kernel::macros::paste!($t::$get_data())
         };
         // Ensure that `data` really is of type `$data` and help with type=
 inference:
         let init =3D $crate::init::__internal::$data::make_closure::<_, __=
InitOk, $err>(
@@ -1251,7 +1255,7 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut=
 T) {}
     };
     (make_initializer:
         @slot($slot:ident),
-        @type_name($t:ident),
+        @type_name($t:path),
         @munch_fields(..Zeroable::zeroed() $(,)?),
         @acc($($acc:tt)*),
     ) =3D> {
@@ -1268,15 +1272,21 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *m=
ut T) {}
             // not get executed, so it has no effect.
             ::core::ptr::write($slot, zeroed);
             zeroed =3D ::core::mem::zeroed();
-            ::core::ptr::write($slot, $t {
-                $($acc)*
-                ..zeroed
-            });
+            // Here we abuse `paste!` to retokenize `$t`. Declarative macr=
os have some internal
+            // information that is associated to already parsed fragments,=
 so a path fragment
+            // cannot be used in this position. Doing the retokenization r=
esults in valid rust
+            // code.
+            ::kernel::macros::paste!(
+                ::core::ptr::write($slot, $t {
+                    $($acc)*
+                    ..zeroed
+                });
+            );
         }
     };
     (make_initializer:
         @slot($slot:ident),
-        @type_name($t:ident),
+        @type_name($t:path),
         @munch_fields($(,)?),
         @acc($($acc:tt)*),
     ) =3D> {
@@ -1284,14 +1294,20 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *m=
ut T) {}
         // Since we are in the closure that is never called, this will nev=
er get executed.
         // We abuse `slot` to get the correct type inference here:
         unsafe {
-            ::core::ptr::write($slot, $t {
-                $($acc)*
-            });
+            // Here we abuse `paste!` to retokenize `$t`. Declarative macr=
os have some internal
+            // information that is associated to already parsed fragments,=
 so a path fragment
+            // cannot be used in this position. Doing the retokenization r=
esults in valid rust
+            // code.
+            ::kernel::macros::paste!(
+                ::core::ptr::write($slot, $t {
+                    $($acc)*
+                });
+            );
         }
     };
     (make_initializer:
         @slot($slot:ident),
-        @type_name($t:ident),
+        @type_name($t:path),
         @munch_fields($field:ident <- $val:expr, $($rest:tt)*),
         @acc($($acc:tt)*),
     ) =3D> {
@@ -1304,7 +1320,7 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut=
 T) {}
     };
     (make_initializer:
         @slot($slot:ident),
-        @type_name($t:ident),
+        @type_name($t:path),
         @munch_fields($field:ident $(: $val:expr)?, $($rest:tt)*),
         @acc($($acc:tt)*),
     ) =3D> {
--=20
2.41.0


