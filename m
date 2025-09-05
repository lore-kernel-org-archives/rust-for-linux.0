Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6D353343
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079658; cv=none; b=NpAAvk/TSLpMalOwdvcmQRI2AEdYfhmcIxS7QnFeXz1ZbhrAify6STpr+g2J1JBN3mh/duOM+BOah2PmbAW0sE/nOTHxsWX+LNWcy8RoyPMcjNBkCse2Mi7lajSjxosTDWNJteElRq4eYIQopdhXMiQz9flRTQ2D29WcKZ1Ij2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079658; c=relaxed/simple;
	bh=voOmW3RsbWCewMWd2r+Mg3J40TZ8+mXmnPEOSB0HzG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvLogqcFdPqErrQbaqonDDDCk5rd91cLqQWbKfo5RrVwinkDDOAofrm0zdutKAYqHz6DBBeH+UPe+HNK/Q51vQ0WORK7MhXKBX/ebcgskrZI3b/sFMTHCyAmBgprkOsVjHYlLEvLBowCcb0Ur97wOjOW/sXf3XD2XmvB76vNiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyupn+QJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyupn+QJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so11708105e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079655; x=1757684455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLbhypj/XaQGR3EoITdFfKg7Bji/N7jJGeDDXFKfJiI=;
        b=lyupn+QJbMiq4zxIhMMVJA353p2sybirTzEFCo+gVHdmcgT+f3CTfeH3S8LxtpvCHs
         0+aZqsYEyLwv+YFAd9UFu181F3gAmwbBCxl7zxXJKvekDyrggKx2h+OhQvNFvAZ/WIrs
         fPGYVcVmVFhuc2oEueym5ARs8vROYWzD5oBOlZu+KVAp1XUbru9xuvBdKLmDUBr8orNH
         dSCbrdHEm+7upkam9SKM2w2FhLDK7ZVQuAvqTbgpF+lM9BW2zCnNJ+C2pI+Yapmal2xn
         syPD+gdw4omAbeIn1edYqeqO1ZSmBzeu/EBPT1nPju2sFSV9CemP5K81S00Vtn72WcoI
         ywZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079655; x=1757684455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLbhypj/XaQGR3EoITdFfKg7Bji/N7jJGeDDXFKfJiI=;
        b=vIMsEe9Uv7uDN2+N3gAXNm76h2kTK1W46586wvqDWwKBynJBcuNd9F+j6lARXSOljx
         GA6LXUgNN1/V8yEa4eVCO7BJiZchMj7Kd6u6DfA71Ew7ZlJST0Mjf5L0MitwWDZA56MK
         nAEiD+D1WXj1UTIB6K5CVBoohO1Xz9y2uoVRu8B6FMQZxjZhRe9tnoPlKtHRz8G5wcsd
         B/5wwSpjrpG9T/uHgBMH5INvUBZT6OhhC1dNVnGpiBaCzIQDxL6VdjlT5rzNLC6DUbe8
         +Vs120e+bSirVnAgpRQgAerS1sYxkJslhSgYmdKzUA5y2t7JbGPhbc1GgbGrqvghSIyn
         /frw==
X-Forwarded-Encrypted: i=1; AJvYcCXtm0YJz1Dbk9agx0feqg1rmL0LKqNuOwYkeYXcG7w1U0XIJWTL2zlTOgBb8a8zG2q+P/faBIz/29SgrYXZqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1w3JdKI0NK/Uq+6gK7DNgRaeVL6N/PS82/8VZYQoZtRt6atn
	K9GvPxABCUPNdW+fAQRDLP8sY9UDgK19C5erDG7rNMAZ8cO/pSyAhvuVLQM3+eTp6TXPITa8MsC
	G5VAYEwPRzuVSfjYr9fMzWZyJ7PIXZlbPL7KfEfAb
X-Gm-Gg: ASbGnct4tRVrwbwOQN4r2gHHmn1JC7xoStnNavFs8TlA8s93NLzkBp7691TsD9SU4yJ
	R/NvC85Agu3IE91pSVVJYC/1BrQONsTvVRCpj5HmTLXeJm1s1LXj8T3gFZgr97+q1frv8G2ri0t
	gcEJPYBemuh4+5nqtcw7RdSImr61qK5Ta6UbbubgNAoLS5HijopMCGzjmRuDOCQ6/SXXIoyovDQ
	9ZOaHpZe35jyNw2Qv3wqiavMh79BzO2ZCgP/lufyDuZvlGi+N/BD/kb9ETd5LSXYocMk9M1YN/4
X-Google-Smtp-Source: AGHT+IEE8xO/KRFQuhi+RnL+UVzSRNYl1mvi1FQz4z8HtUo3MeJ8h9Cv5q4pPdBWC/rV1bprpoRNO+upVHUwkCD/bms=
X-Received: by 2002:a05:600c:a107:b0:45d:cfd0:55a2 with SMTP id
 5b1f17b1804b1-45dd5b30b2emr23719205e9.5.1757079654731; Fri, 05 Sep 2025
 06:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905133401.3312707-1-lossin@kernel.org> <20250905133401.3312707-3-lossin@kernel.org>
In-Reply-To: <20250905133401.3312707-3-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 15:40:42 +0200
X-Gm-Features: Ac12FXzp-hxMnPrbay2SNTSIFeZcHR9SPtkB0WwNY1bsCkUYOWnnCCqhah1QSHA
Message-ID: <CAH5fLghuF=EM-F8vzs+AzNrXzHEVE8i7_ZMW1SpJCZ96Ao3HkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: pin-init: README: add information banner on the
 rename to `pin-init`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 3:34=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/81/commits/3cf4658e=
2db96b4a6b26db9478250de2ffcfa1fe
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/README.md | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
> index a4c01a8d78b2..723e275445d4 100644
> --- a/rust/pin-init/README.md
> +++ b/rust/pin-init/README.md
> @@ -6,6 +6,18 @@
>  ![GitHub Workflow Status](https://img.shields.io/github/actions/workflow=
/status/Rust-for-Linux/pin-init/test.yml)
>  # `pin-init`
>
> +> [!NOTE]
> +>
> +> This crate was originally named [`pinned-init`], but the migration to
> +> `pin-init` is not yet complete. The `legcay` branch contains the curre=
nt

typo
