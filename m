Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860042ED144
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093042; cv=none; b=DG8opIZz5KC064uHO4ggjfgtXYPUe04B5xJq0ZtUxnuubayZwK4oKHwJisVdo7h4qI7fHOsTMv0MO2p8Uy6G8FWwlIBlubtwnT0BNG+QRhQzfuVPkdXCAPuy9RiZsMbT8islWztrINCPiFP6EoPPHGczalmZljiVSFDBRlge+A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093042; c=relaxed/simple;
	bh=Th4SgWJ7uOrhbJgJsJ1OslYEWLKNV+cmdvYGwrA7T+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiUHWCMzaQQTIpo0JANiWP5yAmsh0GBaUmSsKqlsPP50DYaYD2l1HsOS9AFiW+SstXPzMywtiDIbkBIh2LZdXUZ/z0J6Dkcao6un5qXADvDmf/XlvR6ugmBCnD/i7VIg2zL9G+Mm8Ldwd6i26ribzKg2Ur4XLmd2F5DO+MwXf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I+4Fmtxn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I+4Fmtxn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7886bee77so4729744f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755093038; x=1755697838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX7HsBZ1OSxtuZpt+0fUOkrMNSmDcBAX1JrxfwqVFSE=;
        b=I+4FmtxnFZLEaXk8+qCr4cn8GcUsrpVhl4TiAG+MPNs8IX57z/AcyQEpg00hcDrFbL
         6QN1Td2nkXBXLhfbpumDzK+Kudldg8zC7QeyMPl0mybfOQo1qs+HSVrs7Y78+JvIe91D
         TtSkW7BvWI+FeHcne4eHWKHCcS2wkuFi7yVQJv5erTVQuoAWr4xIK8p7/r/QSgsa/UlK
         x+X0vb6wjhl5DQPSGnuTXbnMt8QQrTDvDRPGCiZr1QhAUZdwK67p6ILt/08l4XHmWIwy
         nq1DL4C3Tn7AIevyMll1XsvZLbe3EVetsdPeKPcmwEA2MIDwyDTjnFcdqnO5ltwqUDTh
         YpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093038; x=1755697838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MX7HsBZ1OSxtuZpt+0fUOkrMNSmDcBAX1JrxfwqVFSE=;
        b=lunyGjvKGNfUxHTnrTfkMnoNu61+vlNq3Rf3SHxklbKFUJQ9sJBCMgIs3m+ujJB8TJ
         8z9SGnV9nbaqaYJMwaVe3m7g0cPl5Wh3VJvA17MXkUiSX7Jb9N4xWyRvslPPPDDD68+r
         At5V6fnSqdjJIAggQRhuDzAHfq6KFiqVLMPZpNFwJr9F73s1co/dir4WfTaLhXgw5FxV
         rpvjGOKyhijMH2LbITHgzZJ5GIfXzlapJqhQIAo7mtW2G1MrEDGgFaocaK6k1RX/UZ+n
         A00zvh/VdeLE3Y9K23qyfAukOeR9hMGhRL1si0ygK6MF9AjcD6sOuSxs0zC4lwdInRv7
         BxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNh/12StqFvMb9Q9DBGhNoT2QlHnByN4NwShnwhWsPqtEasylBoHNO6fOjkpdweK1XHFPG+Z2t5T9XjIkBCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoqCE2mPG8rEvD4/ybZpt41X1AQzU38t10BxAyFap+LiLtLd0Z
	ekbzSu+cHQ6opuuBHf98l5lXA8tFGLOnczq+XzU3xluJiYcBAnIIW+6q6vR4mzoP3qPcpFdofEV
	6QToF+L6hO77yED5zm8L1SbB2/smx5d8i8rk1p/lw
X-Gm-Gg: ASbGnctcFPepTLDpojfbsF0n4h8V6ocFbN2fsuB0sf5jea20Db3/+CeW4x/OapxyFTk
	YpN7zXUG9wsEC5mEwhCX0GIcTmyW79vGjMtDGnM10e7pTqts2XS1epgAUZ2WEXsG2M+zsstjRrs
	2qUG7x1e8nr2++xBWheCJN2UUwoAQVzNccVV2hjyrIIS/QJYrY6uMZ19bd43epMGqbKm/FpbP9U
	bUn1IUJJuhYKN8Yuu+DzbXHKI5B9URjSaW6RcMaMSDuYmCu
X-Google-Smtp-Source: AGHT+IHh+vA/07eWR9Ebta9w7V6pVGfOotLmHgLP9XCK0PEzsGlKp04MKCCBaqBhhNesoViqmXpEfMe6W8DHSs+xG04=
X-Received: by 2002:a05:6000:2005:b0:3b8:f358:28b0 with SMTP id
 ffacd0b85a97d-3b917e4ee33mr2691536f8f.25.1755093037572; Wed, 13 Aug 2025
 06:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org>
 <20250812-rnull-up-v6-16-v4-12-ed801dd3ba5c@kernel.org> <I-QXOGdDtTAVOcFvHZksoPqkYUZThmxrTUNw1h_MEGXdk_X_dc2txQdKJPMLz-yPmqL956iydAqVD9D5aL2SDQ==@protonmail.internalid>
 <aJw_I-YQUfupWCXL@google.com> <87a543fkh1.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87a543fkh1.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 15:50:25 +0200
X-Gm-Features: Ac12FXyzo-eVyDXufLE9G-NGeZ0mHM_6CqrztsTkjyFXCp398EsRl9GEXjBkjqs
Message-ID: <CAH5fLgjezWnFLaEKZkfvb9ko0RHG-c5g6yO0KvOJ8nyennEXOQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] rust: block: add `GenDisk` private data support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 3:47=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Tue, Aug 12, 2025 at 10:44:30AM +0200, Andreas Hindborg wrote:
> >> Allow users of the rust block device driver API to install private dat=
a in
> >> the `GenDisk` structure.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Overall LGTM.
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> >>          self,
> >>          name: fmt::Arguments<'_>,
> >>          tagset: Arc<TagSet<T>>,
> >> +        queue_data: T::QueueData,
> >>      ) -> Result<GenDisk<T>> {
> >> +        let data =3D queue_data.into_foreign();
> >> +        let recover_data =3D ScopeGuard::new(|| {
> >> +            drop(
> >> +                // SAFETY: T::QueueData was created by the call to `i=
nto_foreign()` above
> >> +                unsafe { T::QueueData::from_foreign(data) },
> >> +            );
> >
> > This is usually formatted as:
> >
> > // SAFETY: T::QueueData was created by the call to `into_foreign()` abo=
ve
> > drop(unsafe { T::QueueData::from_foreign(data) });
>
> I don't really have a preference, my optimization function was to
> minimize distance to the unsafe block. Are there any rust guidelines on t=
his?

I would say that the unsafe keyword just has to be on the next line
from the safety comment. Optimizing further than that leads to wonky
formatting. A similar example that I also think is going too far:

let var =3D
    // SAFETY: bla bla
    unsafe { value };

Alice
