Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436882A8E5
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712062210; cv=none; b=KTmqCKXrTX/v+tMJ/W8NkLUpcvFiNZnujlDWOQ2J1zF6BH8emXyFltnxOHClwuFNfuGw4KUu0cbg9z869DUQEAjvXGFIUw2/BZ8tqpoLAAI8cZsKC3bIqM1QlYAmJw2vhjKi+pdr2VEdWlwKVAVVT7UtvII7Dv/PkXuTOdcz0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712062210; c=relaxed/simple;
	bh=YVfCRrIMjM3qNuE6jVIeiRm1+M5zgpz+svQs64HzCW0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SivyMRzDkeKsGM0jloL/Hk8FLdzGOnXb+76+hV58W4x1ELFtQhtew6O/R+zpfOt201H/u7Gj9YQBGBu9+mhf9ZN/ewQGVC3loiTAWuEwm1LzIgJAk20EnLpmN4o93ytsTHjDGq3flGJkBI4PouGRP9mjxwQFtGOqttdpegNyPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fQ9D4KJY; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fQ9D4KJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1712062207; x=1712321407;
	bh=ZUFnwo0hp9HoIfPTPou9zjyCN3N2Lvg27XoRrnqIoh0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fQ9D4KJY95UiYMArX95Cts4UjPgLLnT/HzPfMsQYBPWBDdL/yQNLKDp5xLSDyg0nW
	 xg88m7J2ayG01IAueCEPNQl6YxVwwJ9gAYJ8zXnHIEQdTUz9Amwvo7lOlcOsp3SZzI
	 hyFHkJ35hY2+OCToMYVaXrmfxRUNCs0S32JdEc9PvCZ/rF0Iv4XlpcU+9NtxXn7a7k
	 Z/UTfjZ83lik9QA4RCP0NO3mOMUTXnQ9EuO8IV5VhjhP5yINlbNtZX9P/5b8dLI4o0
	 dvE8L/+hw5WxFYn5cygGxZJREviNxukFVacXSwC1wDcnKa3AkgyrSRyvcKh9Mz2LjY
	 7XEpFRJ2jhLPQ==
Date: Tue, 02 Apr 2024 12:49:58 +0000
To: Boqun Feng <boqun.feng@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Obei Sideg <linux@obei.io>
Subject: Re: [PATCH] rust: types: Make Opaque::get const
Message-ID: <512ad3fa-37d0-470e-9f4c-bd185d9b897f@proton.me>
In-Reply-To: <20240401214543.1242286-1-boqun.feng@gmail.com>
References: <20240401214543.1242286-1-boqun.feng@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.04.24 23:45, Boqun Feng wrote:
> To support a potential usage:
>=20
>      static foo: Opaque<Foo> =3D ..; // Or defined in an extern block.
>=20
>      ...
>=20
>      fn bar() {
>          let ptr =3D foo.get();
>      }
>=20
> `Opaque::get` need to be `const`, otherwise compiler will complain
> because calls on statics are limited to const functions.
>=20
> Also `Opaque::get` should be naturally `const` since it's a composition
> of two `const` functions: `UnsafeCell::get` and `ptr::cast`.
>=20
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>   rust/kernel/types.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

