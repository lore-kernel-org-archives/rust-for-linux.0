Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD791E376C
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108576; cv=none; b=kMr7hCOCHjdfUUJQt97XX5eTYOVzJUMiRQ7QRqC59R3DJ1GrMjMTxfLRFev9x15RJZGFNgizrUuGY9tkYwIHfxidlrPpCA3BPN2n8Lgs4XBVg/TlDBzbU2NOsaWrRj9ORBDSixovudsJYwmuAWDppvuK5qyRf6nwVDNezQljqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108576; c=relaxed/simple;
	bh=uMbi7Kxr8rvZ7kIsukRrp4ZI9YsrDaZgWVczVADFjIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI+sbRj2wK9UXBtB5klE6VaHFc6tCBlJHiYXNonvaKctqttOPgtxy/Hs76y36JlJRZx05Zuajv/2pnosXg65cPLVXDeE83cnUxcNYFA5+1rq7fGbWuLbdsQ/BKqlt9DflQfQsm56z6t7WLJ3kJLm2a5biSfZICtVBi4t94v9z78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKg5UB/G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKg5UB/G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so19354645e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753108573; x=1753713373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTmlftLa3/YVt1RZ5+485y5Gyr6GHR6cDRdtU6PtQ74=;
        b=VKg5UB/GNZmHLg07aYkm4xemIVnKjq81ZS6sFEHQDXm5TSPV5/8M83s1e2ymStzIwh
         1qymgNLw2w0FcavCyp7CMs8ND90kB5+uFHeyw6I8CTAzBkH9mutjYeCIpC+u1DZI9hso
         KiOo0al5PIvAp03ctobTeh4axgSsrFFuipnPGOnxFrciJ3ktWjs1SeLqtdeDiwfXgxot
         hAUuOW0ar7maFdR9AZmLLswOUPqmy6AMdth0NAO8HCHV0t0zFs2Bg3+PmkAdI/TiL/zA
         OG1kYOluvtuRF4XsfMY2MRi65t0Dys0qTk+m0+Uc/qvIplDmK85/990fdj56zPpySK51
         8+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108573; x=1753713373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTmlftLa3/YVt1RZ5+485y5Gyr6GHR6cDRdtU6PtQ74=;
        b=kSENlz+spaNXjcBMWMWLASX3sq9jpZk0Z24gy36Tc1MGEBR6Ax4oUX/nsRuA2aA3zr
         deiARMNJpOiETw4DqDLaXWTJ9EM0Xv1jhxZDg7+xTQq/Qa2NhCy6J+CydBl9kz5w7/I/
         LYxxerlWStuE327svNaI9DgPDyg7oxXKQt51zBIxAtGktL/3QrXlvjmHbsBJwtpDLKqJ
         +phyNuasBaBE7cr7kH8WiaTP8Ig2wfSIucTbb9agnzCPKMhep1wptBF3Fv5IJZ+gg1Ud
         37H58nQ6w/+AqYz9PJVNer6ghF1p+Tdz60AS8co+7iDCRJSWGf5rATDxeB27N22HRW1l
         3QQw==
X-Forwarded-Encrypted: i=1; AJvYcCUzsNRivzUrpZ+/tPZ8IKZsxaVF+irbpSdI7I6JqZwZQI6xMUaycjODnu9+FWrEA2nZqnFtoV0ldHoKuzuElw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoaeQdqcFHsdeWgVkO4Z1IhIj9YUakzTqoKOXMW9P016A9B75n
	GLoLp+5JnseseNw8IAQimzucoH7eGOwAmzEQfK3fHoFDCzZHrosPmM9BrsTM5A9LYzMpPtedBii
	b3HMSCKngDkNNgEZK2JmN6mRKnGidTwnPghjvIf5w
X-Gm-Gg: ASbGnctc6zagsn8FD066MO4hayAUiNJ5CwKLfSxI1uMVq/HW4/lx1ABnF5QVt1VkX4n
	TCK0AWZbqL68PyKnfIj3aKRCG63D9boZctZ4vVqjpaB0E/YvET6Sqy1yS0/NpP7Jv8cd9rtiXKC
	aG7mtTniKtNq9dLLNIfYamFDB5fYnz4SAbfoIqaXW4Y626FZYp417ovAaiGMeT7f7hisYdFexdO
	TSPUiyWmfS2oHDw6SdDvrYEU2R3nuXdImoeAQ==
X-Google-Smtp-Source: AGHT+IGSY4dsqLiio99W2pKDctUPS+XE0logFsjutpzA/f6pr5pm+OBm0u/2cQX4+KQJjnUSoHcgMnJBXPlq1m5pw7s=
X-Received: by 2002:a05:600c:6747:b0:456:1281:f8dd with SMTP id
 5b1f17b1804b1-456348caa04mr178354145e9.12.1753108572583; Mon, 21 Jul 2025
 07:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625051518.15255-1-boqun.feng@gmail.com> <aGKWIFVl4nwSl8SG@Mac.home>
 <CAH5fLgj1C-BVAfK8Qoaxb4hV=s74-SNPUeHq9LtmQ5q8aqcd-g@mail.gmail.com> <aH5FrrpORLWpDCkk@tardis.local>
In-Reply-To: <aH5FrrpORLWpDCkk@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 16:35:59 +0200
X-Gm-Features: Ac12FXy_09uVssfF9ZpXS0xbrdTDC24Zuz9KFSNdkFLnm71hbdRkTgvYqBmGTAs
Message-ID: <CAH5fLgjajEq-FnVyUaNECZJYB67PoSARCfc=JPNpbr9VDtt6YQ@mail.gmail.com>
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Tamir Duberstein <tamird@gmail.com>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Borys Tyran <borys.tyran@protonmail.com>, 
	Christian Brauner <brauner@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 3:50=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Jul 21, 2025 at 01:00:49PM +0200, Alice Ryhl wrote:
> > On Mon, Jun 30, 2025 at 3:50=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> > > > Hi Ingo & Peter,
> > > >
> > > > This is the updated version from my pull request last cycle:
> > > >
> > > > v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-b=
oqun.feng@gmail.com/
> > > >
> > > > Please take a look, thanks!
> > > >
> > >
> > > Ping ;-) I forgot to add that this is a dependency for Rust version's
> > > read_poll_timeout(), which is a dependency to a few things:
> > >
> > > * In the `Tyr` driver:
> > >
> > >   https://lore.kernel.org/rust-for-linux/20250628.224928.690831629261=
546521.fujita.tomonori@gmail.com/
> > >
> > > * In Nova, the gpu driver:
> > >
> > >   https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf=
41ef99252@nvidia.com/
> > >
> > > * In the qt2025 phy driver:
> > >
> > >   https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonor=
i@gmail.com/
> > >
> > > Thanks!
> >
> > I would love to see this land to unblock the above users. I wanted to
>
> Thanks, Alice. It's already merged in tip tree:
>
>         https://lore.kernel.org/lkml/175153176741.406.1455708180747580017=
1.tip-bot2@tip-bot2/
>         https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3D7e611710acf966df1e14bcf4e067385e38e549a1

Thanks for clarifying.

Alice
