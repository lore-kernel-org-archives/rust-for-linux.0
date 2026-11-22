Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795346487;
	b=KeFaqrnxdHytyY7/0QLUGF7kXGlwOKljMADW3d+emqCyoEHNPKAAmcaREoNGYuu9aAzl
	 Z3Csvks24cv1xp3YouOcGKBuIbda+b/Vn9PGpb/ZDvo2S9TDX3r8sW4mtKZWFTwI6+uRy
	 +1SKk906w9avOLrcj1Lw4wRLVcJ9KvLPZHhdhE9heQSYG869rD1/uYiti7yAk4cVym1XC
	 lARgStNVxpqDdFulyvOgeUsWu0WisyoHDqrVd83lZ3+orvp7N28tPDYcxnJDwtNxjcdzZ
	 DbR9VWRBv7Ghcl3P0S0sirEvQMNWmYH0BpoT8hJQQTTIaDb6+Ow3yluOdTt3//aeBCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
	b=jHCs0a7t038RasXGoeZxUyN7SBwwPhvXMNpUL36vEUBZXHdyG0QFwGgCpcsqQE2lGRH9
	 jPVvaRMIRbjL91e/WeOi6GmHw5qb+4wQdoJMNNjW+dIh6JXFaSCsTMs1iLNWLTPB+OPky
	 am20yxEzMdvja7sX2qEdbvbmW24tjuroF8U4jWiwTJKF+Js1KGSuw418cOAFTMTY1e0HV
	 rRaU4QxjEwqynfOkeokExbkHbHfwY7eJBDPXKRcFVUPtv6xkj+svA5fsOzzYP1Gg66tO4
	 I2PzxFmI76ltXAqkxOtlit83p6g8rEz01lmbnQdZAJ9tS+9AU23J+bEzUUyaIIo9TvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zf056G/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6E606A32A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 11:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zf056G/Y
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso1903511fa.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 03:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795346485; cv=none;
        d=google.com; s=arc-20260327;
        b=pMoUQPbhEeFljy4nfUbc8lgw8nkWieEBbpB/8aGNvfBgPq1odx4FgtqS/y8zhnWQTl
         6EcEpS91yhtrfZa231hAEX9wEpwXLR6WCD7ryJwnL5OXD2/J0gTKTGaYfyEy1j6fzjfF
         Ss866kk48hvz7RjRktmRB+vZ2iIIMvK1P+n6385FYsqZHWwm+6YpsRRG++EB/cAXTXTR
         Z3rjzWTwO1OyPaoEDMcmJo371j+EHd5ISlPZ2NEHk4hlkbpdgfmlNXe5uPxKe2DWov9Y
         zBTul/UrHhDuWZCtIIWH4vpuenxQXG7V9+0CbxTgqJTM8ACK+iQIwmVPo+Y6zU50aThs
         xUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        fh=oirEGwhUVkezDUzlUqXWTY+1obuZlCEBb/a8fPL0Jf0=;
        b=gDCFmlg2uyFBBj/j/nrfKl+xho0xhEtNfoFTVkUEpDGlJ0sQySP7hxWuO0TPHsbubB
         TBe33JyDaOxJcibyCg/reiRZZh6Faz6LWzTNKWHzPO56kIzemFYkeAOzP4sT7LUSEghy
         2/JE21+6SoptyLQdX70pRijqIikOT3hTd1y9PiBpYHSPk2q1au0/JD3C7hl/DUjuH7Tq
         VgStBiqQ/LMK9XL2m9s575ZMM8khn980BaYRKLi8/d3xlMx0nhmkRGt8xt64VgAWYwMf
         9yccYGP5TnPTwvm4PslhtZO5ioP2345kPHqiyeuTfsVs7+ihpXKDpbZZk0vfaFEqAP0w
         NhIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795346485; x=1795951285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        b=Zf056G/Y+GwGxQXeae6ea0V5lpqHLMoxwIERhMIGNmrPdDZ6cZUEoHU4hrCFI+XQPu
         DtuuDApe9j2ugyBnKJw8BnIVnu1bY+6E2hAi6GCbeElPeWazvmsDNRdPdzhAF6ch+tB0
         sDMwQCeoHX/9pKFb9x74e6mnkglRTIN4TILmvm/kkwXU8Fs8C8MyMJgN/jx11Uj9kbTL
         ado1hj028EW6qS1Am1bSc/OrESnmIvOG2jEH27iyYoz+NJlcYcQMNgVrTjfy1leizNdH
         NV5DOBaeMdvTr8c7lXA7NsOkseNQGf9CBYJNmJSQWgoHi1iEwAVOSZDfiJbiqFvj4F/t
         jeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795346485; x=1795951285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        b=RILs6AG2lm6y9LtF6rueBliMjGsCHLb4BITbtLXD7/HdZ+j6XzaDp4eBwb6ThOj/JC
         uvS9Js0pZri7L+ETwWThrIE64CLFV7MMd2y8zpoQkCZmqQZbf3FwJ0BD18oDbuGJKAqH
         X1ojg9RKCJUtrboFCamNHaktMjDXSBSeutXuYdIekdPWUwNZ3DZ7Zoe1VkCjp0c/e5od
         E/9wIUkENXOI6F+NYwECTwb8LyCcxMMmk3VGBkgDevHgOG20UbuiAKcZHOfYTuDILhlo
         tUPDNwMCiPmX9jKW6K4CDpXN+hg/RU0POh98GQ2SHutaahtWI3jYYh8AgQbJPK+QaURt
         sgLg==
X-Forwarded-Encrypted: i=1; AL+hErEwbISa0teQwf062uDMnSxNQVrE/BqqfSP3AHq78rW9noxuYxbgts/+SWqvK4EsHKOZlE4goPSxDvAE/uYiZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lDIwanwgS1YvxDMqYzy1CFK71BP2DtKGg64gWWR/w3PEll0Zb
	gdXZcx5UH/z2GWv2ZOVDnsrEwV0dpkm84VXD6aBPLXZfzuxOTwjC0UP/rnaet/WYaHrE3g348Fr
	pl2QXYqunv6cTpDwSA+1UDvNW5Zxwx7U=
X-Gm-Gg: AZFdTZfIJmskUXw+LAPYAMQTfuw4FMy/X2neJS6nEjM5W8AlrRLsWms+jnz4oTCRmjB
	eEo/+0YenVUCQ55y4p7wtSaOvplVw2+SvAnlKsaKI4n6bDJP3NQhKl/xnyMZLEli9GcDTragx/k
	eox6KJkB286zGsX2czRq1Iv3lIpd+9AGYky+AcfG7oYwEE3Dm5MlTKcZ9O+UasU+fECbTC9s6aW
	OvUffiyiiHFD1ctfpWJBbrIWCbm0jAe/qGXePljKNpbjTSmeitKTJswf78MAyszLp1cZZQenzjw
	6aTRGQ3OHJmtcu0dgtaAwVMcS5o6MSmASinIUIBOoa0hDaVAw28kqH+CCLTF7+4PW1bp2Gf6TCX
	qp3Q4neCeJ2S/7le6vHwYU3W2xRlQ1fLbzgEFB4ZKqqU9Xxjfj1baAT+cvnYpPeYjrPbCAyMHDA
	qTGcpNKQLGd1H+DtgZ9VJhMYUghzwEuOdMZct6XuI0UkRDAWM1vzmna8VkyJTijCGKpcfX/usl/
	hDFxRIDa7V2cWLibVE0fP++NSaQG6VkI4qrjefjlzS/GN5ocjb8iNS0GvI5RGwLD7ebG1qV
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3359356e87.2.1795346484987; Sun, 22 Nov 2026
 03:21:24 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261121141830.171033-1-aliceryhl@google.com>
In-Reply-To: <20261121141830.171033-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 12:21:12 +0100
X-Gm-Features: Aa3M54oNJa8cPl_YiVnZHC_82X9FGjy0ARvybs1hSE8ttDDvbfY_eIi5LF9yt98
Message-ID: <CANiq72n4CLJZ0aZwHJYSnnc58haG05si6+ocibzd07HLgFbAkg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 3:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Miguel, are you ok with me taking these uaccess changes through drm-rust-=
next?

Sure:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

A couple notes:

  - rust: uaccess: add UserSliceWriter::clear(): Newline before `//
SAFETY` comment? I am actually not sure why the newlines are placed
like that -- if one wants to compress the code, then I would place the
early exit `if`s adjacent to the variables they check, saving 2 lines:

      let len =3D self.length;
      if len =3D=3D 0 {
          return Ok(());
      }

      // SAFETY: `clear_user` checks the userspace address and range and ha=
ndles
      // faults when accessing userspace memory
      let res =3D unsafe { bindings::clear_user(self.ptr.as_mut_ptr(), len)=
 };
      if res !=3D 0 {
          return Err(EFAULT);
      }

  - rust: uaccess: add method to get UserPtr from u64: Intra-doc link
on `UserPtr`, and span and intra-doc link on `u64`.

  - drm/tyr: allow userspace buffers to be mismatched: `set_uobj` has
a bunch of comments, should they be documentation even if private?

Thanks!

Cheers,
Miguel
