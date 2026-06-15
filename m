Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC37384CFE
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549041; cv=pass; b=rtpCY0GVuNN7PGxEua3mxUgtk6cDFNSrCZI2EQbmZ/yZ+bxqwmM8YZSjRlWuad88ALLR5KPZWaHcJiwqmX84eLr+wEbdFofjvYXzh1vJgOqcYCrkASLgNgsgDuX41uN2u79+H2Mj4pzmEKfqGUNuPWjgS+rlF0l2odrOTQl5n7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549041; c=relaxed/simple;
	bh=63wq8el5EDu0B8FLKRvi8Au0rDG0mlDgynoZhULenOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSRPew+HVoPVx98DzXuSdmeUGdhcqM67G5wlKqCVUBjr0fmbDSMhGdhSQaP/Y3loVu+RnFZMvHkSzrA76enhRvjsXedwXVVTa7ydT16WepeSiXYrQzIVh1/oDFIhWAVtzK/eTlun+Ff3t0pzK68NqtxNWP57WB1Qk7hoJl/PqzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6rYU/ob; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6rYU/ob"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so375073eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 11:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781549039; cv=none;
        d=google.com; s=arc-20240605;
        b=bYWBmKqoKQZyNYLEHGDcFtr0n+x4Dazqsh041I+JiQ+29zJi12toESsKPhBX9/CHTe
         m5DkidOFfy4tmvEM7ub+eMf1MvsT6eAQqA7RrhTN6XP/+XFnMSmLtildcQxpezJkUm4q
         G+dlTLc8RXSe7RKCQZa1QCrbTvyA8W8ZDIv+EtiJ1RFmM52DVDCvzel9DKKAqhZALdJu
         Q9zGZOO6mIAJD3Xxt+7xigAERgVVnydb+J0GsNmAAEOx/RVRlZp5jsgSb/GdsVwzwMCF
         KcV13CUumMA8S2GgQCWph8cCNO1o1uXCEejUw0SpCAkGXlMVNE2AW7yHAi2oQjgoh4qY
         KdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ngZSQBSwtFtQY8JlHNMo5cTcp4rz+totgFIqx79Fws=;
        fh=lCJlVnsff7Hw3Cvn0xaEgOMWB94zXjBFBjx194CYGwU=;
        b=iMbbxXXWAFvF8AMxl/NyvDgORC5YQH600eEe3b63+YrruciDDVAYwXRmGWNdZF1lrR
         caRpm8IxlQOUZqysJM0KdBFcFiVxEKOzs/jO8wnXxFFcfTN+E6t0r7ScypLW6y8zAoNR
         hs69K4BQFoCGCxqGjglG5LuIDxh3YwopZ4L3PneUqu4+Tuku0JU/HJhWo+CX4XZGjjxv
         fX2GeR0sEr/K5NHtLFKdgi4rWZzC+T23ft/XtXi206TXbIOHSTVOtyvoEbToOyIl/Hcg
         1dop3ms1yiKCERLTncS7KYhAYgfusN9YXocFGE3aFGbeieBHptNFqKvwGeo2Jz0smisy
         zapg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781549039; x=1782153839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ngZSQBSwtFtQY8JlHNMo5cTcp4rz+totgFIqx79Fws=;
        b=h6rYU/obcpva20zo4nb5NRoLkpXOSlDgNuXCENdCvrmD5sPMQbDNWXV50HiARYj5mN
         eaGQHeRi+P5zTtKSf+4vEbJDENbSKw+eocw7UpMyXpXLbTKAqH7PKK2i+zo5gUqc28E1
         oA71gb060K2m6/Ron83p7mmxb8VlpcWfMVmvPZZ40BBHNo0804Mqau8G50STHNt4pRWG
         81y+DFHSs0DJh1Rk1IXGwaV6Bn9rc6Xs+wUKuogwCheW657JdlXjVbGQE7sYWc5LXV9L
         /+QQkPpwJ14y67W27XCWkNELFRX44oV/dMJ19z/3Hrog6ZYEDKF/LMVeKjkaPoRLuZRd
         X4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549039; x=1782153839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ngZSQBSwtFtQY8JlHNMo5cTcp4rz+totgFIqx79Fws=;
        b=Ucjyi8livFc9Xxcoed2pQoxvQ9tLcEw2Dn3txvlgscFsCnnqva67RTV9QcGOabQKln
         dHSMoLtUbFFvd7b/215Gs+FHXJTW0HxmaYm/cJ4X2SMrUpZQjrWULhNEhKtc2HL6NrRB
         mCWqdDCx/NhSRdT6G/+9hoEdf7HYBIxZRcDtrD9ZnCvw5oteqdIV80liHdHX8scxrptK
         ciAu3/CsICmmiAV6yd+bdDW1QauSa4T+azNusEG3L19G2NFedTzpNhVza3xHxC7ohpdC
         OIzg/2uzbMihza7bHUo0heBWHFbG02jwUBXSPMlzlinPnTOkkzrEJaz1tWm9bmdq4dSN
         wdJA==
X-Forwarded-Encrypted: i=1; AFNElJ+vgOjPM/+lgaWPhfKJI4RZqs2R8leFy5Lfuo9aYiDVRQz5eeYYhIQ5ODl9AoGehs+fj8KLpRV/xWXuVL37eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHvKOLK7IaOLXOO4GYWi13Ifi35pZWrkNmGwCGcCeIwCYtrId
	fkPVNrw4FGo5MzYzrPcawSfY2O3liziyQGW+nnTXRfopOXBTDskx9kHXJEtXBRWrFB/VUyb1Vnx
	8hdKoKrlWDijdXZGateXID/TvJsa9gvQ=
X-Gm-Gg: Acq92OGAS2ZhFN8LHmWimktLRtu33REKdzqbmsyvIwNRCTdXtJVUbw86j3nPCq0gmCy
	H/fP7M0fU0ZaRfVvasUmn+fuVPxcP3cRnxkBf7P2Mzh0KUYT9rRUQCh888CLzB7fvSFu77JI26X
	El9oLtepLk9pFasYY/R9flmcEP3uhyatNj8veEnvyJvWgYVgQxN5xapGWjrKbKv8UOXNSD3kmPS
	cwsuG0dJraKdsY+S2iD6R5xd2n9NFMqeC0bk1CSf8hTb+NzZEvHZQplbW6HWOZcYVg0/iIZLxxA
	WEVUvAZqwpiVrhnUSZc00WBT0cuXWcV9xRYg7quvpZU6rfdblpZfa3mwp78zdi2XOceUvlzbzK4
	Wu3P3Ebu5FGntmb2aJ5AybVc=
X-Received: by 2002:a05:7300:2d07:b0:307:39c8:b26 with SMTP id
 5a478bee46e88-3082008c2bemr3416378eec.5.1781549038993; Mon, 15 Jun 2026
 11:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522172558.137415-1-ekffu200098@gmail.com> <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
In-Reply-To: <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 20:43:44 +0200
X-Gm-Features: AVVi8CekAjBoiruNn82EpiYoA074ArwNp5fuglXLTEK2i9XPd1oV1lToj2LL0mA
Message-ID: <CANiq72=-=eE4X1MWGvPPEY2wJs=h-f5rt8_j229ALWJ=y2meRw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 8:15=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> We're now in a new merge window.
> Gentle ping. Any feedback is welcome :)

In case it clarifies: the merge window is for PRs, i.e. it is when
Linus merges everything from maintainers, rather than when maintainers
apply the patches (generally speaking -- there are exceptions of
course), which is a "previous step" if that makes sense.

This means that, in general, your patch may be applied after the merge
window closes in a couple weeks, and then it would be sent to Linus in
the next merge window in a couple months.

As for a bit of feedback below, in case it helps... :)

> > +/// will sleep for at least the maximum value in the range and warns o=
nce.

Not sure if they timekeeping maintainers will want to promise that it
warns (and once) or not (i.e. it is EB, after all), but it sounds fine
to me.

> > +        pr_warn_once!("attempted to udelay() with out of range delta\n=
");

Perhaps:

   pr_warn_once!("Attempted to call `udelay()` with out of range delta\n");

But it is up to the maintainers.

You could also consider splitting the patch into two, but it is not major.

Finally, perhaps you could take the chance to adopt the "kernel
vertical" style since we are adding an import.

I hope this helps & thanks!

Cheers,
Miguel
