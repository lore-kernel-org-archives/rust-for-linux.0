Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFABA1A08C6
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723709114; cv=none; b=Sx6LRydvFuMoJyoaWvSUc6SlYDmzU88dERZMIt1kXgZa3dkCBiIX8H/nyxqazQGDWrtq4ies/8BtavOLc7YLZSKp6tOIxrNMOUS78SqiLPoh804cazTJ61N9sLLvGnMX5zSytBVCWgvb6cMoytJLE4z8Melsm8X/tmjQbgyI6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723709114; c=relaxed/simple;
	bh=z9gF/rR4YAP9Df3qlVcsOZgH5TMPEw3eQ5J9+Wi9oJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJfwRr+qW3hcTe9sOypVElDLnLeNMzfy1dPNnBKy7IU+yMiUt7f9YXILy0r/B4AB1gR10NHOUQlawCfOvHd9rwaOYBMMeci5slxhf6y7jgklhBB2tW+5S/Dkb5vNENynYWqj8cCkGO39x65RJQeFuaureYwc23LM6XBlYkTo4VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLWkDSOp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLWkDSOp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01993090so846616e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723709110; x=1724313910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9gF/rR4YAP9Df3qlVcsOZgH5TMPEw3eQ5J9+Wi9oJY=;
        b=PLWkDSOpMHZFKQsgTm8xgxvd+o5CCb62ZpXxOPO+Bm5p8HnWvl17l4GbzQnYYqQyQ9
         MWG5Bwo6ATSWUJ5zIxmBgNL97NNA/u5HM6cFx5IBiXxd3z1xieX4D7irf19IcfcFyLnt
         SIVDWcgBxV3SPNpt2JxgYsn0NMf0tDhK15+Ro2vbAcLT62U+uDIkMqo+daW27s4f1Lmm
         GKBEGMNJ1+ew9q+ZfFr3PbzlZCfBIQfaO7iJA9wH+CWuKxQvOgvhSOfqBfnxQcnClvfr
         iIVETwdOvJgDZOKKuV4Ltmd4BXVbVKOAvfqpL2PPEhqbcGi6d/lKlXS+cOc1gw4hc6GC
         EphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723709110; x=1724313910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9gF/rR4YAP9Df3qlVcsOZgH5TMPEw3eQ5J9+Wi9oJY=;
        b=CuLPfT1qyp1GUrVwwc6vsZzPc4D679nk6avfbdskCYlJDAquhAIlnZank8v5nPTRlN
         VDsJu0kKGxCh980h36VnWq0BinSWLmManQ+8Dhf6y/ruiyvYb4939H60K9dKvTddhURn
         1DkIa6wgPmb9Cntjli213aqNA24lHOcLYXSP9aRwDpE4c38Qp3KnE1dpcGFd/OxEOURy
         vSsylVuQlSofhQuQB/neXArzAS0OxGmKd4eu+WnBnGx/Pm01p5RkE/9ep5N42kfH0DQI
         GkTsm4WSpoaFk3Iwm6y8qkTU5G4HilbLhh0vUS+MCoHSrvrQAbY2uMJimlh6ibJBO72P
         TmZA==
X-Forwarded-Encrypted: i=1; AJvYcCXtBALttFw7Q+nnGoy8yQ+84PBB7YxkyUAt6APMsCqvxCaT9X4Rb7Y5OQ6qkwuNBSv1keaTW5qjHBVSpOObWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBDv7xGRc74KhRTsN/sID0uvhnJE7x5Pjeng4ku5TApjDtyZX
	bb1p8yrkmaVEPOOEf6sW2fn01Z/0LvzqdNL/DA1dlP//Ifl5JWRQFbO16nYe8BxklSuGdeeiHv7
	4rmcoPkuWvFHopectJaUVTD9Suozbat5WXpIpQ2fSJ0L9wKUteA==
X-Google-Smtp-Source: AGHT+IGCOOMBdtfFVG7gZ5Ss3y66J/LKGslf+MKrMBKcw1l8XPOfnAgft4zB0125aa1c2yS8DWuc4vWYMO5cotvBUlc=
X-Received: by 2002:a05:6512:6ce:b0:52d:6663:5cbe with SMTP id
 2adb3069b0e04-532eda5ee4bmr2856220e87.12.1723709109517; Thu, 15 Aug 2024
 01:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815074519.2684107-1-nmi@metaspace.dk> <20240815074519.2684107-3-nmi@metaspace.dk>
In-Reply-To: <20240815074519.2684107-3-nmi@metaspace.dk>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Aug 2024 10:04:56 +0200
Message-ID: <CAH5fLgih1QtO-ACyoifNsgqd=VtJimoGV+aD=3iHG0wb+iDGyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: block: fix wrong usage of lockdep API
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, 
	"Behme Dirk (XC-CP/ESB5)" <Dirk.Behme@de.bosch.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:49=E2=80=AFAM Andreas Hindborg <nmi@metaspace.dk>=
 wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> When allocating `struct gendisk`, `GenDiskBuilder` is using a dynamic loc=
k
> class key without registering the key. This is incorrect use of the API,
> which causes a `WARN` trace. This patch fixes the issue by using a static
> lock class key, which is more appropriate for the situation anyway.
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Reported-by: "Behme Dirk (XC-CP/ESB5)" <Dirk.Behme@de.bosch.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-Genera=
l/topic/6.2E11.2E0-rc1.3A.20rust.2Fkernel.2Fblock.2Fmq.2Ers.3A.20doctest.20=
lock.20warning
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

LGTM. This makes me wonder if there's some design mistake in how we
handle lock classes in Rust.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
