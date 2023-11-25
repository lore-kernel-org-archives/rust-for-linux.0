Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="MlnzvQgD"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA3B8F
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Nov 2023 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1700916677; x=1701175877;
	bh=33aXj6f7MMAvVCpNxf5TEPWoTnHFl6Dp/Pi0T202+hk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MlnzvQgDM6MiOLDHRw6DLnWwAW60YhaHjnBVVhZHox4UJsmw8o6Qw+aMYfgTyDZZh
	 3GupcY4NolZVGQ1ZFmKUCX3jWI369kacbnCsfKBwzFWrkj3BQB5IgeSpMojK2aeztp
	 zxM/iTLfMyVbUzpLNxiZwSZRCKgI7JSt6lzLh0oAw0STYBfYZuxetlUtGeCV8hf9gT
	 g4ZRxr7RDAhDcRzkF+m/kRWFBDM2XLlvC7+Q6eLDmZlalyYKCH9BulSa3f9tTXSIEt
	 /BFZo9y8Iiuuk0KOAYWCj0ThKAUohtHbLC8i9s9HbvZkU/CBL2GjEEpVNbozi05ect
	 FGkFh793z0htg==
Date: Sat, 25 Nov 2023 12:51:09 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rust: macros: allow generic parameter default values in `#[pin_data]`
Message-ID: <20231125125024.1235933-2-benno.lossin@proton.me>
In-Reply-To: <20231125125024.1235933-1-benno.lossin@proton.me>
References: <20231125125024.1235933-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds compatibilty for generic parameters defaults by using
the newly introduced `decl_generics` instead of the `impl_generics`.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/init/macros.rs | 19 ++++++++++++++++++-
 rust/macros/pin_data.rs    |  3 ++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index cb6e61b6c50b..624e9108e3b4 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -538,6 +538,7 @@ macro_rules! __pin_data {
         ),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @body({ $($fields:tt)* }),
     ) =3D> {
         // We now use token munching to iterate through all of the fields.=
 While doing this we
@@ -560,6 +561,9 @@ macro_rules! __pin_data {
             @impl_generics($($impl_generics)*),
             // The 'ty generics', the generics that will need to be specif=
ied on the impl blocks.
             @ty_generics($($ty_generics)*),
+            // The 'decl generics', the generics that need to be specified=
 on the struct
+            // definition.
+            @decl_generics($($decl_generics)*),
             // The where clause of any impl block and the declaration.
             @where($($($whr)*)?),
             // The remaining fields tokens that need to be processed.
@@ -585,6 +589,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We found a PhantomPinned field, this should generally be pinned=
!
         @fields_munch($field:ident : $($($(::)?core::)?marker::)?PhantomPi=
nned, $($rest:tt)*),
@@ -607,6 +612,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($($rest)*),
             @pinned($($pinned)* $($accum)* $field: ::core::marker::Phantom=
Pinned,),
@@ -623,6 +629,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We reached the field declaration.
         @fields_munch($field:ident : $type:ty, $($rest:tt)*),
@@ -640,6 +647,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($($rest)*),
             @pinned($($pinned)* $($accum)* $field: $type,),
@@ -656,6 +664,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We reached the field declaration.
         @fields_munch($field:ident : $type:ty, $($rest:tt)*),
@@ -673,6 +682,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($($rest)*),
             @pinned($($pinned)*),
@@ -689,6 +699,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We found the `#[pin]` attr.
         @fields_munch(#[pin] $($rest:tt)*),
@@ -705,6 +716,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($($rest)*),
             // We do not include `#[pin]` in the list of attributes, since=
 it is not actually an
@@ -724,6 +736,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We reached the field declaration with visibility, for simplicit=
y we only munch the
         // visibility and put it into `$accum`.
@@ -741,6 +754,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($field $($rest)*),
             @pinned($($pinned)*),
@@ -757,6 +771,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // Some other attribute, just put it into `$accum`.
         @fields_munch(#[$($attr:tt)*] $($rest:tt)*),
@@ -773,6 +788,7 @@ macro_rules! __pin_data {
             @name($name),
             @impl_generics($($impl_generics)*),
             @ty_generics($($ty_generics)*),
+            @decl_generics($($decl_generics)*),
             @where($($whr)*),
             @fields_munch($($rest)*),
             @pinned($($pinned)*),
@@ -789,6 +805,7 @@ macro_rules! __pin_data {
         @name($name:ident),
         @impl_generics($($impl_generics:tt)*),
         @ty_generics($($ty_generics:tt)*),
+        @decl_generics($($decl_generics:tt)*),
         @where($($whr:tt)*),
         // We reached the end of the fields, plus an optional additional c=
omma, since we added one
         // before and the user is also allowed to put a trailing comma.
@@ -802,7 +819,7 @@ macro_rules! __pin_data {
     ) =3D> {
         // Declare the struct with all fields in the correct order.
         $($struct_attrs)*
-        $vis struct $name <$($impl_generics)*>
+        $vis struct $name <$($decl_generics)*>
         where $($whr)*
         {
             $($fields)*
diff --git a/rust/macros/pin_data.rs b/rust/macros/pin_data.rs
index 022e68e9720d..1d4a3547c684 100644
--- a/rust/macros/pin_data.rs
+++ b/rust/macros/pin_data.rs
@@ -10,7 +10,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenStr=
eam) -> TokenStream {
     let (
         Generics {
             impl_generics,
-            decl_generics: _,
+            decl_generics,
             ty_generics,
         },
         rest,
@@ -77,6 +77,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenStr=
eam) -> TokenStream {
         @sig(#(#rest)*),
         @impl_generics(#(#impl_generics)*),
         @ty_generics(#(#ty_generics)*),
+        @decl_generics(#(#decl_generics)*),
         @body(#last),
     });
     quoted.extend(errs);
--=20
2.40.1


