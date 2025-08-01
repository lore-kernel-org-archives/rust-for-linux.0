Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596BB1A0BFD
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071194; cv=pass; b=B3ECbJXf4zfNlDBHOgDprc0oL7kGNWRggLwa+dtur5M5+/maKIRwOvgOsbxtN+U/iIuMyFYYIrj5rRXOIfG1DFm6o8k6YJMl2bKxajg1Ifl1Pqac4p9pEwq7KIuDLJ5fgtrrjtm8cMsVzRGYV8ZL5tlV4etfm53Ax7EELMX2mPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071194; c=relaxed/simple;
	bh=khtb7rwC0+4HZrCKdp3xDTEIu2L+dZkYB9LLvsUNT+0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DLTnIfw16h0O+l0PmPg61MrLxxtvHnHXNC99mCFn6vnbaUe4VqVJ5iyHHN4kaTrlw4Ph8rPeQbRlEojjChXHEMW0uUDBThBrSRfvkryId98RsXk2QGwpgeYVB81yAyQdkLLBRKKnoBZ8LNvbVcGMpJBeDWTs/KScYrPVh7gUZlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=cHwC3szg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="cHwC3szg"
ARC-Seal: i=1; a=rsa-sha256; t=1754071178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nWEaJictGbdXRslC89ia0L8HG8Umr8IhYeX7Oidmr1w908zq7fn4sySe9MbId9UzzFBrIpmt4w9+RuWaWz//Rc+XFt0IeVCJQIB6yorWv9wtu6rHkMQPVsukbLyEFLsih979Y2r3xM0/9lanG8pRxwO7WswV1z9yawFBMEHRV6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754071178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GUKKJYqT+hjyXfnMHC3N3ZaDSWTN2cn6Ni+REED0K0k=; 
	b=NeM6y93txa0pZEhnhR+cLnE8IE+5VNGLNOAU8326wDAciig7MYQfg5SBV3ioi9r5xv0mtvtxRZU8Xx6f9oRa7KwWz5F1S6NAXfNcnTXqN2eJTlQ1D/IAlEIzWq+TwJoAjK41jxsR3iQe5h+JUq5N4RM6RJcxPy9BJK0WN0Werls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754071177;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=GUKKJYqT+hjyXfnMHC3N3ZaDSWTN2cn6Ni+REED0K0k=;
	b=cHwC3szghwfgTWFpKikzuz5iS8tEIGr7R4xUr0QPqRwwKtgtDaYLdNXQpZedTkmw
	FcQuq/zIE/bO4gWnOuswoAt1ne8JDCIx/KwoiCb2zMYlUEVekkQFKlTG7p/4ic499s8
	wdxmrPdwFUBYHX8p5R2z5jcix6Phi3ZnafPSSLIE=
Received: by mx.zohomail.com with SMTPS id 175407117466773.72300403914551;
	Fri, 1 Aug 2025 10:59:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 2/3] rust: i2c: add manual I2C device creation
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250801154438.14759-1-igor.korotin.linux@gmail.com>
Date: Fri, 1 Aug 2025 14:59:19 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A5DDD914-C07D-41C6-83C4-5ED9730D8A5B@collabora.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154438.14759-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Igor,

> On 1 Aug 2025, at 12:44, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> In addition to the basic I2C device support, added rust abstractions
> upon `i2c_new_client_device`/`i2c_unregister_device` C functions.
>=20
> Implement the core abstractions needed for manual creation/deletion
> of I2C devices, including:
>=20
> * `i2c::Registration` =E2=80=94 a NonNull pointer created by the =
function
>                          `i2c_new_client_device`
>=20
> * `i2c::I2cAdapterRef` =E2=80=94 a safe reference around `struct =
i2c_adapter`
>=20
> * `i2c::I2cBoardInfo` =E2=80=94 a safe wrapper around `struct =
i2c_board_info`
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> rust/kernel/i2c.rs | 111 ++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 109 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index fafcae92cfdb..bbdc41124fd8 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -139,7 +139,6 @@ extern "C" fn probe_callback(pdev: *mut =
bindings::i2c_client) -> kernel::ffi::c_
>         let info =3D
>             Self::i2c_id_info(pdev).or_else(|| <Self as =
driver::Adapter>::id_info(pdev.as_ref()));
>=20
> -

Unrelated change?

>         from_result(|| {
>             let data =3D T::probe(pdev, info)?;
>=20
> @@ -312,6 +311,77 @@ fn shutdown(dev: &Device<device::Core>) {
>     }
> }
>=20
> +/// The i2c adapter reference
> +///
> +/// This represents the Rust abstraction for a reference to an =
existing
> +/// C `struct i2c_adapter`.
> +///
> +/// # Invariants
> +///
> +/// A [`I2cAdapterRef`] instance represents a valid `struct =
i2c_adapter` created by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);

Is there a plan for an owned version? Otherwise I=E2=80=99d personally =
drop the
=E2=80=9CRef=E2=80=9D nomenclature.

> +
> +impl I2cAdapterRef {
> +    fn as_raw(&self) -> *mut bindings::i2c_adapter {
> +        self.0.as_ptr()
> +    }
> +
> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Option<Self> {
> +        // SAFETY: `index` must refer to a valid I2C adapter; the =
kernel
> +        // guarantees that `i2c_get_adapter(index)` returns either a =
valid
> +        // pointer or NULL. `NonNull::new` guarantees the correct =
check.
> +        let adapter =3D NonNull::new(unsafe { =
bindings::i2c_get_adapter(index) })?;
> +        Some(Self(adapter))
> +    }
> +}
> +
> +impl Drop for I2cAdapterRef {
> +    fn drop(&mut self) {
> +        // SAFETY: This `I2cAdapterRef` was obtained from =
`i2c_get_adapter`,
> +        // and calling `i2c_put_adapter` exactly once will correctly =
release
> +        // the reference count in the I2C core. It is safe to call =
from any context
> +        unsafe { bindings::i2c_put_adapter(self.as_raw()) }

Should this implement AlwasyRefCounted?

> +    }
> +}
> +
> +/// The i2c board info representation
> +///
> +/// This structure represents the Rust abstraction for a C `struct =
i2c_board_info` structure,
> +/// which is used for manual I2C client creation.
> +#[repr(transparent)]
> +pub struct I2cBoardInfo(bindings::i2c_board_info);
> +
> +impl I2cBoardInfo {
> +    const I2C_TYPE_SIZE: usize =3D 20;
> +    /// Create a new board=E2=80=90info for a kernel driver.
> +    #[inline(always)]
> +    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> +        build_assert!(
> +            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> +            "Type exceeds 20 bytes"
> +        );
> +        let src =3D type_.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once =
stabilized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c_board_info: bindings::i2c_board_info =3D unsafe { =
core::mem::zeroed() };
> +        let mut i: usize =3D 0;
> +        while i < src.len() {
> +            i2c_board_info.type_[i] =3D src[i];
> +            i +=3D 1;
> +        }

Same comment as the last patch.

> +
> +        i2c_board_info.addr =3D addr;
> +        Self(i2c_board_info)
> +    }
> +
> +    fn as_raw(&self) -> *const bindings::i2c_board_info {
> +        &self.0 as *const _
> +    }
> +}
> +
> /// The i2c client representation.
> ///
> /// This structure represents the Rust abstraction for a C `struct =
i2c_client`. The
> @@ -340,7 +410,7 @@ fn as_raw(&self) -> *mut bindings::i2c_client {
> kernel::impl_device_context_into_aref!(Device);
>=20
> // SAFETY: Instances of `Device` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for Device {
> +unsafe impl<Ctx: device::DeviceContext> =
crate::types::AlwaysRefCounted for Device<Ctx> {
>     fn inc_ref(&self) {
>         // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>         unsafe { bindings::get_device(self.as_ref().as_raw()) };
> @@ -389,3 +459,40 @@ unsafe impl Send for Device {}
> // SAFETY: `Device` can be shared among threads because all methods of =
`Device`
> // (i.e. `Device<Normal>) are thread safe.
> unsafe impl Sync for Device {}
> +
> +/// The registration of an i2c client device.
> +///
> +/// This type represents the registration of a [`struct i2c_client`]. =
When an instance of this
> +/// type is dropped, its respective i2c client device will be =
unregistered from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and =
registered
> +/// [`struct i2c_client`].
> +#[repr(transparent)]
> +pub struct Registration(NonNull<bindings::i2c_client>);
> +
> +impl Registration {
> +    /// The C `i2c_new_client_device` function wrapper for manual I2C =
client creation.
> +    pub fn new(i2c_adapter: &I2cAdapterRef, i2c_board_info: =
&I2cBoardInfo) -> Result<Self> {
> +        // SAFETY: the kernel guarantees that =
`i2c_new_client_device()` returns either a valid
> +        // pointer or NULL. `NonNull::new` guarantees the correct =
check.
> +        let raw_dev =3D from_err_ptr(unsafe {
> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), =
i2c_board_info.as_raw())
> +        })?;
> +
> +        Ok(Self(NonNull::new(raw_dev).unwrap()))
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
> +    }
> +}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released =
from any thread.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released =
from any thread.
> +unsafe impl Sync for Registration {}

A `Device` ?

> --=20
> 2.43.0
>=20
>=20

=E2=80=94 Daniel

