Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45243228CB7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856612; cv=none; b=NnZoL7pSlDKHYJuZNlAzWqtg+G/ymf2UNPi8bD4bvYCFqen2VKHZy6Shf4p2QiBGFDIojlDgw9ltsN50mMhJYGDx6pVozWvpE1Un4FOigLdy0rHH+XBEAUPZp+bP+Bc818II6Pvi2DNBHlZ/wQRUd4e6An7J08cErFCK1fZknIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856612; c=relaxed/simple;
	bh=7hdQjWzEotDVIDZcI30XgkThfzAt1j3JK+eP0FGi1Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQOXmb9cVzPqpWrlgHn5jFCoZlytmJiu+GQnRq+mf3ef10aKlsquAB3tmUCz2XTdIJtHSxP5IwkMMbYb/FBxFsusoediP5w/AV33gL7IzGVBJQmIuPLN5GF0SepRdFHUJCJiuz1LAzhrYKBfxeVQZs2zrsFRvSol+iLLGF3KT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ay5wzBy5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ay5wzBy5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-438a39e659cso7113125e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738856609; x=1739461409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBdMhdMtIUzIw4rMictCNzI6nR2pfFg19HEOqhQG/Qg=;
        b=Ay5wzBy5EfYhylEQXRQr5Q6bg1PQ9tNbVKwhMwH+Wnfilm6CQB47wo17VibWasQS4s
         mmxl1bxwymRMmqcQuj26Tj0FyCbSfc5F7q6RFzyFtYQYoCZ/jjDk94VhCex59VrCv09u
         vs9N5alxm0s+1d+Mm2NPbsZBvcBs4SVfTgxm12bAgXGhK8H9UAouNA2guvFhiIQt8J+E
         smEJAPKRS6ZsVBOoznsn7cX29j0dAysfU/BLxTXsWu9IsqPL0Lp+mmSqff7bdVk1lN/8
         tAcTSTqhGlIyZbkNbl809QKhJ5fO+RhK/WHTpNWb4Cm6dfzuOm4UZkV6HkWCoT3RJZ+4
         5iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738856609; x=1739461409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBdMhdMtIUzIw4rMictCNzI6nR2pfFg19HEOqhQG/Qg=;
        b=lAsqnQB3rBWD4nVur0KohKQnhuWFeF5IHeejHkpivOBvPUv0lORiHdpOFePssWC4eI
         iYk+FobOoqjs3r8Yor7LUGcS34kYBcYdeWnRcjB24Vsn9BLgW/bR0NOSatfnR3ejIGKr
         NLyDVhfjTD1d0rFGpFMl2Vqk7GrxV8RSZcHl1mNhJX1qUF4yGJ7JhNEf0H1V6WxLP5No
         tNqCCPqcen3CJPN9AvcHhbTrW3KGtvz7y/clzuBvQ5qUhsp98mb58lwfBiMgtvF+w2TK
         okXtAaixxpp9T8CLVks6uzzRJd9JCdLfXo3Y6G9YO0xwaaFJiyrfXvnzR5RyRjQ57iy3
         gtBA==
X-Forwarded-Encrypted: i=1; AJvYcCW9gIh42XQL90I9BPz/wIrULXSSlvQO0AuyB7efOY8To30so74xQY2W7zGdNAhZPSb0tVP9cedLNXZWoTD1UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuWYnqdkP0/DVl46a+ra9xo27SYEFzd5sG7vGs0Luzr21eJvNe
	kexM4g0gra+pSSBnU8p6/Y3VJlMpvtwSCc6TjdxD6AUTTqlMdvJgR8Lt9RyzmxveJlaCNQfwlG6
	WRWqM3JtDBCDuZgqKksRMcQU8TzGydKwzIsZY
X-Gm-Gg: ASbGncs/jVTGItsc1zfy0Pj599auuk9QXkYS8eZFHChNT8e3SCOUTSFeIIjPAcpUKcE
	hA3SbzHYGng99vv3gkAC8YxPXZUiZNZgw6ugXXBrRGooleGq/a24HdIwvG1cwhIioxFdrZP0rQg
	vukLQhj46GNuhYGif0zvt2VGzQnhU=
X-Google-Smtp-Source: AGHT+IGVKvg7QdK0ZYKMFxbiI4Gc5AjnmbWA3Q/7JAZIvDr0g+zAH54rcHrrLRM1tKGEIK0vCNsE9h7xYg8y3lczKdM=
X-Received: by 2002:a05:600c:3c9b:b0:436:a3a3:a70c with SMTP id
 5b1f17b1804b1-4390d56f21amr55885475e9.28.1738856609308; Thu, 06 Feb 2025
 07:43:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-3-daniel.almeida@collabora.com> <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
In-Reply-To: <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 6 Feb 2025 16:43:17 +0100
X-Gm-Features: AWEUYZl9AZYPANFjvhtBuOiK8XImDgpndW-XF_eT0_KkcgiqXMAivkukX7j73tQ
Message-ID: <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Guangbo Cui <2407018371@qq.com>
Cc: daniel.almeida@collabora.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.mco, boqun.feng@gmail.com, 
	boris.brezillon@collabora.com, dakr@kernel.org, gary@garyguo.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rafael@kernel.org, robh@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 3:56=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wrot=
e:
>
> > +/// A generic memory-mapped IO region.
> > +///
> > +/// Accesses to the underlying region is checked either at compile tim=
e, if the
> > +/// region's size is known at that point, or at runtime otherwise.
> > +///
> > +/// # Invariants
> > +///
> > +/// `IoMem` always holds an `IoRaw` inststance that holds a valid poin=
ter to the
> > +/// start of the I/O memory mapped region.
> > +pub struct IoMem<const SIZE: usize =3D 0> {
> > +    io: IoRaw<SIZE>,
> > +}
>
> Compile-time checks are only possible when CONFIG_RUST_BUILD_ASSERT_ALLOW=
=3Dy.
> Otherwise, using compile-time check APIs of Io will cause a modpost error
> because the rust_build_error symbol is not exported. Details at the issue=
[1].
>
> Maybe Io should expose compile-time check APIs only when CONFIG_RUST_BUIL=
D_ASSERT_ALLOW=3Dy?
> The expectation is that a build error should occur when calling `Io::read=
X` and
> `Io::writeX` due to a boundary check failure, rather than because the
> `rust_build_error` symbol is not exported.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1141 [1]

This compilation failure is correct. You're trying to use writeb even
though the size is not known at compile time. You should use
try_writeb instead.

Alice
