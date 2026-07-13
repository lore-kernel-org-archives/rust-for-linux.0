Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1222643803C
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951107; cv=pass; b=dMa+qmcHt/X/4tP88P48cpMUbIZUX5MiJ3TJiNyovU8t2Q3c0CHUwFmM9dQ9O33j2c1Zod6d9YwfxIyvchxp50eTBaiLXkvA6m2nvONt0soDRYX8E2zUXJDYHEdM6Gz9MIrL+aAA3Y0PvGOG5KVGEzwspR7iT8fNkHuGgrTKhQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951107; c=relaxed/simple;
	bh=AEzIPjQ4tONnmAeSycA4Zl8y6lQnr56Sy3u0tf5J2eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INbuerRKDUBlJSaTawd0cgfiArect/FFIQDS/H/zxiiWtWAaFPXGR5n64dxmBcfh7mREf4qk7yfmSfLqjopvUD1QytPQA1+zAfVa9jlM2Q7C4r3O+xZtK4wqjOoTsrUp+/ihO4R9oqwZaB3N8MWDPQMv+2T6Qo8Oak0NMPqUlXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvYQ38bS; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvYQ38bS"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso226904a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 06:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783951105; cv=none;
        d=google.com; s=arc-20260327;
        b=fMBdhvvobTs0TPOwO7urqhYSS7ECbqHczfVXdwgP0MS+XKTr4kUhyEbnhkG0hnBX48
         yeljoFz1dUFlHoE2ePnLibS9oDUOCkvyLN/14SFVVvJqhH6MW+TXe+3eqeFN2FaqC5Fj
         TKjEK1XoqtUSp/pT8Zv2jdKnN6Rxr1OsfuPbJSEaNpzuHRalSwoZaoceb/WLjrcwzspt
         Ranyy+ThGIN1Beqq36X6V/4rGQPAYw8tk7/oOxVbgcYSFLJrKnLfRij4q2WfBsJFkKhC
         6gwqRehNyTZ48ZmtufNEHtVafvaLVO5SThzcASxqrduexop5g+q4OHjJ92Ht6+TqPFfP
         hYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AEzIPjQ4tONnmAeSycA4Zl8y6lQnr56Sy3u0tf5J2eU=;
        fh=Ywz5fJ+KWp3FEbLllt/nV4i4IAQvEANucIOdozeBtiE=;
        b=LGkI3zIenPNDgAlRHjuzYK2uG3E/+aCF6FxCMCND4oQXnkhtsgSFw1oQ3HWih3r+gF
         tXa+c/OQeU2J2DLYkjZx9YS8nWZ84LlyQxpsNi6mCn80udx8UEhOwerIbFZUfCJqyZfW
         igbcveOxPywjnHB44DkR0ELTyrtJD9v0UgAFR1wyxrGDaeEV0tFyAavTsOPt4HCoLoli
         qQVkO0lJvcgsnv+RKCK/ERYeVVgisyaos28YnncJhuG5LQv970qpsXuSAWye/CQKkRC3
         +ijPmH/EzfQD2wkoa4PO5VrMXfFlssnEy79O4s//0524D8imwKY/Cd3MFxpuXmXzmXXJ
         +urA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783951105; x=1784555905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AEzIPjQ4tONnmAeSycA4Zl8y6lQnr56Sy3u0tf5J2eU=;
        b=pvYQ38bS5izAb2wG43KIw1P5UZYxb9ft7hJA7sXGuPIk+dz86Pb8VD9ECUgHy+1mla
         d5j9N26TSt7b4oYsqANI0Mc/qtliamFi983eHgT0vJPctREasIMkOgCRGhGHJRfuXY+D
         /6nZCYJdRiNqHZBvgEoZyraCJbtazyb+hb03mnbKxg0EVVic5gtoOzCGrG9spdRd6AM6
         S47eg9rK9IRsythVWjFWxF2PInkXXhuBVJ+1y0zsO61H4ANJ5y23tRP1hMcpBhTyPvqj
         egFmm8XSRWiHIoWUpQsEKEW5yLs7/dx3DlCJQtohvCftiwDJF7DWG/o+6JyRTHV23S0X
         KZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951105; x=1784555905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEzIPjQ4tONnmAeSycA4Zl8y6lQnr56Sy3u0tf5J2eU=;
        b=E9NSC+hrdRJ2v2rSfw7u832PNQEEIVqnzY/5Xe2UKus+R79omVOaAwi5PGd4rBGOKQ
         JFjjf7spzbcC7o82QvxoN95ZkdnIZXmPDt1VIfjtsgPhp0VWarWD/6xPJJpEfC2HtZH4
         BD6YNIQDV3FyjVyXpjKMZ4V5evLIHHjEK87FICxvB84cjxP1PM3hh3jzS+wTGbR5W9ft
         fwv044/gyAIfeDC5PSTfCDxIGIZxHWWuuJoBlOFHmIz9NNPKRyibCDEhE9z06y4mkeEX
         rHzS+tYKEw4lWqGXhRY+s/h32Afqv7zgG2TOynwoGmr7doGL1k1HIrrZBFdS/S3OWgGn
         SDFg==
X-Forwarded-Encrypted: i=1; AHgh+RqBbkVgl/q2cjHebiaTchPdM3ADIkb2/eexBnzkbSnfxx9rXmZVEsX/ztFnTR+G9mcRh2Y7DiMgvhqOaoHsCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtHfwqPKT/mQnROVRvryGLd+CfMHzamSSAZuJHw4V1kVo4C8L
	+nOw1ptp6LMu6RtQHmQRDF9moaX3jYJrcrX9Wn4/0kBdMxdYmmlqCeBaDpHtkymG+RchR3ZumJ/
	az/WFZUtrHa8vXUWqDavBegXIpaDTkno=
X-Gm-Gg: AfdE7cmsc2gaTmGJiZQX9Kl7qk2PAnMZx7znY4I378WRiewDu1QCYL18l1VSrT0gvkN
	wRjT1frdthXlgePOs7pknlJ+YmDSMfcXn81IU7/10MjP4dhVstX6BBxW+wC2u2/G4a/x4g8OfGP
	je4DWHq1MglMgw/fte7ZDfmXq0/1SVBfWrRg+AZ8gvwCjKWy8RfPe593lLlqnLzcsnFckocgDgA
	Vw5DixH1exbYrDGo51yccMZPTrToy0vcDbSZfjz78xdGJZy8P0BLji0wsUx2fYD9KWPAcFQScFv
	orNVXF+H9H9I+M1gUReBNLu5dObKkHVlTf4dv1nLwWAw0hs5wWjH8/q6GEXnM1kK8d9290ZF7lP
	akp+yTIYVThoj
X-Received: by 2002:a17:90b:2685:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-38dc781f3d7mr7088440a91.1.1783951105371; Mon, 13 Jul 2026
 06:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-rust-reverse-randstruct-dep-v3-1-e4e09c50014e@kernel.org>
 <7cdb2407-924c-44a1-8c68-917efadd4e92@sirena.org.uk> <DJXHTB615I2J.POTXT6L2LM5K@garyguo.net>
In-Reply-To: <DJXHTB615I2J.POTXT6L2LM5K@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jul 2026 15:58:11 +0200
X-Gm-Features: AUfX_mwVZ0NryDxFqhvpTqzVNlCtwM7HgnYa0pfBRDhjq9-oYDqBTVV0BB9Vf7I
Message-ID: <CANiq72kNYRBW88VwYyDX8_2b1L7dLv_gDwgE5SruMELR7KPmig@mail.gmail.com>
Subject: Re: [PATCH v3] hardening: Default randstruct off with rust for better
 allmodconfig support
To: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 3:55=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I thought Miguel wants to add support to properly support RANDSTRUCT with=
 Clang?

I am happy either way, i.e. whatever the hardening folks prefer, but
regardless of what we do, I think recovering the linux-next coverage
is a high priority at the moment.

Cheers,
Miguel
