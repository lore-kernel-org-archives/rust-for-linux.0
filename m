Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2EC159596
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170485; cv=none; b=ObgK+0ObUbY7RDOa3Tf+1Y6geaGNVnjUNDKwafp8RGo/zEubxIwPZyDHZ1qCB4rZ/g4osK4IPY3K9tBsp/1du4rMk2S+NtLTxTkd74/1y9V3YVUqF6ATkhtpAPrmKjmGhGccv2NwJIlSszo9YlvCpDeQz7avjHYLAviayKuzH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170485; c=relaxed/simple;
	bh=B3HsdfgBzxMgIHgwCClZeKWkoo4ORNRSUDqz8b2l50g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mt1wnwUI4GkNE6Une0dG03BctD07Ve09WZaCAjhVWjfmBdEGy91P031E6fNo2oGuboS16mMMoyXzet4NuyLH3XHS/dVcgsWDwQNsJ5pqS78qQOA26YWPR0CSwFWM4pd3/s2Q3hIIzpUOflIL5Mz+ELr7JXDmIOEjn4Obl/1IQNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L7L9pQPk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L7L9pQPk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2161eb95317so211982815ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736170483; x=1736775283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvzFjIAhq07nlXvWeUNAaQLDjYY2fBhvjBQSOXVPCEo=;
        b=L7L9pQPk5zXURHEuQ3u+IpnxX4Eeoz5DpbZ3s19DWYfLupwebtrswq9G+Kc/Fc2zZv
         K/mCkjuA4+oSA5XQr6DsgsfU8qaLB4LGNzi7pBPxWiSMjYCKOqTboXouVAVuyIidqk1C
         1MJ/7K3Qck3t8eky2uy47Tu+oNByqOyEAuNYozAavZrINkEsdd+WNkO+gTT2T2SjGV0G
         R21K/bEhHBesxi3SHRwcKO8zkM5fVVjJXZiHaGHK9zisBgLYlg3rQS7PLjfe3suUnc/w
         2QclugrGZj8qMtBteUm2XXLunMJ6isEEeqRYE4hluiSFgqufSETPVeWJmRVDdd87edDZ
         E21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170483; x=1736775283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvzFjIAhq07nlXvWeUNAaQLDjYY2fBhvjBQSOXVPCEo=;
        b=Ks5ZFiKqOkQimBliv3p0cvl9lr9vd7Pz7Y4Pcb+TZlflYGXc6vdodrS7PyBkV3gvW5
         ZfETGNRV2G8eSasi+6HBP8Wc4gcZ7Kay95ktIjlqie36fjWu1FcHzSMMN+rwfpjPd2dU
         aEQd4kT7dHYOLujlxZ4shegQsSxKZZk+REf/I6wValUWn4+euh2UgmYKCEohIYT+BW6n
         a6G9Hhqx2g57bUsJNcgR2+X4R9R0F/jVx//edUtf4/sWhDTx7r7uOWsxYVhEv7wHOV/+
         r49P+Eikds30f/D2GqfH9k0IrzCLnSE11WkGUxRmeRooi+4Z3rMXgTNTKmvyCf5TNh3s
         bePA==
X-Forwarded-Encrypted: i=1; AJvYcCVyZSL232OipLirOehRRAbePf1huqGndAc+nnYlGIPBP4WDaoB9KsbJRCmakoNuDo+4dvaNFYqV8Haam3iBfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPJjnraC21aEk95W/jGpHlWu9kZsdgLLFhkB17277CRQTlxbO
	8tm7yrESQYSGw5MJ0nUX6/ayQb74s7mxEdTKkNIO/WLD9Pz0Tiyj+mTkXPKb9MFk3eHV7saW0J5
	fMhA+5bS+t9j186Ele0HLt1VYtMErSF4H0kMA
X-Gm-Gg: ASbGncuSnLqRVXiS59vTZFkdFQ6uPaFZ4PpB9iCIjYcqwf+Oe+SlaZdgT8ymLa4CirJ
	0aahvBdg3S+GGVDhw3Vce59PlzeUjoIdy5QeR4sqbWkKQZzLcSZuR0GYermS+DcRbG0DI
X-Google-Smtp-Source: AGHT+IHhJ6tAyikxL4AwPDCUCxCSXNVu0C37AoqU/4d+X8gNkOQoCsrHvFDUgoJNWWIrmVpWEPHQug1CGAsDFFgpZ3Y=
X-Received: by 2002:a17:90b:5188:b0:2f5:747:cbd with SMTP id
 98e67ed59e1d1-2f507470dd8mr20739970a91.18.1736170483229; Mon, 06 Jan 2025
 05:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
 <Z2hKTPIBaJ2K9HJn@boqun-archlinux> <7fee31c8-6319-44d5-b01c-7f5022054e10@ryhl.io>
 <Z3LI981PbEwMts1-@boqun-archlinux>
In-Reply-To: <Z3LI981PbEwMts1-@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 14:34:13 +0100
Message-ID: <CAH5fLggzi4-ccTTpbwjC9RaJo-GFne27L8_f68sKsR-c3knY1g@mail.gmail.com>
Subject: Re: [PATCH] rust: generalize userSliceReader to support any Vec
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <alice@ryhl.io>, Filipe Xavier <felipeaggger@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Filipe Xavier <felipe_life@live.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2024 at 5:23=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Dec 30, 2024 at 02:21:39PM +0100, Alice Ryhl wrote:
> > On 12/22/24 6:20 PM, Boqun Feng wrote:
> > > On Sun, Dec 22, 2024 at 01:37:02PM -0300, Filipe Xavier wrote:
> > > > The UserSliceReader::read_all function is currently restricted to u=
se
> > > > only Vec with the kmalloc allocator.
> > > > However, there is no reason for this limitation.
> > > > This patch generalizes the function to accept any Vec regardless of=
 the
> > > > allocator used.
> > > >
> > >
> > > Interesting idea, however...
> > >
> > > > Link: https://github.com/Rust-for-Linux/linux/issues/1136
> > > > Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> > > > ---
> > > >   rust/kernel/uaccess.rs | 6 +++---
> > > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > > index cc044924867b89f6116c7f9ec216d8cea2b3f8d7..719b0a48ff5550acc19=
f2e607c0a09f818145def 100644
> > > > --- a/rust/kernel/uaccess.rs
> > > > +++ b/rust/kernel/uaccess.rs
> > > > @@ -5,7 +5,7 @@
> > > >   //! C header: [`include/linux/uaccess.h`](srctree/include/linux/u=
access.h)
> > > >   use crate::{
> > > > -    alloc::Flags,
> > > > +    alloc::{Allocator, Flags},
> > > >       bindings,
> > > >       error::Result,
> > > >       ffi::c_void,
> > > > @@ -127,7 +127,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self=
 {
> > > >       /// Reads the entirety of the user slice, appending it to the=
 end of the provided buffer.
> > > >       ///
> > > >       /// Fails with [`EFAULT`] if the read happens on a bad addres=
s.
> > > > -    pub fn read_all(self, buf: &mut KVec<u8>, flags: Flags) -> Res=
ult {
> > > > +    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flag=
s: Flags) -> Result {
> > > >           self.reader().read_all(buf, flags)
> > > >       }
> > > > @@ -281,7 +281,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<=
T> {
> > > >       /// Reads the entirety of the user slice, appending it to the=
 end of the provided buffer.
> > > >       ///
> > > >       /// Fails with [`EFAULT`] if the read happens on a bad addres=
s.
> > > > -    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) ->=
 Result {
> > > > +    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, =
flags: Flags) -> Result {
> > >
> > > ... what if the copy hit a page fault because the target memory (e.g.=
 a
> > > VVec) is not mapped? Would copy_from_user() handle this? Or would it
> > > return a different error code than `EFAULT`?
> > How could the memory not be mapped? A vector lets us obtain a &[u8] to =
the
> > memory, which isn't valid if it's not mapped.
> >
>
> I mistakenly thought that vmalloc()'d memory can be swapped out, which
> is not the case. So you're right the memory must be mapped.
>
> But the usage question still exists: do you have an usage case for
> reading userspace memory into a `VVec`?

I believe there's a use-case for a KVVec in Binder to avoid maximum
sizes for a certain array.

Alice
