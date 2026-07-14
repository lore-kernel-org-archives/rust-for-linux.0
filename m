Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3C418A38
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056317; cv=pass; b=mpn589wSJQnhaFIlwF2VgOA8LzzRbZ1ja8ZXCqiL4b4bFG/UpBoPXRUkinulzsVS4h32ogr/FWENYgTyLIFkpbjD2FJUhaGY0/FBfsxtL0vfJqrOw+g6rznOUUjScnTJeDYHO74Hd2N0tR18w/Rbk7wvZ75He2qnDK4rHR7OWE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056317; c=relaxed/simple;
	bh=Yi73BiN3ijNx3l7DwTynvqe36yS0esoDlO6LV48FWwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbBU7KbutRKT/IJyBNkIXSNdoQwerzjSWtTzolpQ76btIQAonA03JJVOgfLed8uUqz4qFzfUd/vWta3seSLAcLQGprh09nkwAUHjy3XdWgGYbLgfKBkL5y4u1jtub3gi+HYzJM86fsZfTmWZnEOBPC2hoG6JywKdjSVRo/4b5NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgYfPmDY; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgYfPmDY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso407115a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784056313; cv=none;
        d=google.com; s=arc-20260327;
        b=KfPAerr2LkDH04r4Un2d9oMJaYK2boBSPzDNgPt40Z6ZVSj+6bfXsVbp5kpwShp/3q
         OrD6nLMjWyA/2bVZ42BIn+izlfTlcGGg7Q1QFP17ePkEAtRfKIKDhawNIbd5eOx2/37x
         0OY1CqWdeQj9P0kKUneWfPhLWnAZ4HWzealjr0KF98e51l5dyAKcVa8dcgEH78ccn5al
         qMSRixzOod+cTYqeIIM0LvXvk9N123xCTD9AisRCar+1QmIsFFaSofmyTiPsI9PN+BZe
         1+Ww7Lr+KDxlkaSMgy9bbDG6QkO8VJsrTFxnCPyzz1yyv0go+GKXMSJWwqf9YuX1AO/9
         +7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yi73BiN3ijNx3l7DwTynvqe36yS0esoDlO6LV48FWwg=;
        fh=bu7yY3zNiz31UZkIEqi/O5u+AyzITqwyFpVPUNzz5xQ=;
        b=Tv89hzKV971g2itXW5V0McUsasahRI5msvsBkxKoJKbwmUAvzFoTYxtAcUFwZA+A5E
         4c/sHWmlsq6wd4SWZXmjF52ZILa7gTCdUa87Tqz4LjOqS6HmTHUsMVE+vnWfxuAFBhah
         lBZukmKanStzLIKvJl2ajZEqev8vi3ZYMUzZW8AWosDxD9AC82YogFzG1MOWLSIpXNtl
         HXK8kjrgrwoTwkFmRzInmfUFd8oE6RXYZtPy/aENSTg5fOS1yH6XjDu8cYMby6v0N1pu
         qFkD7wCZlXWyHdIQ5R2kgGqwwaMRuyLZs3/mHAgoxYxSxIu9JUqDC2uKfmOVU7z/j5wD
         sC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056313; x=1784661113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi73BiN3ijNx3l7DwTynvqe36yS0esoDlO6LV48FWwg=;
        b=RgYfPmDY63xeHqRsIf8qyFQO0XVWLxNIm/WSrR26lFGTz351oWo0k5zLFK1MZ9Ugkr
         j7c7cIwkJwFQyAL4icWBvNfsN2gHS4Oa8epmVxlbHDXZ84bUOcr/J8yXp5HKilibl7mA
         /i04+lTl5bh7DVwXdJSlCMQDG3HCYA1kSqtx17dQEmHdWUM5KMK2OVSU21ulDqZ5LV6y
         FaO6ijN5KISVHKXQJcnKRdysaa9oDPfDLr8JH8J3weRjDaihO5tQhYmy3lvFbpNLJ9tc
         HGKRUJ7HnOc5MbDFcrMBT78+P+D8OvvsuanTblRJ3G5vI8lJIjPLAY+LTfGWwZKVJwrc
         Wk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056313; x=1784661113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi73BiN3ijNx3l7DwTynvqe36yS0esoDlO6LV48FWwg=;
        b=ePueInfBuBo7DCohUoTTtu6Nr5LVSJ4A24sSsOtjQf/GsEufWam7gZdsY8rfMkUGju
         BTCMLssOENWCR7kaJ2dFvqYyGk68V+d1vK6gY5DKouLOgoIUsrfa+9n76ngsKjqTxsgn
         HDaPFXLNcxjyTTyJqgLTTOX9rpSyxPcSzCYuajOCF1+KyeA9bEl01DP/vOi79kzhG7p8
         5BIM4ogta6zDD2WIOhckerwP/+PZW9KQUNZpn8EjYLd6XxecidRjrqS//bVmQ9Y0QAR7
         TCcG33TpXgb0HMXzAOkPlzTRj5WHkVDGlwAYaARMZo0byP/DUcC2Xw1HzYhBOIbeO+gl
         ikJA==
X-Forwarded-Encrypted: i=1; AHgh+RrHhvo31ycWRxpkbUpEtrXo0f7A9FylPxteQss/AWKpmP1x0QhobuyfFJckA+NGTBseD+HDFhWTWO1J6lieKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+OCU2PP1lkdEMoIddBVgjwBW8iFIvxd+c+rypPZj0/xKF8uS
	sn9lHOGAF3gespan+VXWAQszEIxsnzzL1so96dCSf3c7CYHyfHfvciUml/8i5V069e7sUg+j/gA
	jPy1jDpgY60+JVD0xwo6ArbM4FpzUbYc=
X-Gm-Gg: AfdE7cn6MjabRcvJ+pmAZdbZ+onwU+ORca3SEDqxRN0a3iVV78fBLO6aOcPWRmfripr
	WtBAs3rY8PWoFEL77zg+H2TSQ2vS56LibgX2uwbkBhGMvtK5nV0rqDgUo3K2KDQ86KZA8l3Bltv
	kFrhZYW7AdXlTnWFNH3rjHry/q2dSkAAAGUJbsp3j14RW7Z94sxC7yR4GDGL3c6f6/XdS3tdP1g
	6Q25hKqiOCb8FzAeys2eOu0rkZv4mlRt9alsY27QRxbtqTVshCmMp2fGMVqNf1P0pJP4AocRXfo
	0uBSuuHgA9ZUIi6naAwY5J5Fa8xGEXFbOIuZHpuYLgBE3SoWp2ZjM76aqA92qZXLzGjgX1CSbPx
	aDJ9s/bvcw+GI
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-38dc780f503mr11725640a91.5.1784056312803; Tue, 14 Jul 2026
 12:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
 <CANiq72=aTZitympw7_LKW4PoD71JfLTVt8EiLcjM5F48pCUjWw@mail.gmail.com> <cc22e92456ed6b394f6e49b2cbb5562618f0e182.camel@redhat.com>
In-Reply-To: <cc22e92456ed6b394f6e49b2cbb5562618f0e182.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 21:11:39 +0200
X-Gm-Features: AUfX_mxCi8BPBAQ7HzcYcnuefn0RYWDgg28R6nFMPk3DBPSSxqRnJ2v1xdOaRQ8
Message-ID: <CANiq72=Ytm5aanE24PraTb4C_dX5h2J-6_HZG54Kt+CLajdogQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: improve `Arc` documentation links
To: lyude@redhat.com
Cc: Harish-CS <harish.cs.ss24@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:24=E2=80=AFPM <lyude@redhat.com> wrote:
>
> JFYI: it also doesn't actually have to be your legal name, it just
> needs to be consistent and traceable to your online identity generally.

Yeah, I didn't say it has to be, just that normally it is.

The reason is that if it is not the legal name, then it may not be as
simple to accept the patch, especially lately for maintainers in some
countries.

So for contributors that are OK confirming publicly that it is their
legal name, it is the simplest approach :(

(For small patches it is not a big worry, but hopefully the
contributor will end up contributing larger changes.)

Cheers,
Miguel
