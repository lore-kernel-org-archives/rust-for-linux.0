Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FC23ED75
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184663; cv=none; b=UT9BIzhnfMjnqTh+FjIloVLYQEBK7j2cq65EHy2Vg4C8uH76gWcxickOWdnxrMTy8z4HJDnWNpQJoru1aXF1K4lWJEk/Ql9Y34tgtX1SVzJVtd7QYJUXcX5r4J/5/ua/Q5v3wMbqRV2KdzbDV6dqoiGqKmlXKBwOa790Od+V5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184663; c=relaxed/simple;
	bh=EVIJLewZdAn9cPIhi1dGnpmeXGL3MiLznfbSxPwMW8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rog+JHqVK3DRiXiNns0wGggpvAzeOc/ON0UwOCbEYiUloqQ6csV2yFNAT4pKhegZ+iiq3wySfT2t6qCN5JJIUP01ygAJSo1nnGoerW8efOtTq6FiUYPBAkh0rkb+3/df+METdp+4kPRFvfjcfsgRob87p/r9/i2wUojOg4DaBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2X/Fd3A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2X/Fd3A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363616a1a6so46743555ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753184661; x=1753789461; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWdtaF8/hiQZE6pBP4WedQKCW6UFYggPj0/8P+ZE8Ro=;
        b=G2X/Fd3AeFnQSDFSjlTKp8Eiu2rvjuyCJWVMqIulRGacMdODKuQHFUIfgUJOan/fGD
         HE16lEljVMKOFLhI1+z2EACPyNkTiw2IH3XMAiQsIlpmzDi28i6g9C3AWA7WQcVLCbYH
         qbSuSjRbfLvmZgHEX+Enk4XI9X5tLt1Ugl4GH61uD3NzmA+rwOjlh8OE3OzfbEsiJBga
         i2QeUKF9uOHAZs2fDhZ7V+1sUYitBKZ13OsT8zF75c4Th/J5YQxG7Jz98EiC5sSJlYOo
         a3DA8tGjvMvLBi1rx7DJC0qYK7C/4Ldru9MHSc3xdOR0rnML9+EkdEQtS4UhBJlbKxzy
         TghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184661; x=1753789461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWdtaF8/hiQZE6pBP4WedQKCW6UFYggPj0/8P+ZE8Ro=;
        b=K1dSiYWhyeXnOOGTI274B/QWFhCHRmn6OrFeJ9q3AXMS87Yw5+Ys2bLHbPGhyZMWDv
         icYh7CCbQCFIdhXPteni8XkNHHksowsryfrkrAeRjtAn0fZYRH2bM8srcFrpvT4k66ta
         vw1H8h38GsQm53Dg5SFPaoZp7pR6yRi/nXHrRUddP7MgSJHsWioilB8ImxAU3F/tz8l8
         nwNckQfa1VxAyqRMpn+Qj1w0IBbwDP4zNz3trJY7bHrrjwh70+PhufAj78tyyRAFSl/C
         XzTuPr4DqJWlxhMMXqP6CbwmICMIfEIB/WuErfUFBjC4fARJhNfm6cuj/wXA1Qy5cQwY
         4avw==
X-Forwarded-Encrypted: i=1; AJvYcCVRLkP0egQHxXDn/FB0cOf78pmuIzvCWKyHxCyR3hH/G4deWS4TbHKGrzz9KlXRhwKhDp8HTJ+VOFpurq4QdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRJdPK6Xq/J0rvf4olIzKdVrwAbHedz2P6QWlZYY7lin10t/4
	zb2byIHbNEBBekKAV57g+0+YNt62PjidTSc0+tUrSqw59ZrD1shzrCKl
X-Gm-Gg: ASbGncs3aD5OOK40IeyJ7amcNYylX6RPgKiWVBcKL9vsVBbW5qmUtQkLYikB1P1pXuC
	eyl4FBg6HsPWO5DBSyqjmHyV9NdlS8eJ0yi/WphO7qA4ZP44qeaMP+dcSGYVH5T55VFHq4vZjlT
	RA6d1v39kkORvaw4rAZifndc+t4cmZJ5/7X39O47wlWDtZAGGjnAEYwlDP8ZUqGA5dHxm4xGXDR
	GMYyTZ3FSmaKp3khYB5zZtc2Zrtn0Y8ilg37vIBW1B5PlfNs0QhVkT6hINzdAsLi1oY5nVNDtVh
	VaGaweWMU5Blpqyl+Vb6wQvf4JPZqP1u7Mozmlg8yNoY+EiJyjk+3PB5wS7Nw9cvrM2h5SKAktw
	Nc9O8RweLe+InGT1nPrA=
X-Google-Smtp-Source: AGHT+IEHfjhqzgRcQH42xNhgxME9AQ0RIS6xpqKL9SIjU9zDs1ZiZNMpLCaJO+5ajm9+x+oZ8Y9vcw==
X-Received: by 2002:a17:902:f64b:b0:234:f4da:7eeb with SMTP id d9443c01a7336-23e25684637mr312265565ad.7.1753184660870;
        Tue, 22 Jul 2025 04:44:20 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b708758sm74950765ad.232.2025.07.22.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:44:20 -0700 (PDT)
Date: Tue, 22 Jul 2025 17:14:43 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] rust: kernel: introduce `unsafe_precondition_assert!`
 macro
Message-ID: <aH95q_4y2e3dqnEZ@fedora>
References: <20250716045957.39732-1-ritvikfoss@gmail.com>
 <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>

On Mon, Jul 21, 2025 at 11:51:31PM +0200, Miguel Ojeda wrote:
> On Wed, Jul 16, 2025 at 6:58 AM Ritvik Gupta <ritvikfoss@gmail.com> wrote:
> >
> > macro. It is a wrapper around `debug_assert!`, intended for validating
> > pre-conditions of unsafe code blocks and functions.
> 
> It isn't really a wrapper, since it doesn't call it, no?

It was intended to work the same way as `debug_assert!` [1]
with 'unsafe precondition(s) violated' message, if assertion fails.

> > +//! This module contains the kernel APIs for verifying invariants
> > +//! required by the unsafe code.
> 
> We normally call these preconditions, and normally I think "unsafe
> code" is associated with unsafe blocks, rather than e.g. `unsafe fn`.
> 
> In addition, we may want to use this module for more things, so I
> would probably just say something more general, e.g. "Safety-related
> APIs" or similar. Probably Benno can chime in here.
> 
> > +/// Checks that preconditions of an unsafe code are followed.
> 
> Same as above -- I would say unsafe function (if we really want to use
> this only for that).
> 
> > +/// are enabled. In release builds, this macro is no-op.
> 
> I would say "Otherwise, ...". Same in the commit message.
>
> > +/// // SAFETY: The caller ensures the size and alignment
> 
> This should be a `# Safety` section, not a `SAFETY` comment. Please
> see how we usually write those in other files.

I'll fix the docs.
Yes, @Benno's input would be super helpful as well :)

> > +        if cfg!(debug_assertions) {
> > +            crate::pr_err!("unsafe precondition(s) violated");
> > +            ::core::assert!($($arg)*);
> > +        }
> 
> Doesn't this print an error every time debug assertions are enabled,
> whether or not the expression is true?

You're right! I messed up the testing part (explained later).

> Also, shouldn't that be `$crate`?

I think, in this case, the compiler automatically resolved it to correct path.
Nevertheless, I will use `$crate`.

> This leads me to believe the patch wasn't tested -- please test
> patches before submitting them! (Or, if it couldn't be tested for some
> reason, please say so in the message)

The code did compile, but during testing I only verified the failing case
and overlooked the passing one.

> Finally, could we actually wrap/forward the call to `debug_assert!`?
> If we want to add a custom message, could we match the parameters so
> that we can then prefix it?

Yes, I'll do this way in v2.

Thanks for the feedback :)

[1]: https://doc.rust-lang.org/src/core/macros/mod.rs.html#306-312
