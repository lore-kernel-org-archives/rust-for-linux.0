Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130BA442B35
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132352; cv=none; b=Uwf7stDtuoTJ4xhsyGQ5AjyQqbvQpRhCVIFcUNofxxU0gX29J0xwomALDkM/3FTpWHAB1F/joJ0iLD0uu39WOOGFWZ6hNzZisGDye7mb0rN3ya0+TQrikj0p1e5FWbgNHA16sZJ/MWi8LdtRtxsSO/j0JTlzQ702UStfWDlWl70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132352; c=relaxed/simple;
	bh=zlErMMR25SYOsUd3S/0AwpVYnof7u7gBjzWgLBfix9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdXuSCPNeQW58cJP4fZ073UW4DYaqE7Kwl6t4TlYt8JGBQcRsUwpIqiFCVHvuvD+lXG8Lje2o/a9cpwRk1lQDLHAwJiml9JmMWXx5S6C+waIgVbSj/poJc/FqSmwpiBcvrzEFz6XURLkCdzKZJHAgSAGwSMvVD0s0/OkgKx4z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96944741eaeso261149241.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132348; x=1787737148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=YjGqRwiS2gUBVkCeavbEsmznqkFpTvyJNYUe8Q7kqu6atZehPdQYo6y5zBxPnwO2zM
         MTKnvDhQ0kcySecGvuvdtx1wz186bX9iE0znN3Uwh9YIsy4MV308IOx+08CuhCxIHssR
         qzxTrCLcjDYLAODR0NWGrbLvwaFIHwKRyTKhGd4da4bgHTYdKwo2IBB6C0Tz7nF6gqMg
         7xIR+GNpztNrCNb4F8ADYOWut0YQPSAcgkBMKR2aTrsqrXSsQAw5DNIP6MUiJkWyvFbc
         I+mYURMCBRKxyGj4Zp2jqoF+kMSiTl394MmoJDtSfnd/wppGyIj78YAwXfxGRgXfuTvK
         IBNw==
X-Forwarded-Encrypted: i=1; AHgh+RozmBhS3J5+YqMFHJue38YBhHGvDau/VV90YvPuRpIvsKwgVKS98zjstdPxX0mbFp+8usA0lmLcXiRdobDkgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxABVlLES9F6A0me1UeK+vGAS2laRIKGNpWxJsw3cDcHquJk5EU
	EabKBwGCc+Z1N5aMbnT8HZdZdjZUfufSHZg1361XL9KjTr1ORjOVFwgHQX4cONXKqII=
X-Gm-Gg: AR+sD13eSx8l46TvihGLNdGlEIxNwt6arbU/3GuRfYCZAk6myh7Vd03fR2ReRnZzmtf
	XDR9awBM9I17yS3m0rch+ACxoUWBSDgCrXkgbgfA5iuicvS2QVducADGcmbImyFNe8VYy3UkZCo
	e3yWe9n64fBA3Qab2i2AoSQLy1sbuPl4pVpRt8qAVkw/fiHPpZDhy98LxS58y/+nrMtOI3EM4JW
	vukw8g3BX55NA+xj0EktDPNTGBs0IC7WDbih3mxcNbHWQRCfoTOksm8UgDiuZHfydsdknPhtD+c
	xzWcMeEK/e20OYdGHS0CRp1BN8hBHNlvy2H3ibe3ahQ5UYD3UjF3jS7MXGxGJj5GFiE6cdDT7eZ
	9vazIuzXWjElofUN9V1m3IiP/0FAFQ9HueaptXaWi5vcdJ4C5JKpHqn5/XfCvrl/DuwUXZQtciA
	dNlOfMCmGGxzd1vXly22gy3rs9lNSrFhNu/dVj+I/5U3gasJHZ0coAWeDkMCkqEDQ9dOBWSLkPK
	OMwxUbUNTgvy6ukWGKaicTn2AU1+iBFEJ2PdZDymKfgv0Vz
X-Received: by 2002:a05:6102:3585:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-777f9c84dd6mr793037137.8.1787132348033;
        Wed, 19 Aug 2026 02:39:08 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e75fd76sm1574323241.2.2026.08.19.02.39.06
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-738bcf9a573so322544137.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/J3Q04wgKbeGclZXvhZG6Dq1LQFTCqayNwKbtHoyQllVT1f1x0Z/UdI284LI1izn4lNEyD6rG+SIJjQJ5UA==@vger.kernel.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
