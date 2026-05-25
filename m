Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F830CD85
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731524; cv=pass; b=k47awGxDGsH+9J8WmTynhDBTB2YDFBFPr1E20WMZ9r2oDE6zCog4WWvtSql6tRZItLFyfZ6eb9tyiajnWb1dFnpuvozq+u9ZM5WgcRB1zPGylAworTlJQupwNMHqMrtocKypFfYLnmAyOQWsvIJ8TZ83HuzZ2MoADfbPRr0ir3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731524; c=relaxed/simple;
	bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFE7UXwRgwOJ8U4JAGCMC1jzyEo7ur82adGlY99SAc7t/GV62ouJB38xfbsDM3NKvKAYPv6C+KySj4EQSvfolYTAxvpCzgx/5fINWeg+clxz1XKSTqqalyx776hkaqnkLF/T80/Hydq0X3GospQtLMWK+C1Qn3htSrDV7bu2pJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OppDLcB6; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OppDLcB6"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f24905306dso1005769eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 10:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731522; cv=none;
        d=google.com; s=arc-20240605;
        b=a2udml4mHhPj9nRNZir8PxfjGdEqKFdm03+kSr2olpcfTTYoGZtxDbpzMUf+Xbsc09
         9beUb+n4F0XaMf+0zWhIYDEtfigqM4yCxcs/2pSoliutIpkwGazo6BpRZqH/Or3Dd2Ga
         xsloLzk2O9djDQ7WYWuPXzyOTs9VasxaCc30LcY8ev68pSe/yjB75bgVduDkUYKlB6rq
         u/6Q+Yw2p3E90PPJUTxhhbx4EBICRQp0mF+gcTKnPC69glkkaprFtZjO9qZBqK0l3x7M
         OVQ2M4YGFshqemkiLD7lsXzsGLAmUJz8x/uFxmsyDbqHGJNqKLuR7jTgqKjIGCAH9/u8
         QNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        fh=VLUZI02/1EAqfLo/NpSZcyHDLS6dcLQBh7SD4oWTAVY=;
        b=MkR6aFtm+XeyjFWD22Fgoy6Z34X/+twYEbCQTrvE9gHEELjEz/Cwo5gq46OO20BohA
         65hkoxcJ/cCwR9GBLHkyDp2Lo+6a6lIWTeEl+uwWwvC/AhZ3jHYwLmGHxl1CrLmF5OMI
         ou5UUa6oxjVRYraUetZZQZ9zoBVmgT94F3zhJiYMw4MC63yXr+biuoVHxmdDfYaBfHRl
         PIdwW7WLEBqbvYqbwdTcAtqwXksW/T2RqtGy0C57cj+DgalEoIQ+W8unofCcA5DZ16Md
         Qn19k/V+YsLcdoDuoPN+PAiXF+cvi20/lEv66k6Teo1LnFfQiyQ320oEBH0dRp081oaG
         NaGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731522; x=1780336322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        b=OppDLcB6u+4hVFF0nRgLbobmYXoTLVQJl+Z8xPBBHmHFhvYb8RJRiF9YS8rMNI5nCc
         7Y8Mv0RdAOhQbay8yY1egS3iRvlzguBb1ZAA5/XLhVgteYSK+JiGxyk3//MN4458SRo9
         RnPLdCXmz6BGOrsL8jz/xmx2khl/zkRtjFrmwzlRIX1cARxKH1ICKY/RTZN9zD9UCIY4
         M0RsNpnlmJzXox6znyWLgimAjUEKTjik8ZAFNZ9+ZZRRE1MRZ555L/2pLG3E12eCKfoW
         DO1NfH6+ROopBpWoGmUixJGU0ztsptJdzJY2XF17VDZnzj9mul7XxWDgSEvcG3nfxPpi
         nZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731522; x=1780336322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        b=AOVFbD3os5odtpbU1GeFGW/QCJ0vEOLqp0ZbUXPtdI0QyfmMRRMluTy/lo42lq1S3X
         oynCrfkByIWaxG/cLSIZm4sKbl4xiyFcItiW4M0JyIl0CubMuuLgNACle38WdOsPHU2P
         UCx+RvDWc3Q8vjZjKz/anjB+tyBVbz3yiWTqiVU1RxV0PAPoppV5TX/tTblIahkXFhUx
         /hw5pWfYN6t1/uVWBd/Z4kZkdcw2ips65RuXyJLimjAWCByYLQq1i3SotkqeqDUbDk5P
         hbJn+tX8Nupi4LjThadSsg6IyDRlT6KLRCtlsrWWD66TsYGMMkr083A1r1sHRzneS8Ln
         y/fw==
X-Forwarded-Encrypted: i=1; AFNElJ9wdFz+JhOUKyukj4k94D/zi9LR/bOkIYX8jLk3szWByldZ5RmPq5I3nMpQMRmcTeJuPS99NTreRw3TdnwnTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CKml11zU7g2swcjWy8QUaYPVrbut2lO5QWJ407f7INYu4OFv
	Q7tP1diIeyxN626c2x2AddeUWpGUXDNISIzOrTu6WCOT0Q1k8LTy4urXFYP4rNGExlyHXshPkdc
	yQOR3GGgbq41qbE+oVg026JyZvc2Lecs=
X-Gm-Gg: Acq92OEoJbNA2baiMoQwH+FT2/HOyxtYo1vDryQoK2xMRZCVS5XMYvkuOyarJTLDKWy
	jVbd0vsytWXXyeUFg78ThPKJQP7mp27NdRZZK0FbKAptitiVbsU67IrKr3Fn4Oq5ypBLlqCZeBS
	mBw5F7/WXaFymC36RKSTnhh7pw0UtNhxW1j7PUmNhLxtp9jyEgy9UwnG/upRsyRMiHjpWURlKsv
	1Asd1jx1pS/eruQa9AQaCdj54b3+6yiwdUniYQZnoSYzMepYlFWG+1GbYVEGfZZJtICcQ7Bxr2H
	k+B+z+S4fzy3yq+Lrvt366Vt1omcm1KsLh/34LiZQq6BuX7jFPMtLrgccvRlPlR0DBfrbrMwi6g
	Ep54Bu08S79+10c+hvsKXF9o=
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr2954662eec.0.1779731522166; Mon, 25 May 2026
 10:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:51:49 +0200
X-Gm-Features: AVHnY4Lj-A7r4aYA8iAqKIKO_8AgbVe3NWs2TYf--zAM-mIaOF-qUbEBAdoXyqQ
Message-ID: <CANiq72k3cjgHiimYqGfuQjPy+A3oOUEoMxUJCS-FgBm25D4MLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Adopt the vertical import style and drop redundant imports already
> re-exported via `kernel::prelude`.

I can take this if block and misc Ack. The changes are straightforward anyw=
ay.

Thanks!

Cheers,
Miguel
