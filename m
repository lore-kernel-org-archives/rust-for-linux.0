Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60E4A689C
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551012; cv=none; b=odjuRP7S69ASVEi/Ed1DKfT305R1MS+btlmWdHhF7NEy++WtpP+ZLBv68OcKNnjFnMMk6m9PilOvyCKGjdNHfRC3GejrPduAlUc3dgp8N7gf42M7fZpbv4TGXlxim3JMi5kRWtlOgKy0776rQrggovCajA5TVMHeEYu0BsR0F8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551012; c=relaxed/simple;
	bh=rVlNPjI4P2z37o7qE9/JXBSWEwGmZChcHXGnM7D9n6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPWn7oMylHPpaBCYdjN3NWX2ptjxUpWFBVp46I1NMOdK4zsvlo5wHCud26hvjlNlZD0oqtfaIsF9rjJuFqk0H/97fi6xlhapyB8JHczqcNbOxpNbFo/kqpUhtcM6Cb2iexTJVBIU7BbnmvocZ9O34Ri08TZwLswgV5mB/c/h10E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fs7uoYbK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fs7uoYbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=Fs7uoYbKDKY066K9mEP3HRx+ID0WQ/kgm9TcfeRaV/m2a/zUOl35CscWm0lj0D1cQaem/v
	8GDTETseFv5XUW4Waf59eLU87zvZeHYcQwD8ZJjWXk95nZSpTwms9w85ZC5lolaTKIUgQt
	SfSDULybjPURnR4f4dhCzrAI3hDsPnU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-4fQCiAdnPR23zIkpWuFUqA-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: 4fQCiAdnPR23zIkpWuFUqA-1
X-Mimecast-MFC-AGG-ID: 4fQCiAdnPR23zIkpWuFUqA_1789550995
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db22383e8fso28716335ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=H+22JjoYa3CLDuxyRb/EjM7YGFvuBUXgsrbkYdJNtFJqE7HjOUayyqRxEucfENdNgY
         hGB/I8ZCKmn6favT9JE4T+EeRPxvFjK6JAuHJIqxSiJMUAxXWl3Mtk0MSw6q/0P8tenN
         nJqKe4k9oGINZ9qcXvOETimWcdt6+lOtG5oILRw5M5luFE3Em3WNuUwAYpR4z5yNjhPs
         9Q4QCeTM/XxzEA/JpCay0HX3uuRjAoHUQKpujVmPEbFRg/vrBhbLz4f+IgaF/PkpW0lG
         CI5FjD7avohdHovGZeeB19CpLltG9nSbAFL9iJQCnMdzUn0tM0T8yo1To6A336mlbrMt
         0aKw==
X-Forwarded-Encrypted: i=1; AKwUvBzf7Unzi7J3Q7ZGWeVeNmlyckP4wQhrdTj/Vw+LUulENPegyPHue7T5vmKfQT5XCeSPGi/tTMQbohfbtoMasw==@vger.kernel.org
X-Gm-Message-State: AFuF++mL0P5ES/LZebq9fEy3DUZ9YgRUMZbnsXI2R1hwXNYdQl7A3tsB
	JY2f5q1BfW24jMWc8/Pjh7ly8l7s0c6a66YgBmWLPFPn8Yeorft0et3QlYlh5VQj+BMaTRqTbz7
	nxaLEAJuZ82M2P0jJCRlrH9wdckTY4V2okfUlGJi30ztXYrc8W48nzthN1ZuY8M8pxMFHXVSfU+
	o3k0yYs2ak9+oDCh4LzAumxe+nlxiV7n+bUCBAFaga9UU=
X-Gm-Gg: AYBFou0YqRNB3vtrAlUcTs8trE4QCWJ+Rw2033S+0Jn9Ag+8ekP9dJG0D2fXyBeUGq0
	l0JaiB2KEbdAWBIGyrWdYD7vuQj8y1mkkSV+p3ypP60hWQP8kfF8k4PKglTXYrdQDiTjqXx4G6w
	t+bAeE+s47NgtqU6edOOiKnVrwpoPEmzyaGISm6CfuUfVzoxM1+H3pcHH/
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798695ad.10.1789550995062;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3dTrkva9xGdcVpR3-krwLbqketHVMZ8iEavhGl56YjM_1789550995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

