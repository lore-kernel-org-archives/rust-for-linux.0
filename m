Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E222224B06
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326966; cv=none; b=NgTB+lEuNfnkqWIKkypPoUXcGBVMeJ+dvz6qJ5OZ3Q0ZWGNyPEGblUUft7U0eyNdrEwasY0JuORtez14HyTlH2UMmgHiu08PhuWXPl1NPxFLXpit3qLgsDA9Psd4/fmb9E2Aa4h8QmSwIVciyP8acKbyhaATkYqQkSEKteNNao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326966; c=relaxed/simple;
	bh=RHFxWDCHLy5hvU8idDeLnpypbjz+dKFI/3c2JendMoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNLFjDDJvSF1VBVfP/P7nP3OCyV2iIlIBfpJwQ1R7piMTMRZfikps7H6lVZuapyV73JIsOohbbmWaCTdJ/yNldtQiwtLR7TO7VaWJQiiMvKPTneWeGJrm8TZTs8tVHHxQTG5TJi64BUkSBhp/wFNBvKVxHBRtqdaO88d2jVMptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RiiAWDkJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RiiAWDkJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso6862515e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757326963; x=1757931763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrzZTtPMBTTwhC4hDpYeCTJZty1sUGPfAIEYck4kXTs=;
        b=RiiAWDkJgLVkF/rUWUJGTeM5S6+zrBpg1qnCf0/zDs7A7WW4l7jqM7vu39E1N4SKn3
         P2XZYzGHAWatVK9OUlT0g+DIMVDvut7SVvtHKl/5IoEMi703d2a1bDk1aUlT9kHkOl+e
         ticcS0I+H8o4z8rIt9xhT00UdsxPsidZp5w6C6hwZPax8Gi+cAfciMEzqiQP0qNLltPu
         JLt4KaIWNxM6atB+RUWcz57jxDTWokfmPy4wvXcQuu5aGkZgKCmusQl5Ti+k+lI/ILtS
         kyZ2HCpT0a1v5kSREMjknDKOiSMUvTGNy9bQp5GrgOvW0e2hEDBhZOeKfoM2hiUMmvEX
         xhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326963; x=1757931763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrzZTtPMBTTwhC4hDpYeCTJZty1sUGPfAIEYck4kXTs=;
        b=DO0I2g3Kr29l288gx0Okh+yyukedFoDLxpA1Y4NHywSMe9GcONHNH8Ok6YOvhF/yPL
         6XpUimaHOqPrTdWGs3msBAfDRGxhjAfmw2AXQ0aUYyAG0x80G2/Y015+aMLkSIY+54Z1
         Js8ziWUYdTP8sL+B0vvGFPoKy0rxd7brNBUIlJomy9VGIWzzkkWMGy+KzlncT2OyE8SK
         lHur9LAlz9/Bs5NDM+h8HjLVm3lCfi7Orjej54lzr4DN2r8RiBiAec2Px98G0feovaMO
         xo7mzOS6lOVzeFhfojNWPqUZM25Kv1KbF5xYGc2V1v+yBPmnw2n+zPu+jyKNcS7SnU8c
         WEFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFkz1Vu2VcW3wjkoJVWHiBUYuwod4WDT1y3usNUfLRssmg5ir/keJkPvuWlNpJFskA3ZKXtlowPPakwK6EHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXhSvfw/labFaUqmgeTt/KteE23tMzSJwd7Rfb6oZYLJIicip
	SPEQOGpvSSgYjkVh1UEF1sVU89CSUVtVzLJ3Pd98UzpSQlQQMSQVvCvzUhpeJ6NRumk9QsizpJ3
	fidm2KAnzoYrm06lpg70Nf1Zy7pzL226sd+qdwaBW
X-Gm-Gg: ASbGncudaebRLdmwVwNek3CRSfoU2A+hHKqPuGMNolBzu24sQ8Gtbz71YrMQ2zCp+l5
	ZIniuRIKwcHEj/g3EBbqErzqYLM1xEd0pUOfd+d5OKTbTJii8GMdM1VFf+hVfU5RGREcdRniHEd
	sMt1bgMZbwxH7jCe3XNx+gmLuxtQHKH0PG+yd6pUFT+cvX7dWhbZldRbZ67OPhQhJlpKeUG411F
	fMK61h6NAakmKSQzZaS8wX47ANR5k9s7yCpWkkHIfFjFGJGYztu/KyA9yBXBM9zBzSuB0OFdymf
X-Google-Smtp-Source: AGHT+IFgWYJROM17+WIrfUEk3tvBLaNIow64btrV8OrhYTpagog0f41sQ1woWipkCJ+Mg8IHT5GJftLiAT4HnQvHO3M=
X-Received: by 2002:a05:6000:26ce:b0:3d3:8711:d934 with SMTP id
 ffacd0b85a97d-3e63736edd3mr6168164f8f.14.1757326963179; Mon, 08 Sep 2025
 03:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906140256.3059395-1-vitaly.wool@konsulko.se>
 <aL6YHkF96ICqqbBZ@google.com> <94252007-f389-41d0-b5a0-ed948225543a@kernel.org>
 <CANiq72k6OXcvjzKimfzKAAw8QPzDoVxUx_smFA8KU6gEwJ3yeQ@mail.gmail.com>
In-Reply-To: <CANiq72k6OXcvjzKimfzKAAw8QPzDoVxUx_smFA8KU6gEwJ3yeQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Sep 2025 12:22:29 +0200
X-Gm-Features: AS18NWA9hYdpwy_1B5DZiD19hEAKMFtTbh_pCUoACeHBYWDL0ERivZum5zi9du0
Message-ID: <CAH5fLghyDNd1SSL5uTZpSR-5j3q9=frAa=AgUjvap45b-DuUig@mail.gmail.com>
Subject: Re: [PATCH v2] rust: rbtree: add immutable cursor
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 11:21=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Sep 8, 2025 at 11:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > Why not use &raw? Consistency with the rest of the file?
>
> I guess -- it is a good thing, but since we are actively trying to
> move to the operator, it would minimize work to avoid adding new ones:
>
>     https://github.com/Rust-for-Linux/linux/issues/1148
>
> Cheers,
> Miguel

Do we already have a patch making this refactor for rbtree? I don't
think I saw one. I can send one if not.

Alice
