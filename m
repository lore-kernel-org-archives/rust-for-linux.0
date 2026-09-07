Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12C3F660F
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814866; cv=none; b=d+ZTqmvM5h8qqqwUubKmGLtNytH9mAVMAOW/C8KYVRRWc0CpjF2TTmJsCuwORMQ9Z72jwq5KStVEBjQ6/dssBEMAR9uNgVDsgH4Yb1uriGrl+xgMVotmseO9cAPRBEuW89KqM6i2+iPTtblvqow0N27afHbuOdr7fyhVzEBe0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814866; c=relaxed/simple;
	bh=Pfp4fHaGp3DYNoQNsq++Hih2POFfdEHNA9k/g4/DYlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX424X+6BbogoL0oGB3C7EdZi8ttl94smUrF0swcsZZNPA1IvFOdsY2vgzCUAdWGMgmNubBSqRm4cSDo0v34fpi1eXWPmMuJaDUoOVKz2qd6Y7gZdWC5lMoNMvdfWpkteJYpyCIKn7oxDHgKatAfpkQdEMwnGOZqpWYV7B9qqbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4srLzoR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788814864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
	b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
	aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
	v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-MuIgc3TaMFSJxI1ZBcyoWQ-1; Mon, 07 Sep 2026 17:01:03 -0400
X-MC-Unique: MuIgc3TaMFSJxI1ZBcyoWQ-1
X-Mimecast-MFC-AGG-ID: MuIgc3TaMFSJxI1ZBcyoWQ_1788814862
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4957287363bso31423285e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814862; x=1789419662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=c/YkvIf8kU3LoBH+y1EUGj/8U9cmiZ60tdL4gIzRxVU8/e6lQojyBznJ5FN9IC1E8Q
         nr0j8+xK1qKDzI10pZJFAhCBbK/QzcIE9jYXY0eHN9ZPsHPJ6apxW97KetfwDzloIO+Y
         fKRgeOUsUYbDk8O4y5y3gSFZpNZvdNSrWq4oIdonlg38DgQnt3t75ZSbDQK0mgzO1nrH
         lBCl79wKYxheU+DoUtsLxj3dVIMb76bzOtauxcbnaE8LZkQIDJgYL9XAbLeV+fFNh7oG
         0V6InbRrHKoV3Axr26sOFMJgNRAsu4Wb6cO8b4JnXxXXzmjUC9HnTdyCfMuAF+Y8BjR0
         /LeQ==
X-Forwarded-Encrypted: i=1; AKwUvByeq+gSYskiG0yS+Lid4Jc1RxHH7LFuVWnBmCVLihRSV5//pk+vk0wPdXZ7KGdqerwj/4526I3LtzX7K8bNsg==@vger.kernel.org
X-Gm-Message-State: AFuF++knuU0soo8qXhPdvj7fHiGpsmZVNRSLA7s0rq0peEw4pfzbRbgU
	to/nbMCi7iPG84rarT9lRxP2AXwpLV2cfBOqzCuYVLbz4Ci5xWOFRFp3PvRjytuSnOgyEpdIWQ+
	HtPbcaWpwVk2kqaZPSEO4noOPQY3x8wYcP/MCvQC4UgsGaa3Y+uxFpz0qMMKa7I8quJOq
X-Gm-Gg: AYBFou0FstyhRtaoI2aJBDn4d7/+jCI2xjLgBxbFFbkQr6FzOZKrNGl7n/zCxNNdpNP
	+fdl5Zqw9TF5gjsoYmigxTxQ7aSrH502T1WffxcC34uHfS2RwZoYnVx++nRDyTulChly5PgBCR8
	at9BPhMi20hm4hp3qyI8Rw00z8fxtTnZYa6SpNL+Bq12CeSwiQOrVna8Obcke4TvXbKpEEGHAeK
	pebAECZtCyxEEGCo9i7rcidWM5H8o3yIX5qEPNUihBLYdZGKUA+TgxFFdCZVeXGzR+srQ4fAYx9
	UsDPdzGW32ccmNdo5BPInuXL1HvyWpb0gr6ykba8X2jX7HMTPKbmPrDmTPOL+O3PYpIv3AirIlj
	DjsAbJExTVd1GQ53vgjVVn+rOP6ED3q4SvJ2+DucNiTbuyO5h
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167275115e9.33.1788814861709;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4fWtFDkAJns0Ch1mxHXcVrYK-z3TLmXmFt0h_eqrOXg_1788814862
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

