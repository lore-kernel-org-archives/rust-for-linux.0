Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B188BC433EF
	for <rust-for-linux@archiver.kernel.org>; Mon,  7 Feb 2022 13:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiBGNjh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384407AbiBGNAI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 7 Feb 2022 08:00:08 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACB3C0401C2
        for <rust-for-linux@vger.kernel.org>; Mon,  7 Feb 2022 05:00:06 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i15so2235047wrb.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Feb 2022 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:user-agent
         :mime-version;
        bh=uYfxIFlTo6MtJflYgUt2hkmOWLPF38Y/O8mFYU/6f0E=;
        b=i+DWBdtxK0jojp+bItSw+LIzlUvhbEyDGckMZht3hdKZgo6kYTxbsNxhJU8iebUnmm
         7NFzZ8qbKMN4R5gBVTblXKNdGpsN/GcQV2UjvpO5tuJJG56SNTabFgE7Bf2Munpwi0dv
         S+fJup2UCKx/k0UJY8AheMUiGzOnvOpXJKDhwZO1hyFx9b/BV9NPXCKioYUkr8nrX0mN
         Ep2ZZN2APWhPlfHgeu/kWxSiLTfF3nALbCN6ea1bRlsDZrqDL9Aor8O5q5PeI/h5gnuv
         eo+NrhrfDyI967d4fTmQJIHRjDFqkGkT+CxvS8FNzCT7xJAhW7CFVA04GxgZr+u0V9+N
         6w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:user-agent:mime-version;
        bh=uYfxIFlTo6MtJflYgUt2hkmOWLPF38Y/O8mFYU/6f0E=;
        b=CK3tKcbafrXxSWGONbJB6seRyT0lpFSZpz/kwPX0ymF/Lx2xS1m3uGOchjtbtc37HE
         h/z0UhlARTtTdncNY3TSzrM866nXY4FFgRSxcBEAD3gJVjI8mMLC4aAKu8p2h6KhFP6a
         jAYJrsaz9nOQmCO7OHoW1uuVPEP0rSRsbEBYBtUDynUbMxeRtHfI3/pVxapnlzs9jVOv
         57a5Eis/2YsivnuxYr6xiSRLA7iDD67AKc9fCDh4jkcdb9HKtELUE33GGYHQ/svoibKH
         T7ZNgLOsQrbZMpuZN0mocieFxVjQ7eiD47EPC3Z2A7alUa1F1mkic/nku6cUdM7OcQHE
         Xw5Q==
X-Gm-Message-State: AOAM531f4zYV580mlNXjgMoMuvkV86fCCmU5HGe0hnNoRo6GT9uT1Ek7
        MhyTY8vBQCx1ED4/OcZ6QeTosNwhGjI=
X-Google-Smtp-Source: ABdhPJykphSZ3QI3J0rw6NDBP/hbyaXTYN2FoogJ0aXwyWFy6PK/FlrO091gkFq9qgtqPQ898XpdNA==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr9922807wrw.673.1644238805262;
        Mon, 07 Feb 2022 05:00:05 -0800 (PST)
Received: from piper.local (dslb-178-004-036-228.178.004.pools.vodafone-ip.de. [178.4.36.228])
        by smtp.gmail.com with ESMTPSA id m5sm9352923wrs.22.2022.02.07.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 05:00:04 -0800 (PST)
Message-ID: <7402ef577a0b41796d88d48bb775165f23b494c0.camel@gmail.com>
Subject: Re: Zulip created
From:   nikolaithees@gmail.com
Reply-To: CANiq72kW07hWjuc+dyvYH9NxyXoHsQLCtgvtR+8LT-VaoN1J_w@mail.gmail.com
To:     miguel.ojeda.sandonis@gmail.com
Cc:     rust-for-linux@vger.kernel.org
Date:   Mon, 07 Feb 2022 14:00:02 +0100
In-Reply-To: <CANiq72kW07hWjuc+dyvYH9NxyXoHsQLCtgvtR+8LT-VaoN1J_w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-yTWxERfFNP5zlcyuz8eJ"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


--=-yTWxERfFNP5zlcyuz8eJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,=20

I would like to request access to the zulip chat.
I will be writing my bachelors thesis on the topic of rust for linux
and in the process might want to ask the developers here some
questions.

Thank you

--=20
Nikolai Thees

E-Mail:	nikolaithees@gmail.com

PGP/GPG Public Key available under:
https://keyserver.pgp.com/
http://keyserver.ubuntu.com

--=-yTWxERfFNP5zlcyuz8eJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEGwZhgX6ULvpiEvOj31bWSbSQeA0FAmIBF9IACgkQ31bWSbSQ
eA2D3g//WdzLGcbWpjZZkp55z2z+b/LRtKQpglAvOJGOyOsBVqGCZmszWbwYXg3P
+HVEcWgrXnNlO2gS6ATsfQMIyo4SwU6KZT39azFP9ApeJvRSW5I9uWD7tqCFSsa+
DQ70GY7q/cDEvTnA7bfxE//XYMnrFS6BpmJsFF4dHkqEAF9PXEdntO+bl+/fgaOb
vKso/tlVeW7elW6j2T+F3ZS8Kd3z/bOuvD6GD7lZ7QiGISL86bk8fDC6xOEH1YOg
dC96Ng/LCwRPaykPUAx3hKk3V8qIgyN5tR6UBEI2bdqOY3VZWmUfYIeVw7ZmM5q2
AIgBtM6TZff8qJNUyy1jeLS96lnKxy4QOBoxOMOOxJufCjRtTsmFHoXjzsJirivo
WpOuoQy0HA1wtnsSEQujZnLjfzH9dJxSG5Ltvg/AFbV99bERN9SlqNMzj4HU01E4
wVhPJUuInTp0aI874mkY30gQfqXaSYy0e5ek8mKTOWmbRAiccvXXs6uwOInpP8jO
/frXs9H0Hcl8H2YXrKMW0YR/IwTSqENbNrFXtaE6QGfn7vuJ9wUjvWWxzZqChVeX
DyUe6mslht/xMtthrJTmZRqAmTGsVipUmeBjTxjitN6XJuFNSC5bO0BKMXpj01P7
9vZ3VU01gY2COoYHxDuikGWVEFJwzu3AqsB8PaRg+ojTypSIJ/k=
=ZjAv
-----END PGP SIGNATURE-----

--=-yTWxERfFNP5zlcyuz8eJ--

