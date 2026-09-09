Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663B3ACEF2
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990717; cv=pass; b=niLlcl/y036UUjKUp50GwUdBFLCgudVB2XJy0XDm0+7j6QYO+x5ACx5GVrYqEKyy2oZMgS2UrWLRMszo57uMceDMAma3tAvIcmFb1F/bxvLTEMR6jWTEYlJAtDyXfAWIQhrjEJjnC/V5sCg6Qxjztbf2yMZ0dUHX9QfBd4PgNe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990717; c=relaxed/simple;
	bh=YPRgAxyATeU3F76UKlCXE03VGs6euypcGZFO8EUXhFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/zecI0NihjcM26xy1Uc8flFxdmSoi9zTMduK4Wn7aVJmCvw83IuzceMM2wq27YWUz7odSIt6S+eXq4cedhogS/ANi1rS5AsXkSjsE1LlbmNCbOy8Wkjdj2iJYBEf2q88sssqBz70+i38xGrgRHZzLGfwMyQKhjStGyQAAC1NmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XB5puUEf; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XB5puUEf"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a9a4dc8afeso261053a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 14:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788990709; cv=none;
        d=google.com; s=arc-20260327;
        b=V1hsIEFyPG/5ICHtosREAvr+q52aHARq7g5AaNIn1yG7iTREuF3ovkFFIqevKSH2h+
         XCVl0XErFCckgHYZGkLUdQ6PuVDzexIzctd3lSbpLyWZw01HIIzDRqDyBdxwUmofplkD
         Z1gCvx9bA0LJuqYwKnlOahPv4zdqP+TjfDypkozXf0C2XdZz0R2txYSZutEvcb2Sl3xc
         Dt44fLGW0NurvwbS7YyIpDDmS0usJtwuvHY0i0T1lqB0pF9d+GL7ILT9T3FODI4JxU1f
         h1m2mdk/ygwVDWf0+kmM07rGwXIZgP2IFiODE1Awl2Mga1t44Czidenzmouc8u6evdlM
         9NZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        fh=ZwbaFPMYx05m1OyqM+QsgMiGSmhDYSfi88mPioKpJwA=;
        b=U7HG7GyxkZzfogESnZw6byN+8uW9WLVxbwSN80EQd2rCfb7ZrL+9pHUbRFZSgMFOyK
         ZhHafOv0lnxmHAkByKanKIhkoP5HW7WdzniXvQlWYUj+zaq97S/ujJlTvrikkf6EHWRt
         /1xqYRQRgAMv9Z4RDNIgEJbtPLcHHdlSZi1mg/Ivha6gxmTIqrdeErcZ45SojPTldk+O
         Ih0fB9owPU42C2TGrgEldgI4AnmfKJpAFQvu1da49WXnyqyzQrv9G7ZzKh33xV7ESaZN
         d+b5kNrmRFb8vJa7qpJHUCaAMQ10YN0jYipE0U5aImCtQNBkMLY+9zyfzRlun4FD8i+M
         Ojkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788990709; x=1789595509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        b=XB5puUEfiB2thfXXFieC2VJ5imNQr7nCDybRev6Z2hfdslc0KmSekPKGiURZTG9EIp
         pR3EtVxlZUDRaqJgSKMWT2dzGaMP0+DnIF2o0/eep+8ijHNS2/3v8XRlPHbiYTuANEzh
         xLv6x5nxHX4m8gfTs72hQ2DYS4ge+dEAKqt5NK5+BTYUI+0LIb0lyTiWcvKAjFL+qX85
         tUlA/AqbVDGq67jyyVd5FplmxKP3llhNqBEORrGWnqhKgLfim5bX4ZLLKUYbbs1Ey6Zq
         dXArGnJh3QwrbpJZEENiO+yKm6TJ8kYkU4g2CGIq4MI4zvcLYZ8aYwpng0p2/UEZbuXI
         qTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990709; x=1789595509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        b=L/DZy6MNc2EKXa/+Z/YhYjCFWo56RA4Go8QLMU6aH6gp+t/0MBBWr2KJ2m1gEmE3Cc
         gEK43v1FDO95GPOslf1badLnUwUFSyIES2nHbpGfIMAs5599yLlyuqSybqXoaHGkk76W
         rKK7Mu7faY4MUVZf+7cysk8vh8eY9bO1azFPGNrHnJjmgTRjkmKV8tK5xMPe9k7T4IyK
         LMwVQ9h5ussGkQysXjsraWAezUXzU0MXoWNTnFUC7bBgqUwDFOuUGV7n4p5LCw4Iw9Jb
         KqK8fDeX8G8ke95Bn5jh3oHn1MvL2FxlFQZX1pYPOyQt1PXZ+aEOOH00VY6bHZ4amtN6
         2now==
X-Forwarded-Encrypted: i=1; AKwUvByzUqwmeNCIqda5O7gAlsfJaKapwi/U8MsfEPrbYP0p9jWuurgPjwTPqmOS6P0R5ePtSaxQmLfd6+QQ9IjA1g==@vger.kernel.org
X-Gm-Message-State: AFuF++lDr0C0SE/JcQJBQSGYJ0H2atx+mFa+96HscgExlu1Yc3WNKowk
	rMseB3aA5g9SF5jd20nnGiNaARCCcXJ92Wql8i4OlDjC1GXcTQtxNdQCWYSPudUoJLQE9/aKUs1
	Lm8/UejvzAqspJ7DZwI/c2XbkkzaJnCLLCw9MnhnB
X-Gm-Gg: AYBFou00MQJQptk1QrrsJZFqaMZRhIcTCEA7vZGo0yQcg/ikJTSBvGOCQzxpZEYOCcG
	uayBzGlBtvtAIdZj92pWBXuavXhbP290vJEbVidEw0wtiLlYlrPTf6BKuNcwrnxJvLU6a8yZR2J
	xo9e1mar1R90kqUrHXuBuO/zpUR3H6q3yX2QxA+bejEWo/8RiyEGczruguqfcFfZUt24G+J4xtp
	D0oybZ8NZ4a5svEwldRHWd9RFJRYsIdFsRiPtPlVOmtK0kc/X1QvTIfdEOzxFbemgOpjnTTZYoG
	ym5W0/W35032opNRJq8MDKfam/evJDIz1a7PzIkCJaNCkSdp1EbDJzUllt5ZEYqIlgON0Nty6bQ
	AYMDzwJAjZzM=
X-Received: by 2002:a05:6402:42c6:b0:6a6:32fa:1e99 with SMTP id
 4fb4d7f45d1cf-6a7e90b8f43mr14558766a12.17.1788990709336; Wed, 09 Sep 2026
 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
In-Reply-To: <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Sep 2026 17:51:36 -0400
X-Gm-Features: AcwNN1VmtEdFon5AgpPJO-meJZ5NT-8G41KJlj3m5Osmin_JTAnahMcOn8IdkOw
Message-ID: <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Fri, Aug 28, 2026 at 2:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.m=
e> wrote:
> >
> > Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> > in [5] for a resend that keeps Benno's authorship, which this is.
> > Cc'ing the LSM list per Paul's request on the original thread.
>
> Looks good, thanks!
>
> Nit: nowadays we typically use a:
>
>   Link: https://patch.msgid.link/...
>
> to refer to a patch that was picked from the mailing list (usually
> written on top of your Signed-off-by) -- `b4` can do it for you
> automatically.
>
> But no need to resend just for that, of course (and Paul/I/we can/may
> change it when it gets applied :)

Looks fine to me, I'm assuming the Rust folks would prefer to take this pat=
ch?

--=20
paul-moore.com
