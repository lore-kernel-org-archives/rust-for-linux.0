Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436992673AA
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475711; cv=none; b=tbDQW2el03pkvQoqZ2zVjGaLB7yQuu1JqwRm6NR0d6O6Ojvt36mRAkobEmsgt6t63y7EiKG3j+AKL7yYAzNF67wSzI/DwbWgiuLf8e1Y2TUPs4KHY/gVWIFKKad8fxYPP0WF3vBe8sHU972wjsBAPFAYUZxn+m3Zz2cLMK7sJLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475711; c=relaxed/simple;
	bh=ahHK7VADMyGzxCu2ktltvYUN5RtqjCFJ61ab34MZUfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMFNEycKJzsaojwdEPDhu1+p/hnPzoR1BeWqNngDb81x6BoYtoPdYmV8BwGoGmNuXKqaY1i3j60qJ0MY3/bwepKDx/wDUIMSIlwLcZn/Teim+5emtqSQnnh6/gnP01uRLf59qzThe+P4w8O9WtU86L+1dj34SdcOzVKgeY+wrJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkCVpVkq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkCVpVkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A6DC19422
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766475710;
	bh=ahHK7VADMyGzxCu2ktltvYUN5RtqjCFJ61ab34MZUfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZkCVpVkqB7R9c0HvPxEIaFPUgEGNI5hBVD6tVmEjGknc/KdnOCWj18QiEZ6i1+a6q
	 6p/lqk3+YAXXAkDGXhHA2I5HmmEZYDXgEXu2wZIEaTiZhSbj4/V5zyVtVoCkpetWvr
	 Y6JWgpxYvYv/pCDMh7EyA7WRat6Xu2TW6OPj0fcUO95LdgNwf0BU3kLvocktkFNyXr
	 CxOg4rMhXviJyfE+JgMds8ezTmJBaWd4Biv+numHCZAP+N+XRwCczHtejXSvQnn+ur
	 akj0OZqym72otnqgcnkuR3w4IGaCdUZXSEBOVv1OTdvDhM/VOHi42KbXj3sCusQ5Yy
	 FeyNO5REkxrDA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso41214011fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 23:41:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+TZv54SCo2++TVUBMU8Z8qm6s3nIgVxqEnoSNHxrg9NzkKW5umWt1LpoZjddSWAMiY7XDuXXStrhrcaAOUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmfmurnq+bFOx/KCQZ67jOa5PJb+6/moXhiohz9+efOuqXrDBW
	lWka9Lz8XmRhxECev761YmzDwATF9ZPCkXclZK4mbd0KISAr3Z7dJBYIeSHz8kHuxJb1R3R9gsr
	5knqjet2YduhA2KayuGX2j66lmZOzIU4=
X-Google-Smtp-Source: AGHT+IHXo+ZFzxa85f6R6SkbPoxDHnq9OqurPIv9c+1WoTJ3GSVbVMeq7fyMrooxUMk3B15pZB0xCHkxRSE4p7dHqMM=
X-Received: by 2002:a05:651c:c91:b0:37a:3ab8:6686 with SMTP id
 38308e7fff4ca-381216371c8mr47202281fa.32.1766475709635; Mon, 22 Dec 2025
 23:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com> <DF4WBS5EQVVK.3TS8CJ4XBVRNF@kernel.org>
In-Reply-To: <DF4WBS5EQVVK.3TS8CJ4XBVRNF@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 23 Dec 2025 08:41:13 +0100
X-Gmail-Original-Message-ID: <CAJ-ks9n4iouVU2f9yU0wjQFt=-HVSYVwhCd_G3wqXM6kXvpsww@mail.gmail.com>
X-Gm-Features: AQt7F2r7v-SPYJae2Gc2kIyDFjxWiG2chiie6b2LpTA91om8podcwiakKiB2HZk
Message-ID: <CAJ-ks9n4iouVU2f9yU0wjQFt=-HVSYVwhCd_G3wqXM6kXvpsww@mail.gmail.com>
Subject: Re: [PATCH 0/7] driver-core: rust: replace `kernel::c_str!` with C-Strings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 5:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Dec 22, 2025 at 1:35 PM CET, Tamir Duberstein wrote:
>
> Applied to driver-core-testing, thanks!
>
> > Tamir Duberstein (7):
> >       rust: auxiliary: replace `kernel::c_str!` with C-Strings
> >       rust: device: replace `kernel::c_str!` with C-Strings
> >       rust: platform: replace `kernel::c_str!` with C-Strings
>
>     [ Use kernel vertical import style; discard unrelated faux changes.
>       - Danilo ]
>
> >       rust: io: replace `kernel::c_str!` with C-Strings
>
>     [ Use kernel vertical import style. - Danilo ]
>
> >       rust: irq: replace `kernel::c_str!` with C-Strings
> >       rust: debugfs: replace `kernel::c_str!` with C-Strings
> >       samples: rust: debugfs: replace `kernel::c_str!` with C-Strings
>
> @Tamir: Can you please send a separate patch for the faux bus?

Sure!

https://lore.kernel.org/all/20251223-cstr-faux-v1-1-ee0c5cf1be4b@gmail.com/
