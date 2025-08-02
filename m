Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D502AD5A
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 00:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754094152; cv=none; b=KTACDVvp7Ysriz9bj3gusDqPzce/dG5ztH6wIcquyKLxDpf5patQ70C+LidV5XzUNE+uQpCwHD48hY45OKk3uxhI++bo8BN/Y55xKs8N9Tnxo1vrfHzwJIF2Df/u+hYFI+OAhNuFYoz+SGTsRppscVzN9VwjdM6aO0mKEzYPf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754094152; c=relaxed/simple;
	bh=uTJTfhWAzVCMobZHksvu2Q80RgsB7v6JtR7CKXzTaeo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=S6U/bRkHRbrJGgsy2e9/QNWhdiy1qbfoQBvFyEI302egns2eHPEy6uARFBixXkJ6/tNDdjrFTVKSfvPfRCwY50TwOLWx3vgB6aaqY5pQphVoClaMyyYZYiygJsgijrEEBPqLjQ5eQcd5SLHlumt40VOB81BXaj45XsCyPMKVdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ini2WPGt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ini2WPGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA21C4CEE7;
	Sat,  2 Aug 2025 00:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754094151;
	bh=uTJTfhWAzVCMobZHksvu2Q80RgsB7v6JtR7CKXzTaeo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Ini2WPGtrLX11aQdlFkTVvqGOx2+7nHixz5thib/PsXovgW+xH+7a3/vT0Br5romn
	 ddsiIW1jvW4p5mjhOMkH9/lzJ2cJsJgizcy881Q75gwBPXgBT2EMueMXnNz+UIibM1
	 Y5IK4mejZ2BSfmoL/PpknlF3g0YbMDE7eUGUSTBEDxaVJRzUrxjGYJA0CmRtlwPPES
	 imWzqzj1WhwbQC1Abmxt59zsPmyyU/6Z/Bu6FK5nmxksgDgtE7ySjVdgVT94f3EUUD
	 NoqmzGgrF5eOefIRKpGP/EjTd+mljJqdolJc7uC7yeYNXBYyKQ2pVSm9PTLUdpU7rT
	 0Pasvbv8QtJug==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 02:22:27 +0200
Message-Id: <DBRIHAWZYNIC.14XQR6E6VLQ8Y@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <F8F4578D-9095-48D4-BC21-67177F2DDD6F@collabora.com>
In-Reply-To: <F8F4578D-9095-48D4-BC21-67177F2DDD6F@collabora.com>

On Fri Aug 1, 2025 at 7:14 PM CEST, Daniel Almeida wrote:
>> +impl DeviceId {
>> +    const I2C_NAME_SIZE: usize =3D 20;
>> +
>> +    /// Create a new device id from an I2C 'id' string.
>> +    #[inline(always)]
>> +    pub const fn new(id: &'static CStr) -> Self {
>> +        build_assert!(
>> +            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
>> +            "ID exceeds 20 bytes"
>> +        );
>> +        let src =3D id.as_bytes_with_nul();
>> +        // Replace with `bindings::acpi_device_id::default()` once stab=
ilized for `const`.
>> +        // SAFETY: FFI type is valid to be zero-initialized.
>> +        let mut i2c: bindings::i2c_device_id =3D unsafe { core::mem::ze=
roed() };
>> +        let mut i =3D 0;
>> +        while i < src.len() {
>> +            i2c.name[i] =3D src[i];
>> +            i +=3D 1;
>> +        }
>
> Nit:=20
>
> for i in 0..src.len() {
>
> }
>
> Saves you from manually keeping track of the loop variable.

That would be nice, but we can't do this in cost context. :(

>> +// SAFETY: Instances of `Device` are always reference-counted.
>> +unsafe impl crate::types::AlwaysRefCounted for Device {
>> +    fn inc_ref(&self) {
>> +        // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
>> +    }
>> +
>> +    unsafe fn dec_ref(obj: NonNull<Self>) {
>> +        // SAFETY: The safety requirements guarantee that the refcount =
is non-zero.
>> +        unsafe { bindings::put_device(addr_of_mut!((*obj.as_ref().as_ra=
w()).dev)) }
>> +    }
>> +}
>> +
>> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<=
Ctx> {
>> +    fn as_ref(&self) -> &device::Device<Ctx> {
>> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is =
a pointer to a valid
>> +        // `struct i2c_client`.
>> +        let dev =3D unsafe { addr_of_mut!((*self.as_raw()).dev) };
>
> &raw mut
>
> I also wonder whether this unsafe block can be made shorter, as only the
> dereference is unsafe.

No, this would create a temporary value.
