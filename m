Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31F184E
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Apr 2025 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743973726; cv=none; b=GPkPGVBjUpbuP4CxIxiRlYmOGV9IqDCKGM+nfVLf0m+2p2yyodHmrF//5aR0mng61zXuKW9vNa7ATwSQMiEIOQITuXZ/2ITbPfOTD3JShDPcbiabahEGe8796Rfc+rOUobk8X/YAZhtSI0qgPYiiTIlBaEiifrAfve3UR6hVf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743973726; c=relaxed/simple;
	bh=joQda4jgkZ2vTzUDBwcqEDOrnnv5RL96g7KKFQoXvKU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NcJ+aHDDCuUha+ci9uU9MBHt/9AsW936ld1slrXiqaubPGF+SLmxQo7vzU9do46AlCiI1iM7NQHgEP6VUwtRBd+EAoMZ5vlbWEakfyN6guvy15noWg4qz+F2Ptkd/YJz/n3fJ18ZoG41hef04QAkx/6CkjvAWkkvlM1BWbnh+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hvjwwvNY; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hvjwwvNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743973712; x=1744232912;
	bh=pHxs5KDOMhLzi4BAHzAYwWgnhTazyOMDuW1dMSBYqYE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hvjwwvNYpECe14MDDy67Q1dZvSXtq4xIyKf9Eixr1xGSCJUllaySWn7kPPuLgaHMW
	 HykR6ujQvdKNJPW8MUzMEObJSsq7RtpXomhGwrMKKo4y/6QXj2pIXP0s8E/4MUoAlF
	 3XiYteHk9PYtApFNlK+1mVHg9dEmyOUj+jkX+7C2d6A76O04bSuliw+YA6gGiOnR2g
	 Oo2iz3mpq+PTqOU8v7GJoVk50TVCk61ZiZ0yHbQSPm5c6R6O1f9jm4tziQVokpuN4j
	 qYEh/RGyH3r+Dj06vAMuaeEuTjz8G/p1wA7PU+lnkJFeyj4y22Ik782BROc50BAB+A
	 K5J2YuIxcLcKQ==
Date: Sun, 06 Apr 2025 21:08:29 +0000
To: Xizhe Yin <xizheyin@smail.nju.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/1] rust: convert raw URLs to Markdown autolinks in comments
Message-ID: <D8ZV2Z6PQZ7U.369MTY52EHG7B@proton.me>
In-Reply-To: <2F653D0EC21DAB8D+20250406121656.31901-1-xizheyin@smail.nju.edu.cn>
References: <2F653D0EC21DAB8D+20250406121656.31901-1-xizheyin@smail.nju.edu.cn>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: dab5e29023e7550257c436768a96c4d2fb0d5283
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 6, 2025 at 2:16 PM CEST, Xizhe Yin wrote:
> From: xizheyin <xizheyin@smail.nju.edu.cn>
>
> Some comments in Rust files use raw URLs (http://example.com) rather
> than Markdown autolinks <URL>. This inconsistency makes the
> documentation less uniform and harder to maintain.
>
> This patch converts all remaining raw URLs in Rust code comments to use
> the Markdown autolink format, maintaining consistency with the rest of
> the codebase which already uses this style.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1153
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: xizheyin <xizheyin@smail.nju.edu.cn>
> ---
>  rust/kernel/alloc/kbox.rs               | 2 +-
>  rust/kernel/block/mq/gen_disk.rs        | 2 +-
>  rust/kernel/std_vendor.rs               | 2 +-
>  rust/kernel/sync/arc.rs                 | 2 +-
>  rust/pin-init/examples/pthread_mutex.rs | 2 +-
>  rust/pin-init/src/lib.rs                | 2 +-
>  scripts/generate_rust_target.rs         | 4 ++--
>  7 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index b77d32f3a58b..604d12c6f5bd 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -101,7 +101,7 @@
>  pub type KVBox<T> =3D Box<T, super::allocator::KVmalloc>;
> =20
>  // SAFETY: All zeros is equivalent to `None` (option layout optimization=
 guarantee:
> -// https://doc.rust-lang.org/stable/std/option/index.html#representation=
).
> +// <https://doc.rust-lang.org/stable/std/option/index.html#representatio=
n>).
>  unsafe impl<T, A: Allocator> ZeroableOption for Box<T, A> {}
> =20
>  // SAFETY: `Box` is `Send` if `T` is `Send` because the `Box` owns a `T`=
.
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_=
disk.rs
> index 14806e1997fd..cd54cd64ea88 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -129,7 +129,7 @@ pub fn build<T: Operations>(
>              get_unique_id: None,
>              // TODO: Set to THIS_MODULE. Waiting for const_refs_to_stati=
c feature to
>              // be merged (unstable in rustc 1.78 which is staged for lin=
ux 6.10)
> -            // https://github.com/rust-lang/rust/issues/119618
> +            // <https://github.com/rust-lang/rust/issues/119618>
>              owner: core::ptr::null_mut(),
>              pr_ops: core::ptr::null_mut(),
>              free_disk: None,
> diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
> index 279bd353687a..abbab5050cc5 100644
> --- a/rust/kernel/std_vendor.rs
> +++ b/rust/kernel/std_vendor.rs
> @@ -148,7 +148,7 @@ macro_rules! dbg {
>      };
>      ($val:expr $(,)?) =3D> {
>          // Use of `match` here is intentional because it affects the lif=
etimes
> -        // of temporaries - https://stackoverflow.com/a/48732525/1063961
> +        // of temporaries - <https://stackoverflow.com/a/48732525/106396=
1>
>          match $val {
>              tmp =3D> {
>                  $crate::pr_info!("[{}:{}:{}] {} =3D {:#?}\n",
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 8484c814609a..350c380bb8d4 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -135,7 +135,7 @@ pub struct Arc<T: ?Sized> {
>      // meaningful with respect to dropck - but this may change in the fu=
ture so this is left here
>      // out of an abundance of caution.
>      //
> -    // See https://doc.rust-lang.org/nomicon/phantom-data.html#generic-p=
arameters-and-drop-checking
> +    // See <https://doc.rust-lang.org/nomicon/phantom-data.html#generic-=
parameters-and-drop-checking>
>      // for more detail on the semantics of dropck in the presence of `Ph=
antomData`.
>      _p: PhantomData<ArcInner<T>>,
>  }
> diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/exam=
ples/pthread_mutex.rs
> index 9164298c44c0..5ac22f1880d2 100644
> --- a/rust/pin-init/examples/pthread_mutex.rs
> +++ b/rust/pin-init/examples/pthread_mutex.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
> =20
> -// inspired by https://github.com/nbdd0121/pin-init/blob/trunk/examples/=
pthread_mutex.rs
> +// inspired by <https://github.com/nbdd0121/pin-init/blob/trunk/examples=
/pthread_mutex.rs>
>  #![allow(clippy::undocumented_unsafe_blocks)]
>  #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
>  #[cfg(not(windows))]
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 05c44514765e..0806c689f693 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1447,7 +1447,7 @@ macro_rules! impl_zeroable {
>      {<T: ?Sized + Zeroable>} UnsafeCell<T>,
> =20
>      // SAFETY: All zeros is equivalent to `None` (option layout optimiza=
tion guarantee:
> -    // https://doc.rust-lang.org/stable/std/option/index.html#representa=
tion).
> +    // <https://doc.rust-lang.org/stable/std/option/index.html#represent=
ation>).

These two instances from pin-init are already fixed upstream, see [1].
So please remove them from this patch.

[1]: https://github.com/Rust-for-Linux/pin-init/commit/fdc7061e192a048a8279=
3da0ec444e154b51d5f7

---
Cheers,
Benno

>      Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<No=
nZeroU64>,
>      Option<NonZeroU128>, Option<NonZeroUsize>,
>      Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<No=
nZeroI64>,
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 4fd6b6ab3e32..03abfa693cbf 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -207,7 +207,7 @@ fn main() {
>              // target feature of the same name plus the other two target=
 features in
>              // `clang/lib/Driver/ToolChains/Arch/X86.cpp`. These should =
be eventually enabled via
>              // `-Ctarget-feature` when `rustc` starts recognizing them (=
or via a new dedicated
> -            // flag); see https://github.com/rust-lang/rust/issues/11685=
2.
> +            // flag); see <https://github.com/rust-lang/rust/issues/1168=
52>.
>              features +=3D ",+retpoline-external-thunk";
>              features +=3D ",+retpoline-indirect-branches";
>              features +=3D ",+retpoline-indirect-calls";
> @@ -216,7 +216,7 @@ fn main() {
>              // The kernel uses `-mharden-sls=3Dall`, which Clang maps to=
 both these target features in
>              // `clang/lib/Driver/ToolChains/Arch/X86.cpp`. These should =
be eventually enabled via
>              // `-Ctarget-feature` when `rustc` starts recognizing them (=
or via a new dedicated
> -            // flag); see https://github.com/rust-lang/rust/issues/11685=
1.
> +            // flag); see <https://github.com/rust-lang/rust/issues/1168=
51>.
>              features +=3D ",+harden-sls-ijmp";
>              features +=3D ",+harden-sls-ret";
>          }


