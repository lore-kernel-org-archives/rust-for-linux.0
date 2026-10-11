Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD2388E62
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711619; cv=pass; b=sgKCfJ3u39gH2LnTr3xDCX0ISlUsjGp8DEPEon90cppCqPEvleS8Q5TvJqeKqYvO6yFWGSvheNwTmv1eX3pEOYz7Grjd4wdtxoRIHljyxstlUqJW691nowcUAkW7w9wJYz0Uzp2s+YUDeniyCLYI4ARIj1VQYduYK1v7oc/h7S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711619; c=relaxed/simple;
	bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT/0rxfflq/QrSquj2SG2UUkoDD2r0ZdnwXq52zj3o5dmIyOT95QGMm87CUyXZ5sz5aHwHEu0HgF9vcHJh8uV+f7P55HXEQKMulIfQS0d9MDEjaXhTnBGKjCnpolVqFf4hy96K5or3h9Cjyo8t7zRkZ2VapT/TLVQU+1SVDLthU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHylWetS; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHylWetS"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3584f70a5aaso100570eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 02:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791711616; cv=none;
        d=google.com; s=arc-20260327;
        b=n26BKGUrt3mtOwn+NV9i9pQlonhcxjILwX5zpcokx0ZV1smmxX3cg1MkxBQYFDcQUM
         bYFTL55ZVoNH+GTK7JzU2D8cwYO5pXaoynS+h8cy0YC1d2wJORgQGnHHDLVReZA5hgAd
         IWhRrZstTiXKL6x/q/QltkAl/wL2sV4tvOPFFPYrrDZbvDGyuayaT219+NUQb+ftUAn3
         rim+E2W6MPbhdMAlVrNX0Dj3P1KsNs7IeIZ1YiqTTiqXvzZwIfB2Ao+jpYCw7ivWMiBf
         QQwEpscMJ1EPWry44E223VxIX7I81VbZNRg05PDsUYEOTi2Sjzj0l9aahAqDPOD9bQ4/
         JIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        fh=SpCiOScq4iXdO9DRJ+ttqprwmSh+v0Xq+hBEu36tK8Q=;
        b=l5jKhIEBnWxrUlBO/ANtt2b8B2i9c/OPZI22C7LJgmScJbZpJp9RooOGyvAlcXZnYi
         7srpoKTl+k03aE9MYuS3pYXw0gwzZEwLAxM2njEbDHr9sy9S40/GtCkMeTqztFIJDhwy
         1zn8d26TsdcavBOMEjJMFgKOSXzbQ4dSXKjHqZCfEyLzGSzRLEj09Y0JJ0MgaDpb364m
         ICBpPXD+qxZWAAowwtPwNeGkVzNZnwT39HxJGLdnVeW56cWM/k/CrSUXevcKud3+LPVa
         PvVeOjtQ5s2hZ9o56QzO70+xPmWoeHmw7rI6uawkhrjK1tye1MQH3EFZUa/wYoryWqx9
         fBZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711616; x=1792316416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        b=XHylWetSXCE1w8vC5w6tbwMwik3UaWYf+IsuKlM8O/qEyoqRnlr7gnVq6xawQFGkc6
         VQCJei/jXiSgqb+z6ow69PTQiIQKCMbJ5vGax5nK5NwEg6/C+QdN5B5RY0mRplieBMq2
         U9T/o3kPS/6rP0/lONYTFyhKZIWsgWMO3R40A8m672ZNWSSe/5YQmBuGwB6HOn6NGD4u
         QEGfJUFaycxYjCzZ1AayaGSOkiZfGKrl/UyorzxtcNpIE1ve6f6f5JcWTVwdor8byY/q
         YdKJYASsEIe/kfUxdToVZWXmQeH4mxKDNYW9aStlu4yFqP1b0zD8DVtiOYUPayy+BfmW
         740g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711616; x=1792316416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        b=ptKBOZMjpaQnwD9X8qj7cJHPVYE+5kJ87onqau5aCWUb5Nyw3dqPiIkufkXWwUjNYO
         RXY7hthFwZvpueFNZI0jk5uUnDOnM/VV5mi+Iz9TaNVuvv0/zjL49EcszWsM2NBIDm5f
         8RyuZUMHxsOC6dMsy7atTNJMJQoXuouD3HKx4Y0kXCZ97qGKpVjbtGLjDPaomuJp5N3R
         XMSJMM1iVU+r314czvHFI4d2cHDUZoi3TYIBLdJkAQcNvFSv1AoMvPBfGes8zrmoqfY9
         EgrxlTMEL9Uz4zZt25JaSV36NjXqc8S92tiRMcqIGBaxbyDjCPo2PGJQvJ7qlojRiTj3
         slkw==
X-Forwarded-Encrypted: i=1; AKwUvBxNGo4vz9hRZW1NIqJLSeaj1pPe0PJpFKAbYy32cjZaSrairKXsq2Oz5IerP5PkegVbYAbCZLiKJV0PHsMz1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLux/Ij1v3/NOLrkxLq0s6n2ErcCbFFYduz+gW1OoButHXvyIAU
	NfLFd7topgce6JbpCs3DubjjX8FzKGXfpWkJDOqnD5ZylNJrKA/KTg1bu6mKXCDowZKNxuZkbdt
	QlKOe7IP2q5Dbc/Xa73TgjYjPO+VFFIc=
X-Gm-Gg: AYBFou1YygEFF2QAFGA5JjSkCFXmTPOgF9w2FRKxtKnsL9HS+sf9qIcThN0cmON72lL
	20HVBQKFv+iYMNUzE4tTlVsr53T6E6bEuFNsYWtyFMJ3nSYHqH+7EpenkPrrEe2z0XiOWWdlb8b
	mLzIDxwdqU4IXsp1P+ryAJN9IsQ1rSvyADq5Xlv8nnq5WgPeWqdje6IraOP/CLAEjHweT4N7gEQ
	7ZhIs4kul314XFkh/NEmtKZ9ijylb0G/UHsVazTD2XE0/WEva3lEHoWDLv9IhPaE/mhUnuWiMH7
	nq3aMT/DstL4gNUza0Op+MeYKDLkp7lHMT76al2SEKtf+//ZBZmNjnwyKo/9MEynfRlszNqGY8m
	mXZwndzBfvqcUTtw98VdYfSHv7d49OOdfGK5O7k83RhO/mpqHR8s7vxe8e4FhMEQBVDZxViABAs
	qe0g35ue/pBKAqAliHldomfCay0/VW/NgDOD9d6Mkk/53Zh8o6Xis=
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr17725542eec.1.1791711615924; Sun, 11 Oct 2026
 02:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net> <20261008-dev-selfref-v2-1-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-1-e280b3c8fba5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 11:40:03 +0200
X-Gm-Features: AclHuK9QyawQ4Xsrr5oApYDgMaQgs8poCwEfL055p9grzyMuKeCNGvafhrR8JLg
Message-ID: <CANiq72n-gTQ24Kr9oMfYxk=s==LtXdwSE349x3dM7YvOuywgBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] kbuild: rust: allow `clippy::comparison_chain` globally
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:12=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> The lint would suggest comparison chains to be converted to match on
> `Ordering` instead. The suggestions do not always produce more readable
> code, and also it can produce false-positive when not all ordering has a
> branch.
>
> The issue is known upstream and thus it has been downgraded from style
> lints to pedantic lints, which makes it allow-by-default since Rust 1.87.=
0.
> The current kernel MSRV is 1.85.0, and thus the lint still triggers; allo=
w
> it globally to match the updated upstream behaviour.
>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

A couple links for context:

Link: https://rust-lang.zulipchat.com/#narrow/channel/257328-clippy/topic/d=
emote.20some.20lints.20to.20.60pedantic.60
Link: https://rust-lang.github.io/rust-clippy/master/#comparison_chain

Cheers,
Miguel
