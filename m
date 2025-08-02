Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A4A48
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 00:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754093568; cv=none; b=TJbNrOXUm+/38Vjo4qYRgzSey3z+WOR9Oe2uUtqYf/3sFDd4H0p73yuDlh6uslBpgfHSaS9llYhK4zJjmNQzv6fBSTiiRCD336cSllb8VrWOAhv4CYKcPPrI0d/kUoAypmzU6Qrm8d5MOURBqz3vx4dCkYu0f6Jwl1NnlcOSu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754093568; c=relaxed/simple;
	bh=wS4DlrwoK+O6FW3wQc71X9mT3b3qA8PrsrX/NNTbd1o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iMVK/EHMbru5FnTu7q0dMJ5YgEzGtLp6UkDbXhJiYsDX1DRkxqEcoRtui3Yxqe2NEZnAl5bvU8akq1ndK+lrAFPJzJUMfKGi2Q5JfipRotLk5V6b28utiM6JWbVW1pcwQ/tMJ3flrUV43QDfI5OgjmtKUJVuoDBi/rrt6ejHi9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfalZzfs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfalZzfs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEB4C4CEE7;
	Sat,  2 Aug 2025 00:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754093565;
	bh=wS4DlrwoK+O6FW3wQc71X9mT3b3qA8PrsrX/NNTbd1o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KfalZzfsc+TKQRd9l0EbNwTeDLgoHLkg+brzUfDZ6SWOwXSO0KYjv5tN8n9OArB3E
	 4prW2P+HMYy8P2QUhno0GXhCcFO6g3HN8kCAgtpyQ6jPcCovDxra56v6YKF7eXcwid
	 hqnKEMwPR5GDHjowEa+B/xLzbSHsUoPg6IRXkILxwx1CIoT2wCx0hzLzfKWc6alyqB
	 8Lcsidm03DOPpCSZbEB5kquhdMGGsUk+Q3obETuMcgFi0/mVR1rE1s0sahC2CWEiVP
	 5iBN3rNxk9LD2ZSJtHJjYMK4KVq43zk6gqKCIjTgYkPnl3ixyUBS7z2SGKxQbTXSDb
	 G/2JnvK4CJLRA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 02:12:42 +0200
Message-Id: <DBRI9TYC29M4.H6WZZ0KQKCOK@kernel.org>
Subject: Re: [PATCH v3 2/3] rust: i2c: add manual I2C device creation
 abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154438.14759-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250801154438.14759-1-igor.korotin.linux@gmail.com>

On Fri Aug 1, 2025 at 5:44 PM CEST, Igor Korotin wrote:
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index fafcae92cfdb..bbdc41124fd8 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -139,7 +139,6 @@ extern "C" fn probe_callback(pdev: *mut bindings::i2c=
_client) -> kernel::ffi::c_
>          let info =3D
>              Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>=
::id_info(pdev.as_ref()));
> =20
> -

Seems like this hunk should be in patch 1.

>          from_result(|| {
>              let data =3D T::probe(pdev, info)?;
> =20
> @@ -312,6 +311,77 @@ fn shutdown(dev: &Device<device::Core>) {
>      }
>  }
> =20
> +/// The i2c adapter reference
> +///
> +/// This represents the Rust abstraction for a reference to an existing
> +/// C `struct i2c_adapter`.
> +///
> +/// # Invariants
> +///
> +/// A [`I2cAdapterRef`] instance represents a valid `struct i2c_adapter`=
 created by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);
> +
> +impl I2cAdapterRef {
> +    fn as_raw(&self) -> *mut bindings::i2c_adapter {
> +        self.0.as_ptr()
> +    }
> +
> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Option<Self> {
> +        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
> +        // guarantees that `i2c_get_adapter(index)` returns either a val=
id
> +        // pointer or NULL. `NonNull::new` guarantees the correct check.
> +        let adapter =3D NonNull::new(unsafe { bindings::i2c_get_adapter(=
index) })?;
> +        Some(Self(adapter))
> +    }

I think this should just return Result<Self> and if i2c_get_adapter() is NU=
LL it
should just return ENOENT.

> +}
> +
> +impl Drop for I2cAdapterRef {
> +    fn drop(&mut self) {
> +        // SAFETY: This `I2cAdapterRef` was obtained from `i2c_get_adapt=
er`,
> +        // and calling `i2c_put_adapter` exactly once will correctly rel=
ease
> +        // the reference count in the I2C core. It is safe to call from =
any context
> +        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
> +    }
> +}
> +
> +/// The i2c board info representation
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_b=
oard_info` structure,
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
> +        // Replace with `bindings::acpi_device_id::default()` once stabi=
lized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c_board_info: bindings::i2c_board_info =3D unsafe { co=
re::mem::zeroed() };
> +        let mut i: usize =3D 0;
> +        while i < src.len() {
> +            i2c_board_info.type_[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        i2c_board_info.addr =3D addr;
> +        Self(i2c_board_info)
> +    }
> +
> +    fn as_raw(&self) -> *const bindings::i2c_board_info {
> +        &self.0 as *const _

I think we don't need this cast.

> +    }
> +}
> +
>  /// The i2c client representation.
>  ///
>  /// This structure represents the Rust abstraction for a C `struct i2c_c=
lient`. The
> @@ -340,7 +410,7 @@ fn as_raw(&self) -> *mut bindings::i2c_client {
>  kernel::impl_device_context_into_aref!(Device);
> =20
>  // SAFETY: Instances of `Device` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for Device {
> +unsafe impl<Ctx: device::DeviceContext> crate::types::AlwaysRefCounted f=
or Device<Ctx> {

I think you forgot to remove this change.

In case it's intentional, it's wrong. We can't allow the existance of an
ARef<Device<Ctx>>, where Ctx is anything else than device::Normal. All devi=
ce
contexts other than Normal are bound to a specific scope and must only ever
exist as reference, e.g. &Device<Bound>.

>      fn inc_ref(&self) {
>          // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
>          unsafe { bindings::get_device(self.as_ref().as_raw()) };
> @@ -389,3 +459,40 @@ unsafe impl Send for Device {}
>  // SAFETY: `Device` can be shared among threads because all methods of `=
Device`
>  // (i.e. `Device<Normal>) are thread safe.
>  unsafe impl Sync for Device {}
> +
> +/// The registration of an i2c client device.
> +///
> +/// This type represents the registration of a [`struct i2c_client`]. Wh=
en an instance of this
> +/// type is dropped, its respective i2c client device will be unregister=
ed from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and register=
ed
> +/// [`struct i2c_client`].
> +#[repr(transparent)]
> +pub struct Registration(NonNull<bindings::i2c_client>);
> +
> +impl Registration {
> +    /// The C `i2c_new_client_device` function wrapper for manual I2C cl=
ient creation.
> +    pub fn new(i2c_adapter: &I2cAdapterRef, i2c_board_info: &I2cBoardInf=
o) -> Result<Self> {
> +        // SAFETY: the kernel guarantees that `i2c_new_client_device()` =
returns either a valid
> +        // pointer or NULL. `NonNull::new` guarantees the correct check.
> +        let raw_dev =3D from_err_ptr(unsafe {
> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_bo=
ard_info.as_raw())
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
> +// SAFETY: A `Device` is always reference-counted and can be released fr=
om any thread.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released fr=
om any thread.
> +unsafe impl Sync for Registration {}
> --=20
> 2.43.0

