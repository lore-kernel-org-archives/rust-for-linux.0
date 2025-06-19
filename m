Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F83085D0
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325569; cv=none; b=Dm40pnt1RvS8kYfA/tV7eZO2sMM51s4NqxJGP311l4FYJ/TkRyHrteMAp51HJnrZ5D3w8FE5ZwtJs3BhSzj7Gzf1NKF/5BldhAQ+whtNUihXYh0X2AmW9X2qfcEtPDHTVdl2LlB3Kd3bCCRXVRYhy0KUwGppdU+zPTwWsioQR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325569; c=relaxed/simple;
	bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAc0I95Qd8x9R0TnDCso9hsMZC7fJxvVMflTJEMe+PokMozjVXb/NOb8/TwM2Oeme2v6pK2y5Ti169wOTmy1CBqxGoEpMGjtNdCG7sxdcxhHvdFN+9s0EWw4MH6VsSE03uJicaMhMzQr8qFod/vyl1eOfONM5mM0o4+aM5I8VUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j20PemO6; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j20PemO6"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2d09d495c6cso128574fac.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750325567; x=1750930367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
        b=j20PemO6Ck2aHkEhpi2XGorzQRyzxjzvtWwggCK56VH2ozGLluZNiVTOW/6+zkcPzn
         ASKTsedtifv6CyQkep4HOskS0l80qziraokBo14HZb0JAcnvd23+vFQe94F+D+rw3w2v
         NHqgmg84wDHFz2bBecanPOjajeHngd1iI5LH8sD4+oNdctuRAV8iGBOji+nr373ShxTD
         sWLasDb2A4kzdUTvbgQ80NbiAFNpx1hUt5CavY2Con6L0JidaSwLwdHSgqe1v3cRdepm
         W8i3uPZSnJxASif+eDWB6qgt1q50dWlkjBuEbb69hNOfdevjCQNSczGvr+N1CWshzJfz
         9Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750325567; x=1750930367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
        b=AXqHFfhLedhq/uXsVJP74wINhLx59BEzHgYZYdgQunmhCdNc+FF2/r7rMcFgz7R3Cn
         farfesln6545HclFXrQdJffk218DbfJoG/pVRvCHJhlv/RHHmAXQP4fv6DLDa2r+mqht
         f59pu5Dqp64okK2HtBG7MLTkG9kFL7oDORrF50fHV6Mc62aoxhGbNd4ShsvNXQEF6vf0
         Iqn43P+WOX5PchRGHgtBnN6J0oo2HHuG44zJJBuYISqCIbFqIAW3iTBYjc80SFgi4D+Q
         4TaAJw6/kGw5cYYDYVpvPIIL8Lc08vYIJsifYa/zZWOZQHUDIz22NdJDXXrCHkZAUOGE
         YJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx9w85CD5+xWvOzi6DynWoH0rLtwzMyqvbYt0GBn8zw3WTJysL1GKjAaoUUhCyg0NYvVznoQRdOoQEsh1KKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxR2OhxYr5P9Ywahdko5kxSqXaj7KYKst1C9X2fI0z5kWexEBM
	NycglO0JNDUARI88ITCtMgiwNNUWid/oDYd5teiaw4YqpGzC5BP1N/ayXpmLOl4wAr3HtZwOaXI
	Q2LhUvDAu6jtaHoV0Odrpr/h2dFbXbH0w71BcvRFt
X-Gm-Gg: ASbGncvowFlK50YIRDMihZKgnvvZw4DnNg1j9HaiE98/x4bh8s8qYGxHqmaWmSMz36V
	ZbPLZmIQQzDEdoTHk1zEOq9/P/W9h54vj/3AHwOHSLNRhS3M8JM6kTsaQsCuOITvRk6iOAF5sZJ
	qWamZ7qjD2ZI9HtEwZQUL1Z5OnWpdJqcXsP7UnuG72cxbOg1DjiMq8fgGdit3dclOzMdIjc01vh
	g==
X-Google-Smtp-Source: AGHT+IFEvooeG4VcErFMLHhwcnUP1Kg+jzxVyPLvzkXLE8yIClgj+ttPBoQQQPiG07i+rui2fBgT/Bw6DQkuafbQY+4=
X-Received: by 2002:a05:6870:8887:b0:2ea:923e:e753 with SMTP id
 586e51a60fabf-2eaf0837092mr11661006fac.22.1750325566775; Thu, 19 Jun 2025
 02:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgi1GBqDHvMh30fbxVUjnTETLXthpK6eGLJA0Vh_TZRnsQ@mail.gmail.com>
 <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com> <CANiq72kuRLANX=W7xUo1Jv7euH2eAhwHbx-CF4_4Nj=e9e1Weg@mail.gmail.com>
In-Reply-To: <CANiq72kuRLANX=W7xUo1Jv7euH2eAhwHbx-CF4_4Nj=e9e1Weg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 19 Jun 2025 11:32:35 +0200
X-Gm-Features: Ac12FXzMiLrysaexKIHEsv3OlSgqtWrN4f4wQ24ucSR8dePMWMPttaiZ4o50cC0
Message-ID: <CACQBu=VyU3vPLaimFZWPVkLpSHgRNFJgQP1khhfq=a1UpU74aA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:53=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jun 12, 2025 at 10:47=E2=80=AFAM Burak Emir <bqe@google.com> wrot=
e:
> >
> > True, I observed the panic but the test is erroneously marked as failin=
g.
> > I have commented it out and added TODO to enable it once
> > [should_panic] is supported.
>
> No, please do not use `unwrap()`.
>
> Instead, tests are supposed to be written as you would normally write
> kernel code as much as possible, i.e. fallible.
>
> We also have now support for tests that return `-> Result`, so you can
> e.g. use the `?` operator.

Point taken about unwrap(), I will update all unit tests to return a result=
.

The lack for [should_panic] support remains
(CONFIG_RUST_BITMAP_HARDENED is intended to produce a panic which
would be nice to test), so I can only comment out the test.

Thanks,
Burak
