Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B32222C3
	for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262580; cv=none; b=DlTdipx4kJhJgwgC3tYWFcjy9koSXtfLnja51z2yqyQk1hjgCYba5kGtfSPsa0Hg6pFUVjjdE+aMmH6nvEJ36T0LvfcqZqXlXZY+nXxPfUERUGDirmJtrYIsoULlKkhOMa1anUbQWPx89DRt19zUTyERhwsFrb1WwtKiWhNDdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262580; c=relaxed/simple;
	bh=dTPmZVat3iQg7xidgKQIVmtAxTHyJlLqxSmrH1cnngg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQRvUB8sDV8KaqGSl3WaVk4AXA3Vv7qRWICB8b4M+wlge0mgqdyoFbEF6R7EtkG9UJSREYyGZSFwCkEwl50coVhcBUs4qCE1w+Kmt1pMpLNtBBbHj3sUUTfnUPtk1PnX9fgWQ+m4QdPd0EvjVSL4bEaqeteIcpJ9anQw+w+Rsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s85SoNad; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s85SoNad"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fc4fc27983so1655a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747262577; x=1747867377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTPmZVat3iQg7xidgKQIVmtAxTHyJlLqxSmrH1cnngg=;
        b=s85SoNadIzhAVB2X+ehz87h3Up3PKQ4vQc8H/UR80ygwWhUTuU3N6/qRNC8E2v/y0X
         fcqTEmTlAodQNCC0qirCSHqVwOS7b99lPBra+YIDGCRt0SgWqpIgaMV4hOteEgIvJIjO
         2bWOSNBgBiHpP1ggdQj9u+kPGiw3ONXqGzUys1cEg4UbqIhEYvLzmG7rFMQefCY2MkQg
         MCoGB8w3B0cN7GCvnyqVqq2dvmHlyUIvViumVkFquy8qewLf0b4jghHONU749UOokM0r
         tKsuZ+O3EFIg055TDkffj27Pp72QJgX1GXEwFrkjwpzWDIBCqDJzVn6bRei1L26wJbw5
         0/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747262577; x=1747867377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTPmZVat3iQg7xidgKQIVmtAxTHyJlLqxSmrH1cnngg=;
        b=DMjCfFjYuGm9Qs9+dRFZNxlZAvfOU8gsDNqpYYd5rj3RJHUO3fJPsAa7/MExZe1hPm
         TXt5DKNAffHh+zyDCS/CbVxcRMuZkgw59L9FsTXsTZggLxBd50Eh1PqZkDbndQeElFk0
         ghFY/8BsFWlcl/VfMI4s1TzFAjcfjflyFhpitEv6Fpooxb6HQB5mGcpsYhKuLTVGYBZ1
         g9ry1Tav5YX3kFmCNNLTQITINOyQV5x6gs/Dtdr2BzCbbzvfxBjYGlcWi78LmwIs/Sfq
         EzLXM6bdh9FfNCzB+tVMDZto/JV7iIe5PYKIE0vXXbILdwVdzh+MzVIXYj0GQ2BItaAY
         LXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIxDN7xqHYZfdRkZAh9HK/s4Oqd2PbEQjipCwzAnREPQjpFriyHHEhIcTZiOqJLctWMCC7xldP0edxz/3n7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrueXgQVQ+bOJ+uTFrfy8Rl2eJ76kK9J0HSZif19yXcZl0qCrG
	pOHYHgdM1LauSIK74JC73xfniJEzgYSnWAn90U0SviGL61k5rR05cjgXi3p2nrI0FESfIbrHDIm
	Ts9kXwkJH/iOWlGA7UqqlbGnvgRrKI7CWLtHD4z7q
X-Gm-Gg: ASbGncuYSz63Xj7LiaBsFl/cmIvdKL5DcO6rf+87NCto92qYmpotn2prLBs4UQmNesO
	vPQn9YnFWulgVueVdryAPJ1ikDhbsg4RfRzjYXJz5XUGlEP9VYIxQPZFSx+HOUMyhCyA7jeUAsg
	2q1Vzd4cV1puFwBLWzAj67QmwE+eOZRs9dKflDtjHyqJ8X+tR87dUYXrH/H5O3qDY=
X-Google-Smtp-Source: AGHT+IHU5Im31tvtHgwHOxA22uas4hBjTuXNbL5LJxD9MN/KwYiyJvt4pBB8Ap/BPSBA0Mm9bModh/Lb20VewV6efp8=
X-Received: by 2002:a50:cd19:0:b0:5fc:a9f0:3d15 with SMTP id
 4fb4d7f45d1cf-5ffce28bb43mr11926a12.1.1747262577341; Wed, 14 May 2025
 15:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
 <aCUVuXO_jORqlxwr@pollux> <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
 <CAGSQo017FgGmStYxLX7JeqV+AcMUMjmnxF6KBesFhc31BieBbw@mail.gmail.com> <d61e11e2d99659cf13d0e20f56afe319720d03b7.camel@nvidia.com>
In-Reply-To: <d61e11e2d99659cf13d0e20f56afe319720d03b7.camel@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:42:46 -0700
X-Gm-Features: AX0GCFtfpNUWJr0poQ4vDSPImERirBrJ6RO-O60RIY74nWeZMm7_rHwF_g6VGdI
Message-ID: <CAGSQo02-vYG-hkP2VXBVX9Lp8+=gxkyKh7TAYkAYhpiz6gj54w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"samitolvanen@google.com" <samitolvanen@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:40=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> On Wed, 2025-05-14 at 15:32 -0700, Matthew Maurer wrote:
> > One further possibility here, which we'd need Greg to weigh in on - we
> > could add a method to the debugfs API intended for Rust usage which
> > specifically releases a directory or file *without* releasing any
> > nested elements. This would mean we could get rid of all the lifetimes
> > on directory and file handles.
>
> I had a conversation with Greg about this topic just the other week.
>
> https://lore.kernel.org/linux-doc/20250429173958.3973958-1-ttabi@nvidia.c=
om/
>
> There are two versions of debugfs_remove:
>
> void debugfs_remove(struct dentry *dentry);
> #define debugfs_remove_recursive debugfs_remove
>
> Unfortunately, the direction that we've been going is to get rid of debug=
fs_remove_recursive() and
> have drivers only call debugfs_remove().
>
> What would solve your problem is doing the opposite: making debugfs_remov=
e() be non-recursive and
> require drivers to call debugfs_remove_recursive() if that's what they re=
ally want.
>
> Maybe we need debugfs_remove_single()?
>

Yes, having access to `debugfs_remove_single()`, if it has the
properties I would expect (namely that the kernel objects for
inaccessible directories continue to exist, they're just not reachable
through the VFS) would allow this design. It's not obvious to me if
it's the design we want, but it would enable that design.
