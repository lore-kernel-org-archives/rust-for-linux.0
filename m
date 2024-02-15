Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9C23D0
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708030541; cv=none; b=FxJ7XrN5wAtiTGXD81PNyxSSpxD3pJoMOX6WfP4b+n4ERP3gYN2GEj+SGfc9HTSFfX+jC2AV6htjW8a3Vr72tzFEKiHUOBL1uy0Lh797wgVkd8DmyGf6lbwTZQhLvDuvMdFsqIf5ECH6O7w/gq80OKcciTjonNpO6kocb4TyKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708030541; c=relaxed/simple;
	bh=KIzclAEwIBOpeiVA2+aczTSaIGRAkzsbbq/mkVVWP3w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=maZP4A62IfTOfRIfKW76yRoJoPNE/Br88ooBQXI21pJUkrTscvbNCaUePEK99HoH48DTH5VgYT44pE4UNjgk/3BcfuXdA7YmM26ixS5A1L/kBPqXH1eY/agY8TD28aeDrVycmEY13ock4Uv22tqgiVfscUmBfRk71dqIQHW2L4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=L09ZpbTP; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="L09ZpbTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1708030531; x=1708289731;
	bh=I2h/y93EAF/twExyQBodY/TNxbTPVRXIQA2iO81nDHM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L09ZpbTPW4NhqOgttk85t9GN/cPdz5IspaAs/NTTA8hHGGxf+7MN+acZ08CWhbenJ
	 VJNAirwqu98ppKBKAkGI0ghy0YyX3vCck9y+4cAwi1BwqWXv4oZzwGpfvZMgEDtFoZ
	 6OpU9wUKVkCmszaJwIVYwi+cVkKhs+HijEWBp6+x834wBbpOOJ1c3qusCCRZpLqyum
	 DahMNNA6LNsRSF5bauuEI3jdvA9240zKdpQItQS3smvegNHXyCsHh0pJ//oNs+dZEO
	 iV5pQvJ/c7eRueI9lHwJkbBRughouLgPpjD1s4tPlSI6bQ9gJ1/BQ7FbZgG+D6dy8T
	 kKswLbYzOgqiA==
Date: Thu, 15 Feb 2024 20:55:11 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: mathys35.gasnier@gmail.com, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH v2] rust: locks: Add `get_mut` method to `Lock`
Message-ID: <ff06ddd4-808a-44fd-9230-f60aa43ec1de@proton.me>
In-Reply-To: <CANeycqqwGE_eyFSDWkmHCBOMZ6+Ty-XK_hKixMtOYqc9_46j2A@mail.gmail.com>
References: <20240212-rust-locks-get-mut-v2-1-5ccd34c2b70b@gmail.com> <CAH5fLghTKpLs=Wb03cjx0LRQbZgmXRoMNy1cyheb7cQRL0mjsw@mail.gmail.com> <CANeycqqwGE_eyFSDWkmHCBOMZ6+Ty-XK_hKixMtOYqc9_46j2A@mail.gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15.02.24 17:50, Wedson Almeida Filho wrote:
> On Mon, 12 Feb 2024 at 11:22, Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> On Mon, Feb 12, 2024 at 3:13=E2=80=AFPM Mathys-Gasnier via B4 Relay
>> <devnull+mathys35.gasnier.gmail.com@kernel.org> wrote:
>>> +    /// Gets the data contained in the lock
>>> +    /// Having a mutable reference to the lock guarantees that no othe=
r threads have access to the lock.
>>> +    /// Making it safe to get a mutable reference to the lock content.
>>> +    pub fn get_mut(&mut self) -> &mut T {
>>> +        self.data.get_mut()
>>> +    }
>>
>> It's impossible to call this method. You can never have a mutable
>> reference to a Linux mutex because we pin our locks. At most, you can
>> have a Pin<&mut Self>.
>=20
> Perhaps you meant to say that it's impossible to call this method
> without unsafe blocks? From a `Pin<&mut T>`, we can call
> `get_unchecked_mut` to get an `&mut T`.

That is the wrong way to design this, since it forces an extra
`unsafe` call. Instead this function's receiver type should be
`self: Pin<&mut Self>`.

--=20
Cheers,
Benno

