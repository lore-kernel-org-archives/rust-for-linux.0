Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FDD3090C4
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759154386; cv=none; b=ZJzgYdBuol8JoNDgPfY+iFSbDwsh172X/DwTXp2r4GDLPCffaZJyBPGLq4X7Fa4JdPnoLzP1A+uaiGaEXn9Vth1JHHr7sWWpH1g05rWqDhWZo2tOfoa4c3p8WVxDF4vT4kiDTtkBAypILIAAMLsabFxEkPv6/HgSl7vsMl1wZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759154386; c=relaxed/simple;
	bh=O0Xt9oaq2AawyZ+h7FjzNvjnt1/k35svRqi2XClUHHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOnbnZ5Tvn0sdYm9bcIdmU/hf4hBGvwQ15EY4dpS7BGJ9TXPH+FujVM5YIjgffYoSietZP5Hw04/sfiekm5bpNEi/+LlHc7r/A8OqpAsN7w1z2nZPPL9AqJmWL2C6L8tHDKjGpcsuRzcy7K4Lz1dqiToL2Fyf8hIySHt5Jqkfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljZudgZG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljZudgZG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27eda3a38ceso11961095ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759154385; x=1759759185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
        b=ljZudgZGVNz000SgVtV8jeDf8IQmTZ1HLZL9Yu9YInEJVv00grJCunmGfabAuV7FQL
         t+Ey+YwBdRt0KL+fzAKZJvwkF55sDyzJv7JJ8PLsUWfTihxwTm+X216r0XUAWapj/DKc
         DOF3U35D5nn6kviEVxWBXIWI+tiYIH+TfrKmGrrm0/z8S0rD690FYkyYv+eVg14Oekba
         tyOZoaO8bCL+VnoHX+ULkCXN4g7bYga8FeyhehrsSos81tPXYYo6q3d5xoZ5CpnN/vXV
         fA4fsZor5/fIX7bfLwWPx5OzSbYb5gKIxqgUcbbPKip9i46NMPH3mt+q6+5NmUqeGXq1
         x8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759154385; x=1759759185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
        b=xOs7ELkgEFCYCoXZ3TaVFpRopWBleHIwxsa/WF3WhhLjKCwlYqRpt8Zteez8clGZ3N
         iu1sC3xVraRjiShXR7Yt74zhfPbde0yaiYZ88jkTEn3fzxeHb6NP7qHwN/l/m+gs4kAf
         6kshnRNpnYgiTAqmPfEm3bhB+EYKzLg9GA4bncl4UMRK/hsDqfueb0fcN2BJnNB5FbAv
         iRv95PRyav+W/amowZbdXMT8fL0shWlWNW6Wz5kDSdluoaBAXhk9jvQ2Ld+aOTT1LYfC
         RWd5sdJQUwfoUH1TfAaQuaI/wszJO3wiwd3EvO62LjbPhf4voPHV8IlydevYpPF14OdX
         tjNg==
X-Forwarded-Encrypted: i=1; AJvYcCWv9AIoC2770+tSOJZl4kH5eKUXIP7wb8z8hm9ZtUSr9qhX9UsbxOOLZbZaIup9lYYX9RTqnf5BVgaji4CbjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0fqHstFYlT7duIieCgfrj3eVuYuBMLLs/38imMD3iq6wMDIU1
	6+ri0mwIe3s7zKa1qvwSNBZCsaCWVt6pzlDzKQfH6Sul9UT2832+9YShMCKILNrrgeNooH/8Dqe
	I7kXJskbCOioq72Gs5b92gZVIhbHNE1s=
X-Gm-Gg: ASbGncuYWDLubK3N2ygBU//eReFobKpVSI18OkKlGbSqmgsXYTDbgCLf8HSsRETawjQ
	A94G3NxYuWFIc4nbZ06pvbFjlkZss7bCaRYv8wsPFFmHJQ2jmqFuB+5fjySIYkmea14PDaPyMmm
	oUYBHAMVKfJewBJ76lLZnYtrBdlYgcRX8lS6c0eO0uqI8Uc/olEpIaE2vunxEOAwi4denCs0BXo
	WaL1OffPpIT04ls3UhqAnpaakrGDCudDft4RgDQK7OI8FsgsUNxuu86/jQ4cH4B1toHC9A2EhZR
	8eQfKCHNucmKkqmVD7WKKKwuxKe9ofdJ3PoA
X-Google-Smtp-Source: AGHT+IEC1OH3LVB4V0oxft7FgJLhEwqNNj6rUnyOmnwsKLC7LLfd/i5cH3v8mOBtoJlF7/5PaCpYXgtDTbDZevnth5I=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr105372055ad.10.1759154384643; Mon, 29 Sep 2025
 06:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com> <20250920182232.2095101-7-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-7-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 15:59:32 +0200
X-Gm-Features: AS18NWASygynDnatU4KPTeDzNXeVtgwJfzlJorCLrDvtP5k4ZufDBjnqp0W75-o
Message-ID: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type conversion
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
	Yury Norov <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 8:23=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The bitfield macro's setter currently uses the From trait for type
> conversion, which is overly restrictive and prevents use cases such as
> narrowing conversions (e.g., u32 storage size to u8 field size) which
> aren't supported by From.

Being restrictive is a good thing -- it would be nice to know more
context about this change, like Alexandre points out.

In particular, the line:

    .set_nibble(0x12345678_u32)    // truncated to 0x8

sounds fairly alarming, and not what we usually want. Why cannot the
caller cast on their side, if they really want that?

We avoid `as` for similar reasons and nowadays enable some Clippy
warnings to prevent its use where not needed.

(By the way, please follow our usual coding conventions for comments.)

Thanks!

Cheers,
Miguel
