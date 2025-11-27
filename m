Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69851299943;
	Thu, 27 Nov 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764255252; cv=pass; b=eJDNLMYAvZyZe0EqY3ltL4MSz+By7mOzlyvpBkEVy4AUXcjuUqh81kp+Fy0meUZoSXRUbixhc8hlFdEFkX3PdHTbkJP63qGDtMFEfVZ+MvnxQjKCvpvhegvuYR9qu2D96QPQ1TVgRgdvbrcWwxR67VtkohkiuyGlC3x9/0YVVI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764255252; c=relaxed/simple;
	bh=QhK2mWJYE29P/SKyXbgxtEFbEp3GrE6BLZY3FYnE3M4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=or4/56bIFXAgF977ZPmfD3FmnbbDpe6khJBfoshVFpGKaP5Rc9OeoWnMMXb39wkXUSwnK+Y4O0T+DocWgwo1DEv5Em87fuLwCC9I242kQx4ObPZcJB52hvzwRh+V5NbtkYGsvHQw4CoSiJS76dsrhAR1DvwwrF1R4n/Mdb2kODY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=EmtK6Ek1; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EmtK6Ek1"
ARC-Seal: i=1; a=rsa-sha256; t=1764255235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DIZ5UZQjOGDxW7XdMYsm5usU3Kx+ujSYRUlYGOxuniKS/Jdhu+0NDB/7dS9gG+yl1Gcx9/ITpOTBFmPDypmqayNhfHwM8BnJUNRJl09XpPvNCC2jZqgqkHO90Ue0MQZk0xnhs4AEV0yfVj6GfnI0mRO4Yx9ptpfOWqeGH3T7UkM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764255235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lFR2QgvKBVqNvlQZcXqWIutd/vItVCn7odeQqverxYg=; 
	b=SBeSJa9OAwXJxgqliBxJqoLlt/+/mqfclRI6/X4FVbzTsw1CvBVBKZmvn6sSkJERU0l4U4nory1C0jl9vItpbBt8TtGTO4MGaD8BHgttDOrjpAvbhoXW2/F3lUhJB+F3wnUyYJDJZBDD8TdnkJ+caezMZgol4O9SuEVfjhuQXaw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764255235;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=lFR2QgvKBVqNvlQZcXqWIutd/vItVCn7odeQqverxYg=;
	b=EmtK6Ek1Ae5RsTkNOMlJqVck9o/xJadLLeZNmUnE/UVa+WA5AyfLJkbGr1wGxp/c
	/Rq0C56Kgj8H40FP/T7T8Be6hZHC21ubAVJNH3qnGejK9AW6HIwiS7jvPJgM6J2TMc6
	JYoIALfW2jG093XseDaMuxestorQL/zbZOA5Kpmc=
Received: by mx.zohomail.com with SMTPS id 1764255233413209.11945608772805;
	Thu, 27 Nov 2025 06:53:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: io: always inline methods leading to build_assert
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com>
Date: Thu, 27 Nov 2025 11:53:38 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
References: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 27 Nov 2025, at 10:30, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> `build_assert` relies on the compiler to optimize out its error path,
> lest build fails with the dreaded error:
>=20
>    ERROR: modpost: "rust_build_error" =
[drivers/gpu/nova-core/nova_core.ko] undefined!
>=20
> It has been observed that very trivial code performing I/O accesses
> (sometimes even using an immediate value) would seemingly randomly =
fail
> with this error whenever `CLIPPY=3D1` was set. Removing the CLIPPY =
option
> makes the error go away, but that's obviously not a great workaround.
> Clippy appears to influence the way the compiler optimizes things,
> making it on occasion generate a method where we would need it to =
inline
> in order to satisfy a `build_assert`.
>=20
> Fix this by instructing the compiler to always inline the methods
> leading to `build_assert`. This stronger directive is effective even
> when `CLIPPY=3D1` is specified, which gets rid of this error.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This is the same fix as for another build error triggered by the use =
of
> `build_assert` [1], which signals that all callers of this macro =
should
> all be tagged with `#[inline(always)]`, as inlining is a requirement =
for
> `build_assert` to perform properly anyway.
>=20
> [1] https://lore.kernel.org/all/DEEUYUOAEZU3.1J1HM2YQ10EX1@nvidia.com/
> ---
> rust/kernel/io.rs | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 98e8b84e68d1..f161ec8056ce 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -142,7 +142,8 @@ macro_rules! define_read {
>         /// Bound checks are performed on compile time, hence if the =
offset is not known at compile
>         /// time, the build will fail.
>         $(#[$attr])*
> -        #[inline]
> +        // Always inline so the error path of `io_addr_assert` is =
optimized out.
> +        #[inline(always)]
>         pub fn $name(&self, offset: usize) -> $type_name {
>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>=20
> @@ -171,7 +172,8 @@ macro_rules! define_write {
>         /// Bound checks are performed on compile time, hence if the =
offset is not known at compile
>         /// time, the build will fail.
>         $(#[$attr])*
> -        #[inline]
> +        // Always inline so the error path of `io_addr_assert` is =
optimized out.
> +        #[inline(always)]
>         pub fn $name(&self, value: $type_name, offset: usize) {
>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>=20
> @@ -239,7 +241,8 @@ fn io_addr<U>(&self, offset: usize) -> =
Result<usize> {
>         self.addr().checked_add(offset).ok_or(EINVAL)
>     }
>=20
> -    #[inline]
> +    // Always inline so the error path of `build_assert!` is =
optimized out.
> +    #[inline(always)]
>     fn io_addr_assert<U>(&self, offset: usize) -> usize {
>         build_assert!(Self::offset_valid::<U>(offset, SIZE));
>=20
>=20
> ---
> base-commit: ea34511aaf755349999a1067b2984a541bee1492
> change-id: 20251127-io-build-assert-3579a5bfb81c
>=20
> Best regards,
> --=20
> Alexandre Courbot <acourbot@nvidia.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

I also faced this with genmask, by the way, i.e.: using genmask with an
in-bounds constant would trigger a build error. Very confusingly, this =
would be
randomly solved by moving the genmask invocation around in the code.

I wonder if the same fix is needed for it as well?

=E2=80=94 Daniel=
