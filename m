Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F851C3BEB
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987645; cv=none; b=cHjNmaNgQzuTpp4Ri1pVVr2sNogJfLLtwrjuyLIcbame7cpioHhyrwy0pyPOLUa8GYdnKI0ELrVohgMl83Pa3veNcgm52uLvs3LH/d283l/2P3tUR1amog5vlWjY4pquQoX9fxxwu3wsiisdTW1aoz0/MSyZjXxR/YNIaHkl/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987645; c=relaxed/simple;
	bh=vY4Dx5DYpGIndN4KC5TJ+g7rVF/qITgLKfx0wrEGOzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=SJ+AM+J0dObKJS+cTKQG70vAkA8q9Yt2Q/OYLHQrQ2E0U9e2KWjFojsqYrbv65OKsZhYaWecQWQAvqTJza3K+kN+0OUaykZJDMsZcGgm7xARxwvzAddE0sBngKwROMz4uFTaVM3BQtuW8WVmNAruu0hHRUJ7c2P/NYvbNZxrO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0rS8ZnU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0rS8ZnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAA4C4CEED;
	Tue,  3 Jun 2025 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748987644;
	bh=vY4Dx5DYpGIndN4KC5TJ+g7rVF/qITgLKfx0wrEGOzg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Z0rS8ZnUidH798bWoHZGeVHVtNlz8MEtqXnlixQITk4MhwpQCnUiVWF989XkuSG+b
	 M9aXGBeEQqVSRsTUvYkySg1YM2hHktctGYcbDp8tBynHFM/hxx/q4FPSGydLNxqPh/
	 IrGz2emEkYx4kX0hDZhIHIbO2l9ts6TAG6HUYALkqv7XlWnPlg0YU99I3fKz2QeIMM
	 5xOBDLakdEYmupweLQdcJ9P1wzdcsd0+C5M4Skl6jS7OLFNa25QjMRV4SyosAJiS/Y
	 NCIwDQ+hKd0fUIXvJB7zHwQ5BieR0Vw8+D3uFAUNwtMDSuGp7QVOFY9lFZruYhEUDE
	 d7i9d84LyDolg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 23:54:01 +0200
Message-Id: <DAD8DI7Q8YV8.OKUS6GUZDLQF@kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <DA8X4RXQKX5J.N4S9TWX90OU9@kernel.org>
 <2846f3423a0641c54ef0368308549fe51c06565b.camel@nvidia.com>
In-Reply-To: <2846f3423a0641c54ef0368308549fe51c06565b.camel@nvidia.com>

On Tue Jun 3, 2025 at 7:15 PM CEST, Timur Tabi wrote:
> On Thu, 2025-05-29 at 22:14 +0200, Benno Lossin wrote:
>> >=20
>> > The macro goes avoids str::rfind() because currently, that function is=
 not
>> > const.=C2=A0 The compiler emits a call to memrchr, even when called on=
 string
>> > literals.=C2=A0 Instead, the macro implements its own versions of rfin=
d(),
>> > allowing the compiler to generate the slice at compile time.
>> >=20
>> > Unfortunately, Rust does not consider the .. operator to be const eith=
er,
>> > so sfind!() cannot be assigned to consts.=C2=A0 For example, the follo=
wing will
>> > not compile:
>>=20
>> This is not the `..` operator, but rather the index operation of a str
>> (`&FILE[start..]`). It can be made const by using `from_utf8` [1] and
>> manually creating the correct byte slice using `unsafe` [2] instead.
>>=20
>> [1]: https://doc.rust-lang.org/std/str/fn.from_utf8.html
>> [2]: https://doc.rust-lang.org/std/slice/fn.from_raw_parts.html
>
>
> Ok, it took a lot of trial-and-error on my part, but I got this to work.

Great!

> It's not pretty, though.  Is this what you intended?
>
>         let start =3D find_last_or_zero(FILE, '/') + 1;
>         let end =3D find_last_or_len(FILE, '.');
>        =20
>         let base_ptr: *const u8 =3D FILE.as_ptr();
>         let ptr: *const u8 =3D unsafe { base_ptr.add(start) };
>         let slice =3D unsafe { core::slice::from_raw_parts(ptr, end - sta=
rt) };
>         unsafe { core::str::from_utf8_unchecked(slice) }

Yeah that's roughly what I had in mind.

Maybe we should check that `end >=3D start` in case the filename is empty
(which shouldn't happen)? I'm not sure what happens with overflows /
other `unsafe` precondition violations...

> The good news is that this allows
>
> 	const SFILE: &'static str =3D sfile!();
>
> to work, so thank you.

That'll be useful :)

---
Cheers,
Benno
