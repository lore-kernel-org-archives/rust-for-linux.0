Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B079203710
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754320069; cv=pass; b=cYDi5c2glnqT+6ya3b5XwZE+3x09MkPIvhFpcoujXo6wuiI65FACYOoufEXb0RMfm90qfFGsZ+fbUVd9nt9f6kM1Onz/LCCaGl6foZ7k3nRpKYkaXIyoah2JpCUNq7P6apLi975GWs1vDKR+yNjAtCq3PXUlqMFK4/OMeNDuuuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754320069; c=relaxed/simple;
	bh=s6Q6CzqEvzgp/wcBqG6KLJO94ZKJraPuagQEsJvsQo8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Z0I0YN/9CKKUpPj5AWI9vk3hD6FfdwX5v019gC4/wA6D6/XrNGF2zkjMFOWx25Q/+gor54u6Xph24UsOnNLHbiczoLkkUKzXqTryj3Mj78PHNRkJhq5yrdNw+x9ES83VEF6OlIhGpj60mx1b9cEaD79K+RTZ5CToT6pSw0jDIao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=M+ArDnP5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="M+ArDnP5"
ARC-Seal: i=1; a=rsa-sha256; t=1754320052; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TZUMaEN3aCoe0DdnddvZPDgkB/e0X/eX7zLvwVbAl+dIiY6sat4Om3DpS+S2O75qK1W4fYIiJF+3hK+pAc+yQn8Ihzng6jBqaXtVyKs6Zv7CCGPIusoR3rWK1SGeMQF12Hetv4wCz98BQ4Ss27+7Adi4/TULUCadzzWMKoF12XY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754320052; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6HcwM7Ob5fgsGI5mJsAuPzaCxqNAEtytLiKnnzMPXkw=; 
	b=YEqrUgHJJgW2CkFgxHTYmeISD+4O6PxksokLgeT7HKpSBQaaS6spVEsty1ApxU7il5qwUhB4IxjoR9XN73c1hno1F5r8lbNESVxRFf1V9ftOOybjSMlUQKdRzVmcoC9MhhgTKd3HSSRQ7wS4iNcTzSgQ3+P67Jcpmv2fTgTuzio=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754320052;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=6HcwM7Ob5fgsGI5mJsAuPzaCxqNAEtytLiKnnzMPXkw=;
	b=M+ArDnP58Z+ikyrMhIKitiIv6bIgQtdtjk4bclPBqHF2mq0c0dANxnTICyGaPzvq
	O/zGuD0XJz/6CRxKepWMgwUMtYfN6pS40lPxWSbvVukKMzOIc6g3b1mWnStwqtvy5E6
	HLNXxqizgHGD2ggUS0p+vO9cPOxIrRpSmCgtjcTk=
Received: by mx.zohomail.com with SMTPS id 17543200491621008.5562923792553;
	Mon, 4 Aug 2025 08:07:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 0/3] rust: i2c: Add basic I2C driver abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
Date: Mon, 4 Aug 2025 12:07:14 -0300
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
Message-Id: <2D1DE1BC-13FB-4563-BE11-232C755B5117@collabora.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Igor,

> On 1 Aug 2025, at 12:37, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> This patch series lays the groundwork for writing Linux I2C drivers in=20=

> Rust by:
>=20
> 1. Core abstractions=20
>    Introduce `i2c::Device`, `i2c::Driver` and `i2c::Adapter` built on=20=

>    the existing `struct i2c_client` and `struct i2c_driver`, with safe=20=

>    Rust wrappers around probe, transfer, and teardown logic.
>=20
> 2. Manual device creation =20
>    Provide an API to register an I2C device at runtime from Rust using
>    `I2cBoardInfo`, including automatic cleanup when the driver =
unloads.
>=20
> 3. Sample driver (legacy table, OF & ACPI) =20
>    Add `rust_driver_i2c`, a sample that:
>      - creates an I2C client device using `i2c::Registration::new()`
>      - binds to an I2C client via:=20
>        - legacy I2C-ID table,=20
>        - Open Firmware (device-tree) compatible strings, or
>        - ACPI IDs.
>      - destroyes the I2C client device on exit.
>=20
> Together, these three patches:
>=20
> - Establish the essential Rust traits and types for I2C drivers.
> - Enable driver binding via legacy ID table, device-tree (OF), or ACPI
> - Enable manual device creation at runtime.
> - Ship a samples showing typical usage=20
>=20
> Igor Korotin (3):
>  rust: i2c: add basic I2C device and driver abstractions
>  rust: i2c: add manual I2C device creation abstractions
>  samples: rust: add Rust I2C sample driver
>=20
> Changelog
> ---------
> v3:=20
> - removed unnecessary i2c_get_clientdata and i2c_set_clientdata rust=20=

>   helpers. Using generic accessors implemented in [1] instead.
> - Reimplemented i2c::DeviceId based on changes in [2].
> - Using from_result in i2c::Adapter::probe_callback
> - Using explicit drop() for i2c client private data in=20
>   `i2c::Adapter::remove_callback`
> - replaced device::Device::as_ref() with device::Device::from_raw in=20=

>   `i2c::Device::as_ref()`. It is renamed in device::Device.
> - Build Rust I2C only if I2C is built-in
> - Reimplement overcomplicated trait i2c::DeviceOwned the same way it =
is=20
>   implemented in auxiliary [3].
> - Merge rust_device_i2c and rust_driver_i2c samples. Resulting=20
>   rust_driver_i2c creates pined i2c_client using =
i2c::Registration::new=20
>   and probes newly created i2c_client.
> - Created a new entry in MAINTAINERS file containing i2c.rs and=20
>   rust_driver_i2c.rs in it.
> - Link to v2: [4]=20
>=20
> [1] =
https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/
> [2] =
https://lore.kernel.org/rust-for-linux/20250711040947.1252162-1-fujita.tom=
onori@gmail.com/
> [3] =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ru=
st/kernel/auxiliary.rs?h=3Dv6.16-rc4#n299
> [4] =
https://lore.kernel.org/rust-for-linux/20250704153332.1193214-1-igor.korot=
in.linux@gmail.com/=20
>=20
> v2:
> - Merged separated ACPI support patches since ACPI-table support is=20
>   merged into driver-core-next.
> - Added I2cAdapterRef and I2cBoardInfo abstractions=20
> - Added DeviceState generic parameter which is used for `i2c::Device`
>   as a sign if the device is created manually
> - Added `DeviceOwned` abstraction which is a safe reference to a=20
>   manually created `i2c::Device<Ctx, state::Owned>`.=20
> - Added Rust manual I2C device creation sample
> - Link to v1: =
https://lore.kernel.org/rust-for-linux/20250626174623.904917-1-igor.koroti=
n.linux@gmail.com/
>=20
> MAINTAINERS                     |   8 +
> rust/bindings/bindings_helper.h |   1 +
> rust/kernel/i2c.rs              | 498 ++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs              |   2 +
> samples/rust/Kconfig            |  11 +
> samples/rust/Makefile           |   1 +
> samples/rust/rust_driver_i2c.rs | 106 +++++++
> 7 files changed, 627 insertions(+)
> create mode 100644 rust/kernel/i2c.rs
> create mode 100644 samples/rust/rust_driver_i2c.rs
>=20
>=20
> base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
> --=20
> 2.43.0
>=20
>=20

I=E2=80=99m not sure whether this has been mentioned yet: c_int and =
friends are in
the prelude. There are quite a few places where kernel::ffi::c_int shows =
up in
this series. That can be just =E2=80=9Cc_int=E2=80=9D instead, for =
example.

=E2=80=94 Daniel=
