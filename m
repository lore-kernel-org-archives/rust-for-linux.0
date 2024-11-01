Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A951CCB2A
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Nov 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483970; cv=none; b=qWZo0HukznbxYUT/PVi4ZYPDEz4MRLgYPe0wfx5szjO8jBJoIbV76zGx91qGiiNEGqbBxKOI5IWAai3ByMY3VjoI9HKzy1WKY/c0Z/YxuryTpTL2Qat+5rG34qZr1udo39kfirk1nf/A8joVtyLajc54lH2L/2omN0IcdelNjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483970; c=relaxed/simple;
	bh=UbgaeArJxEeaLS8DCoPVLztbE9TSjYcjzodPBB5CarA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7C9Zhc/SBk6/g0xOKw0S5I8f0auvBdF/p1TFZBNCE4kovUK9WbUKsVjMdTpfC3TKlmxrtKdVV0WWq3/FlBvau1GSbj36mokdjlf3PGQ5Op0BF3kzsVIdOLKZ1TgI5r0/3UNxrSRo3vdiAWauNK5dXfRwaHgpfUvqxDfWYwZqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dXNERkzy; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dXNERkzy"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so2049674276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Nov 2024 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730483967; x=1731088767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHFTRHafBa+64JSQGkZJwqdhjQhl87yn+cc0CQ/Umeo=;
        b=dXNERkzyvJTx49ZaXU39Z4k9AafyfxXEkZXUxRto3I87UECsQVq4n1BLWZzpHbSXT9
         /zHdx5yBqFPak9s687VX47s4/CiNjUD4OVbyfZ1uNfhQGDJjpaKACEzHi2FM/q2zK3Ul
         C7NHXxj6kFEGo0xI9T4uzitaSZcbmhRoXN17hlzA/ON4cWRhqMHJ0b+So9Ookc5z5zb2
         UPFl8QdsGsL0X40Nhh5yNNZO8HAInCjWXMORLX/lAlovqQ7bt2XF0/yy/edzk0t/UbDx
         pbLr1+lx/61tAHPMV50jvOi0snThkIOIOEnmHK3OItSV7WBw6iOiGshQC6BTvOKhtlSu
         sPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483967; x=1731088767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHFTRHafBa+64JSQGkZJwqdhjQhl87yn+cc0CQ/Umeo=;
        b=vF1v2FVbA8KICzYcNvRtSz6ChOPatoZOqS3KEdO+rBZdrZp8Szz3cXR6xOal95ingo
         ZiIGIFGwwxTPFry1rbpcPxwkSsboPE7sKSb+T+QolGKYNDwUcVzvDYJ3o/PK9xchAqAN
         hJbfTkj3/XEbhTozIJPJO65R6437tMKKfaBx8n0YOaDy5lDUb53EQXAeBORvx+mdWyss
         EVWKH3aEVQCEKNkr/W1iruXuUlxAvf1d4ld4HZMUs3+8+zi07Df+nEZT6io0IhpadnX4
         VDROig6r3lKz1es7S73VAxFpW3dD+4DNP3fKLvtuCOC7NYWQauBV7IONLLzLlmDpQ770
         8k2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5XzRlGo2RM+ANrk74YJumgb9imURPjEgByP23TxsisyUFfs8nDO8iCWXkRU9khNGuqQSxOaLpw3aYOQdr1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIm++BreFQVkQhNz9PTR+TWKeg3PBn2ORBZBC/g73sqZhEye+V
	xomRsfDh2FUpDxT/eIiZ2gDBzIQR15HtDSZnE/AiOn5pjsH1M13uNXtHAULhVKQyFz1Y85be+RL
	cg+Giso8+ZJ4Y5wiwoAx5V165vEHrfPSme/pEO6g+OaFo3kM=
X-Google-Smtp-Source: AGHT+IEYCapNRD7ztbrSnudiiod9EpcctaQvgweIgnYm1vysGZdSjWf1HTc6ccTjHniL5WPjg92cjXpUQU0GOISoNXs=
X-Received: by 2002:a05:6902:2505:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e3087a48a2emr20973638276.5.1730483967029; Fri, 01 Nov 2024
 10:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
 <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com> <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
In-Reply-To: <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 13:59:16 -0400
Message-ID: <CAHC9VhSv+ro9gOzanvPS1gZwLkqO7ZoZk7SOZ64FP+-sdmYs2Q@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, naresh.kamboju@linaro.org, 
	casey@schaufler-ca.com, anders.roxell@linaro.org, arnd@arndb.de, 
	brauner@kernel.org, dan.carpenter@linaro.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, ojeda@kernel.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:24=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Fri, Nov 1, 2024 at 6:11=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > >
> > > > Thanks Alice.  Would you like me to pull this in via the LSM tree w=
ith
> > > > the associated LSM changes, or would you prefer to do this some oth=
er
> > > > way?
> > > >
> > > > I'm going to merge this into lsm/dev for now so that we fix the iss=
ue
> > > > in linux-next, but I'm happy to drop it or do something else, let m=
e
> > > > know.
> > >
> > > Christian has the VFS side, and both are needed for this -- do you
> > > mean you will cross-merge vfs' branch too?
> >
> > I think our last emails crossed paths.  I'm not going to merge this
> > via the LSM tree as we don't have the Rust security.c helpers.
> > Ideally it would have been better to have the Rust LSM/security
> > helpers in the LSM tree for reasons like this, but it looks like it's
> > too late for that now.
>
> If Christian is okay with rewriting the vfs.rust.file tree, we can
> drop commit 94d356c0335f ("rust: security: add abstraction for
> secctx") from there and I'll update it and send it for inclusion in
> the LSM tree instead. I'll need to drop the piece that ties together
> `struct cred` and `secctx` from the patch, but I can follow up with a
> small patch for that for the 6.14 merge window.

I can only guess at what Chrisitian wants to do, but my guess is that
he isn't going to be very excited about rewriting a VFS tree at this
stage ... which is very understandable as far as I'm concerned.

I wouldn't worry too much about this right now, I'm going to plan on
holding Casey's patchset in a staging area until after the upcoming
merge window.

--=20
paul-moore.com
