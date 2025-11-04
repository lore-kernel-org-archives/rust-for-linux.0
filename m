Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611512EC097
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762283215; cv=none; b=ngGMd4CXc8tKXIGsGrC823jCe4nb/mvd8FfgxUUGZJ+hQWX9raAidhXmd3GLf75ThiB651s+pe9vfrg5rrKIJz1Vxtp8uYQyVmu1MwQnoTSQZuUJyEAHEvddmBWyPIgcfJq9RhkI2Ma8H7PGhFUtPu/2CqlHsyPQST7ZvXxMQjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762283215; c=relaxed/simple;
	bh=hcYL8k8PGVIqmqm+I5iUSWXrgxNbr2ybXnIE8pG67Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwLFP+1lzzTIAls90nCgbptoIz07Hjxm9dnMGhKNibfZN3vUGecEP5w+KL1BHjWZcb23XPXnXB5je4VWq+j+R8HtM/lUz1TjjQGxOx9F1AMbLd2cm2h87i/6lTMAo9GhLt+ze1YhRFE3MOvZjmoVfxUzkhMYo8rdDcFMlkxg0/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG10ciNg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG10ciNg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7810af03c69so223204b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762283214; x=1762888014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wAeCuRxzb2BXeoNq8+i8slzGY9RtvDmLaGwdLPgLzA=;
        b=UG10ciNgrf/5ojW2OtFJQcHE2fJSXCWmmcV+prCD+PLOEXg3Ev2RxMDBZKAZFWpocO
         MdgmuqQvRvNCN3NQMPdhqYS7Z9qQ+fU7ANUcYYtLfyKwD3PPR9VdFv9Yxk4tBeuJMacE
         umT/NGniNcvyJvj8PPAD5lQpGDNgmedXOyj7BIJXATbUGKVn4ut11pdspoHl7XxTJQpe
         HZaVZy0sO61d0OhoASIIappR2wNFBa0BCkdenYyaM9g4d+Cb8hFqf6hXDSReLXYlzotW
         BSsGYqbPjwQbzwo//TfLy8ueo/n6Lk+eYKPVwXBkQ4iSlh28aEObQxBjgt+9hvihXPw0
         nRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762283214; x=1762888014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wAeCuRxzb2BXeoNq8+i8slzGY9RtvDmLaGwdLPgLzA=;
        b=tgDA4FinbJJeOkMvh1jIYbzpYq+GMCFTriEp771i/BSSjPcWJ3QDBuMGa+begywFMK
         rfI5ruqhicWNxftJhMKnYbEdT2/Pnxq7EQxyc0ZhZR1aFKxMMyilhTEHysB+aBOjXjNf
         A6k0f58FwXbcKO+Ad1crXNqhxB7bqL2BhqLCjK3SUIUkMjyVYk86pX9CGVvIdp5pUWMb
         v5Uis/S/LU5tZb1kmpJv3sV0p322Z4cp1cfiO0YnzzMPG9QFQB4yZOuyh9fFQvi0ZFpJ
         9/nyYaYBsMn9dKxlHiPoEbiAiFwrSHhcXvT099FIibdv/y/oREMwnorfgcCz+op5VlZ9
         9QPg==
X-Forwarded-Encrypted: i=1; AJvYcCW8HICgE/gzc8dm3WJ/ytiXBYmzunLjfFsHz6Zetj2RLOH61ZFaelo7PQ3BQA9sFyI4dpOYyEbaFMeUoI6gRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNqLtMwV1wn22jC+oO6T+4b65WOegnXO71aHcwDmNI0Co6c8EN
	YsvWI5vQ6C9qE2UG+b8RKNHR2Gkr2804XOYJZXVnaewLm8uV8V+F4T6+FhYOIW4VzmwVz+jz+sf
	r6ih/XGiRfesWOs4XDuZuM0nq33t49jo=
X-Gm-Gg: ASbGncv3DkgJ5sagCAyPHLz9CpJ/rdBTVQRC1LTjrSb2y2YMvg9+XJ+UiNjBIo1owwa
	+YZRCxzDI0Y9nCcp8k7vGYali6yhS+aUaZuL0k2pfi0/i5C2bbyLnp2k0tOZ5ED6Wig0o2qPMgc
	Djjybo/7+5yhrfe6wPb2jHgCA/cserwXljtb49cUYtbPtj41ME5yaZ0IoDMmpNKchnhaqXbkW42
	ej0NOc+b+Y10nzqBTZp6k7IoMhD1ZE0drT4/koz49ez88S1h+AfPHNCSvAFaOX0WTRF4LdutK+b
	rL0NRgQCS9slywzadVLY6TANvT6l/Mfpj5Vjz845JMKQtSawYU5/oZhx8gOzLTUnGsfQmA7iLPm
	ipso=
X-Google-Smtp-Source: AGHT+IE6zMw0orjCDwKe71BtT9keGPs74U4T3Nt51J7XxmrJZBuNOyX0hJ52/hdnOd+9OYS5PomAI+ZTVm+Zm9uBsjU=
X-Received: by 2002:a05:6a20:3d8f:b0:341:29af:3be7 with SMTP id
 adf61e73a8af0-34f86d04830mr209534637.7.1762283213593; Tue, 04 Nov 2025
 11:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com> <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com> <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
In-Reply-To: <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:06:41 +0100
X-Gm-Features: AWmQ_bnwMN6fmA9J5YYRK5sVTYidOU0VW_dN7yFlDXkN-QCauIAosWdhzgT_uW8
Message-ID: <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 7:35=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Orthogonally, the script that generates the doctests could perhaps
> help to automate some of that. For instance, we could have a way to
> specify an "environment" for a given Rust file or Rust `mod` or
> similar, and then every doctests would have the code prefixed to them.

I guess this could probably best generalized as "tagging" doctests
with custom tags that `rustdoc` just forwards in the generated JSON.

Something like:

    /// ```tag:foo,tag:bar

would give us a:

    "tags": ["foo", "bar"]

in the JSON. Then a custom generator like the one we have could do
whatever it needs with it, including prepending code or other things.

Now, I see there is already an `unknown` field in the attributes which
already give us the unrecognized ones, which is great and we could
potentially use that.

However, should there be a particular way/namespace we should create
our custom tags so that we don't conflict in the future with `rustdoc`
ones?

I have added it to the usual list:

    https://github.com/Rust-for-Linux/linux/issues/350

(There is also the question about supporting the old non-JSON way for
things like this, but I am ignoring that for now)

Cheers,
Miguel
