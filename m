Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BB16F27E
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731863854; cv=none; b=SRA3iyFyz+jtyCBv0lpofr8Rkbax4Rwu4wBau6x2UHkSRT3bg+STBmHKH8dRFhAOw82K6W/BIZd7/ExcHempRVLnztfoCrtdwpV80B5jnakV0knYmnaczBfm+gG98F4Zahk6MS/VFGui1qcWDvbGXKMadWYwE05Pg8x+ittXqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731863854; c=relaxed/simple;
	bh=6K6I/qP6XGM2FCtQHDRg38YQD4J1lNi04ieJh9aVtJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9LdA3LIX6ULvqL8VhLhC7dxIu8TOeag8OROH7qD7gYkow+1oQhiDENqgEt0fdOj33tziBsIpFuzytQYNQolPNHObWmbjiKAfU5Mf1Hd6jAZ02VadRV8xnPLlauVJVGa7lAAFZEdNprNoI94+JAa59t5vWMvIofP8ZFDWBDWQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=Aw8M13ff; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="Aw8M13ff"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-295e9b63d6bso1800450fac.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731863850; x=1732468650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K6I/qP6XGM2FCtQHDRg38YQD4J1lNi04ieJh9aVtJ8=;
        b=Aw8M13ffA6gyyTC7mtluRKKk3YJyHUnNWBlpMKczmO4z9FjUDtucKKYaZh8BlB68oj
         QU4UK2jspDZFAkg2n+Kpey4Sq4iq34IFWMzKQTzeuGN3e6JX4ybNA0KQAjGPbC7Ltyax
         xWeCtXpurMb7EtLYCoYl17VGpo6o++JO67z6qQWV+JJNv9euGYoZKZhIAcy6txkOHlla
         bXQ9kB4ec1MMIGOb+DL3JimQV/6U+XtHEtGBeWQp215voY3WOEfF1qnFd00JnU5JrE0I
         NWYLDNSNBsqD9Q/YK8qCW0uV57X3W9CDf3U1bog56JBW6nPYzndsVnCAy3iTUPTpk9jN
         kfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731863850; x=1732468650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K6I/qP6XGM2FCtQHDRg38YQD4J1lNi04ieJh9aVtJ8=;
        b=R56PYa6G5QHlVGGpX/mnKldwazCfNPiubKrKDi9H9+A3bg52L7tM90vdGcK6SuyuLx
         H9OniHvovi1wdTWWO9mIqEueW7k0m9VKB8aIoITBHji7irpRwOidX7xa0qaCq8jaR9uF
         tAZTVb3fgrxIoBf/if59Np8fCMejmm10NkN5/WVv/2L6UP6Vff3y/gHK0j5Gai35OYJf
         baF8the9AtAdY7VP1gXpnfjnoHFOUTWnKco1qS9AJRojnVz/nABM4u9THxSEmyPwDh0f
         rp1a5Ou4v1lpZSpvtyeMvkMYusAgLRBVEGG9KwSWWDDMcx6uw9gRvkrATNTBQOoyOrbR
         r1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN5Ick2y+h5HuHDxMH4Old5TL2pfcITmlfktgJzRpRNJkpGIobpSPyLwcKUZLLRwFGvRalXC8fieJ+1KXvxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CAdFsK8VTGQDphNxk1lZiiZcv+JcXwuJUu1D9ptd9NnyCmZq
	oPSfJRnzye7bHn4antlx+rsdBR4Kh8DpALPe9LNZiZOyLBXgGGWmO/xrSHPLCJYAlL3hhE0um8T
	/7XP3KZonvqfKqKxDaBbNhnx5e3A4/E0wRo0P7w==
X-Google-Smtp-Source: AGHT+IF+GboNTLfgux7jTZKcXeit0aoBZLbyzRjxD0jCVrBu90rVli1nytnU4t+ZqcGk9PQep3uIuv9PEKyfOFGRuCo=
X-Received: by 2002:a05:6870:4d1a:b0:261:b48:3c99 with SMTP id
 586e51a60fabf-2962dddcaa4mr8110736fac.23.1731863850464; Sun, 17 Nov 2024
 09:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <CANiq72=hn_-+RmhdEtqScrv-=_mFs4AtGCc177khdcU=3GjskQ@mail.gmail.com>
In-Reply-To: <CANiq72=hn_-+RmhdEtqScrv-=_mFs4AtGCc177khdcU=3GjskQ@mail.gmail.com>
From: Daniel Sedlak <daniel@sedlak.dev>
Date: Sun, 17 Nov 2024 18:17:19 +0100
Message-ID: <CAMFZ4eTrZo1YLS_7eOwLbuzLfmi228_FXHU28F-xq-Pai60CXw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Replace unwraps in doctests with graceful handling
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 9:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 16, 2024 at 8:52=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev>=
 wrote:
> >
> > There are multiple occurrences where we use unwraps (or other panickabl=
e behavior)
> > within documentation tests. In the following patches, I try to replace =
at least some
> > of the occurrences with graceful handling. I haven't touched the rest (=
yet),
> > since I am unsure whether we will all agree on this. If we agree on the=
 handling
> > I can submit them in v2 or as a follow patches.
>
> Thanks!
>
> Tip for next time: when you are posting patches for comments only,
> i.e. when a patch is not meant to be applied as-is because it needs
> some discussion first, like in this case, you would typically send it
> as an RFC instead -- use `--rfc` in `git format-patch`.

Thank you for the tip, I didn't know about this.
>
> Moreover, ideally you would also add the rationale in the cover letter
> (and commit messages), i.e. why you think this should be done (the
> Link you had in the other messages is good, but normally you want to
> say something rather than just link).

Sure, I will add comments to the individual commits. Also, since all
patches try to remove unwraps, I am wondering whether it should
be one large patch or multiple small patches?
>
> Cheers,
> Miguel

Daniel
