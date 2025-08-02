Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119DF1FB3
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754093893; cv=none; b=EaV53Nbx8OM8ymnXrJTudv754arcnzw4a03W40eWGY1CnWMbiDiiX9u43OfH4npO30qZ7YnGIjSawFVydc/ysqwanhk9YH6hwZ7N0g544Zap8eJWESIN3rVo4rZiXYhe2CHKwOD3bKsBfXWKk9UXVAcNJwFzGPdGudw6SHcEsLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754093893; c=relaxed/simple;
	bh=bcvIWGj+7Ss2n1eH9RM+tz5jqyhBJdW5RrOPk1kKH8Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=AHap/sEt0guGFY2d4py/mgBu1GvbxKaRPIV1p5KZY/f4EwCZ+qbAVdb1mlyeKrF0ulUHfGubQr0AImDtcJXuWmG1HbHPGgHRSJWNZNRqQvhD0JPgOpuog+P0puSUbT38Ikqji027iRWQ9XNysi/VomztaIZu7SMVCI98OK7J2hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfepLvLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfepLvLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB2DC4CEE7;
	Sat,  2 Aug 2025 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754093892;
	bh=bcvIWGj+7Ss2n1eH9RM+tz5jqyhBJdW5RrOPk1kKH8Q=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=tfepLvLKAfsBS6hG3VxxAAN2//F/LKkwtxl1g3KUtCLFUIPZUsai5ExUrxdh/E/34
	 ZLoj0U27GzIBus7agp1j77thPAB9ncfIexiGofgpSrTnrjO6rjtYxT34nZX9AeOI1p
	 RxOti0+dpSKdDXiW45DebLLY4TYCyqbBi+eZFehXTRziGB0jnhrPMJYYefKA8P8CLH
	 xa2RCmhKdCw474GoNK9zlannIl9GDl0MuAPoGVDLdjeXg2oRzgMAPz9xE7zFto/97p
	 IS/pl1qyUvPvSA9F1z8fVFSpnD1kdfESxgAV9lW50AF2SXsm71DZxtSvdoy7MhcrsS
	 rZi5w3giNjVHA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 02:18:09 +0200
Message-Id: <DBRIE05O14GW.2ARZUN01717GI@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 3/3] samples: rust: add Rust I2C sample driver
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154506.14810-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250801154506.14810-1-igor.korotin.linux@gmail.com>

On Fri Aug 1, 2025 at 5:45 PM CEST, Igor Korotin wrote:
> +#[kernel::prelude::pin_data]

Can just be #[pin_data].

> +struct DriverModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
> +    _reg: i2c::Registration,
> +}
> +
> +impl kernel::InPlaceModule for DriverModule {
> +    fn init(
> +        module: &'static kernel::ThisModule,
> +    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
> +        let adapter =3D i2c::I2cAdapterRef::get(SAMPLE_I2C_ADAPTER_INDEX=
);
> +
> +        kernel::try_pin_init!(Self {
> +            _reg <- i2c::Registration::new(&adapter.unwrap(), &BOARD_INF=
O),

Please don't use unwrap(), this panics the kernel in case of failure. Pleas=
e see
below for a better solution.

> +            _driver<-kernel::driver::Registration::new(<Self as kernel::=
ModuleMetadata>::NAME,module,),
> +        })
> +    }
> +}
> +kernel::prelude::module! {
> +    type:DriverModule,name:"rust_driver_i2c",authors:["Igor Korotin"],de=
scription:"Rust I2C driver",license:"GPL v2",
> +}

I suggest to write this like this:

	#[pin_data]
	struct DriverModule {
	    #[pin]
	    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
	    _reg: i2c::Registration,
	}
=09
	impl kernel::InPlaceModule for DriverModule {
	    fn init(
	        module: &'static kernel::ThisModule,
	    ) -> impl ::pin_init::PinInit<Self, Error> {
	        try_pin_init!(Self {
	            _reg <- {
	                let adapter =3D i2c::I2cAdapterRef::get(SAMPLE_I2C_ADAPTER=
_INDEX).ok_or(ENOENT)?;
=09
	                i2c::Registration::new(&adapter, &BOARD_INFO)
	            },
	            _driver <- kernel::driver::Registration::new(<Self as kernel::=
ModuleMetadata>::NAME, module),
	        })
	    }
	}

	kernel::prelude::module! {
	    type:DriverModule,
	    name:"rust_driver_i2c",
	    authors:["Igor Korotin"],
	    description:"Rust I2C driver",
	    license:"GPL v2",
	}
