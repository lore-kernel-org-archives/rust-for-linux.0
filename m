Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF722FAF4
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754138485; cv=none; b=JanGtuCLvOtN3iEKMPrfASE7QhNsyrm27Q1uLMuNJlIphYVbeCspg5DDW4fcJQBqNIfhisF47iA4EMWgUx8ZMTeVcWp8VJ96MsZYlDKue3S8x8xjSMGCJ6ozTCNo6ukraz0pl5gyFveRFL4ClI4oNGS4crQd2M/yFJ8UEMZinss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754138485; c=relaxed/simple;
	bh=njFkkdbJCIjEVeO4UHTSZh6rdIl/cjkkreNVktsE26I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=cO1rg8W79peXsmhr/f/RxdilLZNVE8woM/mhf7ghISDY7EL6nTOj33ENp7RsuBvJSKX0gOASi4cJaTZ93zOpd93Ft7vZGJ84n8OxJnch2XFew8UQhGJwuilZ0GBwW+5C5UNT4fvkcgyArbq+O9MK7719mF8XdZoeI+J/f92jGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usO/ZdHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usO/ZdHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D8C4CEEF;
	Sat,  2 Aug 2025 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754138484;
	bh=njFkkdbJCIjEVeO4UHTSZh6rdIl/cjkkreNVktsE26I=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=usO/ZdHrpF9Bk8Yz24T8AlfhmJ0l3MokZaBu9CshgwrNxivNM9lb0SfyycgwIpUR+
	 J4d1jYzGEvhJzElzsQJQd1HbCHt29dB6g7J/K5QquHjb5LQjiFfUU6ZJvc6hzW//t4
	 Eu1A3Cpj/swdt4etbsitUPF71W9UUxY0X2SFw/RpeeulYR7VGqV65VhFuV7jwivIRZ
	 XSHWpGUalN0JggljSsHz/QogNySxh3AUp2lU63u5XNckpjYgTaRN7IEH+wTokZNgEv
	 asbvMjZYnqoaX1mhFmEvORLuLU3snnYUi4W/uqjzDjCAGTsBKuaoxqRFJ7XZPM1PE4
	 8WzzoPXOPTRag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 14:41:20 +0200
Message-Id: <DBRY71EJZU9K.1V5FGUA4IFDCA@kernel.org>
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org> <aI3VN8WxZeu_DN9Q@shikoro>
 <DBRVV7MYEJD8.2LNT14LTDOXSE@kernel.org> <aI4BF1u5J1cTugEJ@shikoro>
In-Reply-To: <aI4BF1u5J1cTugEJ@shikoro>

On Sat Aug 2, 2025 at 2:14 PM CEST, Wolfram Sang wrote:
> Hi,
>
>> Maybe it would also be a good option to take PRs from Igor? I think it c=
ould be
>> a great way to get in touch with some of the Rust work over time without=
 having
>> to commit to maintaining it. (Of course, this is entirely up to you thou=
gh.)
>
> Makes sense...

Great!

>> While I encourage the above, one fallback alternative could be to take p=
atches
>> through the driver-core tree -- at least for now. Given that this is a b=
us
>> abstraction and hence most infrastructure used is generic device / drive=
r
>> infrastructure, there's some synergy.
>
> ... especially if the alternative is "only" the driver core tree. My
> tree makes more sense then. I thought there might be a more fitting
> "Rust" tree. If that's not the case, I can pull from Igor, no problem.
> We will see how this goes dependency-wise.

There's of course also Miguel's Rust tree, but this is more for "core Rust
infrastructure".

Citing Miguel [1]:

"We try to reserve the global Rust tree fallback for cases where there
is really no other way, e.g. when a key subsystem doesn't want
anything to do with Rust at all and thus would block many others
otherwise."

[1] https://lore.kernel.org/all/CANiq72=3D+UUFVemSGHvzkX5FoOv-U5YRDKQkbKjYw=
qEfex-ey6w@mail.gmail.com/
