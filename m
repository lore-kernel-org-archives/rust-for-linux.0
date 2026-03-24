Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97073318EDF;
	Tue, 24 Mar 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356160; cv=pass; b=g1PTMK2Cx7k2vvGk9+iircpMVuNsPwR8I2tq34lFdWJAUWF0+AgLnd6APwJtGXiByzgxvm4lJ2EwuAoJBn8gtcR+mX2cpRW2yqinJZDVw63lOGVE/2I+3tq7dttYi3tHWsTzVQ6bmr4GcYSTMvKSwmRCVSicu3B5CyPpvIAXaUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356160; c=relaxed/simple;
	bh=FwNgM5qGJVCwbUbiJmoNO3NP0ASLurqDfjM9QUUwB9s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HGXw5OD7JYmyRzhPEG9X0KNu10I3jG4VyrP1QsmcRqzax8kUSZRrvEd84ct0iQoTHzE/mg+Tzar4CB4Nm1GWd/gl3/i1HD/G/OElLiZSGrXIQ98o6L5ImrRLSAQSWgoa8w1uxHESSbufVQGqnD4krTZzU0Qci1px2xObdPE+6qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UBquMKc9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UBquMKc9"
ARC-Seal: i=1; a=rsa-sha256; t=1774356140; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mSHuF/z6nJEz7k63YuCjPbzK8lDKdzTGTY0WYfmxhp4/v+RXBZcOX746VS1dGOmTkNGXUu19+nHDQYo8V1vLrbfiTJTAyj40JvC8+JGtKR2WkNDanW2f1EZUAAQ1ZbvmEVZ32wlGIDiRl1fkOz1pkO/j0j4th70FiIJHdb1ppgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774356140; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Td396gIDfSO8n+tYcDctCdgTarfV5XxmZToM32S87c=; 
	b=UfNTWDR3TiJxlO8NCofLeSbrhEL9J9+6caKnE3HrdFgsr6BikUAsXldf82dPzlCdsGlopvrQzAxnetlQnWQWV4bgJmLPFVDhgcNm5zh1wJ4PmSj+ahKkgN2TOIOtu84NfEE8RSCEk1Vcwt2BGcse4SRM80qitasxuzSlFjfsV2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774356140;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=7Td396gIDfSO8n+tYcDctCdgTarfV5XxmZToM32S87c=;
	b=UBquMKc9ND2T58yCIl3zy1XqUzYY5AJJ5acyvLjP3UbpCHl2EqH+RciOoN42gIk9
	bKZmEvlkCvHTnHKSimlzzIz3qWf2d7X/OPTV899lA1CtjEq+EJN2S+35gEtm+RA8sgI
	FTJ3RJLFX9EmlsPTCSs27anDSWdoybugrLMIBIAg=
Received: by mx.zohomail.com with SMTPS id 1774356139291760.452374191236;
	Tue, 24 Mar 2026 05:42:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: regulator: do not assume that regulator_get()
 returns non-null
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
Date: Tue, 24 Mar 2026 09:42:02 -0300
Cc: Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jean Delvare <khali@linux-fr.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B177B09-D3AC-4419-A364-4489BF8D6C50@collabora.com>
References: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 24 Mar 2026, at 07:49, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> The Rust `Regulator` abstraction uses `NonNull` to wrap the underlying
> `struct regulator` pointer. When `CONFIG_REGULATOR` is disabled, the C
> stub for `regulator_get` returns `NULL`. `from_err_ptr` does not treat
> `NULL` as an error, so it was passed to `NonNull::new_unchecked`,
> causing undefined behavior.
>=20
> Fix this by using a raw pointer `*mut bindings::regulator` instead of
> `NonNull`. This allows `inner` to be `NULL` when `CONFIG_REGULATOR` is
> disabled, and leverages the C stubs which are designed to handle =
`NULL`
> or are no-ops.
>=20
> Fixes: 9b614ceada7c ("rust: regulator: add a bare minimum regulator =
abstraction")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: =
https://lore.kernel.org/r/20260322193830.89324-1-ojeda@kernel.org

Sorry, this got buried in all the email I get from the list.

Thanks for picking it up, Alice.

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/regulator.rs | 33 ++++++++++++++++++---------------
> 1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> index 4f7837c7e53a..41e730cedc81 100644
> --- a/rust/kernel/regulator.rs
> +++ b/rust/kernel/regulator.rs
> @@ -23,7 +23,10 @@
>     prelude::*,
> };
>=20
> -use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
> +use core::{
> +    marker::PhantomData,
> +    mem::ManuallyDrop, //
> +};
>=20
> mod private {
>     pub trait Sealed {}
> @@ -229,15 +232,17 @@ pub fn devm_enable_optional(dev: &Device<Bound>, =
name: &CStr) -> Result {
> ///
> /// # Invariants
> ///
> -/// - `inner` is a non-null wrapper over a pointer to a `struct
> -///   regulator` obtained from [`regulator_get()`].
> +/// - `inner` is a pointer obtained from a successful call to
> +///   [`regulator_get()`]. It is treated as an opaque token that may =
only be
> +///   accessed using C API methods (e.g., it may be `NULL` if the C =
API returns
> +///   `NULL`).
> ///
> /// [`regulator_get()`]: =
https://docs.kernel.org/driver-api/regulator.html#c.regulator_get
> pub struct Regulator<State>
> where
>     State: RegulatorState,
> {
> -    inner: NonNull<bindings::regulator>,
> +    inner: *mut bindings::regulator,
>     _phantom: PhantomData<State>,
> }
>=20
> @@ -249,7 +254,7 @@ pub fn set_voltage(&self, min_voltage: Voltage, =
max_voltage: Voltage) -> Result
>         // SAFETY: Safe as per the type invariants of `Regulator`.
>         to_result(unsafe {
>             bindings::regulator_set_voltage(
> -                self.inner.as_ptr(),
> +                self.inner,
>                 min_voltage.as_microvolts(),
>                 max_voltage.as_microvolts(),
>             )
> @@ -259,7 +264,7 @@ pub fn set_voltage(&self, min_voltage: Voltage, =
max_voltage: Voltage) -> Result
>     /// Gets the current voltage of the regulator.
>     pub fn get_voltage(&self) -> Result<Voltage> {
>         // SAFETY: Safe as per the type invariants of `Regulator`.
> -        let voltage =3D unsafe { =
bindings::regulator_get_voltage(self.inner.as_ptr()) };
> +        let voltage =3D unsafe { =
bindings::regulator_get_voltage(self.inner) };
>=20
>         to_result(voltage).map(|()| Voltage::from_microvolts(voltage))
>     }
> @@ -270,10 +275,8 @@ fn get_internal(dev: &Device, name: &CStr) -> =
Result<Regulator<T>> {
>             // received from the C code.
>             from_err_ptr(unsafe { =
bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
>=20
> -        // SAFETY: We can safely trust `inner` to be a pointer to a =
valid
> -        // regulator if `ERR_PTR` was not returned.
> -        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> -
> +        // INVARIANT: `inner` is a pointer obtained from =
`regulator_get()`, and
> +        // the call was successful.
>         Ok(Self {
>             inner,
>             _phantom: PhantomData,
> @@ -282,12 +285,12 @@ fn get_internal(dev: &Device, name: &CStr) -> =
Result<Regulator<T>> {
>=20
>     fn enable_internal(&self) -> Result {
>         // SAFETY: Safe as per the type invariants of `Regulator`.
> -        to_result(unsafe { =
bindings::regulator_enable(self.inner.as_ptr()) })
> +        to_result(unsafe { bindings::regulator_enable(self.inner) })
>     }
>=20
>     fn disable_internal(&self) -> Result {
>         // SAFETY: Safe as per the type invariants of `Regulator`.
> -        to_result(unsafe { =
bindings::regulator_disable(self.inner.as_ptr()) })
> +        to_result(unsafe { bindings::regulator_disable(self.inner) })
>     }
> }
>=20
> @@ -349,7 +352,7 @@ impl<T: IsEnabled> Regulator<T> {
>     /// Checks if the regulator is enabled.
>     pub fn is_enabled(&self) -> bool {
>         // SAFETY: Safe as per the type invariants of `Regulator`.
> -        unsafe { bindings::regulator_is_enabled(self.inner.as_ptr()) =
!=3D 0 }
> +        unsafe { bindings::regulator_is_enabled(self.inner) !=3D 0 }
>     }
> }
>=20
> @@ -359,11 +362,11 @@ fn drop(&mut self) {
>             // SAFETY: By the type invariants, we know that `self` =
owns a
>             // reference on the enabled refcount, so it is safe to =
relinquish it
>             // now.
> -            unsafe { bindings::regulator_disable(self.inner.as_ptr()) =
};
> +            unsafe { bindings::regulator_disable(self.inner) };
>         }
>         // SAFETY: By the type invariants, we know that `self` owns a =
reference,
>         // so it is safe to relinquish it now.
> -        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
> +        unsafe { bindings::regulator_put(self.inner) };
>     }
> }
>=20
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260324-regulator-fix-167227abcc92
>=20
> Best regards,
> --=20
> Alice Ryhl <aliceryhl@google.com>
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

