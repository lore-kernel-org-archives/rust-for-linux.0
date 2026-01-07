Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3A1A3172
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768810; cv=none; b=GwaPXSFP4OmM0+C6DYQeps1m1tqbq0aeJJzd+WUr9ZjVwTdtDGYCvRodON09AWZHAp4w6XAQBVMvzC+TT2j2qs/61GTO0o+xAmwYaShfm4rlGidaTpcE/4C5pqol4aE+CyfSNG0br0j+XZWs8/W2ISwqLmTBXMnQlGRqa65vLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768810; c=relaxed/simple;
	bh=jrkPuDGTiolihR/vEo6Q8QqA0Opl6OIz6h59jIk7vJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6oDjtALyis4YhwTzurXuZJ4Vix5kTxK9Q9qyXmRrsdE4lrFS/NRu0GMYUpTXju50pMJ5+6f9dqXQEFEpIAp2/xD0cRVfIvv3LFNb8T5V1M9NM1/cZRMctILuchiyhtyCI3FrytMoSa1QJbUCoFYsLBFpEQxpVTQrN/VysJmY5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1SpBXkFh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1SpBXkFh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1232162f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 22:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767768807; x=1768373607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftMrkjbLTkMIJ1Is6EUKDchzlG6OICkmtkENXfbqQsM=;
        b=1SpBXkFhwbMJ3zo/YfWodZl+h4F7s9jg7BAc7LaoU6VCw/qzT10fiwzh3+V3KRyHVj
         iDsgAlRe1K1FMKuaCYCKsmzuPsKC6oBOmvllPo17xb14wEfMRCXhjMAJUX4j+ZRamxvh
         zbJUFPg6mJb+8rzOfnRRTtcRvS7dH010zp2fRMR+e7WTfv4V1PvOm4dcBLK13bekLsvY
         Kf5xg7Xv1wo8F13i2Da0dsq5euFK+eSH2yuqTP6bUfRbev7nP9KFxtDXKHoh+FsV7mcM
         efrTsJjIm5RSs1rA51pHne30gZLh/HsEvAZWWYykXm5Kp9yUGA2gO18H5KtWaegsF3Q0
         givA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767768807; x=1768373607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftMrkjbLTkMIJ1Is6EUKDchzlG6OICkmtkENXfbqQsM=;
        b=JiK+vvN7eJBZf7d8PGXAqJf5LiUAvBaV3/3Efx9yvOUoGAcWHCdQf7RxPBzBWg9j5c
         o+RR1/sDvM4MDh/q9i07ZMsxxP2ocbppApfgihzEuKJGbRU6evYwd3dIUDAO4SJMij7B
         gRz4Ak18X2TyjDeKat7+e6V63jpkcYuZp6CtNkALNMK5QID2QO7I7j60dLb/3yqAJECs
         kqgVyG1la8018TIqvEHTTWcIS5JHBb1RJ/sSsSwQovFzhkPp1UBaa/9WAkD3ePl8+an+
         96xrRIsq48zkcuzrP0J9dzfXVvRl5uBW8p2X3GeeascwTJCLHJoM8B9xz49v1zeDRmg3
         Lf3g==
X-Gm-Message-State: AOJu0YzYjY5/kcY6F4m4uX2hpA82++n77HUUiun3UFvctQVv9Q7oc7mN
	eSBQo4yxrCuE0CB6kNA0qHvQ4/M7OIvWBWIMRi7daDHl5unH/t9ReMc3T3azmhVXfYbzaK9lKJ8
	awUFdw3QNetLq1owp+dZrhiYpPiOiyRg5SC6ON0z0
X-Gm-Gg: AY/fxX5aWKbsGQ6oFrq3mOYgF1t2J9RVbOzvhrhecdmW0jCu9YpGmnEP56os7zBPc+c
	OPhhpPWCDCpTGkufuT3i3Ph3aVWqgaRKf2Sv0fQksE18hNEuvHTXWGRV8Agn0h6cUP4QBAc+hHn
	QJl21cS9n4ax2REGSqmEWZfq8o5tOTovIltWTyRSsFcq/Fi5Y3e4tjMNnA6uI3toYHxJOywbmNR
	ngI41qwlMG8yja8+HsSzIMt58i8bRkOA4ZyDkTLAYfiUZQhqJ0PVbYzxtLrxZL4I0hH6u89fDDz
	j7z7jAn2euR/kU/UMGU7817lig==
X-Google-Smtp-Source: AGHT+IEjAhqtoONLv/iwA0CFBn+Uwj5PihwOj87nJUWY/sVKgH68AkQ1t3GnlUdng6bIfpv4YqxXHEhAlQKOrqGevUs=
X-Received: by 2002:adf:f08e:0:b0:431:5d2:4526 with SMTP id
 ffacd0b85a97d-432c379090dmr1314740f8f.19.1767768806936; Tue, 06 Jan 2026
 22:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-7-51da5f454a67@google.com>
 <CAHC9VhQthnDRi3yXxnD8W_vAsxKOJPh8Zd1YxpF_fU5YGkj3SQ@mail.gmail.com> <CAHC9VhTqptD8_QWsUehss27AEhQq8oi6=rtA+dQTCAO1VoEYbQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTqptD8_QWsUehss27AEhQq8oi6=rtA+dQTCAO1VoEYbQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Jan 2026 07:53:15 +0100
X-Gm-Features: AQt7F2p5Et4_k3ESiLdsgvFvqpKALHmLYipgva6urpkNVC2TaPrSBtZC-xQiqyQ
Message-ID: <CAH5fLgi2XBLpyJhUvM4-ry4ZKbBKtheHyH0w-1B5hNySqj_Tpg@mail.gmail.com>
Subject: Re: [PATCH v2 07/27] rust: cred: add __rust_helper to helpers
To: Paul Moore <paul@paul-moore.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:29=E2=80=AFAM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Jan 6, 2026 at 8:25=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > On Mon, Jan 5, 2026 at 7:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > >
> > > This is needed to inline these helpers into Rust code.
> > >
> > > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > > Reviewed-by: Gary Guo <gary@garyguo.net>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > > Cc: Paul Moore <paul@paul-moore.com>
> > > Cc: Serge Hallyn <sergeh@kernel.org>
> > > Cc: linux-security-module@vger.kernel.org
> > > ---
> > >  rust/helpers/cred.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Acked-by: Paul Moore <paul@paul-moore.com>
>
> Ooops, sorry, I just saw that these were okay to merge into the
> various subsystem trees.  Merged into lsm/dev, thanks.

Thanks!
