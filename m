Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330F28F1
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Jun 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750524468; cv=none; b=qE1X37lzRbd4yIT1eV1XSunQYeUfeW/jtadLF0C8+6n94fCL80Ss2kA60IAvGZmrk6gMl8/Q1CFqvcLbNQE7vpKEyR4C8W7rv0k/KxD4+nIjCQ2Er1sLqln2iQve3W/LAOVp8RmzAYlzHFH4w85gApIZ23cafnd9j9ivuAoUhY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750524468; c=relaxed/simple;
	bh=jNeoKbM/DLQBV9e6aHhN9Snk3W2Vf4E60Zv40WKThxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUo/aQS3jNox1/ISh393ZVTV7zifvMdTOn42/OgwMz3AVH4Ty+AtOH5IORWI66fYiYfkVjlazaDtrk94oTT8CChJfj0aTUHRB6R7omSeaqBM9KUFLqsgM1uw9e9MHZRP5mrnvGpZcbnYrU33rPwzSuBBNQaoQixxeNtI31p+JvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYYRtUxW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYYRtUxW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234eaea2e4eso4610095ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Jun 2025 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750524466; x=1751129266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8GqFW/c8fYaYOl804UXg3CUaucNzIG8FC055y67qg0=;
        b=cYYRtUxWnhCvLoE8OezQFWaws+7XGeGypxBoFPWnbLgCAZ5IinKXVaXuf8bIkqsOAw
         2EPey1k7QjIStIi54ECeWjx34W2YjGBksioidMzkF/jM2c36qeJQnEVihdxMMpeHO8t3
         C9L/JMBJYeXtb02zrk8vS+Es48n5vUBVn5jFqfaA36QRLfHLgVSmuZaPLCD0NN+prOC6
         ZXWVDwf4XGVWIKACCNUfvg1YIshlgxPeP+ee0AiB1tJumtXVa1mrdrpBmCb77SzODS14
         xbvaQW6GofKVL5wrJyiK8Ms2utktyGVjg7J/LbhxjdooDbapnP/EeENyD72r5HayBGiS
         L/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750524466; x=1751129266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8GqFW/c8fYaYOl804UXg3CUaucNzIG8FC055y67qg0=;
        b=sDYt3/r7ajX8E3RDyjm8IHvq9YidRqswSR61qu0NUassF7luC3J6Ee8vjPmZJNGuE9
         0PxcrYSFoCk5s7AeSf0lLnx3lnyIdJitc9XApuNuCJBVppqw0/8xdb1TsoNQLv1zkP7p
         zrdWM/ssFC3a4nbJGrgYVkSyJPik9cdTAtx+bZtyV4cEkKwzhmRUbyBwQGh0zaArXeDi
         GGUi6EOTQ8eC4B424WLNIdhCGT+bqg34Tn6AJRunsUVvyCdf5uTxoyxbqofykJZRMpSN
         +OHVF9dbJZJZKZwdC6OiXFD+yGU0zJlfYKYPu3mC3Th8xXtR99hrezpM4foubHsmg1kK
         PF2g==
X-Forwarded-Encrypted: i=1; AJvYcCVq+TmMfPFqBgUqHjq75ogf8+augk8/1cWfc5uq7I/DLyy7t814CIIEy9IkafHFerbM9oxlqpHWTuY2Cz/wQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/xnRx3ZR9VbQdgpTeqdtCGv4ziOusTRIv1KZRCFTUj4VowQO
	iR4ADYbdcEuXEZLAXVDDKWwa+Gp3qwYrxpwUqz+u7rVHrlmvvzr/rNCFJ+m7EUFYzhXQc49pkDM
	2mWtnBoVbSqBnqw+b+bY0Kyxr5UXP89E=
X-Gm-Gg: ASbGncsRmJKltBa7dNSCoEH44PamFGF5dFZhI4D86Jq+MgY4kspkbPh+oOJ70+Mnlh8
	H5UAxLbvsD0ekizqZTec17ufbF/lLzATrCkV1FsSqJ8p8ErU7s9E3oi5cUE9n/zatMUsNt6wKzN
	rUPxKh27WjKkOZ1tBiWcbNSaxs+wdFr3A5qGXY7G4EbPqtREZ9MeeUhw==
X-Google-Smtp-Source: AGHT+IH5AHACYSI9eYr0ZXTTvngtGu55aTO1ZWG4jAQFhUcbduVVOWHY54RNK1f46pUzp7SiDAYhyoYslZ9I7e7DAzM=
X-Received: by 2002:a17:90b:57ee:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-3159d8c6488mr4086216a91.3.1750524466455; Sat, 21 Jun 2025
 09:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616193433.2643407-1-ttabi@nvidia.com> <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
 <a3cf49cb7d664ce2c61cdce9a6e0cfe721aa6bb4.camel@nvidia.com>
In-Reply-To: <a3cf49cb7d664ce2c61cdce9a6e0cfe721aa6bb4.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:47:34 +0200
X-Gm-Features: Ac12FXyNm3ow3eNhyDZeVdWkS7DitdH2BoIbY9hll1JC1EYCqtIFhpNmVxvpN8I
Message-ID: <CANiq72nWOGwdGj4p+nd2+0Tw-L3idQ+q+2BVM5M8ce-mTKmEDg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:07=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> > > +/// const SFILE: &'static str =3D sfile!();
>
> Sure, but I have not found any other examples of a comment example showin=
g the output of that
> example.

I meant something simple, like:

    /// // Contains: `...`.
    /// const ...

> I will make some changes, but aren't we heading into bikeshedding territo=
ry now?

As I said, it is not a big deal, it can be improved later, if needed/ever.

Sometimes, for "core" things that everybody will read and learn from,
it is good to try to do it as best as possible, so that it serves as
an example for others later, if that makes sense.

> Anyway, I think this looks good:

So the idea of splitting was to add some actual explanation
in-between. For instance, I was thinking of something like:

    /// # Examples
    ///
    /// The macro may be used for succinct logging purposes, e.g.:
    ///
    /// ```
    /// # use kernel::sfile;
    /// // Output: `example:42`.
    /// pr_err!("{}:{}\n", sfile!(), line!());
    /// ```
    ///
    /// The value is a constant expression, so it can be used in const
    /// contexts, e.g.:
    ///
    /// ```
    /// # use kernel::sfile;
    /// // Contains: `example`.
    /// const SFILE: &'static str =3D sfile!();
    /// ```

> For the first one, there might not be a slash if the file is in the root =
directory.
>
> For the second, this is for files that don't have a .rs (or any) filename=
 extension.  Technically,
> that shouldn't happen, but why panic if it does?

I wanted to know if you had a particular use case in mind, i.e. root
files and non-`.rs` files are unlikely to ever happen.

As for panicking -- having dead paths isn't great. This is a
compile-time thing, so if it ever panics, we will know about it, and
we can then relax it if it was intended.

So that is why I am asking if we already know about a concrete use
case, because if not, then we can just simplify and wait until we
actually need it.

Thanks!

Cheers,
Miguel
