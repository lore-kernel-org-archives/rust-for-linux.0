Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A01EB5D8
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115393; cv=none; b=ctc+cjtvOWMoYwJ2ZG/xohw5na2ooeiY6UyLl/dU954uStZcqHLtM8gVjE6IamfMVoQN44oj2W+D1LQyg1rc9AlZsGbU1pxY/jWV8Ni3Fh+2c6wt1tFNV8oAQ1zqIpmyB1iNZWU6gW+zTFnaorVYNHusGhzDKfWG2wcEYx+nS/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115393; c=relaxed/simple;
	bh=m+FCO+Av4kHpHPJtHKk5uNp6Z3tQxMV5Nq9W+3Ol5uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwZS6C3cYIthCWM2Efr9Kjd7rTGSC64XQorACp8MTSckjy7eoDp6Pzlf93f08AX4uqYKvHpJ4UwjFWNm4uV66ruTLJFPGKOyzDKecArAroaHeCeEnKHdVowORTG+SspLZSDLh3T8RUdVlPxl0SwdCHsrO3dcuy6FMCxm2nDQItw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4MfapSf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4MfapSf"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6602a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746115390; x=1746720190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0BhQ95eFCkHuf2CLc+ykMuQ6mFJY28TqqhucXbsaD0=;
        b=E4MfapSfXxAyHvvX5PmC7H7ilTB+/eHqnq5njOOG3rlejRddwLHLteqaJTckZpy9sN
         nOxzDbpEYmLoKAA/dNiIeKDxGDHnutpw1/HwTNNoQU52wTokrY6fsWEurpWDTNXuJ7Ip
         oXZJwa7pabVYgZ5GuwkbjHrgU7Cs/aJfhuNyfFOnwJFREOjAxVO7uv8RFnqvX8u2nZ/y
         fCJBLNkW1jK6nSgHxhYrv/PTXE9AxKDQ8BogdJZ/1Utu/kf0an5y7dXkXki8PnCH164S
         JndzxpUovUIH9f6cpDf3ztf+br8emCBCw0fWmRVS8H0em/B4dSDIoMk8E1oT8Hd5+E+z
         YcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115390; x=1746720190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0BhQ95eFCkHuf2CLc+ykMuQ6mFJY28TqqhucXbsaD0=;
        b=eezqy5BQtX3gh8hmUCle7GLgPck1RQ0V4dtos/+iioDh88FWrhAtUBHTQ4tEe63c+S
         t/RnGI0lMAcNHoIkQtwHvK208WWUoQJgOBm24Fku1KUInsjcDsf8VYhZA3s++r63IWlr
         z5uZKOxshYiLNEGD3volr8sGaVd5mba37mMfPy29uPG6u4itEph99q309IQPDdumEldp
         SLFhrJKKmTNBbTVWBA9sK/pID1yCWQ9qs24U87LeKfnelxnbyIP5ZUQIcRdE16A00KK6
         Zwc6huHBj4BO0HAG3Qkoe450htCAizYHwkx1umq9Ia1i0io99oDfLPUO9FrMpr2/qpYz
         xG7g==
X-Forwarded-Encrypted: i=1; AJvYcCXoVZ4NWHiDqXoGYZZAWiNxU89BThQvwawrVjQwomtp1c0ppSFp2GUW3gWEaZwrFzUyczixPnf5zD5h8Y42bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QWZZ+OM888gcZsb/pCh2rW8pGXYfhTLO1EOIj/BYkV9C+lO0
	jXASr09RzniZ/AbutYpDw7vEJhtny7b7VoF60/OKk7UZEGlXgP0lHUisTrDdndshbyzhC1qhmAS
	37AE2ChDg5rz40zUGI9z2R5Y6lxDMnKUmadaY
X-Gm-Gg: ASbGnctSHUPk5ekObkaZjSVvp9gq/3twvY3QM1hg2CetdTjoYXEH8VJ/8/j/LOp1Gf8
	LZOz1GRP7zPArJxWGwA9v6HqovbdaOKwppErYQWemZzwzIPEKWfhJdOrBNjq9PeB0xOD5LIAuWk
	WT1vVP1kTKkE90ebf/aW+eRYGlRAe9O/DMe3XydzHDtj1MuBnqghnG
X-Google-Smtp-Source: AGHT+IEW/SA2JtUr+blXCey8yLJ4t4R/1W4cd2StqAa1QMCl7xBxPUAkLE/i37/vYyWWFwLxirdm8M9ypruJ7TYuaUs=
X-Received: by 2002:a50:c018:0:b0:5f7:f888:4cb5 with SMTP id
 4fb4d7f45d1cf-5f918c08662mr75474a12.1.1746115390061; Thu, 01 May 2025
 09:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com> <aBNKEewhCP8jRIZL@pollux>
In-Reply-To: <aBNKEewhCP8jRIZL@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 1 May 2025 09:02:58 -0700
X-Gm-Features: ATxdqUEDFCt-sMq0pzV8lmt12d1rAero7bLyoYrA2gYeUgZ4ZjyObw6mkPjCAqM
Message-ID: <CAGSQo01O8DFe1+APM2cYYFT_4ROKrbTQpNmozYk3NQwYc3Zv2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: debugfs: Bind DebugFS directory creation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 3:16=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed, Apr 30, 2025 at 11:31:56PM +0000, Matthew Maurer wrote:
> >
> > +    /// Create a DebugFS subdirectory.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// {
> > +    ///    let parent =3D Dir::new(c_str!("parent"));
> > +    ///    // parent exists in DebugFS here.
> > +    ///    let child =3D parent.subdir(c_str!("child"));
> > +    ///    // parent/child exists in DebugFS here.
> > +    /// }
> > +    /// // Neither exist here.
> > +    /// ```
> > +    pub fn subdir(&self, name: &CStr) -> Self {
> > +        Self::create(name, Some(self))
> > +    }
>
> I think this should return a new type (SubDir), which is a transparent wr=
apper
> of Dir and dereferences to Dir.
>
> Subsequently, we can remove Dir::keep() implement SubDir::keep() instead.=
 This
> ensures that we can never call keep() on the root directory, which would =
always
> be a bug.
1. If the code in question is builtin rather than a module, discarding
this without tearing it down may not be a bug.
2. Users could always write `core::mem::forget()`, so this will always
be reachable (even if we decide to remove `::keep` to make it harder
to choose).
>
> As an alternative to the Deref impl, you can also implement
> `From<SubDir> for Dir`, such that a SubDir can either be "kept" or conver=
ted to
> a Dir. Probably, that's even better.

Yes, this was the "extra type complexity" I referenced in the cover
letter that I was considering doing. I think that probably what I'll
do for v3 is to have both the `Deref` *and* `From` implementation, so
that `SubDir` still automatically gets all of `Dir`s stuff, since your
later `File` comment convinces me we can't just have everything be
`Dir`.
