Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C5B311C37
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765924373; cv=pass; b=XTwz1KtdXJHXXfSdugKAlayHNXEbz1uk918113FjGAkx9fnfsbHIAF9+VL2Xl4yOsacFBbA5EAQnBO32kaonad6JwZK4EFwv/0hI6WOYOdmkgnXcGWUcNgPKoFTehAHQPQLxu1qjqnNp+StM7wXDx/Rgy4ENwZ5Evavm9o9lVU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765924373; c=relaxed/simple;
	bh=bpI3qgmct85d99Wdu8ysJv2aQrdBxKxtFJJfm0j7Fas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btnR/4kZC29FSZ8Of+5syeoiptwyIvtj1RHsm+YhhjUvgXkqihHRKWUNdd8G7vzClVPWfBSfziH7drkuG2rsjypnmyxKxT2LDDOhCbCTfWZL9mVaM8+k0zemRp9A7+e2ihZV4ejshpB6Rz9CVP/yIFG52rTjHZew0YjIlxtZFFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3G8Y0ntc; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3G8Y0ntc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso3769a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 14:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765924370; cv=none;
        d=google.com; s=arc-20240605;
        b=hM4T+dz7VF1OJrkKXN4W/QfdklKH6yf6sXQ44NhWJMlm1QfjZObIVLnBBtDy4dUMe2
         +pUx+IcvYcQUcJKne7m+ZDJRtsg0pZzWceI5JfVplaKJpjIv2yTUqH2CKQELaDZ6aSBe
         D4UR8eLJsxzGz8VK/B2rNt8jb1UkTsnZ5g7Veved08a2Yt2SQWghrIPvtzovMtlpKk2Y
         WIgAI+y1jxOnWUFl1gQKvO6oQEtO1q3wId6DZGy6sOYi/rBtIz2YQjYmKuHPIkk6dtQk
         y/sP011Kb9b530oLBjrlrIHEeDQbfspl9zSLZldOYF7WquTwFyPT4+eMHTPb1PWnaTv2
         IYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        fh=eaTNxMVy05hPpKggBcifRo6I7JDGFwnLutrPvzD7K5k=;
        b=fLbDAgV/2F5sEJzFCBKDyouL/k8zCPgFILKVb1E6ycwbLvMHPoOJYkeqGCj1537Ubj
         V6rS9QlTxFgywejgwKMqymsDw5Cqj875l/IhE2HmsHsJBgoWJgO6EH+AHZMtdjxBDHtY
         oPScxJ4fMR+kWCwB6MYzSV88eo7YBum7o9GafQ98UEx9/QPai0Y4sagXNEDy8DbfMCn/
         hbV7Yu3/av4WbvbQ73BrdDju2zZu3HbrsHWMssUzHdFdaiAFQKZKxChTTr7jozL/5bGp
         E7vUIPJtkp0WHTNshlUboguRyBv8iLFcfaQmt9VJezmFOFxSwms/ODtUnHbY7tILCnUM
         Q/SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765924370; x=1766529170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        b=3G8Y0ntc89S11XNGwjl0tL6CoUWCmOZwkV9hh632nXInvKkngMf9yaxZxx70Pzd4JI
         3ueD3QdPhPQzKj+sMyazPs8+lGLm1qgAPt+6tA/RLoqcVmGcC9+i6PTy2mGT8zArELDr
         9HWTbnDOfNZWcgcx1Pphg+NPkxOIBhDEcexCpARbj7qt3SEdol3hquMA48C0XJ5hWW6F
         LumiRInZstQ598Z6vGL9KYd+g8cq92JjlzE852t4/rWiFgj0FKUv61P84KfWYyfAjBZN
         touSz/ZKRTLhqkcCrPdn4aw3C4wlU7GmSXBRHVyn2C0emHfgd9sQOdmbzPrFKG6Uanxm
         vbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765924370; x=1766529170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        b=AmMhbthMFdkGbMFN1PzG6vtrNIIRtHpLhaiqSdXSXmMtHcUyct8qd0VTUkhT331mtD
         77Uvn9AMYPywtcgVrINu/AZobgX7AtHKvI9c+YSX8ey4F9/RaczeBm8D5r3TyzrrFU0w
         fQYzeYk/tcFlH4/7Gum0bIgMv+IAM0t1aMVfdY7Di3SN38d6UvTYHgERGVgJrE5Xc5YO
         rsfaPxFdfjMc8wvsr80dQGezr1uRZwUo1F0+z9VpJlW+PUVRGEQY3IxprN9mSBUw9vyF
         7pB347BLIQx0U5K6el38qXleG3Pev2LZP7OXJgfRgjFlCDa2B11OqvArhgmRasqWtgwj
         FNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCbyCM5VyndEcQNe+m8ZEdq7DeXZivYiA225TkZrsa9jDv4GNqLfXEHnd3LntX7Q07GDEaWqfL6GM/X0BL8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmYs4BrgUIX2rgvcxEzvf+2kC+lAytKvZG60Da6MTwLcVYS6Lq
	HVbjmb9N7GQbvc7XbDkOe8+HstWJEdvivLQasSh1xgHXjHoozHjU6uvvvhNxNkBX9EYaB4AsyPy
	ue7siYbtcO8RF58F8PFDqYPeAgSBxDys1dttDrW6g
X-Gm-Gg: AY/fxX5e6SSYcaZzDzHy9e4PKSA5nLb7J4qvk++XNX77RpkXhxc+yCNzJ57R12lpLsa
	KLRe9ki+fihqlVIE6S5HjNXt/Zb0kU5bVYANmtUVmbhtQHgw4MEV4bcEUGewg7Li41VHMP7qTaj
	RfuxO+loq42z+LOsfe57sVH07BzN1OMNuYiuX2y4Z1s+IOTDqK7gpjo78D+JKt6syDiXfAcvSYq
	McT0Wy4VZZ6OKSt2rXXCxDEQvO0LhsRuqoAvpoJ7DgwubJMurNUO3f7Te9BHogIYYY8/xOPwyUv
	0Am4QPMAzEnaQ5pyBfgQqwBlOw==
X-Google-Smtp-Source: AGHT+IGk+uzAq4KrDl4d6gp44pXmFrmRq7YrqGJeM6IUZ/xwN2/FNI9D5PEuR/uqGEmokbJ/ruk9yr3kVNSu4r9RbYE=
X-Received: by 2002:aa7:de93:0:b0:643:6984:ceea with SMTP id
 4fb4d7f45d1cf-64b420db90cmr3076a12.13.1765924369503; Tue, 16 Dec 2025
 14:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
 <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
 <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com> <tbypgxb6ksoa3b5lshlczfozcpz4vvor3ypkpwocl4oczi5iyl@ufbhyyljn3zo>
In-Reply-To: <tbypgxb6ksoa3b5lshlczfozcpz4vvor3ypkpwocl4oczi5iyl@ufbhyyljn3zo>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 14:32:38 -0800
X-Gm-Features: AQt7F2peL8HajVvvFgsPh5Inmu10tO1nxbHHDTz5Irq_1l5Geotc52icf8ueFUY
Message-ID: <CAGSQo00DqmA1ihePtOWqv37h3U0NjN3ka853XA7w+6aCUkxS5g@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 2:06=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 12:55:11PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 12:52=E2=80=AFPM Bjorn Andersson <andersson@ker=
nel.org> wrote:
> > >
> > > On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> > > > On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > Shouldn't this all just be in 1 .rs file?  By not doing that, you=
 have a
> > > > > number of public symbols (that are very generic), that will "poll=
ute"
> > > > > the global namespace of the kernel symbol table (unless rust does=
 this
> > > > > somehow differently?)
> > > >
> > > > Rust produces one compilation unit per "crate". In this case,
> > > > `socinfo` is the crate, and the other files are included as "module=
s".
> > > > Symbols defined in them are not public unless annotated with `pub`.
> > > > `pub(crate)` makes them only exported within the scope of the crate=
,
> > > > i.e. inside the single produced `.o` file.
> > > >
> > >
> > > Does this imply that a fully converted drivers/soc/qcom would have ~5=
0
> > > subdirectories in it then?
> >
> > Not necessarily. Directories are not mandatory for a Rust module,
> > whether to do things this way is a code structure/stylistic decision.
> > I did it in this case primarily because I wanted to separate out the
> > large in-code data table (e.g. SOC_IDS) and the logic for speaking to
> > the smem driver from the rest of the code.
>
> Separating out the logic for interfacing the smem driver sounds like a
> quite reasonable proposition, to the point that I'd expect this to be a
> module of its own?

Currently the socinfo driver is the only user of that code, so
splitting it into a full kernel module would just add overhead to no
benefit. If we had multiple Rust drivers, we could consider between
either referencing the same file multiple places (would cause minor
code bloat, but avoid module overhead) or making it a module.

>
> > If you have a preference
> > for a single file, I can very easily put it all in a single file.
>
> My preference is that this follows whatever is the idiomatic model for
> in-kernel Rust. Whichever way that pulls us would be the answer to my
> question above...

drivers/gpu/{drm/nova,nova-core} use multi-file layout (with a single
kernel module, and multiple Rust files), so I would say that it is
idiomatic to use multiple files to define a single kernel module.

As far as a directory per kernel module, it generally appears that
multi-file Rust modules happen to have an exclusive directory with the
exception of the binder driver. However, that may be coincidence, as
most of those are defining a single high level kernel module, not a
cluster of related kernel modules.

Danilo or Miguel might have an opinion here on when directories should
be used? The Rust Coding Guidelines [1] don't seem to have any
opinions on directory structure, and I was unable to find any generic
guidance for general kernel development.

Were it my project, I would use directories for any Rust module that
was multi-file, and just use a regular file for Rust modules which
don't have a natural division into multiple pieces.

[1]: https://docs.kernel.org/rust/coding-guidelines.html

>
> Regards,
> Bjorn
>
> >
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > > But putting this all in 1 file should solve all of that, and remo=
ve all
> > > > > global symbols.  Especially for just a small and simple driver li=
ke
> > > > > this, no need to split it up at all.
> > > >
> > > > I'm willing to put it all in one file if that's preferred for
> > > > organizational purposes, but as explained above, this shouldn't blo=
at
> > > > the symbol count in Rust. If it were my own codebase this would be
> > > > separate files, so up to y'all what level of granularity you'd pref=
er.
> > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
