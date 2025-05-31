Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61F23C4F8
	for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698078; cv=none; b=BJhsNMQwuKOR8bjJdTGU2plprIL5xF+qJTxY2NwWnhd+2SKsoXSebSF1PYEzNNqBkIv6LxlsE6O/kWW9lS41Q+zYPNbITa7EOrTU4w4iJYAjKpJRrozIFX5hRsaOJB/RHFLg7NWpd0mdiVvNehk9YPpmq1kCivmaBc1Z2h9/rmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698078; c=relaxed/simple;
	bh=dnZGVEmP8lQ2yjLmNRMNfQCk7G7HPch0ofnn/V7NCB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEku3i+V+T7Dpvl1ZXkiJLQZj4uPNI5u7GVNJFMi+3/IY+6EB5RAuCzykamwCMIgbbNAnKQCHI2p9Kw6HGki+0yE74QF58JtR+Mwd3Cx6WrcPw3i2KDxc434mvwvDDBe7dRxEmua2wJnosgYRx1CxJq7MGRKAcHzCm1Nsl/qdrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wX8d+tdN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wX8d+tdN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a375e72473so1646107f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748698075; x=1749302875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnpqmHgYLPI4hzWL/k8NVMbgoWIzDssICv/avNSiu+Y=;
        b=wX8d+tdN+MZ9tvcGZ7FV8CJOVQc5kqRyZmn+Ve1vZur7aBsPbn/lC+GOWv7wX0eUFs
         zwPtS2rqAZSA+Jt8QgeqJDSFWqvVFdVzApeI/4tDUqo6cuU8icd1FRCCPmRLcrzaSBvi
         wlZJNZv39fFWuCCPXagtAWuX//IU9g2xASyowUudMoA+UdDqeL5GDHZQTOKmWJQnVcLH
         WpxqgaTxWXcHg7hQTarjIrMDfOMRtyl9rRWOG+4ig/3FNr5rbaMJDxmMpDP2lFbPgD/f
         RPhrmdW97s7vcInmFTJz2zqd+9AVgWAgvJLclYtP9BUqcrFZNQuCRX1FyniAs0N7oSvA
         yqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748698075; x=1749302875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnpqmHgYLPI4hzWL/k8NVMbgoWIzDssICv/avNSiu+Y=;
        b=MbDcAI4VArSXRqoT+dX39sosi9SUj3S8uxYwwALUo9ByrMZ16FQtLNJ6d+i6f9YayU
         lWc1SIldR7clCRCdiCJ5X0K1cBmUnodgQ8IkWgcz7NK/Y8V8N/garNpKa8i8pbmvKAcQ
         WP12EvVk8fY56lCwD76OQVVEOlJyXoqFtK6MDp6Gf/v2msEjqGKQUPaModSGc0Zo+sN1
         imriicPlVSgROrh45VtH8TQ0HEYhuP8onnesA3i2vEshLy3Luu9bpsy0++SFbT8yRFNO
         XaCJZ6sVB/xwGutgsK4DrUyf90fz+GXlCRLV4tFLcM9D0Dif4F0OBnraMLrzIZAdzjJZ
         OoLg==
X-Forwarded-Encrypted: i=1; AJvYcCWr59iK0t+15jxxm/uzizBAxUH6iARlgL3wTaAzeSME1oMgk+2bNvcindsxK7zROt62UgDrtxNYSHbMzyuZqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNKO3w8UqWrxygTr0N0liPk1Quui3TuBQhnTXnijoreZYOmKR
	vq5f0/6I7NyCXvydvh9JMsXNMhg/HGX6dHhO4zTRp4wXPR3VfBBkNT4vXfGW2M39MKtBESqfn5g
	Y1NGJ5wi+iwlxctgVsFQDFLBetIrKTF4eieuKaBvb
X-Gm-Gg: ASbGncuLxUOuANGH712esag/ENQfgd7HE+JxaeuZfyb7x/Oh5RPr6OzcAmbwKk7l/O7
	mhVjL05A5LrzDvgjsk64fB8U70dCDTcFd58gf9ztcvh4jh0iFAb/bo3xaqMv0lPd8HqeRnyY5jG
	nmdn9NCE8m3ZUBL7p21JcmDbl3tzwyvjAnHMcPqcWvqJgf+uiRfePvg8k=
X-Google-Smtp-Source: AGHT+IHz4dGneNsz3I86jpWfUkTX0LdPSNEr1rfeK531BxSj7yoVtYDQ9VtZtSXN1TJMVHmK3I6ahTgb51RGXdmNNKo=
X-Received: by 2002:a5d:64ed:0:b0:3a4:e672:deef with SMTP id
 ffacd0b85a97d-3a4f7a6cd16mr5014540f8f.36.1748698074866; Sat, 31 May 2025
 06:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com> <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
In-Reply-To: <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 15:27:41 +0200
X-Gm-Features: AX0GCFsyOpodom7COF6Q47O6GbdlFNGm3NxxkLS6_i0l2e9VkeQHWf9q4FIx-EI
Message-ID: <CAH5fLgjoX5AEO8NvDdj+05HUtpoVUPpOa7ri5UG6Djp98vQDxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
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

On Fri, May 30, 2025 at 8:13=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> This patch's title should be adjusted, as it's adding
> `raw_strncpy_from_user` and not `strncpy_from_user`.
>
> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> > +/// Reads a nul-terminated string into `dst` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or unti=
l `dst.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (so=
me data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is=
 added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is retu=
rned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the fi=
rst `len` bytes of `dst` are
> > +/// initialized and non-zero. Furthermore, if `len < dst.len()`, then =
`dst[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
>
> I would remove the last sentence, it already is implied.

I do not mind that.

> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) ->=
 Result<usize> {
> > +    // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
> > +    let len =3D dst.len() as isize;
> > +
> > +    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
> > +    let res =3D unsafe {
> > +        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(),=
 src as *const c_char, len)
> > +    };
> > +
> > +    if res < 0 {
> > +        return Err(Error::from_errno(res as i32));
> > +    }
> > +
> > +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> > +    assert!(res <=3D len);
> > +
> > +    Ok(res as usize)
>
> We probably should add a `GUARANTEES` comment here, no?

I can see the idea behind such comments, but I do not believe we've
used them so far.

Alice
