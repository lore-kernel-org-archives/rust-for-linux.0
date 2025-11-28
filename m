Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3FC28BA83
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764320983; cv=none; b=IavK+ckcK/OGKmhXtLGG87azhZOqAn9YhrfHWaFHmhcoyW3JkKOZBfwycTeQkNLb5If2YRMeRXx1u/c0KkbMuoP5gEYgARRn0Sv6y9F+618oz+8hzx6mvEEMyxODCUewqUIR6+xK/ILwq/L3xtECCleiHTb+U4Zv44N20OtNg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764320983; c=relaxed/simple;
	bh=7fJOcVesKozHIidrxpCYG48n35OnBmqP+4dhiYS6OgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRDqGxHScTtVs5eW78cMXREs9juc+qVT1A5Yvz0WpazY8sR24+xqxGAEW/JgZlPtc3m5PB7TLPQ5G20Lf1Krh+jwFSDWGPDlQEdNARyHcohyDA3558sEw19iAyG2zpXTt4VS1FghsQyMYomxxvE1EngUBQcdezmtbPj1mFJh8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ah8ivA2M; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ah8ivA2M"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1374405f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 01:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764320980; x=1764925780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fro7LhHzQTP24XU7PrBMIKHOilb0+6w3Zx5OO7LAhuY=;
        b=ah8ivA2M/R2WTL/LkFzBYpJWGDiZ+t/tDzzIwDx5/SqsQGcp4KTwNKAzMekMAhojTo
         qfRimQGv+k0LZgD7I3GStUFgmE3bitlcCJx7rGjdc4ZAFurqQrOxIjNaGwDIp/qhLXuj
         yllxVI4FYr3O07bsSaBv0FZH32u+asOhB0VnzOkpCMBsuqw+G5kk3Mgvt80hYqQL5ABB
         bWEFhDNo5pmMXuyzzCpFgKV89c4PLBp6W0J6s7TGjUR/UEkCA2cnfuoKJXWZFADWMGPj
         v8PzpWcwsodlKuJLFqpMDCAVzQsSlbmZLiGhPJFUimX8RX6jxdhkbA3+mcr0vDyhu/Db
         vkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764320980; x=1764925780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fro7LhHzQTP24XU7PrBMIKHOilb0+6w3Zx5OO7LAhuY=;
        b=qNbt6WVO1hplhSUH3sNnO100nkeQT7iLthlpDzcLOb0UQ+Q+Whs1J/l3D7yJq/YA6r
         wkHxwp8e9Ji7YSvXJ50hX3ZC3GlZ429jsRs6nYWBAQutYM95K1m9zQECSLGs/HA5kG4H
         5UKOvi4DQmLgGHc5Squz0NQEmwk96YsPl8Z51eDXbUZT/Jdbmxm+ihkQwaaSjAfevGwb
         y3JMY+oixRqrudys5rVnJWOqqrP/lTQaAEFps4gfYYIWbIDaQ3r0nKXYSOspMd9sYRKW
         ZnJebiNLdjmMPd9mg0VwvzTNeaiEpCjLATsEcNmgL5if7Y7esguPAvAFBPrg2pQ2QI2o
         STYg==
X-Forwarded-Encrypted: i=1; AJvYcCWCctpAPne6G8NLPl+JcQb3ZGtIwDNVilyeTDn3RzVA0cCFHWJommtCDFgirqDGW3/9kbzE7z2lnO2Djg/mNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXUjv7DpW7t+j5/XV/nxso5IePstbsltDnAIIUyd5io+YJFIYv
	RCnobYPyVhMgY8Dx0BKxk8FCJShTP52jAHKqmRIztA/CpSsi9CN7b6N+ya7W/+DEbwiOwLRI0Em
	tQJX2BhQpLWZPiKnr1G1C/1AiY/ZJbAxioiuIJgxWwuYsfuC+rnhch6ReL88=
X-Gm-Gg: ASbGnct3ew6h8SaDXBDavNEUA3GAhrzCXI5jIXe8Fh1cFg+pCHCdGMu87mOQilf2tON
	9eSg6VB+D4GW3ga/BCl5ZhfP4TZ65M78pm9XxN0suA6D46/Yf59ByFCHadsVYx3DKP6oalOLBgL
	FWxc2zF1GK9PiMjT+P+9MNyh5hY5U/pFAEtpOc87lydQKMKSkR13dM0vE11fDQlh/vMG/clAN+I
	NxtBgcaJgLnuJH9klsZnIzwg4dVXXHzNo03BpHs7d1ZA2aRDbOokw25wQG+S7AjuMtmf28P65Uz
	swoVPkjNA3xBf8IbNIhHikjRcQ==
X-Google-Smtp-Source: AGHT+IG3J6z7iTqHl9DYt2o/y6fr8HZKW4SvHwftyKtdXX33EgMmRaxOV8LdYchd0b8uG0/9DNfKIjmDEU4GH+QPW5I=
X-Received: by 2002:a05:6000:228a:b0:429:cc39:99c0 with SMTP id
 ffacd0b85a97d-42cc12f1bddmr32385655f8f.1.1764320980101; Fri, 28 Nov 2025
 01:09:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aShM9CAyRPe2gYpK@fedora> <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
 <aShdutWrmU2q7gUT@fedora> <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
 <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
 <aSkzK4QDU6pN2GMS@fedora> <DEK4NFX9KS3U.38DNRG7ZMSZQJ@nvidia.com>
In-Reply-To: <DEK4NFX9KS3U.38DNRG7ZMSZQJ@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Nov 2025 10:09:28 +0100
X-Gm-Features: AWmQ_blVlaA_qa9EnUUYv56AEQdH4huCl5cYZLxn3pd9-gQUWOGQ5q-409Lhxzg
Message-ID: <CAH5fLggsmNd=3ezgK5A1k3YnO6ZHbJRhb0jsO0sR+ERChrewUw@mail.gmail.com>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize overflow
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Shephard <bshephar@bne-home.net>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	dakr@kernel.org, airlied@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 7:51=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Nov 28, 2025 at 2:29 PM JST, Brendan Shephard wrote:
> > On Fri, Nov 28, 2025 at 03:12:13AM +0100, Miguel Ojeda wrote:
> >> On Fri, Nov 28, 2025 at 1:29=E2=80=AFAM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
> >> >
> >> > Ah, indeed. In that case, can we make the if arms symmetric:
> >> >
> >> >     if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
> >> >         Some(sum & PAGE_MASK);
> >> >     } else {
> >> >         None
> >> >     }
> >>
> >> Early return style makes the happy path less indented and is more
> >> consistent with the C side. However, here the happy case would be the
> >> indented case, so `let else` would be better:
> >>
> >>     let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) else {
> >>         return None;
> >>     };
> >>
> >>     Some(sum & PAGE_MASK)
> >>
> >> Cheers,
> >> Miguel
> >>
> >
> > A wildcard entrant to this conversation. We could do a match instead if
> > you all might prefer that?
> >
> > match addr.checked_add(PAGE_SIZE - 1) {
> >   Some(v) =3D> Some(v & PAGE_MASK),
> >   None =3D> None,
> > }
>
> Clippy will likely suggest to turn this into an `if { } else { }`, which
> puts us back to where we come from. Miguel's suggestion of returning
> early in the failure path looks good to me as well.

How about using the question mark operator?

Some(addr.checked_add(PAGE_SIZE - 1)? & PAGE_MASK)
