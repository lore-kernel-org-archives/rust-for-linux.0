Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98814F125
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763917688; cv=none; b=inR3vzXcD0RSme7MW4HY+KUe0k1VUQoHtZALTomkobXeW1xK876NuvpptfwAAXJtiPGY9daub9HRbXxygUfXUhm9vX7Ciy9Ln0O61CAVEISkX1Rut5HJpr6z4953KItvwid8xLUJMJ3Nu2cQc8B7C6Qp3+HB9qtqnGjhjv4t1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763917688; c=relaxed/simple;
	bh=z2qomZJrFAx00Yj7OHy0NxKolD7NBMwWvO7k/89BywE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nc4THKchdg5vxKR1Rr+jlWyVxMrvcvgcSx758edxm84p97IXwvdR9g1ieQKAUx9Zl3eil/9NyscH/wV/nrdZMVN/SJWFFuowyn66sQ4uz5O0yy7A9fOeIN0aGkix7XNtV+/RpA2GhCjbcqKFJFTuNVLK3YVOVbeq3pv7CGO6U+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajYGeV8U; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajYGeV8U"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340c2dfc1daso317936a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763917686; x=1764522486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jzRdwgrlBGM4Ka3Mqp23QOr2mWfwNczhjfRCOlufvc=;
        b=ajYGeV8UG9vUKmY8HU/OX3lB1URQZwOrcNFolhKA5U04bmA4yWEHSHMAGZXA6SSITb
         mc236+HaaxmilT1/VRW22XXQkAKfmD/2BJaUHRJs3u0dV1Wrm7PBk2C4KetAokzioMAV
         rAWtG9yjzMEVHtX0bgvDcpQBwnFn1E9aPE3CcMZv79eGDB42qNe1e2u8ONU+RDQRBffG
         XTXH1Hxa93lDVJzP2L12PWn92Q5jm/AEjsnq5gFeQdV0R81DjTKS2a1KIEOGqvM9s+8W
         ggexvdzXHrW19Dmbnsb4bCnSt/SstWPW9VtrqzstDPFWtpNb6SxUI5cfZYZ0bQSNwH61
         YLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763917686; x=1764522486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jzRdwgrlBGM4Ka3Mqp23QOr2mWfwNczhjfRCOlufvc=;
        b=S1g1ZTNFKw5H2bi4UXe/kvLbvVYyP+/D65/LkQ6uG20qu5valNqJ01od8fsz72a4zn
         nQ6BsLFOXFfkukl6oV9nOGNoDBAA3vlL4YNdxh0W8ftkpvDMBpsLmqtpY4P75JofkOwk
         T+UR6Pu2cXN7iz9GNzLeqICX/IpjMlFtfP3qsrcs5lme3qFOtWHLdBvd6/CLNsgUF/0C
         45GE0WdgRxuy+7mr6kip2ZHHeq7sbF9gwlOMvF8ZCg8uVIasvOBEBo9g3XMo63FQskPc
         wrygnsgvXcZibqGIWIZEAluUQmAUKrJtjg2o9OXENL1rbRkHbRKqka2+C3eX8ejPx0GI
         qc0g==
X-Forwarded-Encrypted: i=1; AJvYcCXRLsmVMBnFrJUAR2XK6ejP5F/EkYGBw5KEcMWWsrCN8nsgEamx6ak9dBdHdj813PsvTvWucIWkFY9BWFH2Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGJ5Ave/ShWv5Uf47eIK/c8aQR7SUNNlMWws9wSE5XCSEJfQ+
	ddtFvuUS8zAn38ECaSTcrItP34ukFJ+HsGEydEcidbV+FtsBLliblkyCq7TnqIJ68S0OKTrVhZH
	LCTmn0mBHsABRSVZaCW6j3gQHyhUt3Y0=
X-Gm-Gg: ASbGncvkTXhH/z6LR3kbF/fh1TucUk9H+e7C14XBeyKKtP7tdSzBGJQyE+RT3OFIaS+
	/qh4ejtmuBzaXv++SNfsa+cREGf16z/BM06vVPeupbAjzSAc6Ojk02VlTqELIP5n4hOfl7tYFmb
	L43zwcH0zH9dZbT/jDT/cpZDQOWX7M0Oqy0ebLM7dyHbqv7tOnZzKrLuTlqRvOByA8vuDEXh23d
	Fc7a/yESMn5G3zHGraKffhMVHHjkSNhvBJP44p3cQ/pWvyCp/XarOx4MiBaCL2z16E6B66id15W
	ICNNInqAJ7b5IC/P171ClZRmtXxJlNd/70gdcOMe/tsP0Vdwuwpm+mkVAxW6YL3Aqhegev77/j6
	QvugCCGVmIneraQ==
X-Google-Smtp-Source: AGHT+IGZHjtJcEGBPZNIEzBBEH/GIwzRmK0XuA/cxDdYSVB2Kf4jYlzMZYG0qa248vJt64LoIMnSUJcQtEvU8UopE1Y=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr4703615eec.0.1763917686200; Sun, 23 Nov 2025
 09:08:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122083213.3996586-1-davidgow@google.com>
In-Reply-To: <20251122083213.3996586-1-davidgow@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 18:07:54 +0100
X-Gm-Features: AWmQ_bn4_ZVLWf7sDF8GSmpgYnQ7TxDVaCgMHNgG3l299wML01MntHwi2jSGnm8
Message-ID: <CANiq72=MXHZ2XswxkfzLqUEPwriNy=_sxAQpOYoYW8iNgyuJ8Q@mail.gmail.com>
Subject: Re: [PATCH] arch: um: Don't rename vmap to kernel_vmap
To: David Gow <davidgow@google.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"Paolo 'Blaisorblade' Giarrusso" <blaisorblade@yahoo.it>, Alice Ryhl <aliceryhl@google.com>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 9:32=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> In order to work around the existence of a vmap symbol in libpcap, the
> UML makefile unconditionally redefines vmap to kernel_vmap. However,
> this not only affects the actual vmap symbol, but also anything else
> named vmap, including a number of struct members in DRM.
>
> This would not be too much of a problem, since all uses are also
> updated, except we now have Rust DRM bindings, which expect the
> corresponding Rust structs to have 'vmap' names. Since the redefinition
> applies in bindgen, but not to Rust code, we end up with errors such as:
>
> error[E0560]: struct `drm_gem_object_funcs` has no fields named `vmap`
>   --> rust/kernel/drm/gem/mod.rs:210:9
>
> Since, as far as I can tell, we no longer actually link to libpcap, it
> should be safe to just remove this define unconditionally.
>
> (If it's not, we can possibly either disable DRM Rust bindings under
> UML, or move the redefinition of vmap behind some config option.)
>
> We also take this opportunity to update the comment.
>
> Signed-off-by: David Gow <davidgow@google.com>

Nice, thanks for this!

Yeah, I guess we would otherwise need to do the same kind of "wild"
macro replacement in Rust code to support this or conditional
compilation, and neither sounds good.

If it is not actually needed, then this sounds like a win-win.

It seems it was indeed gone in commit:

    12b8e7e69aa7 ("um: Remove obsolete pcap driver")

So it sounds reasonable to me assuming I am not missing anything,
which I may be... FWIW:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
