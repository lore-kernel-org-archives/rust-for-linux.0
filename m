Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF114010
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147499; cv=none; b=Kpt0T6WuSGYJ4tz9B7eHRJa4555ZUmQcbSSL0w0C2YkdmkvTISXtK/uZPzPaQ668cH8oChWkXu6d2EOy75cBLphlvJXQM4c8SuEV1AhT+EK2liQX5FciqIShvAIZ7il54lSQyfF8glkfIlaoqFcBFR9Hv/c4zWh3Txd/9JhJ0CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147499; c=relaxed/simple;
	bh=nmwCd6oE+Z8Sz0paNTI/cpUPNTE2UPvOTA85Lr3hxlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUl+k6uctvnCRb5WFQcZTiQlpgEgRwH2ErI1qThiP6poO3HuYUcPEd/OQbuFJPX2pSrA3FdmDUhtq5eRNX6+vrGSOSEK/elYdh0vyRPGhJBpUvZEcSK5KeSr9nAQwDO2FLS53DB5wiwSMiG3/HER85KxBGEky+LbdRv/AK/Ytfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZ4Cn7Na; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZ4Cn7Na"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-47260f17741so2630509137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710147497; x=1710752297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83LHccGVHbfUBfKOspQNihL8xbh5xYWLuxJMeB/7Vbg=;
        b=LZ4Cn7Na/7gVWqi+uIu89Rag9CZCaVHBumyyC689jTsDnxMOOelgfEPYRm8VY3/dJB
         w+K3mSJIPPHcZBXw5TMatP7X9S9Vs1AX9Pj+K+XFpXlnCpq+x1lTFYcgDMv87TBjaEEW
         srzs6/TKjOtCnHsHeZU/xcEb7GKpRU71XeE1ItyXuEtceMirQxeaLncGrvCGDFoOjFQz
         kduVDe32xnuMpn1MeEPihKSxQRN3zTnE4O2/4D6+kVsZMsCM5vBbEDss5Pz4ouqxIbkv
         qiTXUg1psNdju34Xw0v0+TISuWpQcdut6cDyuNxVAqn1GjRArmUienV5y7P/DlbOhjN6
         qsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710147497; x=1710752297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83LHccGVHbfUBfKOspQNihL8xbh5xYWLuxJMeB/7Vbg=;
        b=Fdrs9JYaoEGMn8ejp0iHbh34K533mtOhOF18GGTahcuTHByup5L98UAe2+RYEX613U
         TkZVpiUDr4xC1zKufXC7lIdLyu8M5C7ReE+Ltp1vphzU2Ipvh/8H9gX2goCfbO56eK+E
         JR8kU25TZXeb4DJz7bsSmj47oWQG7oJ5g8/LPV1uw6wdErM0Ic+4cQsrV18/XEw7IFst
         bViBj8O0vvKxBaOGlzp+sTnuPCR2focVmvLnFMZRM0VYXdXFgfeLldNpvFK3dMV5Xy6U
         LQq5OA5xGJPMgMkbPrG8dYrxpNZ3wbEkRhmERU3RGDZ4plzx6kClGAVG1Ld9bxbTIJ3c
         rpyg==
X-Forwarded-Encrypted: i=1; AJvYcCV5PgmyinKzITYxS1zT7BxH/SgWd6zlstKFeZcAdprZkwlO+Eu8l66UJ3mL69U5jXR2UG0RV7W4HU+kFbkDy9XCkjKtTSMWBwTMzjsZqB4=
X-Gm-Message-State: AOJu0Yz+vNrKtswlf+vQ+5avif8vxBB4jGtNvJeokNiiph1HZLg5yF6Y
	SCQKKphta0HjytSUL1ehRM5rLc71/mCYJNUFkzhksrJIK39Tsx9VY1OlCe+ceWjgAhfU9SC+NlF
	uKELcpxzM/gZALwFhVxM2FkJtS7P/PkiVFzUW
X-Google-Smtp-Source: AGHT+IHr5dSY0omrZBiIUNXcAvVnpqWlW0t/hT6ZoNUGLielnh2CK+N9PUKfQgh6cwvynZjTrk7MftnuyPMaXYjPwZc=
X-Received: by 2002:a67:c58d:0:b0:473:1a67:5af8 with SMTP id
 h13-20020a67c58d000000b004731a675af8mr3827778vsk.13.1710147496816; Mon, 11
 Mar 2024 01:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-arc-for-list-v2-0-ae93201426b4@google.com>
 <20240228-arc-for-list-v2-1-ae93201426b4@google.com> <e09ed8fc-d305-4740-8c6e-7308a634b822@proton.me>
In-Reply-To: <e09ed8fc-d305-4740-8c6e-7308a634b822@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Mar 2024 09:58:05 +0100
Message-ID: <CAH5fLggWwOLR0c-MR_p=Tw4vS8RHAEhJZsMLyx9rhYo=eVu+9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: add `ArcBorrow::from_raw`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 1:56=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
> > +    /// Creates an [`ArcBorrow`] to an [`Arc`] that has previously bee=
n deconstructed with
> > +    /// [`Arc::into_raw`].
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// * The provided pointer must originate from a call to [`Arc::in=
to_raw`].
> > +    /// * For the duration of the lifetime annotated on this `ArcBorro=
w`, the reference count must
> > +    ///   not hit zero.
> > +    /// * For the duration of the lifetime annotated on this `ArcBorro=
w`, there must not be a
> > +    ///   [`UniqueArc`] reference to this value.
>
> I am a bit confused, this feels to me like it should be guaranteed by
> `UniqueArc` and not by this function. Currently there is not even a way
> of getting a `*const T` from a `UniqueArc`.
> So I think we can remove this requirement and instead have the
> requirement for creating `UniqueArc` that not only the refcount is
> exactly 1, but also that no `ArcBorrow` exists.

If you combine this with `into_unique_or_drop` that is introduced in
the next patch of this series, then you could perform these
operations:

* Arc::into_raw
* ArcBorrow::from_raw
* Arc::from_raw
* Arc::into_unique_or_drop
* And then use the ArcBorrow

If we drop the final safety requirement from `ArcBorrow::from_raw`,
then the above would be allowed. The refcount does not hit zero at any
point during these operations. The only unsafe functions are
Arc::into_raw, Arc::from_raw, and ArcBorrow::from_raw, so this safety
requirement must go on one of them. It seems to me that, out of these,
ArcBorrow::from_raw is the most appropriate choice.

Thoughts?

Alice
