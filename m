Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753024EAA8
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 21:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741125457; cv=none; b=WCvQ7FdODjyCrOH49ivYCFtfp5B2lA65haUVoEL+sMOhcZ8UYgQ6YA37C1eLBciqSBdeBMg0dLYCK+gnSfRiZpJEgp/F/7re3Ni7nKv+II4OkfSc7oIogK+Hd+EHwuEUrm2WM4d86ftJYBZkjHHfGbzxqowj4DCZogTaTpP6kQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741125457; c=relaxed/simple;
	bh=KzrIAcArmLOe3V1Ys+bs9y+LLe/XSWtbLOyhy2D+VqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyjI2U8azK8rpxcnPCsMi3YypoWAfHnt3nbjItni04Eb/8XFwWgR+6bKnajx/h4AfxIrIRYzwxNkMWhp80UMJYWWW/bkxMDner+CRLtpRMaT7ZvAgKeFtXZS6VNzu8DbM0oFuObF2mnomN4zJC3a0txseX9pF7my6jwXoHjWJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bkaC8UBe; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bkaC8UBe"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so4553815276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741125455; x=1741730255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsnikvCe3hOdMVeN/xhtWmCodnyXPzUwaCFk12jXD3E=;
        b=bkaC8UBeyV+6iTNhL7uDElTcS3201kHiMWEc1FMXzAdwMNkWYZLkHnogppVerOK81m
         KLnoNDjYnE4rxQcyVsT/eXRXn/D9K9f2lviEodsQONjWgzj5v2JuxLYVVynRE4yEOEva
         oiuRX7Wjl/dQ1+2v3UY7aNVL7emIikrFe161NQ5pDaD+LQ3geLqH1pJEQPmmk3nLa9i3
         n3gS2N4e0zZr/hU1Z+dbHVEGxsPBoWusQCj0wHXIdcLVjtmmx4kDTdCQKYvUbhCYn9Gr
         vi7ron7PpGnarKkLs+AQxaMLnckOV+Fey+ahHq0LqKistGoO46PMeaI8rT3IRG1tqE/G
         lIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741125455; x=1741730255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsnikvCe3hOdMVeN/xhtWmCodnyXPzUwaCFk12jXD3E=;
        b=X619LY+3YWpafhGSwTDLo2Z/pAo06TmZ+717Q1poU4u6IUsGF99wRzr/SpvdFHWLGJ
         xI55cop26zD+tchsJMl5dL9K8yqT7lJFFzCQePcv64L97bhPn4d/PgDhqdmw+MnqmHzG
         FKsw6d/ROl9/8hPYF0nlkFX33BYFhB5jvADpfTwtVSrcU3dQDQChY141NKHCx8RF72TS
         15eqdD+ERAFLcoO9UQyhl6aBaHaq47i0HaJLQzn125WYwk9ds2rLHU67DZuZ5vBBy2Kx
         dK3d6AF71yfySptOCc4kBM6n9wSD8+IO5hi8jqlP/a5LmR9EwE1C6GuymRoFj/dSuTxU
         CKFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1RAhnm7ENmmlPwggmDmdyJpydf4H8wJpHI2yNyr3kvMHwcNsJRNuvmFh9xkUVJ/wYhlwZE/jvNCxgZLPGQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBhJtktIe/pq9X4MbrkxLsheZtjVUF3g7MuS8ZG0/Xii7K9WI
	/MbFgB2vw9LNE4IhBWxBQywlKFCpg3INRj4LWSrSk847h99CTfcqqXzIaaLCjA5RHkRo8vGD0ms
	CH9t6ncW9NYqgZv8ljZD+pzS3a37ug4g09D1h
X-Gm-Gg: ASbGncuyIk6+o+bItbYlUk/wrr0ym8kEunV1a1Q0D8r98uvY3cskf6X1iH2p6DTUwhd
	HKDpzd6nAlhjuuIuSLRDGGxOGKkCoU5UJDzwdeWaqH9FStz/mJiCHE5nq4ztpvSuScqhmBGY95D
	qB+yqUw54uyO6B+HCwZH6OD7IWJQ==
X-Google-Smtp-Source: AGHT+IHTuaql6CxX9+oW0vQt7zfON8FgK8oPO4Dgi10jT0f1C5KKKb1wciqXNbcYDDrBoPtRQrQnfcYSdkhYI8GxvnU=
X-Received: by 2002:a05:6902:100f:b0:e5d:ae04:1e33 with SMTP id
 3f1490d57ef6-e611e18dd27mr1373344276.5.1741125454946; Tue, 04 Mar 2025
 13:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com>
 <CAHC9VhSo3aGsJVd=a3MTeakgU66oTN86oh5sZE8P4ghSk8Rx2g@mail.gmail.com> <CANiq72=n_cGmrb6+6CH1AbGePy5dRMMFyzAFv6O1VEp8EgKR8w@mail.gmail.com>
In-Reply-To: <CANiq72=n_cGmrb6+6CH1AbGePy5dRMMFyzAFv6O1VEp8EgKR8w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 4 Mar 2025 16:57:24 -0500
X-Gm-Features: AQ5f1JonifUOcpqfOyjEvG2iJEgbZmlcgciRANX9bY2EJ9_XOLCe5zh-YKF7hu8
Message-ID: <CAHC9VhT3DqOeYbC+GCQRgH3NNUiOk6Sh=6fzsFaiHk2LEFbi2g@mail.gmail.com>
Subject: Re: [PATCH] lsm: rust: mark SecurityCtx methods inline
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 7:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Mar 3, 2025 at 11:55=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > Beyond those nitpicks, this looks okay to me based on my *extremely*
> > limited Rust knowledge.  With the minor requested changes in place,
> > would you prefer me to take this via the LSM tree, or would you prefer
> > it to go up to Linus via a more Rust-y tree?
>
> In general, if a subsystem is willing to take Rust-related patches
> through their tree, that is the ideal scenario! So please definitely
> feel free to pick it up on your side (and thanks!); otherwise, I can
> pick it up with your Acked-by.
>
> Some days ago I wrote a summary of the usual discussion we have around
> this (copy-pasting here for convenience) ...

Hi Miguel,

Thanks.  Yes, I've seen the summary and the recent threads around Rust
in the Linux kernel.  I don't want to drag all of that up here, but I
will simply say that from the perspective of the LSM framework we're
happy to work with the Rust devs to ensure that the LSM framework is
well supported with Rust bindings.  However, I will add that my own
Rust related efforts are going to be very limited as my understanding
of Rust is still frustratingly low; until that improves I'll be
reliant on others like Alice and you to submit patches for
discussion/acceptance when there are issues.  Thankfully that has
proven to work fairly well over the past few months and I would like
to see that continue.

As far as the mechanics of which tree to merge code, I'll probably
continue to ask in most cases simply so we are all clear on where the
patches will land and how they get up to Linus.  From my perspective
there is no harm in asking, and I *really* want to encourage
cross-subsystem communication as much as I can; I've been seeing an
increasing trend towards compartmentalization across subsystems and I
believe the best way to push back against that is to talk a bit more,
even if it is just a mundane "my tree or yours?".

--=20
paul-moore.com
