Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109B32F75A
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278855; cv=none; b=EVltAVzeFkUhPNzq1MdgX/aqN6qMIZdNOk2NcReAxA6T+6Zr/QzVHBh1/y4ZZrhZspr+W+CKSziS3VYfNg5wkbmaO3y+/nRFs8M70ueV9lYxd33Ghzrhiu9uvz+OzjOzbNzFYXyl+rFJurAgJYaOU0phylZGTqcAanU1FKxw4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278855; c=relaxed/simple;
	bh=2Z0DzMdlKGyNTGf+MF12DGoG2gH5hCysE8EVaW6c+Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7XVrNrmLtnpY4fjslrm2GY3KytOBkPUGvzs3f2z/OcDX6p0e2cntiwbmaRX0L74SAX0zNlPJs42ah0fuMwLxS0h9JR/q3lJu2XnM4EEMrjplMI9xxA/mLBDErpqoV9L7zvM3QJKcNn2khN/HLfSRdtaDR/mLa99pWhPa+J3Lgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js7JXGPa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js7JXGPa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2951e58fa43so3932065ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762278853; x=1762883653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
        b=Js7JXGPap/5cANLL5dLDTErG3xhHR6bTeAJ5dQM9O6bJt8cNhWr5mLx7C70HrVqOQQ
         FpCwXSORXrfHfSZwjYmzWup19iKcnOGLLgEzf8ojpkZTQeYHNP1xcn1WWvO9x+5bVhPu
         W8eYyd+9+OSUJR5I5MN0Zzp5pIwop0cim8WEUtn2XFl5NtRemz0rSIVo7XcWom4qhFzV
         r3f+pVccq4bqCkqfkav9uNHhIBHp9Us736gFBskFIbSvOr7FoCKdJ54eqpf/7wYzlAgW
         u73S6z4HhPFmE1HocL2RtBws2PtIVrChAReaZ95/RnhSjkrGz3IcKErm96uDY2fBbAYv
         i1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278853; x=1762883653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
        b=Ldq3E5cbALRCn6R+uCMWP9kWmh572U4yVKK+jmWznwARvZFZQo42hc0GoQ1ojuXDMj
         GKSEBTQBsz3hG/YEZfbeV2hOaOB1VyVbn6QJqxwVzS7+BPUgS9/bTrLk312XWyIsYX5M
         yrHFmp6qJ+vptHwfimwGKlmhmLzXwv9/Odf4EEZ5jA8kPHOm+JR1fWE1/kR4IDlyeXDm
         vRSFCWiLY6sYjrL7I9NsjC7oJBFGMn1DSbga+LQyeVfSW9NAChkEbb3oXX3q5OWygRBT
         WctCA3sT5p+NZwRkb0pd8DJOaDwCZ9OgvUjTXs7/ru6MVYwdAxTD0YqeBdlS+snXr+kZ
         k6sg==
X-Forwarded-Encrypted: i=1; AJvYcCUfS5YCZnHHuei/fFTx0qs/61V2pfa3pZjaHFYkT4jeqnxb/PrHcedLawgRoBJ39HAXbMT+zxJecM/5hVDALQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZflgUr6TwzJkU39RIRoSEn6gyJ1MX5EaZjcptVFB4KiRbnV/c
	xNa1rZrPH6UW9QTfB0bLKYo/BFJUx6JNF/1IorYKlTnF7ciJVX7jOPugCPK4CvJWuNAguaFUk0+
	opAU9HNkT8y56aNggwnsQk7WCplYsXkY=
X-Gm-Gg: ASbGncsUEMNIrL3CyQphbkyMpdzYNr6BRl8sv8KcYzfmEZRba/51yB4hM2LchKxO2LM
	XnFvrkHj/SrJwIwlLiUMISRHiIt6ZayYXuY26gNAbziFxp6Tz6sIAiXC20Lqsjdcoj5IhWyhMt+
	RcEJKQohTlgLdB4pLNj1lXcOOXnbWrE48KE/Fxzpj4TouloiGfOfy8cmyJEr1bxyZFM9BiqTD2g
	rKCKVoZHk/AFtMaLhXOXymYO/uoaj6z1oIEuTTsGIm3j0C0rJAZmCZ+NT2ZRYQaL0QRKmlRbLtX
	z3H4dT10sQRgVRrHbLzu1zjEHLTH1D8rcQ+B7TVe2ryHdFNxanCtPUyFl32i71C/SL5pgfZuVHC
	fxho=
X-Google-Smtp-Source: AGHT+IFMtgciB6QONB6VxZCG1myoQ/OF5p9zSByGfEAwuejN7MO6VmvweNifh8ze36q1bb6i4v+fU3wfRfdXIBYH7Vo=
X-Received: by 2002:a17:903:32d1:b0:295:a1a5:baf6 with SMTP id
 d9443c01a7336-2962ae52bc0mr2728245ad.6.1762278853136; Tue, 04 Nov 2025
 09:54:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com> <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com> <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
In-Reply-To: <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 18:54:00 +0100
X-Gm-Features: AWmQ_bnlFTvkhYxQQsxRU1wVA_rAcYxAjX9HSQxCVZanIDspjsve6Q_H0_KRQ5Q
Message-ID: <CANiq72mqDWrLp9EjXHUgeODh1zh-9XaUnmgHWGgX2Awqs4G=cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table management
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 8:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Thanks a lot for these, I studied all of the suggestions and agree with t=
hem.
> May I also suggest to add some of these suggestions to the kernel rust co=
ding
> guidelines document, that way others new to sending rust kernel patches d=
on't
> miss it (example not adding a period at the end of a markdown doc header.=
). But

You're welcome!

I don't think everyone reads the documentation, and one issue is that
the longer it is, the less people may read it. For instance, the note
about using "Examples" as the section name is already explicitly there
and other bits can be inferred from the examples' style.

Now, in 2025, thanks to AI, you actually have a point, in the sense
that I assume people may be able to point a patch to an AI to ask it
to apply the guidelines from such a document.

So a good way forward may be best to have a list of "short
rules/examples" in a separate section or document, where I can easily
add entries with a simple example without too much explanation. Yeah,
I think I will do that.

> Also a lot of your suggestions are related to how it looks it rustdoc, so=
 I will
> try to build rustdoc and see what it looks like as well, to get an idea o=
f when
> things in my patches could be improved.

Definitely, please do!

We all should be doing it, especially so when the changes aren't
trivial (e.g. adding an entire new feature/API).

I have it in the "Subsystem Profile" document from `MAINTAINERS`:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

    "When submitting changes to Rust code documentation, please render
them using the `rustdoc` target and ensure the result looks as
expected."

Cheers,
Miguel
