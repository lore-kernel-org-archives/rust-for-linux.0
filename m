Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB024EAB2
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026669; cv=none; b=Xk8ECcjPqWkaQcBCTqOAklBUPmOl+XilJftg2AkF7hqHunuzxE9Di/2UZuCC5mKdXnCjlEfBjpbcgU6h9mfWW7oVA/CCgqJGOIR3IZYyHXEb+dLgrN7Xrc3TIPpIEgNiEYnqL1uXLDGSmXsoUvfNuT/uNoEaileFW7kI4duveyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026669; c=relaxed/simple;
	bh=mc4iqsJtm4Sch2mwpZ8Pu5tQvX+8lkT1bH+4ftx2oVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUPw3fZZVhhaEJdkPUDqgdGTR84kIEw/jWG8ykW4UzH6Yso2M44ZM0HDk65SZ02RAmu3ZmHo9LQ9O2kRnyLVJUuHb2LAJ8VGVpBv2jp/ehXxPVQbGgRjPv7DIPGomgfGWtxlnVTXPu0tvt2L3PFq3zt3DQbamrUPLXoKDNtG71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzeE+dli; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzeE+dli"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso16026a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746026666; x=1746631466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeDm7nLAxnXu6RatwjkT71ungT8sACaa75OHLr2iMmQ=;
        b=lzeE+dliI/Lx+MKSAyH03cnIeXHSc+IFbd3VPweuFt/xbKQ8oKW3UN+zu0ONUCyWyz
         hT11U687IAfm41FnFWJbYwrb7/IcaCRcPHlFd6JGVHKKNBR1uSh6FoFjVJ3+o6xlDZnP
         jPQDKlGyfg5UmmTh+VEM3a4eacrdWU4PwUtHSwY1ZBOrU2xz7TAh95bTtymUaI7NYksk
         kSI/WSLfoiizCsEcHDvxwNj16Zz5ML1U4BTq0vmL7ceDRBw9FwwFMx6mEPdpx5bmAUUX
         5efkkKX/k8dr1oX7DZqhSAqByd3acr+D+eNy9FkZUuXJnDNMmQsiaprBcC82JgY9b5Ak
         7BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026666; x=1746631466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeDm7nLAxnXu6RatwjkT71ungT8sACaa75OHLr2iMmQ=;
        b=DJ506OlNjAsrx/dyb0Nvah7/aoQRvfGLADPthlmaUHkKjVaH6fVaam3/JXH3pOudT4
         9C00eDug9/yTL7t1xRrzpBlkSEGfXwbUW3KfYRu42Czkog5feTUm/O+p7shXjgMQWnCC
         uD00hfrsRx6kznEHlaEQ+gfUl/M2S0O5lmYKgXNtYwFBAeh6SGtmgAxGEaziRbKdGk6l
         mnirmoTBhxLdengqtk5AxNr5/+IVIkQkuJt061mwptA7qxGlqHqnwq+uuR8of6NMM8aS
         PSMcfw+95SPnu3JxmhSQHdqi5TURt+ycp+gWAbrtLOgyz6bL12XaaJGu9WvDfappS7Mr
         I9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXA2ZLog9nPrnA5Wv1uPzQ+c4V2Wuwjy/mdenZBWWuGMX8v0fT2KrbdUsdX01afWz3u23QXanoxODUjNlo2Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZtSYSrnyESnh+1oeYwOHLI1J3Ox3GImVXuje8aInKM0lFqZ/
	kZ5U8xEYpXgtHZt29d6PlOXNGg3VY6wQ/ZAnGGuahtkBI+GHBEJhPS7HWvafXrv28zfw2L6TD97
	AXR2UvDdr9u02cCkKmJ3inbXGF9hoXMr4hD0D
X-Gm-Gg: ASbGnctDnU6aHzVPq6n0ldM/bWhJ8mnwksQBkmSUDBax01W25BHurbTDv004G1emck5
	PFmfD5mx41NKAENjfO0IyVldBJYGM29y6t+FutfwDR1S589RA6stOn/fslpn9Cj8HHgqVdDrT7A
	Ug8ymbr+F+Z9Z8Jxcz4fZl6/uPjCV8of9xdvkQdc2Wr1JI8pAGvvHvyAB5o+n+Kw==
X-Google-Smtp-Source: AGHT+IFEbNLx0ZK5cPqpPxBC+AtdkFb1w6qa4q56RyKF/vAzRVoyOMywLtxe0yeCxlss2t8QVgLEVaarl5iaH36JsFQ=
X-Received: by 2002:a05:6402:b7a:b0:5f8:d6b1:71ba with SMTP id
 4fb4d7f45d1cf-5f8d6b17480mr49571a12.4.1746026665751; Wed, 30 Apr 2025
 08:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <2025043024-disk-rockfish-1c1b@gregkh> <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
 <2025043005-monkhood-caring-7829@gregkh>
In-Reply-To: <2025043005-monkhood-caring-7829@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:24:14 -0700
X-Gm-Features: ATxdqUEAzeZzctZ3LnlPvf2gn0jZW2r_7XtedXu0n2P3rjYFwFR6rEnjuHYaGh0
Message-ID: <CAGSQo03=09qCj230-y3yqD_4zRJ9PE8U-9NLmOZokUfBpRdKCg@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:21=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 30, 2025 at 08:01:38AM -0700, Matthew Maurer wrote:
> > > And yes, I know why you want to tie debugfs layout to a structure
> > > layout, it makes one type of debugfs use really easy to write in rust=
,
> > > but that's not the common user for what we have today.  Let's address
> > > the common use first please, save the "builder" pattern stuff for aft=
er
> > > we nail all of that down.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I'll remove that API in the next version of the patch series to get
> > the basics down first, but to give some motivation to what I was
> > trying to support which *is* done in C today, see qcom-socinfo [1] -
> > it uses a backing `socinfo_params` struct which is expected to outlive
> > its whole directory structure.
>
> What exactly do you mean by "outlive"?  Right now debugfs has no way to
> "own" a structure and it just "has to work" so that the file will always
> be there and hope that the backing variable is also still there.  I
> guess you are trying to encode that "hope" into something real?  :)

Yes, the `Values` structure used by the builder interface enforces
that the backing variable must live at least as long as the `Dir`
corresponding to the lowest directory it's going to be used in. To
make DebugFS safe in Rust, we either need to:
1. Have DebugFS files own things (not currently done, doesn't seem to
match intentions).
2. Expose things that live forever (e.g. globals, like the early patches do=
)
3. Have a pinned structure that is guaranteed to outlive the files
that use it (what the builder interface is trying to support)

>
> > [1]: https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b=
46565f4616186/drivers/soc/qcom/socinfo.c#L133-L156
> >
>
> Yes, SOC drivers are a mess of debugfs files, but manually creating them
> is "fine" to start with, let's not go wild to start with.  If we see
> common patterns outside of the single soc driver use case, then we can
> propose exporting structures as a directory structure in debugfs, but I
> really think that is a very minor use of the api at the moment.
>
> thanks,
>
> greg k-h
