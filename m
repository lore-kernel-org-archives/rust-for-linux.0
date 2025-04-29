Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BC224222
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954963; cv=none; b=SqNRnFFx6lJvsSxdFeKrUWgtuCeknjQlJ2AQv0aOBSaZnzr4UHBu/Ku5smbuZ2O5bDcjfNijn212wt5vMOKnxop5FBHo/VtZYue5ENnSjC0ux2gn1rJDGtqMrwzzf469jbh9+QWfKo3UJX4vzihmFkX//Fx0Q0UJYnLOTMo+U2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954963; c=relaxed/simple;
	bh=kHc/cytx5Adj+8CqLo2UyKgU1kEEXeemLFRGfdkhqgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxqoyyDOdEOdDi6effOA1I5NNPUnLrPhGg1TkGTV8iAwytYnkhdVdfB1fYc4eAD4eDStwPMhbuR8zp5/Y1XAVyXB/ncNwpaSlSWRQ49qqihRlW6+e08RrbPkQhRbSUncyuONONU98n12StkVly3oEP+R9Df17Hj+1V078/Vjsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqmWrgk/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqmWrgk/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac56756f6so6479661f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745954960; x=1746559760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqMZCaPyPBAIN/Fd3CxJHtlGXvSegu6boDxVIZP3NUQ=;
        b=uqmWrgk/J11SZEksWiK3JPCe1Fzdzgk2pMiYt2UFN8fmxESWsTA2cPGYdXJxWIr8X5
         F25g4narJfrZNN9Ekauo42pA957PHPuGrz5Tcj7KxbAsNBoguuW22tiZJ5fPWmg+LcTS
         Ug+87pKTVmaL+vZR79wfjAMDFFErP1JfeCKaZ0MBNg0Ixb4wovtKA0HrfEr38fBVmkgR
         s7sKjWxglXIWPaC+7kZxEo5FCLnCs/mbEDQEq1AEb3T1l0AZfDqbur8GhlCzKQRpA+EG
         xaWL3mfTncti2+L+cxMGYYaDNHP5uoz8GgAgPW+xOcgjcuDIV0a/HCDRvLyjwK3nEsiF
         xVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954960; x=1746559760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqMZCaPyPBAIN/Fd3CxJHtlGXvSegu6boDxVIZP3NUQ=;
        b=BINTc09Ybzu04TnU0P9YywJvTgc7xvN1sDOYwziaYoAdDtT1t5bb262UganBwzKz1e
         jaj0I8JVBrfpOEOTmYZrBvtT1RTRNv0fS9W3oijjf+YFBkzoYIb60UQ2vJy/bgOGYD4G
         euGeoEyaS5ytD9fBAcepFCO/0/ko4mol2RPpIpWvt5n8OOccfDv0HWullIozslemqFuT
         5roNFLuunOvmMxMq9GtaEGOp/40exW/8RjN/wRKJd3yMyKyASBs0QXxJEJJ1uIN4MVGG
         0uFQuP42/X6zCtxU8IafAox2xrllP8Xer0b6JhUJk/Wh6EWgiXoQdo55Y9of/SoEOG8W
         omeA==
X-Forwarded-Encrypted: i=1; AJvYcCUOvdBQW52lbJeIMEnbr62EbzEwbQLxWqNBVyTxSlSAHFtDXXCvY6iGTd0VFHSj2lN3jtSCPWXO5oIutO28wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNm/2xMtOqt+fbotKkT3OdwsHUEU0tlYzD3nWEzrsIsJzhC3d
	otpagRD/56j57UhWetHl50k34EpxiMcecuTF3KtADHPeLyBsRN7wKwKo9T5Bp01smlH/HHqigwv
	JNj2AcnLJNTh2R9+0YJA3FmJW4/Wjm8pjd/Km
X-Gm-Gg: ASbGncsPYNHMMWCoL0B+XK7Q2Bb4wgqwFkEyZgoo2Cw6NoOMaLy2k6C5uj4CoydOkcn
	X6uWEx4stjyL3x9SugbwsyzskGWB1XcaRRc5CPZRDAmJyC+SQoUD1T9TP64x3L9feV6zC7omXRS
	yhuqx1+LWWZw4jXf7gwZDO8axCM7l4acnMDA==
X-Google-Smtp-Source: AGHT+IH1OnVehQWv94v0BQMbp7CUXSGalAv8VO+ObtTwx1jiibBMzs9kXVSL8iuRc7gDhDYnjG8EJirxKA4k1bx6gxI=
X-Received: by 2002:a05:6000:400b:b0:3a0:8a37:fb8e with SMTP id
 ffacd0b85a97d-3a08f77c285mr484722f8f.27.1745954960258; Tue, 29 Apr 2025
 12:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com> <68111422.050a0220.e6713.25af@mx.google.com>
In-Reply-To: <68111422.050a0220.e6713.25af@mx.google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 21:29:07 +0200
X-Gm-Features: ATxdqUHzG5OYUybCnGZV1DFce1JDL7NLUDOej9-nRXITvFXjwy1VlvSzbSi_LLY
Message-ID: <CAH5fLggj-Mfhd3311aKUt9go_+FeAuXdPxditW26QL5VtLD3iQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> >
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be=
12cb29905740789fc 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut =
Vec<u8, A>, flags: Flags) -> R
> >          unsafe { buf.set_len(buf.len() + len) };
> >          Ok(())
> >      }
> > +
> > +    /// Read a NUL-terminated string from userspace and append it to `=
dst`.
>
> s/`dst`/`buf`
>
> ?

Hm, append is also wrong. Thanks.

> > +
> > +        // We never read more than `self.length` bytes.
> > +        if dst.len() > self.length {
> > +            dst =3D &mut dst[..self.length];
> > +        }
> > +
> > +        let mut len =3D raw_strncpy_from_user(self.ptr, dst)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len +=3D 1;
> > +        } else if len < buf.len() {
> > +            // We hit the `self.length` limit before `buf.len()`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // SAFETY: Due to the check at the beginning, the buffer i=
s not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> > +        }
> > +        self.skip(len)?;
> > +
>
> So if the UserSlice content is "abcdefg" (not tailing NUL), and the buf
> size is 4, after a strcpy_into_buf(), the return would be a CStr "abc"
> (with a tailing NUL), and the UserSlice would move 4 bytes and become
> "edg" (not tailing NUL), is this a desired behavior?
>
> Alternatively, we can make `dst` always 1 byte less then `buf`, so that
> in the above case, UserSlice will only move 3 bytes and become "defg",
> and the return CStr is still "abc" (with a tailing NUL).

Maybe we just have this method consume the UserSliceReader and avoid
thinking about what happens if you use it afterwards.

> The current behavior makes me feel like we can lose some information,
> for example, if the user-kernel protocol is that "a userslice that
> contains 4 64-byte strings which don't have a tailing NUL", we cannot do
> 4 strcpy_into_buf() to get them, right? But of course, the scenario is
> completely made up, just food for thoughts.

But then you should probably just read the [u8;64] type four times?

Alice
