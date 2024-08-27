Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C638143C7E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748278; cv=none; b=SY1AXAP6kgG3qQlpqAlopHBaYxLeqpvrpeMLRYigHfFN3tO4g8JOWuplPSL0cB22IYfdPs20lXE1VvrgPUOCcsp7GjmLNwXUbieWp2dXNCGLSiWw07R4B9iNVRx1uxBXsnqE6mk+AgiySCOhLYvAC+AR+C1tdoLM2HYRhjtiN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748278; c=relaxed/simple;
	bh=NvbeC148oSRbYXMM0uzSxMd4msog5xZUYO0JEMUJOOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMferSWVPIgSdw+rv38dr1K9u19Npa+63whqQZsoDZCO4G6EG8WiMxO4JzMHTV8wnH5twMd8bwWH9+1MYSpdimamBMbF0uZUkDHmNCeb/408Fz4Rb/dN5997ElQ1+FcFZ0F/KwbY0d8B9eWJoVIcjTNNgJ7vrEjcfuDkuSwcs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqLrf7GJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqLrf7GJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37182eee02dso2785657f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724748275; x=1725353075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/3mAhAO5h0s/qUUCeFcScHoCRmtt4LbfBn/mVCsy1I=;
        b=UqLrf7GJk1WupUC9xoD42lZVBZf9bHjeN3DXHQJnFTv+ckjSRpB8lY/nyRVheG3V+K
         2gWV/GiYqXDK8BZi8twV7IvUQ/73cJtV0ENoPMzLE2GlYvYsl0pA3s9nYN4oX9mArWSO
         HdRyTsBoKeZ8eSqw4Jdy/LLIZefVF7oq3VDIb2dedBHLGbGHkFjVStIatdfX1nlLAnBQ
         0DRSyYqxcAsocAIQW1um9HBE/nBmA1btIO2d5uVSE69q4uHJM7puJJe7KRb6PteJ7lyY
         8KMNoli1UAe3SCs4DLxan0BNpOoRle+2BKCpLxZYdfY5rohQOBBXFf8B7oB3uvyRJm97
         wnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748275; x=1725353075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/3mAhAO5h0s/qUUCeFcScHoCRmtt4LbfBn/mVCsy1I=;
        b=DG+bdgdwrR4V+6ldgb3EaIRQlg6G9d/tcZ/bWRjAU/gOpkKenuU41BBIzSlac3XJmQ
         OFwtOFrXEg7sTuNhFjoqxcNu2UZW977bvIqpatqUgA27eq+Pg6+Bt7Y3gikUAG6pnJNU
         GD4AknUCAeMXPw9gUH53jq6fpEJcze6yk8m1S3CNbCPG9IzWdNT7Qq6B+1qe3l9cTBHh
         Hch6MAsIxgJxBBzOiX45QdaLebf0K/tl/ZqspwkbnQBrY/6JNEiVwZXXiYV10WUfOTa0
         +LYH9ZwD/sWp7shjbVqDKJNIwFZm2PiIenXr7OWFNlAvMwS0/5CmOHwr4g85HwBcT4y5
         01Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXUZz0v15xLGFT6XfoJZ1tToewm72cirY+wdm+J6kP6UPVPk/EvBCkZarosmYp8C/GZ6ZzVf+wvcvNFgjzUSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyctWJOWMFzZHf0uQ/7osQHiSxWJjFSjjgDEiZrxKoQn8B7/vie
	+e8YTFO+QETWYuR34nXub5xJOkQRMi+hU/yGTBWbX+2keSBsQMPdOyK77CK+c0LD5DWsCcrkHFM
	h1iyTGiCeEL+NrM7mb7TlY3oVBtyvgTV2r8uP
X-Google-Smtp-Source: AGHT+IFYTHQlYLYW/Qk5Rja0NVX3FfQ92z+GUd/bLTu1Q3IiU54YX4Xx5iOcW8R6LXMQYW4lLg0MDKKJc0XPIyhj5L8=
X-Received: by 2002:a5d:4a43:0:b0:367:8e57:8 with SMTP id ffacd0b85a97d-3748c88a644mr1182066f8f.19.1724748274370;
 Tue, 27 Aug 2024 01:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826-static-mutex-v1-1-a14ee71561f3@google.com>
 <9feb41cc-cb1c-4d0d-a3df-09298e69af69@proton.me> <CAH5fLgjtSVMcKL4aMrNT=zJPGvzAPJt3qAUMYdB-+3=s80FNKQ@mail.gmail.com>
 <91ce9f9a-5def-4f5a-ab9d-9bde4736cca0@proton.me>
In-Reply-To: <91ce9f9a-5def-4f5a-ab9d-9bde4736cca0@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Aug 2024 10:44:20 +0200
Message-ID: <CAH5fLgj3fZpHQ3Mxz-1tNgmR_Y9Cpqrxwo2HeT+QT36bYoD0xA@mail.gmail.com>
Subject: Re: [PATCH] rust: add global lock support
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 5:46=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 26.08.24 17:31, Alice Ryhl wrote:
> > On Mon, Aug 26, 2024 at 5:30=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >> On 26.08.24 17:27, Alice Ryhl wrote:
> >>> +    /// Initialize a global lock.
> >>> +    ///
> >>> +    /// # Safety
> >>> +    ///
> >>> +    /// * This lock must have been created with [`unsafe_const_new`]=
.
> >>> +    /// * This lock must be pinned.
> >>
> >> You could also ask for `self: Pin<&Self>` and remove this constraint, =
or
> >> is that not possible in your use-case?
> >
> > The value is going to be in a static, and it's inconvenient to have to
> > use Pin::new_unchecked when calling this initializer. Not sure much
> > value is gained.
>
> Can't you use `Pin::static_ref` [1]?
>
> [1]: https://doc.rust-lang.org/std/pin/struct.Pin.html#method.static_ref

That's an excellent point, thanks. Sent a new version with that.

Alice
