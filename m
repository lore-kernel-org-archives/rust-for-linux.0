Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865D3207
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754094407; cv=none; b=o9KCQXQuFTe+u9MlbJWl23923uSXT2xZkOdBn25EhU6vw1PwTfyXhNyEjzakjZooU1fTl1BrQIFI2VC2kin8xlqzMcbxXQIDDt+UwwFW80hLx4HM5V2mihZrCP1Z9a+HjR+CDcsHIHEo0mlNTJgF8JSUuvFaHaivOGDs/lK7sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754094407; c=relaxed/simple;
	bh=FUFUg6+K4AaBxpnH8mZ2GCZ+QRVs+eZyJQkleUKtraU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=EkaTRUvJHNd2h9OaAGLVsMD2D8uSZQ6xCoko4tU5ZBaaA/5QE9y3RqTGrc62SbfOB/pC3d7sefe8a+TpgjBIIqWmAYKS9jnW7Zz3jV7HjQ8PsITcckE8cwMu5AoZlFHgJ95ftnzsFZzM1QldMlWcM9+oyYDmIYh3MSdy0VKa0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQd7csJw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQd7csJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFD8C4CEE7;
	Sat,  2 Aug 2025 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754094406;
	bh=FUFUg6+K4AaBxpnH8mZ2GCZ+QRVs+eZyJQkleUKtraU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=XQd7csJwE+BwQHiGmcce0FO/keLr7EECe+HfonUffWsxIi+ssiIMFY6bUnZFvTMrO
	 Yeoi1oYP6+RJX2ru4cTo0gQ8hGNqJHM1DoAkAk2SOxd7owqAyGhsV/PNNAgFBMwn97
	 zDCpLFbxAKihyIlKX3eJD9TWUb6k0wjXoGTkAjW7QKKUcrw65+p1DF/86EL55VBigy
	 13gRQxuTjw1Zh+SIrIQfv1v2gHSeZOYeZRCqK6EMONOUgixVg564bLxA2yPcF7wkKN
	 EJyEcGvmr7M64ZAlP/InwL+fljlXf2/r7/1p1H9SAbE0nP95whGh23T6oLSviS4zSZ
	 ARfH4Qc8CMdoQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 02:26:42 +0200
Message-Id: <DBRIKK3NT7EK.IIK91AWAOHDP@kernel.org>
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 2/3] rust: i2c: add manual I2C device creation
 abstractions
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154438.14759-1-igor.korotin.linux@gmail.com>
 <A5DDD914-C07D-41C6-83C4-5ED9730D8A5B@collabora.com>
In-Reply-To: <A5DDD914-C07D-41C6-83C4-5ED9730D8A5B@collabora.com>

On Fri Aug 1, 2025 at 7:59 PM CEST, Daniel Almeida wrote:
>> +/// The i2c adapter reference
>> +///
>> +/// This represents the Rust abstraction for a reference to an existing
>> +/// C `struct i2c_adapter`.
>> +///
>> +/// # Invariants
>> +///
>> +/// A [`I2cAdapterRef`] instance represents a valid `struct i2c_adapter=
` created by the C portion of
>> +/// the kernel.
>> +#[repr(transparent)]
>> +pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);
>
> Is there a plan for an owned version? Otherwise I=E2=80=99d personally dr=
op the
> =E2=80=9CRef=E2=80=9D nomenclature.
>
>> +
>> +impl I2cAdapterRef {
>> +    fn as_raw(&self) -> *mut bindings::i2c_adapter {
>> +        self.0.as_ptr()
>> +    }
>> +
>> +    /// Gets pointer to an `i2c_adapter` by index.
>> +    pub fn get(index: i32) -> Option<Self> {
>> +        // SAFETY: `index` must refer to a valid I2C adapter; the kerne=
l
>> +        // guarantees that `i2c_get_adapter(index)` returns either a va=
lid
>> +        // pointer or NULL. `NonNull::new` guarantees the correct check=
.
>> +        let adapter =3D NonNull::new(unsafe { bindings::i2c_get_adapter=
(index) })?;
>> +        Some(Self(adapter))
>> +    }
>> +}
>> +
>> +impl Drop for I2cAdapterRef {
>> +    fn drop(&mut self) {
>> +        // SAFETY: This `I2cAdapterRef` was obtained from `i2c_get_adap=
ter`,
>> +        // and calling `i2c_put_adapter` exactly once will correctly re=
lease
>> +        // the reference count in the I2C core. It is safe to call from=
 any context
>> +        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
>
> Should this implement AlwasyRefCounted?

I don't think it's necessary given the context this is used in, but it's al=
so
not much more code to do so, and ARef<I2cAdapter> turns out much cleaner I
think.

So, yes I agree this should implement AlwasyRefCounted.

>> +    }
>> +}
>> +
>> +/// The i2c board info representation
>> +///
>> +/// This structure represents the Rust abstraction for a C `struct i2c_=
board_info` structure,
>> +/// which is used for manual I2C client creation.
>> +#[repr(transparent)]
>> +pub struct I2cBoardInfo(bindings::i2c_board_info);
>> +
>> +impl I2cBoardInfo {
>> +    const I2C_TYPE_SIZE: usize =3D 20;
>> +    /// Create a new board=E2=80=90info for a kernel driver.
>> +    #[inline(always)]
>> +    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
>> +        build_assert!(
>> +            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
>> +            "Type exceeds 20 bytes"
>> +        );
>> +        let src =3D type_.as_bytes_with_nul();
>> +        // Replace with `bindings::acpi_device_id::default()` once stab=
ilized for `const`.
>> +        // SAFETY: FFI type is valid to be zero-initialized.
>> +        let mut i2c_board_info: bindings::i2c_board_info =3D unsafe { c=
ore::mem::zeroed() };
>> +        let mut i: usize =3D 0;
>> +        while i < src.len() {
>> +            i2c_board_info.type_[i] =3D src[i];
>> +            i +=3D 1;
>> +        }
>
> Same comment as the last patch.

Still not possible unfortunately. :(
