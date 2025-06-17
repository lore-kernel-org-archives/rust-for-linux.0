Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95428EA63
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Jun 2025 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145352; cv=none; b=OflXgI/QHslhTRSMmeMW/JsYt/ofn0SzLyVh9h9YLtdTy+zL014FkrhCArbch3jMI9qX0uh0KVL6hGG1SKFLse4QkHwMM2qqgOWCphqzAtNJt0CcuZuFjReSY6Y8mTvX+s1ILhSfaTwlisIBHsgSZ2CXcoE8kURy9ye5YLDSua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145352; c=relaxed/simple;
	bh=OoBPqS700VKLhoWeJZ3k26URr/7ax4pu0e/mY9XEK+o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Bpn7VQpdo/UZTyZB0ixQonta9nx3uhzh1OGNzTP9VSH+plMJKVR7CdYrAPRWejk0Klpq1fx5XYS0c7+oVCoVa3T1nVwdrrLf9A30OwqkIsfHkG/EL3JTsyeJF8vorxKBI8BKP1NO+2H5ySRB1vibJe+f5IUMSM3wd7FzaViwVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyhY1bEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyhY1bEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7463C4CEED;
	Tue, 17 Jun 2025 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750145351;
	bh=OoBPqS700VKLhoWeJZ3k26URr/7ax4pu0e/mY9XEK+o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pyhY1bEPmqBSP029O2JjZqpTOH+ulJNVShSpIf7UJSV/2/rPedDrvQkr0WkmsJuue
	 ZqWTpnKKNh/m/u4lTUskDypCvqWf3jpc16RGrK68IzNYkOP080Vpk882WfsU0qbopW
	 nxg0nsHcBzQpzwL0bNfZnRDvAMYXIziBysxe3iSg5ag+f1zzFlWSsuNLVPQhlWRGvC
	 +lxrMNRcyvmXHZcae+P/rUkmRgu6lCW+kzn/vHIob0agcbRgE++xKVfAOr+jLGY90k
	 rdkj3iXGlrkDSJf2JqWfs4iIwDilLAIjNYql9si55Lzk4XTV7dqBwDLxrk9sRZDXqe
	 a/9OX1Hzx/3OQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 09:29:08 +0200
Message-Id: <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code
 tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Timur Tabi"
 <ttabi@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250616193433.2643407-1-ttabi@nvidia.com>
 <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
In-Reply-To: <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>

On Mon Jun 16, 2025 at 11:03 PM CEST, Miguel Ojeda wrote:
> On Mon, Jun 16, 2025 at 9:35=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wro=
te:
>> +#[macro_export]
>> +macro_rules! sfile {
>> +    () =3D> {{
>> +        const {
>
> Could we avoid the double block?

We should be able to.

>> +            let start =3D match ::kernel::str::rfind_const(FILE, '/') {
>> +                Some(slash) =3D> slash + 1,
>> +                None =3D> 0,
>> +            };
>> +            let end =3D match ::kernel::str::rfind_const(FILE, '.') {
>> +                Some(dot) =3D> dot,
>> +                None =3D> FILE.len(),
>> +            };
>
> I wonder if we should just panic if they are not found. Maybe I am not
> creative enough, but do you have in mind a use case for either?

Sounds like a good idea.

> We already remove some cases anyway with the `assert!` below, so it is
> not usable in every case anyway.

>> +            let ptr: *const u8 =3D unsafe { base_ptr.add(start) };
>
> Benno: do you want here (and above) qualified calls too? (I would move
> everything to a `const fn` though -- please see below)

Yeah we should do that. Some of my macros don't do it (eg use `Ok` and
`Err` without qualifying them), but we should make all macros always
exclusively use absolute paths for everything. (`Ok` and `Err` are
probably never going to be different ones in scope, but you never know)

@Timur for this case, you can qualify the call like this:

    let ptr =3D unsafe { <*const ::core::primitives::u8>::add(base_ptr, sta=
rt) };

Maybe the stdlib should have a re-export of `*const` and `*mut` in
primitives...

> I would just call both pointers `p`, by the way. No need to keep the
> base one around.
>
>> +            // that FILE is ASCII (via is_ascii() above).
>
> `FILE`, `is_ascii()`
>
>> +/// Returns the index of the last occurrence of `needle` in `haystack`,=
 or None.
>
> [`None`]
>
>> +/// use kernel::print::rfind_const;
>
> Consider hiding this one too.
>
>> +/// let l =3D rfind_const("when will then be now?", 'l');
>> +/// assert!(l =3D=3D Some(8));
>
> Please add an example for the `None` case too.
>
> Finally, should we put most of this logic in a `const fn` too for the
> usual benefits (docs and tests)? Then the macro would just be
> essentially a const `basename(file!())` call, possibly fallible, and
> you can even avoid having all those qualified calls :)

A function sounds like a good idea.

But I don't see the value in the macro being fallible. Then the macro is
less convenient to use. The function can be fallible, but then the macro
should use `Result::expect()`.

---
Cheers,
Benno
