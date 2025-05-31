Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD217A306
	for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748713139; cv=none; b=fEWd68f2mHG/htUqn4M3qb5Vr+cnGvU5LraMIbObKFdx3sv8pgknXMUOUuniPjEQKbVOVq/tVHS814g6jKpqWNnh192Xt/UsxKWsKIF7S6Z9c0Ak7Xx48b6pV9UoFFp6E9qz1DXydciAAOWKKvisujpMvH0d3UDYwhWIRyUm9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748713139; c=relaxed/simple;
	bh=+yiCfGe4fW0XffAwNncdBCVmgxhtqqA4Z5ANJlPMTug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaHLfvfy5BYZysilfO8tPGpnGOg5/c6pVM3XnfITwyGmnIlOhkI0CS6K9YT92E4AIzkBnxuG0++9MGe8/+1duEBW9ERv4Xp6BOV32gV2Bd2VDu3ZKUYh+fagW1XJbQZeX1oxYdzwHmpaFhgi3DKTeYn+220tQiYX04OR6nIZb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qf1RFcfK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qf1RFcfK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2567323f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748713135; x=1749317935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLCLVg3DRY+kdQKI3UOmRBlx/q2NwNG+bRafEeb9LK4=;
        b=qf1RFcfKwcW5/Hk47bNBUBgraAI0lhsiNe/xpJiwQSRUWCLo5lg7d9SLEvoZzC8e+F
         iidoSxdM8HhaLQZqa2YgjLf6fCGUqT8qYCTl7NIWYw9hNgJoITjzaXSFj8bXajyL3MFg
         mBkIxodI48Idcv4OdNVPXeYjl+P4erJOtvCtvSWj5oONdrOterSXseVtGvj2ipIhyD8v
         Wly6cA/KvVmWyXqEr6InEVPcjiJ6E0Lgc+oojO9EjfYtrAyfd7+qIHU0KUS8oKUI0Gfv
         vEhnTEpVU0cWmxmEkUYYPco/a+c2I8csdeAGGAR/ek5Rfsgl4sf64IyiFbpphr2kG8YK
         sFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713135; x=1749317935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLCLVg3DRY+kdQKI3UOmRBlx/q2NwNG+bRafEeb9LK4=;
        b=f+juR31IY4WbYMQ1EhXqL2C0aTvY0PaToJ3K6aLnFvAEdrTXE2jkB/o2RX4jTe9IsG
         NGgwl5+/fEh55HGUqFOdzqIRPSNbq0S80VoLwd+t30Np5zvnBSBHK1gEXskrBpsGzsJ+
         u1RtnoC00vsjrlH4WRkhe1zOiOQVcJX7sDPwA2Lz55/fjuQr0iQI6rK6LzABtDfPiVrb
         7hQrsTg3HyemFKBp8zP1xdo2bqCFnO6JvYKHNDzkOgwdfFosu9QyYLw62071hR2JUAKV
         bzPWZq5fCtrGvqwKHShiXPC9y0ZcUuTlpwHtqPVh5Ov8myhQ43zTQxicZ6L4VhGvn6Rq
         6qfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGsZh6JwTj3DaPy34mwLCs1k0av03ZnOd9zMN0u1r9oEmoPVowZvhTJL/Nea0GRSDwMMmk3zzFienuDNAq/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyzpftd/lY+gdmZr9BO0xF5AL3gnOCLn4ZdAJ6CqfIaC5MD0Cg
	f+X23151ahvDu/cvTRHqi2sZMfGrAHRnY+dcBvcnfrVBJmI2qyHyaSYrceRcGRBCYQ7Hzw8ooTV
	k84fQb2Za4ldDj6WlttPxcUs144iJ1DoKIdiqmNqv
X-Gm-Gg: ASbGncu7I3Km/dQ5Wgg3JEbcMl+FlxorKaGqPXp2zSlwATWEkkTCdnFktXmtFHw919H
	rwmC4m5NdMtU3oGOrcCQlGiHSTHJk0dZj/S4ZvzPf2rtnFjJlP7OSleJ7rbeSo+2ceQqmzwr0oR
	t42C5t9VMxiAiTI27fHx5NcA1Zq7inwb7NNt0Y6LSu1thU
X-Google-Smtp-Source: AGHT+IFcQc7PhrlU3iGzooaB91LCZp9G23UHEC8GFDWBqsB6YALAnfq0jsP/gQvtcHrgFUl7d6tErACA3KF7ENhU2+U=
X-Received: by 2002:a5d:64e2:0:b0:3a4:e1e1:777f with SMTP id
 ffacd0b85a97d-3a4fe160ce4mr1952606f8f.1.1748713135419; Sat, 31 May 2025
 10:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com> <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com> <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
In-Reply-To: <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 19:38:43 +0200
X-Gm-Features: AX0GCFupvoH_OV-ioJo2JO2JFQ27ZZjQte_A5hZNPm4JMyO-baMu7qThPLV4JKs
Message-ID: <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 5:25=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Sat May 31, 2025 at 3:25 PM CEST, Alice Ryhl wrote:
> > On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> >> > This patch adds a more convenient method for reading C strings from
> >> > userspace. Logic is added to NUL-terminate the buffer when necessary=
 so
> >> > that a &CStr can be returned.
> >> >
> >> > Note that we treat attempts to read past `self.length` as a fault, s=
o
> >> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> >> > reached.
> >> >
> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  rust/kernel/uaccess.rs | 56 +++++++++++++++++++++++++++++++++++++++=
++++++++++-
> >> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f=
8349426d4cdb38286089 100644
> >> > --- a/rust/kernel/uaccess.rs
> >> > +++ b/rust/kernel/uaccess.rs
> >> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &m=
ut Vec<u8, A>, flags: Flags) -> R
> >> >          unsafe { buf.set_len(buf.len() + len) };
> >> >          Ok(())
> >> >      }
> >> > +
> >> > +    /// Read a NUL-terminated string from userspace and return it.
> >> > +    ///
> >> > +    /// The string is read into `buf` and a NUL-terminator is added=
 if the end of `buf` is reached.
> >> > +    /// Since there must be space to add a NUL-terminator, the buff=
er must not be empty. The
> >> > +    /// returned `&CStr` points into `buf`.
> >> > +    ///
> >> > +    /// Fails with [`EFAULT`] if the read happens on a bad address =
(some data may have been
> >> > +    /// copied).
> >> > +    #[doc(alias =3D "strncpy_from_user")]
> >> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Resu=
lt<&'buf CStr> {
> >> > +        if buf.is_empty() {
> >> > +            return Err(EINVAL);
> >> > +        }
> >> > +
> >> > +        // SAFETY: The types are compatible and `strncpy_from_user`=
 doesn't write uninitialized
> >> > +        // bytes to `buf`.
> >> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [M=
aybeUninit<u8>]) };
> >> > +
> >> > +        // We never read more than `self.length` bytes.
> >> > +        if dst.len() > self.length {
> >> > +            dst =3D &mut dst[..self.length];
> >> > +        }
> >> > +
> >> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> >> > +        if len < dst.len() {
> >> > +            // Add one to include the NUL-terminator.
> >> > +            len +=3D 1;
> >> > +        } else if len < buf.len() {
> >> > +            // This implies that `len =3D=3D dst.len() < buf.len()`=
.
> >> > +            //
> >> > +            // This means that we could not fill the entire buffer,=
 but we had to stop reading
> >> > +            // because we hit the `self.length` limit of this `User=
SliceReader`. Since we did not
> >> > +            // fill the buffer, we treat this case as if we tried t=
o read past the `self.length`
> >> > +            // limit and received a page fault, which is consistent=
 with other `UserSliceReader`
> >> > +            // methods that also return page faults when you exceed=
 `self.length`.
> >> > +            return Err(EFAULT);
> >> > +        } else {
> >> > +            // This implies that len =3D=3D buf.len().
> >> > +            //
> >> > +            // This means that we filled the buffer exactly. In thi=
s case, we add a NUL-terminator
> >> > +            // and return it. Unlike the `len < dst.len()` branch, =
don't modify `len` because it
> >> > +            // already represents the length including the NUL-term=
inator.
> >> > +            //
> >> > +            // SAFETY: Due to the check at the beginning, the buffe=
r is not empty.
> >> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> >>
> >> In this case you're overwriting the last character read. Should we giv=
e
> >> `raw_strncpy_from_user` access to one less byte and then write NUL int=
o
> >> that?
> >
> > Why? I'm not interested in changing the implementation just because.
> > It needs to be significantly simpler, and I do not think it is.
>
> Sure, but then I think we should document this behavior.

Document what? I understood your suggestion as a change to the
implementation of strcpy_into_buf that would not change its behavior.
Did I misunderstand?

Alice
