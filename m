Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F843FE674
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731385; cv=pass; b=eME31Le0zFM39bvu7jCmoOnKI8D9/3WOoCQjt6x7ROpoRGfK9Qv0LL4nYak8EFD9LGs7kdDtodyW0C9/dtkwJwAWgag+HyuvHxFyOfODQ8zM1MeSBwFoOKLyVq2uxZ5nK63ZRIpi8X3TCdR8lxT09Bp7YFjAlZ45zpqlxsSwYhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731385; c=relaxed/simple;
	bh=py9B5accco/thyjWkEedZD3OS7UlmqMbMYkKNGFZ8BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVV/2UVxfv8WtDrtjYhjuLz9SXOqyMnT+l3LoPYc6S2MylUuXV8SjPtfbyKKoT4sR3wCp7sU07LtFpj9XrWafHt3aYwL184G/NDhU//O05QBszY+HhHFhF4vwQrflnDf62tO8wpcMNFHNXaVD6QKlPgYXkEzqTZt1ospaioNx9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+vWCBQU; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+vWCBQU"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bb87c90deso374324eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 04:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782731384; cv=none;
        d=google.com; s=arc-20260327;
        b=UXBRBAOtmUwDnWy4cL6b162wqQSOkyE3J5Keonpxha5ofBewF9WNRo8FhPbX/DTWu9
         vtP6XYNBA0q6LhUkoJP1476tBoCNovVOEv5XmovTExCd4qvJwL6rRpxDXMdvUjrXICI9
         mUgeH7Re63rAC6tu2vB4i6dzckFWSk1sFhSnKDNvU1JnYSmK7qdOg9exHyLOZbUDG9lY
         odzBrbWLaho7H5S0Q20zyR9uUMRkAylruJZGUwPhRqnFvk6pnNPbYY6pTBFxbzBOkwDG
         nLhjMt0aklmZEOOGSJBdZ/ikQG9CXiuhQUm6Q5Oosw74aYLLAuJPUjB12kAakPuRc+F6
         aW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5Bg//wVpgZ3o88HsuMkHRByvtJq9hdlSqcfr11qWuU=;
        fh=3BzhOUsjJhKsChSCuxzwxIKIY560uK2BCpdpVNKjSrE=;
        b=XtdrtNGjjdnkk2AAc2pD9o98xDisGUuytCUSPQaRNUFK1O3SmngQuHjwUNtV2mpj9t
         3K32reOx+sKb8dVD7dtIa8H7tvWqcBvIbtXc7OsaCRI5Fv+uOE4FTHHP2wiPECFlxVsd
         eAj0yin1n8KtJ6n/3u6sP9NhAZvconqzpFTeC0MHuIOZZQf0QpOI+HOT9Rbn2mZOG35c
         86GeT040iWBFBaOechmSmzDjBRDmmgPq6YlbtI8w2PhntNOKzrufq6quybvK/ieJAch0
         46G4sjDHLiewNaTUoQGceV5iL7W2D4niTEXSZz9OkpbCpsrBOkJ/Fuoz8ohd2MbUXCUE
         q5tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782731384; x=1783336184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5Bg//wVpgZ3o88HsuMkHRByvtJq9hdlSqcfr11qWuU=;
        b=A+vWCBQU6pp/AX0oXtJlBmBnkHk12b2g2jviBZcXrI3h0+3NESIQuTUV8p72m7hYuW
         PQ4Pg9OQ2/LPjxl5HQTwQfmI6XW490QWg74ArrjbrUXgaN45uDgdRSweQcCq50Khlle1
         YQLjJi6no5ylesaTeEmRbsAGEmcLxaG1okLiJcOi/+Cejj9tIBrKNa+uKlY0opJpho7V
         Iw/keBUiRyTIDclS+Cyc6E8xwZVH3C8ysIYbfXQpiFUDiRmwEYNC7D5rk+hFG373Ezz5
         IvWP8O71e6dfBqklQ+TnTSwEeJ+6FWGvLIDSTgikwIj8Dw8VYKHJme15uqqIn0wlKC2G
         thCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731384; x=1783336184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5Bg//wVpgZ3o88HsuMkHRByvtJq9hdlSqcfr11qWuU=;
        b=mCHE5dS0miwvSttXWucBke63obvVfPRHuqeYACb72n3wyfiyGSOCfQ0eOFNAHiNmCU
         /yvXdThdtg7OuGSnDmD1aVquneo48HWl5FyICPvGvDitDmjQBZ68eQoXJ9g83otAQetQ
         M7nnHaciU6rI0aw+ZH5THRMyxGuOGMyOdM0rBJkFVfPLb9U2VedRum6zTOTDyGyatpLt
         B2dmLUNUC6ehbi9H3fRN2JKf6ERflGrWqMvUYAtgfhoIaRcZoeqQolSCnzpeUgZFvxiL
         +MBosfytAZrUMd+co+jRpjfDn5MuEreUoehGINfdGzdB8iAzHbXXJWVEoZumfBQ5h+AG
         JGPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHX8VAtMtTFjNRC+WCkKqrHvCJNBBVS4/cL8OddsdAl/CkAZebEj79beTdbBwEDid+VvHlBI/2u9FIXOoPAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmUtXCMB9wH0xGIVY2DeXq70rSrpZZMlQxnXL7eDWnfDuJXc2
	Mp6+lyCfJa98AYBele1hvFKbUSl0sBTKA6LT7jY7tpwCuwQQQwdePZRQB4h/9sUD4qP94zcCKbr
	JzwURkqE9oafvSZTB5JhrH6MoXFPgSJ4=
X-Gm-Gg: AfdE7cnA60z9KTbzphrfHVAJh14HPlx6OM/biAoXyv9pn0t/4WLQB8akLqBdN9DFKTh
	DAztLDbBbwgEJlJoOSEYuODPXs1ONtXZsQJ/3+npTq4SJ3bvX+o27BvoP732UQS3s1VupqCokB9
	NpXqBLZh4wBPtcMEqPdk69T9CZE8LVKF+MnV4BZsDQq9ist4Jg23jd41UAzbMTgpS8Rr+zYlsb8
	fXuPsGy7BJoXxtcIjmDBGcQWZkmyvMH/yr9TBQRHuCF33vPyN4uCg3GVq5QPCfjhvaY5Pf3zMOi
	dY1Dpqq681ojGoFtKv7IBCH+n6FO40QxJF8lDxTRYhD0+r7EVaWsqo2tfZieNZbmLJEPdeUPPVn
	WHtdxRzWBrpVu
X-Received: by 2002:a05:7300:8609:b0:30c:b42d:47d4 with SMTP id
 5a478bee46e88-30cb42d4aa6mr4017286eec.3.1782731383800; Mon, 29 Jun 2026
 04:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143225.471756-1-ojeda@kernel.org> <CANiq72=QWC2XXbf7Pf80c8FcGjV16Jyzgm7Yt5S5aEBxpgWX=A@mail.gmail.com>
In-Reply-To: <CANiq72=QWC2XXbf7Pf80c8FcGjV16Jyzgm7Yt5S5aEBxpgWX=A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 13:09:30 +0200
X-Gm-Features: AVVi8CeQ72lJRMDTDBhqujhOZjNokkqKm_yKMOBn5DRee4qRVbyIayOf1EOjpZo
Message-ID: <CANiq72nVzfgb-Zm6RvwCqXNDzFhBwxUa6j7jW9OOvPr=qu-dCw@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint
 for Rust >= 1.98
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-fixes` -- thanks everyone!
>
> The PR got merged upstream a couple days ago and is now triggering
> with the latest couple Rust nightlies.

By the way, added:

  Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Cheers,
Miguel
