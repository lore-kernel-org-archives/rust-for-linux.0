Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F92135D5
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075784; cv=none; b=ag/p2C0AJ0KWuwX67IDXGm5EWVxtaI9WAJYSTzGs2BCiRfO/0WtmGlo/f3ZZP2WSlILsWdNsJK/Vh8/6dG3x+AWPuhoJP1qOwUpQayYnG+QbDxnN5S3nBxgD1BzsisOSiJjgBwXFBdExYkykLLxVK0Zamx2POaGA6so1eD+CZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075784; c=relaxed/simple;
	bh=bEp6xigsLHHyRGydgFG6cY5JkgkV+AnE2CCNkdUAcfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMiFjS3/YK63PqsIli7L6H4tCTvJ288dIncTht7Sf/sbDMidgi/gbPme5R8DuBBKDFaXMjcIMHgfr8f855n9EXy1MML83fpRfuZmNmvv5AZ4B3bSTHy0chq6YvA1XgCyXZ0bJ03dexvkRdO0IwromcCjXLzWN1wu+alI5pDiMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVJ4hpuI; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVJ4hpuI"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so573622b6e.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743075782; x=1743680582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=098/WJlPRFtgRjWciBzH25sdsG+k8IR2+Xx5OaMFgJQ=;
        b=GVJ4hpuIO15f01GJzFASI174Nium1ihRU5q+BT6SL4t071ihAZr/HHQzMo1N1oa7zR
         NRx6G8fzqLBEMnCgHNyK9fv94jil89q1krZxmDCxLwASfiMC9U/eUA99G+PFz2+HiziG
         Tf2bZ3f1aGtoR/nXywSoyTgGEE51liM4YAt+eowcdC3FT1+9rv7JH6RqRTdK+WPptl1+
         hjEuVhxBjsrzdZdPjz1sYNhoL2qHzUkMDP5757EJ6s089Hl4cS5B36X30aB+iNsEqbpY
         NoWTOx71/s2AoGwaIflyMXem6uCJmy0FkcEzB31RbEfkZYbr2aUbp0mt8S8tlesDHnnE
         FEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075782; x=1743680582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=098/WJlPRFtgRjWciBzH25sdsG+k8IR2+Xx5OaMFgJQ=;
        b=k+crREO0HocwKjw2vwZWlOR8Ny+5GVj1n7ZMn5TMm6EVEgu+Xd2LDxKEzbqOm9wIlD
         etXfU3pRfAi7eS+GYz/uXW+wJFafpyTCn0S0Mgcucp1x1KkyD18VQes2ajbNXhZCZ3V3
         FQWMD9OKNfne+9BkvRqk+Uk4vDYsTy5C6KVVtddFFWKtRvIUTRN+viB3vG87EWArZI4M
         BVFbuqCeguVE30Q/1WgfC7mdqHFY0/tkRf/HB4h7t3SI5fW8UqiMwp0aLSqViaWeDGzk
         Z0Ur3w70Q+TR1IG+/nMzTwiHnbD4+0X0T3c8E076SQn9vw4fUPbxbffo/RWclIjpAQSO
         ZJdA==
X-Forwarded-Encrypted: i=1; AJvYcCWy4lCuYw1kmrzURFfgAueTQyeXpwzVXBtufjRFT1zujgsCU6ctYmZX4wqD/noweOnQQMixhEZj0Nab1JbpIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFgUhCn/vjMTPmBIXbJh9KSn7Q9GEFlHgwwoUWEzkuCzOAhy5
	mZchsMpnFqjf/qXfUC1K6DDVUaPdWJ6R8EHHJzWvglP8jZFqEspD4JnE0Axd2qs/kqp9aRTTBog
	RHubf+TxxWgni5yK8iqKM0Io/6VDnTcjmmpf4
X-Gm-Gg: ASbGncuHJJbbiVb6QUg/TdWTmf2GDU9W32MfWWBM11NDMrwGvNQc+E+mWP8YSIuVCmR
	JnXWwjPOypg+D3IspcIdx/uqN51snQD/CIUkFaoX5zcap8CdnI6oIuwBQVoRbr2iVUmhmVwMK/w
	1rR8ocqnhKZZdKG/XmiQB5lwm1fuy3i2QUmqrw9b/dla44ZMHEHxq8G++D
X-Google-Smtp-Source: AGHT+IHrE4C+ttk8AOVzYXJZpyZmoKHktd4gYEnnr3J+sxJW7Zapo3xVbvsYHA1pnlz/dYwvWEo5DwFoTPjiAUN91gY=
X-Received: by 2002:a05:6808:1456:b0:3fa:c549:cff6 with SMTP id
 5614622812f47-3fefa6055c7mr1749381b6e.36.1743075781556; Thu, 27 Mar 2025
 04:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <Z914T_oYHvV_Zk74@thinkpad>
In-Reply-To: <Z914T_oYHvV_Zk74@thinkpad>
From: Burak Emir <bqe@google.com>
Date: Thu, 27 Mar 2025 12:42:49 +0100
X-Gm-Features: AQ5f1Jq9HEDp_I46TikkToJM7nDxnpvmpKqtRZdrU7TGIlcs4amJcteaeH1O1l0
Message-ID: <CACQBu=Xp7TfVHyVq8Ew+vOvEO-kWg=9b6bhdzhNDVqYE5yUSjw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:31=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Mar 21, 2025 at 11:15:28AM +0000, Burak Emir wrote:
> > This series adds a Rust bitmap API for porting the approach from
> > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> >
> > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > and bitops operations. For now, only includes method necessary for
> > dbitmap.h, more can be added later. We perform bounds checks for
> > hardening, violations are programmer errors that result in panics.
> >
> > This version includes an optimization to represent the bitmap inline,
> > as suggested by Yury.
>
> We have a tag for it:
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>

Will add.

>
> > The Rust equivalent of dbitmap.h is included as id_pool.rs, which is
> > tightly coupled to the bitmap API. Includes an example of usage
> > that requires releasing a spinlock, as expected in Binder driver.
>
> I don't think it's worth to refer the existing dbitmap.h, because:
>
> 1. It's buggy;
> 2. You limit yourself with committing to provide an 'equivalent' API.
> 3. If you want to bring the existing dbitmaps.h, you'd just bring
>    bindings for them, not a re-implementation.
>
> Can you just say that you're adding dynamic bit arrays in rust?
>

True, "equivalent" is maybe too strong.

I considered "DybamicBitmap" but dbitmap is only providing a
dynamically sized bitmap under the hood (and with a specific API).
It does not expose `set_bit`, `clear_bit` methods as one would expect
from a Bitmap API.

That is why I found IdPool a better name. I am not attached to the
name, just dynamic bitmap seems misleading.
It is essentially a dynamically sized thing that happens to be
implemented efficiently using a bitmap.
I will leave it to Alice to explain why Binder needs it.


> > This is v5 of a patch introducing Rust bitmap API [v4]. Thanks
> > for all the helpful comments, this series has improved significantly
> > as a result of your work.
> >
> > Changes v4 --> v5: (suggested by Yury and Alice)
> > - rebased on next-20250318
> > - split MAINTAINERS changes
> > - no dependencies on [1] and [2] anymore - Viresh,
> >   please do add a separate section if you want to maintain cpumask.rs
> >   separately.
> > - imports atomic and non-atomic variants, introduces a naming conventio=
n
> >   set_bit and set_bit_atomic on the Rust side.
> > - changed naming and comments. Keeping `new`.
> > - change dynamic_id_pool to id_pool
> > - represent bitmap inline when possible
> > - add some more tests
> > - add bqe@google.com as M: for the Rust abstractions
>
> Instead of 'bqe@google.com' just say: myself.

Sure thing : )

Thanks,
Burak
