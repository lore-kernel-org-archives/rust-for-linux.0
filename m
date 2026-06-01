Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A73AC0F5
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321872; cv=pass; b=Ts4N9TCiHISUNJg356aleRHh1hmHE3IDkHx/osdpNEa1xtq83Jj8MY70qPL/EF6fyCJm8FlZvzLOQmtgX8aksfZMjA03xpsjXSyAc0Hvp2c6Muae5F9XJZLhMw6cgz/+kL0445HoJb31MyQk1g+CvAgN7xhoN/grUyPHjuHZWyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321872; c=relaxed/simple;
	bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXsh/rjq/dmlmR7JvGd2WhuXfnWS0ENo6ufSKT4Ka7igOM6b2D7Q0J+ujoX1IHSm7AUMZfdIfWefcZDB05rAGrnC+iYiSqAaMOwNUunuUW/YprYJY6A22l5qg4hbRHbpWHczRbo/b2KSnwT8tfKAD8s5+hKzJQnvaAQK+By3eac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6RbfrGr; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6RbfrGr"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13644e164cbso325179c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 06:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780321869; cv=none;
        d=google.com; s=arc-20240605;
        b=VUdceBawBMEQj8h3RD/JjgfkTL1xo9icSlhn6+nmuxUVIeCnJlADB4OmD5jZ9tBo18
         Jd/3S4zNeMyXBVgNu6G171rwNB1lGn1yMP8h6mwbGRfLAOHtd7nwev7FgIYU4+twjUav
         aWAoWpZF/MVoaw1dD9eK6ph9dc4rxTL9LLyhw27QQuUbaUSnHTNwT8uT0/holy9YxUbU
         RFC6djen8NX/EDJJX2BI9veeQyDJljx6bxttMQ1dRy1/U9+7/bWCBd8Sijsc5Vo80kM3
         FEGxvDlcaDT3VKz1X0WR07Oc+b7tnEqqnLrnrb5ac6kKcgCoMNQOtHaeSk2+MzStulzh
         gl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        fh=9OxNTX8t9guTEpe020jft5VRu8PwUS1JulDH5dTY+kc=;
        b=KZylhW0yKZhBTDL6fJr9h2IJbXJxrY4lEGLkTonu4ENuHFoaCXHtSd0fYqFOWe4ety
         Eh+MQqR19NAO/SnbnIHA2uFsbt8bVPlxHBCzcmu5QjsuinvZdNyoDCOBnJOwte+YEeGM
         JScwQ6o6i4Y8ai+tZ5XGlRXc2Lh6xnGrZGLzI5ndReWyIQVh3N5AtH1SUT0JMumiH9vT
         GhmFxWTkeX422U+nxUtGoaPKSIeEeRiGKSnIjqFHrpV9hZxOPo5e3GuYqF4U9oOBds9j
         KvqcQD5rNQwsw4A3Q/Y4BwCC7gwyiCxAVlY/jmRSFzWV7U/2bWySwWTY0njPGAzfJP0H
         2+ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780321869; x=1780926669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=j6RbfrGr+IiCQSUJU0CCgzjkk7ezQojqbUylqJ5WYigR5NvKETewBS8CYEe8YE1Dqd
         7CUaWKa97LqOrq2I583PYGa5vQfsTtLXnfPpVGfXAEWpMr4CpHupJy9eUm77VWWzzHqm
         fCcRuJvsqR+yzPnqJPUwd901sUXqWYoVyZtFfZP3NCeDUHR3xvJL5aQg4ecAKdfwOhQI
         lkMg+lEHK3/uQgOlviU5ucM6x2f4h999bQsPLKiR2IpMZRCf+U30c4Dl2sahRLMICeiz
         5CHoawJGNXKGKrkMuJrGToXCEQKvil0SpVA1o4u8wTgBKahQ+uXzh2C60Tfrdqfjee51
         QR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321869; x=1780926669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=dr0FUg/auKoRufLLYSBTFSRB2Co+YI1CjMiXKfNbO7Api90m3kgX7Q0rhFgIj8wA9D
         lSwfg3XVi4pywt4DwESrojLQIVwTHlPwajzA/xyguMU7AxHqbJjRQ/Dy5UgyHSOaqBZ1
         KKAC3KVvk2X705Dd3kP6pFcyjwRdbLmxNbiHVUAgRftA1rLx3Zbr2x3NxX4om9bqVCOv
         k6wiw1qnyN7YUkDfyKtnp2wDYOPM6hBa30s6yX87x+5ugR7o5pcZMcwn9txOppVCOf/l
         +1jDrQZ9GHGp43b27VSL6kARNdPzyXhHqca2B/NaXlLFcdJZcMV/06re8XSiKzByesZ+
         kNzA==
X-Forwarded-Encrypted: i=1; AFNElJ9J1YJWZYswToYjJbAY+qQzfXCH3t2+FsWkKuFZr8Tm3eAYbT+FE/RN3cSvHbEBGx0xBHtbd7n94dJ3p62LKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlbeNNFFmps1C5atgFtlj2Qjsb5d1NPBfjzzX2PBpAFgigjZ/c
	5IhR2J0Hjfw0owLeAdy7JRGUe8l2k3CF3S4uHwWSeciXcbJw56LO7EHmzj4c5plqNZh0Kea9dk2
	7+4oLmBu2nRubM79VR4YPc6iinn1ILWw=
X-Gm-Gg: Acq92OGcFUthuMwHicLnNzyC7WEmk1N9Fn9oSZkso7soncEcA4IdpbstUmwG2yr03Tt
	lXD4E5w+bjwA0y7ox0Lxns2OWiH6oPu3jMhXVg+lbBquuSqMoFF9Z9aB5zTwEa/gXGrfagDCJ10
	ySmqiyaAyAZibIsx/JTQSOhlj1vygDejXYOEdieOuUC6fgfIZbqHwRg18iJv5b/OewRMvdKOlKz
	zbdSgFV7rKaitrpWcdF4Q6SJAzTqumEmdKkL8EJTkyhRG8DyUZW6ArQz/P6uGcG3fUHfTOwfgtX
	mimtXscgKl1A0bE9MIpXhAfiNnPm7SkAiBoj8UeP39Op7+9AtrPl6KJ0bCH8fWhbj9Iz1nLZwed
	KwGV+6hf6x2kw99ZMeTQQA0oJbQHMVBz9GA==
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-304fa31c4a2mr2349142eec.0.1780321869058; Mon, 01 Jun 2026
 06:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 15:50:56 +0200
X-Gm-Features: AVHnY4KWUDuK60JTIBwgnlL-tTjDarV9LStXY-LSeVpwOJ2FNQpjnaTpcPZMaew
Message-ID: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:28=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> In the meantime, this series introduces a Nova-local workaround for
> `nova-drm` to call into `nova-core`. It generates the `nova-core`
> metadata that `nova-drm` can use to resolve references at build-time,
> and also builds a list of exported symbols for symbol resolution when
> modules are loaded.

The "local approach" is essentially what I suggested back then, so if
this works for you then I am happy -- with the understanding that we
will replace it with the global support soon (it is good to have a use
case in-tree :)

I see you play some tricks to get the ordering right, including a
sub-make with a double build of the `.rmeta` in "private", which in
turn forces you also to do the `.o`, right?

What I originally had in mind was simply to do everything from a
single parent `Makefile` instead, precisely to avoid complexity (after
all, it is the local approach, so you don't need to force yourself to
handle that). That should remove all those shenanigans, and it is way
easier to get right. Did you consider it?

By the way, I think a `.gitignore` entry for the generated header is missin=
g.

Cheers,
Miguel
