Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB15231845
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350523; cv=pass; b=k7OH3M031/qIUddWFS1RApFbBsQYopSUmHnGIRTq3liOj8WbcTpGPnv1pICzyopFRaa4sA7ZuFGnX33pQz1j+SgY3uMXtOhMj1vbRAx1aAGZiKQEEUnNRrFYSNWikMhKvuZWIS2E07KJhpU4UkDYjd6AVKw2NKi1wnWvPaL5PUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350523; c=relaxed/simple;
	bh=GgpJ9yEcRczGDFchqBwS4N3ZDlFOzwb0ws/VEtH6HCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pkb7kz3RqHyVib7TvuyDoS+Hp6CgTh3L5DjbrEs9kA5Te//px/ZuGAQfuqxjYkQGFejvRki8X2HhOvNG6fHuwsXo8y0WpUgMv3euaGhqSmQtTUPvugfRKJXXfN+KPTUAtDXC8wT+N8CbUcW8zl7+xJ91F8wO0zK/4AaIgP3PJQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Plf3wlvT; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Plf3wlvT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a3a1740e7so329a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 09:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771350521; cv=none;
        d=google.com; s=arc-20240605;
        b=fIAWpLOQO6Tqm45Aq2vjgwhfOU+WcRVWHP/ON2NMInXGaVO7BLXc3h82ADm6uQUG+A
         ZG/JZoNgPX87y/zZR5q4kOw0X3SwWEsHJxoqq7i4cknXjr8AuA51w34J4lpc8sP9McbM
         5dTFbPPblgkG5BHhIaDt2x8r1Pr97UoVrEYL9gNrt7YUUg47GZp9PTgRO2B6YlkUR9yH
         T8qWnz9bv7m9Ja0ZcvIupGjj7bvjawKpUVGawihRycC5M3VXqXsb7406DKno4i9oIseI
         gn1fJ6yp+ecfq5S4/zivOcHIE2AB3MIAuEOENzCPWIKd8+eu5PghhlnY3kijkCDroh3q
         bnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZfLQXgkBk9jXdjY5cMxmWAy50vt0W+v4RbNQzonshso=;
        fh=Q/UKx3FwIVqThKdxpVCg2HDNBvoh4NJpGX08b8QT6S0=;
        b=QB2YMzTkUEVjyQrlIXb+zbkzrkxYP2GIRCDEncJr1fVI+9x/32qpLFxPulED7qYkPv
         HHUbl8TFDk0VhrVYjYsyeiThXCWF+yi+ovcGtUEt7mPGs51zAAOHl8RI3LPJDSrbFFEh
         0PuQX3tEx/kxLN0axTNdYWFw/WY6H78aiPVk83IH2QAAidbBNwbNXmEHIqyrWornoEio
         MzjQdj6zwBxR3uxwxkBFB1skZc7OXXUwRyihLKG+JyT+45QeA2FfadtOA286inX2jlSB
         rk0VFVjPM8QnsXr1jsJvNvyKVW4ScnfTjzWSo6c3dtPiriBzZOAfBYG5DRlt82PocNaL
         GtWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771350521; x=1771955321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfLQXgkBk9jXdjY5cMxmWAy50vt0W+v4RbNQzonshso=;
        b=Plf3wlvTPrIJ6Q0HhdjgrbVCLGfuH4UjZKUjOusIbz1cDbI9pv8TR/nNrKlcS8y+KR
         DsbLE9gENuZiJBaqqp9MUQa3BqTK6w18hUKXxLt87+1z2dCYAda+0agCAR19JvkGZiYg
         tpYBU28VdOfWPlrMYqdgGuY2+9yin/vQELmZut9rNLGf2Lrj9PMo45Gr4ol4pWKSkwD0
         tMeiYg9z6XxSMPhyN+JPRU2apJuzcIS7DsX19ke8UEnqbytLjXWgVD6JtsktpgVxw9iU
         sY7cuVynQyA7NpmAcejJWEgHNWfwOIQdbjLVDB0IB1Zxsx93uPDmAVSe4aVLXCkgxBnD
         0bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771350521; x=1771955321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZfLQXgkBk9jXdjY5cMxmWAy50vt0W+v4RbNQzonshso=;
        b=gJ8jVTaU0CkmPJL03RfUFDtP7GIzXoe055M2DgRPnw+XazdQe+/H05KLbuVKbzoHEp
         mMMIZUIsFfo32cexU/yWETHvbwusAOwSNTA9dMYJtK8sBBceJWFMVCI8Jvj6dvTiCF1q
         UHXjvAivBoF8U5IU7piwqUgVAdTVCtdlwWTFIFwxFS9jE19chUSn8lunXmgSd2u+t3SM
         lqi3egXDJPvbBbx7o7+kFGofJXnmYdv5w+3D5CqAQLP7+Ds3M6PzFlwNak3Yg3JswkHe
         gbfTKw5uw60S1SARJDurPgNz2vn/CTqjoZnd7XhpkhvyyrY31GXMAHZvjid87UMi7RU4
         M8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVbK61bOlyLWLyXr0+I29C1VdekhpYuxzLCiCMhLHEyItfDV2zZgtLsbL9yrUpVSxcoWpwCBJMCZIcfI7eryw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPiv663yM+sCfTpZMI7HRgLv9zIWmhKqUB6XfLI6/OP7XlChJ
	8L0fkAuUkFDwdqFkxtfdg/svCxFUZvTRG7H+6GzIKT5rZv2nHlvElyacOizoDeWfw9Hu4XE3Y4L
	K8Vue4STQy9Bn5+Js9pZfznCFB3arVTfWjOQ3O48m
X-Gm-Gg: AZuq6aKYcmfIWI9nr+y2VlbPyqs4K1jB9xaoYOp/DmdyCOG46tY6Bi5MqOcET7gU4uf
	MMwJDD73kULr64Pff1RcyS/0v4fHN3tiKxXN0udUgszMBCJGt8Jhqf0But/0RUV2RGRbcsVI2Ns
	1vs2WaYgggQ90QTcoFvnCi79UlIHn6DTqpoNKHm9X0lw8V1btTau82wBDV6TloSLcoQYP3Ynb5v
	gQU9TUonYPv4YQKGFazXwFbUwPUJIcdQ7BaYJEHDYvv5bE0afF/ZtZEAMb8oilEBDrPR5AbhDdg
	X8w5lnoIIX0h5qWR3Ncw55QZoYf1H/t3B6+7NQ==
X-Received: by 2002:a05:6402:110e:b0:65a:1240:b8c4 with SMTP id
 4fb4d7f45d1cf-65c1784a989mr60515a12.3.1771350520127; Tue, 17 Feb 2026
 09:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>
In-Reply-To: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Feb 2026 18:48:03 +0100
X-Gm-Features: AaiRm50Q6ssb6ZW8F6siVy7jzQQOTtBvYsjEBCebZyc4a5zul4m8Fw0gjdRMHs4
Message-ID: <CAG48ez2j5xA-+XwVejp-8gUv2uPEJNOO5t3MoYBgbigE2oV66A@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add additional alignment checks
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 5:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> This adds some alignment checks to match C Binder more closely. This
> causes the driver to reject more transactions. I don't think any of the
> transactions in question are harmful, but it's still a bug because it's
> the wrong uapi to accept them.

FYI, this actually fixed something somewhat harmful: Before this
patch, `unused_buffer_space` was sized such that BINDER_TYPE_PTR
objects could grow into the area reserved for the secctx; so you
could, for example, clobber the secctx string with a BINDER_TYPE_FDA
file descriptor fixup, resulting in an incoming transaction where a
file descriptor number appears in the middle of the secctx string:

00000060  75 6e 63 6f 6e 66 69 6e 65 64 5f 75 3a 75 6e 63  |unconfined_u:un=
c|
00000070  05 00 00 00 6e 65 64 5f 72 3a 75 6e 63 6f 6e 66  |....ned_r:uncon=
f|
00000080  69 6e 65 64 5f 74 3a 73 30 2d 73 30 3a 63 30 2e  |ined_t:s0-s0:c0=
.|
00000090  63 31 30 32 33 00 00 00 00 00 00 00 00 00 00 00  |c1023..........=
.|
