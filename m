Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA28A21D596
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532342; cv=none; b=XmmvUQP81cqWjiXEJn80zDhRiTWy2S0sPKTae6yFlw/4LGZ07SBfuJBPhzMnrUEnVffJVHaK48tF37rNPqbTm4VzvQTrvK/RPq1tF6Wd6BV8WtAs2Trw76Wrgm6LG+r0JwZK47FIngFBQpENE1sZQO2MqAzpzN+TK6TDYMwOX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532342; c=relaxed/simple;
	bh=RSmzwJrTXAwWOpjHjmJYH77Dj7djuXTaf/xefYjNEy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvjzXQJodBgVslr31BIuQuCwl+yuJhhwkFn60SZHOEOrvC0T0UBLdqahEZbzsucH+mbedNwcuzIi+yGVihtuKSfAdgt36dTGqGcbIkmF+CSdDKE/KAJlDE9y2X6FExU6ycGI1l48H3HDEQ6QuLZmN/jMFRje9mN1OcipbHnzkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf4cpH3u; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf4cpH3u"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47174b335bso677898a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758532340; x=1759137140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/hg83WyLrNC10Q0spl1aOUqEb5TFCtt6mtrUXl9W4Q=;
        b=lf4cpH3uBXqM1D7LY1yaYhEnfxrJyo+W2SFdD64FjNfHCUneMiIoREL/FdXZpllBtQ
         uxYEsBIPFgxO4eB92IGHdEYrJxbwlrGX+1H2FfWlv13tE2xk4YesmfP7w0F8p9yL22Ym
         Oyf9apAH4JoY4i4lLvdP0izP67lxdT7ELVOzEGBRTiQaMyGYZDlyoDulHVxilLpKUwb7
         QT3dt/eOv+tdMtrV85gMb1bqYwSDUYpPBUSiN+MoBEAXrnaol61vfCc/rjskhl8ztvjT
         A0YC+1MNMltUyN46jHnluiEoO9F6MKZZ5RyThMN+twqtGHLRPaOwN+YTACVdIPNiNsmm
         ETFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758532340; x=1759137140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/hg83WyLrNC10Q0spl1aOUqEb5TFCtt6mtrUXl9W4Q=;
        b=gy9WCV0lvickLpIoB1bCW/zg1iCldYlH4T5T3zr3goGXX+zQmnTd+LZNT0EY7uBucv
         3a8XJmH87bI4yZivQoP9RemF1+Y6UUhuk07IWZD+iDzvt+W8Gb9zNjHXDjJxqnjdDoTg
         M+l2LfyhtcCt7+f6KSe8UyKx+MM6iXj31WpeGmcoSlIxqoG7pS+iLl14K9cbnvd7mE39
         sYMhovRN9R+r0ADttgWhsuxo8xP54ZaLJVXA84K/Wt6wTYe5IiTJ2C/vynFAZ9KxOBLG
         gnZNmwyD4CAPFRv62Skxav8FF+evRLLbDzQQLwTpI7C7XahQ4aMwViVZapC6wVtDZJHT
         FjXA==
X-Forwarded-Encrypted: i=1; AJvYcCVUKO6HlL+yMF731hxz2hL2IjhMJsVHBpLj8VwHlZlT1agCaY9aG8do+IC/BCEM2nYKQnq4nAzIs2vFgAZ5zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EHUKd+VxphKHH0+Bqivg/4WkSSUZ1Xu+6QNp3WKRzjYFp2ZD
	2V94+pULy87pvvRv1fhL6egqLi/WLJSzuIV9TjaQhiPG5qHcnLv/9WHZIlOPeCL0Gy4XSNK1bpW
	Ns2BrzMDS/F1JyZ/1sDQNW/nq8dOwmjM=
X-Gm-Gg: ASbGnctMM5r4r4iOWmA7Dfkbvua9PegqMi2UPt12j9V8LwzZOhL+V9pFdFyo82bewPU
	uIAbARjNHZFQPrvpVeYyr/KJgfcCkPeXUQyhzfuQYv0F50tkRR25CF5dzk/rFNd8WvxCDwFJcuW
	5Idicxmbvl7K80zUs40xalko7HE8TcegyBnJQwPEH2u4BNi4IN4fbquzGc7wnCokh155IEx0clh
	FcaUrsyF+7WsZre+f1vHupMC5pd/L+D2+P2Av4ZlhBmDXF/F9ZwryiUznKtrLxivA0XdhJ7of26
	92JRwa1D1EqXD+C8v/zP3OKvBQ==
X-Google-Smtp-Source: AGHT+IH+Y/Qw1sGfA9WSg6pIylqKFXuYdPBu9mI4y/JfqzYaBs1Wh3UAruX5c7Nq9JKlgrqodinHl1AP57TYl7YgxCg=
X-Received: by 2002:a17:902:d4d0:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-272f27d3695mr44402795ad.0.1758532340177; Mon, 22 Sep 2025
 02:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
 <srjU1u3baX4w21qEJilAGIT7S5H_ePu7EGtxWPBWfmpn8yDwI4EuiRdK2648g3LuDskntabTv1uy5AcGtnFkuA==@protonmail.internalid>
 <CANiq72=33y3L8oN7d1BaKpD6TxEzhVKUnyx7BGyX+z+HdQtUBg@mail.gmail.com> <87ldm6x5fd.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ldm6x5fd.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 11:12:07 +0200
X-Gm-Features: AS18NWBbfLiiY4Fp5YMfiZOmxNu9S_kF6Kzt3ya7uQSj3ot_gC1UutnjUS7PFCY
Message-ID: <CANiq72kuRnfR8nwc615DxPVYABQ9Pkd0K6Qj=VZZqfb3rvjd_Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.18
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 10:22=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> I am actually a bit confused as to what information you prefer in the
> tag and what you prefer in the pull request message itself. I would
> appreciate a reminder to use as a guideline. They seem redundant to me,
> which is why I used an empty tag last cycle.

As I mentioned, anything that you consider that should not be in the
merge commit should be outside. Typically, mentions about linux-next,
expected conflicts, links to test merges and resolutions, any other
warnings the puller should know about and so on and so forth.

That is why they aren't redundant -- like we do in patches, one part
is the commit message and the part below the `---` line (or the cover
letter) are usually meta comments such as the changelog.

Of course, duplicating the tag message in the email message gets
confusing, which is why I asked, because then I am not sure which one
you want me to put in the merge commit.

Please refer to other PRs for examples, e.g.

    https://lore.kernel.org/all/20250605025400.244965-1-ojeda@kernel.org/

Thanks!

Cheers,
Miguel
