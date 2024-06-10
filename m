Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A53BBC5
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718008218; cv=none; b=Sc2NFuJhQxPpsjddfi0P8HyalB35E3nw4vR80LrhG1I3YJP/dMh6NJPEWrcUd8m152bo7Fjhu5Xm2Dbk1fbBFHgYsZ+yG4hx9b8AZD8MLVRlTfgg7gg+BYHUmIQa8iQscwXAiHU5uE4SvYLLq5Dlhb1hkUCUkVXVp8t6hOhy6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718008218; c=relaxed/simple;
	bh=ZrQXB5sq9y+EJn888M/eWGe31yz976GHUoxEVuvXVQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeEjOmNwguiNRm/o3deR/Z46PPyjq0hsfTVXCI/otxZ1kSARU85oAY+nsrtXZp+zMVk1FY2ZFbLj86XoOE7A0KCb1AIzypDmHNAKOqMcueQCyB13kAgvsvDreZuSEYDKMrnuZ8DSG25NFRkvObdz2wT1niuNz3y6GBRAHEY/2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MnktP7Ui; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnktP7Ui"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f24fabb81so526889f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718008215; x=1718613015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikZtrGjNtsw8eqbnsEbMWgcSlq9bAYVZbEsIK9DE49I=;
        b=MnktP7Uixc+R6RCOqgEQHoLZRHZhkUe+wZmhj2yjvQ/6dkGEkaOUM2KdP0o8mI8iwI
         0vRRABtSPVn67l0ZX+Ae1XViXadE/h62881mQYpXMQCj0r/7MfVn8mBY/VS81HiJO7rd
         DaPWSe1y92v/howECV2myBHPpvhsvjVHI0CoYocvOSzkOnRci+RF7MGNtAAV+i3Qhkud
         +W30uk9P9z5aeOKm0n/wKjYjZeG7p33DU8N1ofUAmpB2tVWr+hZPSoShCYtYtuNVuhRS
         FC/87i0rGw63Hp+v3UUud63ejoJXI2S3atBBTybe5YkP417LevmGt1jRWDNMQ3T/9OiF
         vQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008215; x=1718613015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikZtrGjNtsw8eqbnsEbMWgcSlq9bAYVZbEsIK9DE49I=;
        b=VR5hHJ9gY/GQCpZu/2++RDGhlrYq92orPKo4zj9z5tOYWHW1vi7HeLQZ1cUK8Ezz3Y
         MwuO8IruOKRPmQa5aw/0TAaJ3uOTzuHHL4oFwuCqkpQjLyRPGEwuR9waPy5epdjrgkia
         VvsalYrmLwAMyGStKn0yqvwLtNATJGISxZ6nhxbF3np/UDxgbhP+ZtIsvqR+jYaHy0zo
         UPSA/AvYXjDg7D1xNeElUitmZJ6S7o2ZdtZc9A2ZTMho2uyWQYYvIdUXNJn3FTy6fyki
         Efpw3WAT8+6n8wVpoyivvVUiQDWeUC0++pjm9nTGuIpSMbOxkeA4ZniT96/hm8eloqz1
         dFew==
X-Forwarded-Encrypted: i=1; AJvYcCUkl0l4M4uDRi/fxxw9j/d9URJeRuNVXtkII9KNfQwRrukg01BYM4bH8iKV4GXarYxGUgceBEYyNyFrmdZkx91PQLqvcv0gD4MWd49SYRg=
X-Gm-Message-State: AOJu0YyO1fYB+kHSICfsaD7Z7LXc/HXnwKUZQZMRc2NqsNoPjtpvwr+P
	dpeBxoAE1bSjN1/zKkS2Cw+Iwbbf/Fx2rCd0QRnWEhBIc2sk5s2pqJZ9/dlSmQlW2b9RO2MSYtp
	+aW8vzIfueFqezLr3/S86ZTW0LN3mNRfiVTGi
X-Google-Smtp-Source: AGHT+IGcdDEvr50Ma0CZTKPkSeYP1ylY+l2mXGOD8+zgOCruJaXcj40eBmVe9MAZ56jPE/j2/rkdCuKIx0jfTqIxvHQ=
X-Received: by 2002:a5d:5f41:0:b0:354:f724:6417 with SMTP id
 ffacd0b85a97d-35efed2b4cemr6903257f8f.12.1718008215068; Mon, 10 Jun 2024
 01:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1717750631.git.viresh.kumar@linaro.org> <dc156230814a899e5e3ffb6f3a0e5471d92506de.1717750631.git.viresh.kumar@linaro.org>
 <epir3.2kxc5jzd28c@linaro.org>
In-Reply-To: <epir3.2kxc5jzd28c@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 10 Jun 2024 10:30:01 +0200
Message-ID: <CAH5fLgiWsWaqTTv5=tA6-+LnpFF62vF8P7NNraSNHbM+h0AZuA@mail.gmail.com>
Subject: Re: [RFC PATCH V2 2/8] rust: Extend OPP bindings for the OPP table
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6_rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, 
	Erik Schilling <erik.schilling@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9_e?= <alex.bennee@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 1:04=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Fri, 07 Jun 2024 12:12, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >+/// OPP search types.
> >+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> >+pub enum SearchType {
> >+    /// Search for exact value.
> >+    Exact,
> >+    /// Search for highest value less than equal to value.
> >+    Floor,
> >+    /// Search for lowest value greater than equal to value.
> >+    Ceil,
> >+}
>
> Seeing this enum made me think about memory layouts which are not stable
> in Rust and can change between compilations unless they have a specific
> `repr`.
>
> Not related to this series directly, has there been discussion about
> guaranteeing struct layouts in kernel APIs? It'd require a lot of things
> to happen to cause a problem (multiple users of an API in the kernel in
> separate compilation units maybe even compiled with different rustc
> versions).

If you have two compilation units A and B where A depends on B, then
part of the input to `rustc A` will be the metadata emitted by `rustc
B`, which contains enough information to ensure that they agree on the
layout of structs defined in B. The metadata format is unstable and
changes each rustc release, so you cannot mix different rustc
compilers.

Alice
