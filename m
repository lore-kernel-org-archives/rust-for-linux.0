Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1BE1D4607
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388439; cv=none; b=BXVc8sOyEBasUrTt2JRDL0xnUSvAGCOyZ2VMvXSmc3asXr9TPYYElK+XyJ0B7S0AUqLMsOqQAVLL/RKONTHDCaPZj/M2Uh89ghIJmVQ9oRDxhweUtr/U7shAwhvUFdgqe0rS7chsbdJ79B0P+Ac2hbMO9w5ymSUzlb/eQy6ws/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388439; c=relaxed/simple;
	bh=hnsawiAPmNyTaOqVa4N7z88n0Q+3dFHhfhhfTqZFluI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hawb4961stkok2NkGnyWNJHCBP0x9ZGJ8IiySTjQFSfpoPyVtYa+rJQa5QTm0cyEGK9ZIaSPw3K7oMhTf2vC0hTeHrcB3dXAezK1ysEgaTYmmZ0g0kcug4PUk/krIu9z2m8H0wt0XlcU3FokRTRR8A55KYmFuAN4U5k5bu/WuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bk1/fQHO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bk1/fQHO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385eaecc213so319076f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Dec 2024 00:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733388436; x=1733993236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnsawiAPmNyTaOqVa4N7z88n0Q+3dFHhfhhfTqZFluI=;
        b=bk1/fQHO81uCf2qg67ZAsKLqkDTud3O/Q4tu06veALpsdxHgka4hu2pTMPxbFs+Ith
         +vRvJoYzVkT7BSLwuXCq2SZlCW7a2V/aCPOiXiD0SLd/TIUJX/27OSpTA7MAtCJxdEhu
         YB9Y/5C5DiDVMPDyC66wJBHqCVFdxzU2xTyyH1c724NDqxOoBcRK4FWxaIJfFdoDmNAc
         mtwtH3ihJgdL+wIZRgiufOQYSjZyPDr2QFRlT6fPmxKYakOaIlb2bB6YuV3pl93Y/afM
         dsCAntmMwb6rF3F+BC2SM7vUkLJkRnCbivqgltDcsf9Zbdm8/DYDeYvJv1pg83pnuh11
         i9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733388436; x=1733993236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnsawiAPmNyTaOqVa4N7z88n0Q+3dFHhfhhfTqZFluI=;
        b=vSBkYeCAAu/wxhVcbvrIfZutLuN/pewlCIIUtLxQvhvlGSAcO8WK1ol2wYhxFojdIx
         DlfHbnfDi3RrZdimG1AhsFZcBu14T9SYsjUyPEGc803MPkuwRGxwBXGPq3nIkeMYjVQO
         gZT/NqRq+2tj+jSsGYcREWX6q9XRDvL1hRXsbpMs4zDJaq4CZnNbF1P43aTYex7I7I4s
         rChOCjtaechiab3c9122iLog7PFQKERPPBcl6GP/UprUM8YAFX6HdQY1QoAIg2F53/Jo
         y/Zg0Qt6K6qpibWww5fi5eHCf6PmOsoAmlDo/kFAfQlh4m9FhNdSpWx/jKoxCCfiZBSS
         0lrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgQNM4bwY+VmjJVP/QUmdkIORhHHqBOG94xETwWQY2/6RlqIYHdSX1CUYxJnb2vRC+15oRYPNqluXiSgl4wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50p+95jjDDg9RuFcWWX7RzluXZX4oa8Vm6J7MLlcIx6qJcAbc
	iSjMEotI1kKqxaPYQ3RZeXjg6N+ySwRJjUA98LEgcz73gQHrKqnSVA1+TN/wP92+E/YnrwpoNjU
	CictMKrEWMLc2vQArqZzzEQOojzIsARcrrQIE
X-Gm-Gg: ASbGncua5dMTviu6/zmVauvIEAgrZPVY4j/X/Acel4BKcxYhYoVr1Z/MQEQAe7A5F7g
	HpPWo6EPdI2J/Mtpq0825ikNGaujlSNGpNDnJ1gugrKVj7V4/iH03ogQIg3+gAw==
X-Google-Smtp-Source: AGHT+IGnhellO6UJ4z4u30dAkBaqbxEvnFWZdjtopqXpVvl6L1W8rz2P6jjJGe9/awoSRPYnuNZOTWKmtI+ml0eBTxo=
X-Received: by 2002:a05:6000:1885:b0:385:fdff:d457 with SMTP id
 ffacd0b85a97d-3861bb7c21amr1569820f8f.13.1733388436297; Thu, 05 Dec 2024
 00:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
 <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io> <CAH5fLgj30AmuobugAgzG9vOhSOrk5SqWwguOoNeh3J2fmLRHCA@mail.gmail.com>
 <OCjFF0---F-9@tuta.io> <CAH5fLgj2qHjYj=heYi55qWz7=LxyHeUPyhbgVe0QLjzH0S34bw@mail.gmail.com>
 <ODK_F29--F-9@tuta.io>
In-Reply-To: <ODK_F29--F-9@tuta.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Dec 2024 09:47:03 +0100
Message-ID: <CAH5fLgiwQzrKG2a3Doj+LYGAna7yJcBO5eTtyMYiBfVZmZSLVw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: Add `OnceLite` for executing code once
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rust For Linux <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 7:49=E2=80=AFAM <jens.korinth@tuta.io> wrote:
>
> I'm afraid you lost me. You wrote:
>
> > Using a Once type for this seems like a good idea to me.
>
> and
>
> > One advantage of using a Once type is that we can use core::sync::atomi=
c
> > until we have working LKMM atomics and then we just swap out the Once
> > type without having to modify the warn_once abstractions.
>
> That made sense to me, so I started in this direction. `std::sync::Once`
> has `is_completed` [1], which made particular sense to implement in my
> mind to increase the utility of `OnceLite`.
>
> [1]: https://doc.rust-lang.org/std/sync/struct.Once.html#method.is_comple=
ted

The stdlib Once type guarantees that when call_once has returned, then
the closure has finished running *even* if you are not the caller who
is running the closure. It achieves this by having other callers go to
sleep until the main caller completes. If we actually want to mirror
Once, then we should have that logic too, and I really don't think we
want such complicated logic in our pr_warn_once macro.

> > The purpose is to use this for printing once, and printing doesn't need
> > `is_completed`. We can have another helper for other purposes.
>
> Why have `OnceLite` then at all, instead of the hidden Rust macro that wa=
s
> proposed initially?

Well, one advantage is that when Boqun manages to add support for LKMM
atomics, we can switch them out without having to modify macro code.
Moving logic out of macro code is usually a good idea. It's also
possible that there are other user-cases of an OnceLite that doesn't
have is_completed.

Alice
