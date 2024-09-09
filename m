Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8D13B294
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Sep 2024 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898769; cv=none; b=e1LXZFQWTMxAWrmlJKPNZHGC7ZnBxrXa/edQ2TKy3BpsqQTHM16l2IDJI2FbRf3unCA4yDH7osFMlMRif830Ai8yoPfRiLJPX5PILmwWJaLctXI6NFpWCuTKQ3T0TIoxGff4O3vPmzR8yj+l2fF5WJx8G4bBp7luPkbCdo+wvjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898769; c=relaxed/simple;
	bh=G7FTe1LqeS7Uk4OGYJzaZZmJ1cJZtom4ayWhKI9UPb4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DF/e/xIecWcdLIrFHDopnsSmjXeNQJAJ/OqrXPORdSTS/TpcsRsTUNegLd/9x8wOFs/j9lrv2CsDF09kLvyvgtUlX2ywv4O/aFs9Est7JPLG5ppNLuFhT2vcnqSObcHyQgdn6iwooEZHq9aj1TJTJlVzr30GJ22QMK3Bh8+PHs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JPuTgSIl; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JPuTgSIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1725898758; x=1726157958;
	bh=Ox7IrmQKDEgA9ZEly234WH62t3pyCHYaSFW+uQbQK8w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JPuTgSIlzJ3EJt0AtJmPUOA/gjwQfR95BN66HirUQbQkVIJpqSm9iJiflNBhTtcvX
	 gu3ASb9fv2Vc/svkn7PJviYNwpcFk4PoQH2ZsjYhwI1DIosfHYcQ5/WC87xQyu8zsp
	 C26a//vdKVzkEYWUVaThcZRZIAWqTv0qhObnVc0lo69VM7vAsQW+AOQdh4KkwG3HN0
	 ng9IadTn8PXbx1qzca5jQUsXceCq6Pqdu5Ed7UKPXD/3Bv+2L+GWAf95DwB1PomHla
	 uZyQ3vl+yR0r+OFwMszRKe5lc2WjPmF4tC5gmBO/M+eMCMKGrYfGnBhv5WOAPE6DBb
	 MELxXygHeg5AQ==
Date: Mon, 09 Sep 2024 16:19:14 +0000
To: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com, ojeda@kernel.org, alex.gaynor@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: error.rs: Remove dead_code marker and make from_err_ptr, from_result and to_ptr public
Message-ID: <9de931c7-4a58-4311-90dd-11a46e7bc4b5@proton.me>
In-Reply-To: <DM4PR14MB72767619350CA0C447D9A965E9982@DM4PR14MB7276.namprd14.prod.outlook.com>
References: <DM4PR14MB72767619350CA0C447D9A965E9982@DM4PR14MB7276.namprd14.prod.outlook.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c0954706f1fbc2876cfd1fa9accc74291928a1f9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I see that this is your first kernel contribution, welcome!
I have left a couple comments below; before you send a new version,
please wait a couple days for other people to also leave their feedback.
You then create a new version (add `-v2` to `git format-patch`) and send
it to the list. Then rinse and repeat until it gets merged.

On 08.09.24 17:24, Filipe Xavier wrote:
> Remove dead_code annotation from from_err_ptr, from_result and to_ptr fun=
ctions in error.rs file and change visibility to public, making it accessib=
le outside the kernel crate(issue #1105).

Please wrap your commit message to 72 columns.

Also your commit title is a bit verbose, additionally we don't put the
filename into the title.

In your message and in the title I would also state the more important
changes first. To me the change to public is much more important than
removing the `dead_code` annotation. I wouldn't even put that in the
title.

>=20
> Signed-off-by: Filipe Xavier <felipe_life@live.com>
> ---
>  rust/kernel/error.rs | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 6f1587a2524e..ecfa6aa41034 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -133,8 +133,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_st=
atus_t {
>      }
>=20
>      /// Returns the error encoded as a pointer.
> -    #[allow(dead_code)]
> -    pub(crate) fn to_ptr<T>(self) -> *mut T {
> +    pub fn to_ptr<T>(self) -> *mut T {
>          #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_=
conversion))]
>          // SAFETY: `self.0` is a valid error due to its invariant.
>          unsafe {
> @@ -268,9 +267,7 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>  ///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(p=
dev.to_ptr(), index) })
>  /// }
>  /// ```
> -// TODO: Remove `dead_code` marker once an in-kernel client is available=
.
> -#[allow(dead_code)]
> -pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
> +pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
>      // CAST: Casting a pointer to `*const core::ffi::c_void` is always v=
alid.
>      let const_ptr: *const core::ffi::c_void =3D ptr.cast();
>      // SAFETY: The FFI function does not deref the pointer.
> @@ -315,9 +312,7 @@ pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<=
*mut T> {
>  ///     })
>  /// }
>  /// ```
> -// TODO: Remove `dead_code` marker once an in-kernel client is available=
.
> -#[allow(dead_code)]
> -pub(crate) fn from_result<T, F>(f: F) -> T
> +pub fn from_result<T, F>(f: F) -> T
>  where
>      T: From<i16>,
>      F: FnOnce() -> Result<T>,
> --
> 2.46.0

The changes themselves look good!

---
Cheers,
Benno

