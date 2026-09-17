Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034950E5A3
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662216; cv=pass; b=YigCwu1GYBr6P2kUZExSJSNOXqT3b279rqO4gcNGKCtFwbn1j3FarvDmueqnnXpizkQ/embR/gUzOas7PYJcAVgidsA2AeN0jbEm0HrJ3UzunMxKdileyU0suljN9xYBBQsTUV/qVDXVLZY+IaYOn6pbWznX15mK9QOApAulVIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662216; c=relaxed/simple;
	bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sb79yFdyYcc0voBDoHnWozcb3TAjOBEDH+qR955auVNp2QB3cnZkoATdyAi6NatQ49DNbWuay1nRI/IgKgbzH4a9F5Xlbv2SywYiXqX16UkPIZ6CgSB/5Db94mGJ59eZrE1J+gXROCchyNaDts0U4Sy1Z0MCVlG7lWtRvz+IfOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+rhBbfi; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+rhBbfi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495437bb891so6716955e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 09:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789662212; cv=none;
        d=google.com; s=arc-20260327;
        b=DmRQ002eC7bHqvLTbPYombpFT9nptEf5f1ucP2x/fa9nt/MK47oEONc2x+l/VCKKzE
         OaydDcpDM8vt8LDBy9AUHpQvuTq5e/8LcHqVq0URYSNyyPQzQD4cyXRGnwe3Ff24W4/B
         lGyo1tFUfeZtqGltCDH/Xh/WzHFsFNb4UVzQgsnYyKqJ4Do9H9d4Vog0F/NSragXmx3X
         oLXUIg1XqCBDzfluMVLH0GzIUDBCJErtsCtMI3H9TW/D/8vuVHFdP0BE28wegmQ8mpSi
         vU5eJNDRM1SsnbC76xReD8WZ05pYH4OSmP1qgAhFzwvBOnv4YR4qY3cBDaQpPX0r3KNK
         8CdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        fh=AGmr/x8ZGyHaOs8qBIIeWlbZuxEvur5ZwrBxp5CiW80=;
        b=BKMwKwNQ3Hn2dDfzG4wFQmkgdEOgr6EBicYSbY1JW7hUtzVRM8uDtSYBtMuGOgFNG0
         FNL0wxsWPebFbcgLcqufjmlWRMy2vr7QtC13ceeuw9UfFsquf6qkhspefmObkdawRCPl
         u+X84ooC15XWGv5zjivKrRRs1AuOht32IZ6llu7oK0L6unSTX7llTHBiJ+ZkJNQHBjOO
         yFsUazyRRMuRqdTTccYmn9xtZqSNtaGlGeh0kZ/Lo4Z4h0FgTmzN3aVmRs+pp+s5CCk+
         9H62VCWQC8xsnFBGb4DD/JIMskGov7FL6Hb4/w/8Qba1+4k0ZpwsBuSRKYbAfwI7GNBR
         19IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789662212; x=1790267012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        b=p+rhBbfi96UhErZI6rxsFeqivT0oXAiCfsfKhfm0zP50VoDXHgBT94+q9XTL1FFJXv
         6DI613GT3uNm5VZ0KtUBOw4IOUoFsja+U0orSrSIgPbXRbTKmnSDje77v5MRDx8r/HkV
         D2ZQZsErLCnQlPhrH+h2yUIxsIfrIjrhJO5HfQxj9MNQWEE+XK65/sjVd5ej51s6p1+Q
         RruVvW6RltNy0jvj/6CC7UAafc6GgoeskMqTjbdwdwH/i2Kt8LwNmElLyIphlPqrxVWy
         fIDAQNWsJmGGQvCE/AsAsN5G+KGdX23xHhcHtTc6Sa6p8oUD94cKbjzQs1Q5HqMhdEe+
         m9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662212; x=1790267012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        b=v/A6sbVrY0GlvxDqC7E2dZ5u3S2LulwQApDBP/ZYg1pzUM1/TpLZPsMNyxJp5Bp0mb
         UkrTYuAIdjoJangNSfE905Ort4hy3mHIBzihz2VyZwDeVQRCCrdJhlH/ofTjRYXS9zYZ
         mpkmBSPmJCaY1imXi8TIabhazSna9LXMTMmvjeeIf3KMagAVOxSnX2H3AgGF1IyKawOm
         d74Q1TjQm/3R/xJPkE0KtsD7FWojSuPh3W7uwz9o/kXD7tinHuUAzBY9IYaffRt2oNDn
         Q/Q8S4rKm0hp68LmCk+In5TajGFDgJ94Rx0SyqR1s5wkfpN+y+chU9lwsOrMoDEnEZ6x
         IBLg==
X-Forwarded-Encrypted: i=1; AKwUvBw2sC4yYGNvOZRv5vcyHhpc8V4DxsG+HEsEtyytJJIXp/Hv/+lDuoL7iYX1WvBCUllTMu87AE+QYfm4l34jYw==@vger.kernel.org
X-Gm-Message-State: AFuF++kdjTaNv06z6dlmdQ2g/JGJ0HHMdrQQHm9xhDGH+/VYciMa3OuG
	eWNc2z3C31/2kFsZKs5DqwWncCyw0s2BLZh0EgmjN2vvbry+p+mSMX2EOxVgGonn9UVeUsa+Xc9
	aoYvAKtjkSmZhxdtP3EEncuk2k3uZlO4gmLjnGVs1
X-Gm-Gg: AYBFou0sOTpIrd0xluTZ0WNsNp/2wLZIDNtUWV4rY/Pnv0V+PoP48theTlOkmcgp5xn
	xUiHr/aSqGTU/6HZiMzF1zYvAnj+2HXbQD7PahBPTRqo8uY1nSIETsK4ANHCstRv583ckt3q45A
	WhOtCButRvhhNKVWpxVCxUOrvxDnlWVThj+OgnmBSglV9PH85H4an6JgH0EisKc3c9I/KHJ6E8v
	jDvMFcypOQDjBjKnIpyWWbgwqHIheKUzcusYMAbZxhwYjhBYkV9fZL1YonIsDpBW0MFr91HyEn4
	0aiB3albZfOs1Y2qzPRfCIeeoEie2Tm/mKl17sZ1dIrX7JQTIcz9Wm2C/b3eqKAR9AnU94ycCXi
	b7/xBv0CYo4Tyyd76Mi1qC9k=
X-Received: by 2002:a05:600c:c0d5:b0:49f:bd43:5a1c with SMTP id
 5b1f17b1804b1-49fbd435a63mr53248585e9.15.1789662211802; Thu, 17 Sep 2026
 09:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915164000.124340-1-sagartaunk@proton.me> <aqu0bzgMAUQe_LZ6@google.com>
 <OFpa5lCrCbU3qGep0CtUhaT89qRwVqHY_LWoHC27noLYmjqgp8kAvHrnng6MEzqlqF3zvapYJrpFBpfjf9XiNfxtR-GwhnFMeIj94mKfKCE=@proton.me>
In-Reply-To: <OFpa5lCrCbU3qGep0CtUhaT89qRwVqHY_LWoHC27noLYmjqgp8kAvHrnng6MEzqlqF3zvapYJrpFBpfjf9XiNfxtR-GwhnFMeIj94mKfKCE=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Sep 2026 17:23:19 +0100
X-Gm-Features: AcwNN1VD1F2eURP__bw4VJs5iXLEi2YyIyAvyAh6K9UFqZkXxZxEIhBqNTgRpjA
Message-ID: <CAH5fLgjrQO7Yo1PkBU3r5Tw36pRBRU37iCp_ai6LOj1XH8mBsg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: net: netlink: validate attribute length before
 casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:45=E2=80=AFPM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
> Thanks for the review. Also,I wanted to ask what do I put in the `Fixes` =
tag?
> Like the commit which introduces it or explain the problem there?

You need to put the commit you are fixing. Please see
Documentation/process/submitting-patches.rst file for details on how
to write a Fixes: tag correctly.

Alice
