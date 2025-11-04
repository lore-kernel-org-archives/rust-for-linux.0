Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539E333732
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278976; cv=none; b=rN5ICqsUg7lKBnElx8liJ1sJN0WJ0tNmWcVTZZunjtr9LbIhp49D+mH1TrLj3iiuzLicChBAN8G/qiIZcj2E1XRaCLGM1/yZsPjmCW09UspcNBqGtrJnAVa4zmvFFbtxtll0/3AXoYcMYeTu1w9AXoYIZwgZPthlc3SSLguQKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278976; c=relaxed/simple;
	bh=HK572gnPFKjsmOd/RZmjDVi6DY4udcTr0A9s9HfvXlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT+/bQFZZsz8DSo/h9d396nPeU97q6kfilute2WHiivpMZZr4lNjle1A5rvO2xSCCIwsWLUWRBhJEm4wAaDBfgh0+gM84Q+ZlByjNZ9i26C+RbvMZ7cw5nrlktvifZTnRkzxCGa8PDVRiFyqjTdd+fuIhZUTCKWtZYs03baJyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeHQqYIL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeHQqYIL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2951e58fa43so3934025ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762278974; x=1762883774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdbFu86UvaH/Ty0UuDTWSO6wJfAjqp1mmNJzmWiSQ2c=;
        b=CeHQqYILm8VRKcq+R7lfCHs2CY1BU/Y/pVGE5CQB0SFId/bp+iljdSxEnB03QspgG7
         ee5pSSL0WnTJIWX+UVkaiG5Z82G2jMM43AiXsXboKX08btjEfyhKOla4FVmuvUqNCKk1
         k/OyLWZ4bgHMgYdVT46jT34wGhyZxSR9JqCQPxKgx8prZDno0luMNkTv7QLwkWvsdZbC
         GiQI2+UCL60bhd0jeFpUdgnkLMFxjLfiHxq7q3Ue+0PARal4XIgdrdMQt7z8nylTJfFx
         tjjYP6SGfvdOYhJ9MNfL2rU7QjIvF2KHTQKgAYCAkDdKfIRZpoAPyZe72DMXFAEMaxFm
         eltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278974; x=1762883774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdbFu86UvaH/Ty0UuDTWSO6wJfAjqp1mmNJzmWiSQ2c=;
        b=hGmGUVmUvgMxCRqG4myu/SZlQVS4DmrAXCXmYMoGSxsmeFjsIEqFID/bcdjsxOK9Jv
         Q40Temjio95JxbaI3exJ4MqO6CAa5olcpSwh2e1rVizb06/FmO3wr2vKDXr8l2YwG4Eb
         HQ/m12w2v1s/DvOWrYaqprlViX+9E8o/H4+2mjProDXB8iNDfA1jg3x86uzJPj/lTk4L
         6CRLCAi3JJMBofSplmp+rworKYm4wANIo4hnZmTrOasBAN+8nQuGk7y30TGEL4TJ589U
         GVrMuUTk3h5KCtmxY4YcTKIItt2C54toDMu/U5SxC7udzukWcQnaYZuZ8ulCNi7JYidU
         GnJg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0syN4bAulbvQxyH2bH0a7224ZcPfrIQ7uIbLfZdNjIfx7rH1fjYO8hdgXHEePhf/4/KM7LmvLPlj4QQipA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/WQ2RYy8k/FFTVMv4TkTRrHM6SCtKRqvYJlH1vjrKzHYqkRV
	M21q35iT9lNchyL94leICblarxFwisbiWTgKVbhUv/jLHXbF3Ft9134o0lTZCtjvw52WbRs7zwf
	BvGifERKKRFVnKdbTGuqkB6aP9FJAUTE=
X-Gm-Gg: ASbGncvinIQPJ5hdIDfqm6lzJAehTJ3/qjF3sGLUG21dp1GXoF5kW0hNsejXU41neNB
	EFC1z5AP20zYO9inraoy+ABWTkJnsbVcOtg3QksSV9dp4fS167Byk40XzWiVsbzl9LgXhkc2ZnU
	H77DQEpuUPhjsZJbxVDca5dni4tUjC+tkf6vzcmSVWf2ttPbhHFyboXIkYwlDebeFDhJU9XtbLS
	trRjB7Bq1c7NAJtYCJ3co88kudqoZpCCyvjrJ1BXjL5opSGqqejHB4n2hAq8z6CKYOY///pxssT
	v31WsCGojTQa2bTRXdwzJCTa+v1cFmFJ5koUSZzlE5bCkQn87ErtrH5ShCpqlMdcyr8W/SQ6ZVI
	82Cc=
X-Google-Smtp-Source: AGHT+IFmGK+yppNjtlfVt3PYHnSU7LCIeOR2djeBicyIzVEbAacDaOZ31AyCC8o6I/noT3LJVN5NEf+tFApmxdym8ME=
X-Received: by 2002:a17:902:db0d:b0:295:f960:be2a with SMTP id
 d9443c01a7336-2962ae6819fmr2827005ad.8.1762278974105; Tue, 04 Nov 2025
 09:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com> <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com> <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
In-Reply-To: <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 18:56:01 +0100
X-Gm-Features: AWmQ_bnuMtNId367X4k07V77YebHWkraMiqGBtJ_zKIeC98ruZBIIlgN0L2q9E0
Message-ID: <CANiq72mR8jpsi4ekNWM3CZCtVYinjFjUhhnGtF+cNn+Q2qiTOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table management
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 8:29=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> As Joel also was hinting at, is there any easy way to get this sort
> of thing automatically checked? This is what scripts/checkpatch.pl
> helps us out with on the C side, and maybe it is also the right
> tool for Rust...?

We have a few patches for that script (including for at least one of
the things above), but lately I have been thinking we may want to have
a different script or tools, ideally written in Rust, to encourage
contributions and reviews and tests and so on.

Moreover, for some of the cases above it is better to put it into
other tooling like `rustdoc`, Clippy, `rustfmt` or even klint,
depending on what it is -- over time I have opened quite a few
suggestions and some were implemented and work great, see e.g.

    https://github.com/Rust-for-Linux/linux/issues/349

If someone wants to help with some of that, of course, please ping me!

I also had a bot I wrote back then when we used GitHub, with quite a
few checks (especially around development process for newcomers to the
kernel, e.g. using the right SoB and tags etc.) which people seemed to
appreciate (to the point of someone mentioning it in a talk... :).

A long time ago I asked about making the bot send messages to the
mailing list when we migrated, but it wasn't OK'd back then. I can try
again, or perhaps it would make sense to make it send messages in
private.

Finally, nowadays, I imagine an LLM could do a reasonable job for some
of these as well, if there is available AI time somewhere (please see
my reply to Joel on that too).

Cheers,
Miguel
