Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7230C4825B2
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993837; cv=pass; b=b/7ZmQVs5FC/so1gFoAgqgNheDXgK8pGSOczgrepFuF30by9JonArUqudmqHxB0fNmmOgy5ItGZB3BvaUzYFaTRLpWoSIHUvqwq1XZj4vFJVFy1idsYaPffPsRqD21FZU9UI71D+uAX7aQOpgaIUpDcWeOhpy+r64Y9k2Z/3Cts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993837; c=relaxed/simple;
	bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCEBP3VchiPBiRFsBXnN6yqQzJAqgzpXnBZdeKwXnBsW5cKqGXaBATWIq7BMSnZzymfCllAAcTlR2SZYt65PViJFzAFyhTQ3B7eX3ghNd/xuwk5vzQaWvLHN+485RfyW4LIoqo1uTm56CGCUBDbqlropW4bEfFKvpEWeoWS9Nj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl0haaP2; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl0haaP2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d67a9ae5bso139700a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 15:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788993826; cv=none;
        d=google.com; s=arc-20260327;
        b=dUSH2aWV29T2dRsf5CWmT4OjiD75NqL9NaiLH95loxi4OcYTb91uDO+LDU8kShyLkD
         3wyVuPUqT11yVbm3z/b3E7h2rd0Ep+8EDsbDd36QxuER0qUaZa1Wp0lcxULvS8aE4TjT
         f8PsbZH1WNWpvKSmQqqY6ZBtaPVIEFcZsT+h+eCjKIHJ2AZdFPdt1dHJyrz3KaOklCEz
         xGa0/cxQEAokOsBDntGPXkCSkYhpbeAsKC0uSBB15dciYEGx4zq4LK/KjnCApcAoJfzs
         BixEtKTcHw3Hvd210110J6ehLN0jnVXFxmB1tuTL7rOcKw40Hk5Q2YPPRYdO+JNvz+ZV
         jZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        fh=vG4bqkI/bPp4wiL+C8hxfZtImWBRy9LfEpeHPe4n8pM=;
        b=UuiJ/DsuolEoDBNquY6tRbkf7OUsRIIOoAA+/fA+0z+pBxmpWXKuGtsoHbJbtIT8q1
         LdVhtlegc4cN15iyK6bwVi3unhCsZx/ty/pq+JCHwTsJLBjrSe+gYkit7xuuW5ya0pqZ
         euMwH2Jywxm0yd6GGm2RPBMKyC7d2OOil76EOpuDmGd2JLpQougRwt/p9T4ffInyYLMa
         05J9xB4LPL4blCW/Yq/0kdtDcE2IZOnqZU7WqyqBwxB0p1AQkr8QGXWo11ut8BrZPkWs
         qwvyAyPJOVHXkPeDDb7HdlFhGN1jqTxRzBfi2/zW4EUuxS5jQMvwf55z2OKCRYPByTew
         8zqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993826; x=1789598626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        b=Dl0haaP2Sh5sDJzrcdE9F7R9ya9UVTGuVZ2/1Ay8ymSpmK0NJblDWlFbWvIycPIYSm
         oqsuJ6c26g7Gd1tZXyow5ymEzOey68Kzqsu8f4CVDZI6GuGRNNJcDttxf5LsqIxU9hsL
         OAiB0z4TZ+TB2aPjD45eaiG2TQ2oREzFakTguSbsAxGLYHTOherjoGcfyXBZdzWJr4e/
         jszKNgkLLpxW7vpw2VdEC8p8VwJRsyZ3tGZ3OhwGHBanK5ffNCencvdoP5V8o2lBuDY5
         MI89bYOUpl6Od15ZD8J1mUoG7Vmuefv7jbHq5KrnDl1vvhFMkXBzmEDcMAQURgD4a1u8
         94mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993826; x=1789598626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        b=Hgia5iX/1Qgdu8n/6ux3oUWGOTKWRPOqvm9BI2vwMMjNewlJ926tULV79b8pQMngFk
         MflQerJQFHWEKVsTHRhDVcyVnpOPJNTsSCmjN2zrDG7voGmqP8Xt7qIiHv8B+K37cKZ4
         xV5SfnuaRB6QTZbj1XTtF5p3FVCxi4sUrk1b49l+juhZxrJju40DnbOdjDFc0zPHfzvV
         evFMpwaRtLmtwMp4t5BtjBA7xMuY3n584/I+t5LvzsCrMlK5DWoTxq23Qs7foWsmKuGw
         V3GKabLpUC7rhByi2Hu86nyu7pS+I31M3JmXg5pSwus/1uy6r8ohADr3bbRdgQ6ps+Cq
         X5cg==
X-Forwarded-Encrypted: i=1; AKwUvBxSlXtKchioUC6sIdEzn7YuOffYLd31LplhUuKmD3rjmWvTbBZztZG5+7Rbqm+awzkoEdbMPW3WNBKFANxNdA==@vger.kernel.org
X-Gm-Message-State: AFuF++n6yCfMD8MhPC28w5hwLY8OgvDcu4aoOggSS6aZSTBouDx85HCW
	RnckkFdE4I5FwX0ngyO5Bu1Qu/njcezowPNJqU/8g5EYLLleD5VklVxFXmX//zg3HHvHwOPVw58
	ODjuB6PxxrcGDnSrTZv4UOZC3BoRGEeE=
X-Gm-Gg: AYBFou1WZA0tNCkGVYjjCYi8d17aWaN0lXV6+czzqKRTjb8J6iv/wEOvNac5ajKr3pY
	qLA1WH4hrBsKhcvWO30YNmc/9uyFagHWQUutgPQLKfjLWFxig4na9+L3mDlT2+qMYReue5Xb8dJ
	cBVUWgC048AFKMFIhK91gbB3uQGyTYP2oJidm37qIh1dS0zW0yEQNkh/m8x1F6r8oANPxPSxy9Q
	I5NaIE8SzobF0RduVZAgrtVi7AY1j8jSphIZy0XjCTPa8qIQWMYAJbnsmAPZQyIMn+zzfkE2FNj
	scdX5Y56OiAd9eGZtZdag3/r8k84YYKMa2ASjsPKimhw1riprk3of/uoOIRdf82NiS6/noYgsu6
	Ptb/VjoFScL/2P9jgJW42W6vHkuxFbNTf+qYnpQH9qOVa3lnDEf2jUbeSQf2bfcteL4OpbH6y/G
	mdWhL48citHbfzJl3ycIPrjyJCtOREe5aiMrMm855zwPTqXP7whSE=
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr30315158a91.3.1788993826465; Wed, 09 Sep 2026
 15:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
In-Reply-To: <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Sep 2026 00:43:33 +0200
X-Gm-Features: AcwNN1Uyn8Ra7gcy_xftoK-U-ANDYC946VFJHbtC8gYw4KcE6ReujmH5Kp4eAgY
Message-ID: <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Paul Moore <paul@paul-moore.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:51=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Looks fine to me, I'm assuming the Rust folks would prefer to take this p=
atch?

Up to you! If usually patches go through your tree, then that is fine;
otherwise, I am happy to take it of course (ideally with an Acked-by).

Thanks!

Cheers,
Miguel
