Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853F42BC31
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275219; cv=pass; b=GNajb2gdo5wQBvkz0pYnA5rj0YWcmoAdDYH4ycVM3oLySqlg1q2mt8iNCD+/6ppuHba/zVmNOstA/84/4rXezHqfQcHtO7zANvYkSxHtlS0cfldF+OySqLEVlN49N3KzmnD4hgN6A3Jm5UR+0Vprtlui7szWt8o2GF5/5wih3mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275219; c=relaxed/simple;
	bh=ev9J0QWqNH5ZNHX3bqbieZbsXQx80CERSjNDLUr7qTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sc64Pv1CT8ux0u9FlVOf1f/3mBzfgtj7a1cqvGdIV8K0qPKkchOJKqgCujJ85yb8g+Z2mmTUR/NzQ12lYG6qFRBkWbJ1rv8uZQ7mrmggwoTezHEx2zClae0YdatdOKoy/++JFgpCNzzL/og0M48B7zYVHo/w+eFbXoGfnDBFN1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojFYTptO; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojFYTptO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4a9175181so516706e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 08:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275215; cv=none;
        d=google.com; s=arc-20260327;
        b=P22mwlD/KbQfjENVZ0ha3CuJQltFDU7OOW4idXdU2vBMTV80/w51subw7Tya5gEzb0
         XitTOK0ei2Kuyvs3EUYmGBZ/D3zofIxF185vfLc6gT4iSHvlMUZw8R1uO+Q59Hf77CnY
         qg8OFGu5jIEea2I20zBm2+6OTbQmqyy67TGDVaBvM7t93AcQOPlBfGW0jUM+bQfV/WD6
         7QOsJsiK63QSVOE0NDWxbgXKn0ODQS5WUgVuzo1kqQiiY+BwBDfcoBJKpK7zqHeyFzpp
         sZk35gX6iWyiTqd3WkWrcBXnxGu3VbxNMS6qqKS80zVOagmifT8PvX0sKkDC7uomdb44
         2iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ev9J0QWqNH5ZNHX3bqbieZbsXQx80CERSjNDLUr7qTI=;
        fh=OwVQ+ymGfwl0IhLvB9kQtLqut+ePIkc6gwnL4iGAazc=;
        b=ft9jQJl2bQI4lBH8DncI03fiCe7iw947x4Bzx7rzRuALCSetw38QwelBSsp/86gYCb
         bl3sbI2/iax8bY+KT2DC7v6mpTlT/rczBnC2tHvl3tHE3mly6leBQ6ht34HonbKyUUZi
         +9DyAy7SHf1QK9B1RgzLbyLWvfCsN3PM04TjTY2ymnZ8uZjqjN7aeYyScNfD1ilSvY2j
         N6siyW9PiLBQuadP5gEVyvG+t6vaFhWE+Hl6lj4pUj28w2fQHQ3TFUmlCIJi6NE0f3IY
         sWKTqTAbD/GSocdhzASaSWtSkyZ/taFta2DhW757ylD4W3lQwoV2oP6U/1ADQtcbyf1f
         HyZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275215; x=1788880015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ev9J0QWqNH5ZNHX3bqbieZbsXQx80CERSjNDLUr7qTI=;
        b=ojFYTptOg093KItwGTDsniED485kph4jpgjn1GUwnvzDkH6V3Z3cy+IEfS9Msl+JW1
         aIkYVkGjg74G/23gX6Mlez/RhorJafvpWcOZOvhcU488+nn37jUlym0Ye56gMC3e6nSn
         g5P7HxhlUw8x5DMKb7KS1mSaASIgVTVKtBy3up9jqSTbCLeuw7xrDUALf9yYFdUesU3n
         XFCM/VaqQYaQVv8fQkcye3ANxBIozpNF5g1AcVxOtr0LrPHlgLATJCPR+gRr5e/X0oa0
         5ibOPsldK1gt4lDnIBV+oc7+JEHskyGmiRqcaeuBh4FoEOBM2kWFV1soff5ZZlgnKbz4
         6Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275215; x=1788880015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ev9J0QWqNH5ZNHX3bqbieZbsXQx80CERSjNDLUr7qTI=;
        b=CXG59hU4O1v+NB7j/9UP4G8Temo/8AXvpbwvojVGoJKeoRPOEsPJsWsrPziv1dlYZc
         +9xNpQ51nyTe73Pg08BNRwgGVTDG6KlnPz2t7qhaPrHKkj+ur3JOdZ/i2cM7TMz9drPG
         ARCViHB7a4hqWAm+YeTrOPAKm8VsumismVaqtmyAUSv/Z84spXzGK8tUPPhhXUqm7Jng
         mWYtDe9fb7UJtD9QCvtMfGPm3JwI8EtTiJPQUvan05QDCAqWrKlTCJHyF1aoZv+NJQ6s
         ZatK0ADP+AaUpl380x3HiWGxwNBk3r0DzgIzP6Bj1SOAUzgCuMiH1PP1DwjPAcbo1Zbq
         pDjA==
X-Forwarded-Encrypted: i=1; AKwUvBzMl6cPEGfC+RL6aQzMiNE+0cvB/ItszJKlpvPC0ntZ2winX/t3U2riwucU2VbaEV8ZTDRiuWFyhEI5lEvPbg==@vger.kernel.org
X-Gm-Message-State: AFuF++llYI/pm0ue6aXJsIJppF3XvhIlTFL+vnlEE1FUHjj/eRFAl0G0
	cPuOOyAiIdhq9pbVmxOSHh0xz1aFJ0v8qFGRQmiqYZGGG+R9aSvcz2CI97y98DgTwNePEyTe8Dm
	Ju9aVALLOD5QSnFsv0PU/d80pWw2waTM=
X-Gm-Gg: AYBFou3yIaNnHqN1YPJNyxEnjqcSciAueyvy5w2jAon2qYd2Sj5WXw5nihOTD18/Cgr
	t279VF1RNNsQmqZh6Px7WwlECDxi6YZBEy8uhN60kF+fNLtAx2tZ3fgt6LxnagLSD72jchwIGDN
	BnbuDCEnc5U8DBbVthHwHZuefBRsOCCbycGOrWewjZmemuFr/ij0pSRHd9N2oZn9IBDhL/+BsQY
	L52nNZLQPCqSLLIJKwgAcpolxvyCFIl4Q61jcgY6QTtEIuuIgxZ9vxQmiMPGRtQDGoqNBtVuLL9
	2viLjzdVZkPEnLZapU55twggPkwTQWRpSFILZb9rsssbWFuBhpSrAkECshQdM2YxnCNmsWiYOMe
	kCQoXuUQWx+t3F+2M92BjN6Pv3VVZknJpSZBVaFznpi9AVY4gZE30JY3LSdsb
X-Received: by 2002:a05:6512:696:b0:5b6:4b2:c408 with SMTP id
 2adb3069b0e04-5b604b2c89fmr564382e87.6.1788275214837; Tue, 01 Sep 2026
 08:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m=CJ7ngSBrnteyt07fHNRJ63J7m+=LY7UDHLmwYKjCJg@mail.gmail.com>
 <20260901144433.143989-1-springbreeze@stu.pku.edu.cn>
In-Reply-To: <20260901144433.143989-1-springbreeze@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 17:06:30 +0200
X-Gm-Features: AcwNN1VohMNno_4kCMf8pJYarKFOSSvTqudvhKPN9hm_3z_OOOZ5CCH_N9S5yD8
Message-ID: <CANiq72kE9CxUD7-Zyn4_T_L-ahnj=cr723MsQ61KWC-YS1p9gA@mail.gmail.com>
Subject: Re: [PATCH net v4] rust: net: phy: fix off-by-one bit positions in
 device status accessors
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>
Cc: Gary Guo <gary@garyguo.net>, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	fujita.tomonori@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	hkallweit1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:44=E2=80=AFPM Chunfeng Song
<springbreeze@stu.pku.edu.cn> wrote:
>
> For the older stable branches that contain 2796ff1e3dca but whose
> minimum bindgen predates the raw accessors, I'll send a separate
> backport that fixes the hand-written offsets directly, once this lands
> in mainline.

That is very appreciated, thanks! :)

Cheers,
Miguel
