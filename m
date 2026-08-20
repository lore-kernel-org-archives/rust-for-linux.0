Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BB47CC91
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245525; cv=none; b=ZUDZGmYy9gYm9zmysBgjjxqhD+SNiVS9QMTLRwxsXyfC0mQzNOZc2kLLgMHjUQRn+QbAes/S35BXMheG3rk+Iccc+O11TfGr/zcQpVmNN8OKET6lzsYpXlfj+gNKLOu/ukWHNXSyMUrZ8F9B2T+SYuItsKoC4sdxE5ey6nmQL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245525; c=relaxed/simple;
	bh=OOvAhEjtRhOw0a+UjXxcotOqI4sqWEFsEYl3cZ0ejEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNQMPz1lIZrwebEIwXmlPOZd8S1PndWNUc7Jj+W8SU4BlErfWlARKDp6LQ0GAVhcuulllWVia3H9SKukGkRaRuPIVlfZMuj8gSzmPUnLnK8j5wSVNlsfgIn9upxMBMx6N60wHZlRYxivEirfAgksZOrcGHUe7Nf0pM+N7ZCNNlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLwjVSLe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLwjVSLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=XLwjVSLefs3y0LTGxk6C/NkIc0TRZ5ZBWgNuZFE2pkXzBuPlByoK/pJSwE9Byri2KYbT+F
	W9Aujb0UBFD1N0Cgd8rkDYIf1mgteZpxiJQc8w5MroA0wefB/Sx1b19SJjvzlA1AYMpLgd
	3EAu2Xx50A8B3SpVKEFuJtv/e1xANQw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-UlsKr6-BOU2N4LeUG-wtYQ-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: UlsKr6-BOU2N4LeUG-wtYQ-1
X-Mimecast-MFC-AGG-ID: UlsKr6-BOU2N4LeUG-wtYQ_1787245499
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso393705e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=Sw9ZSMPQNK8djb3WvBJW9alOgCpiXPfZh1wVW84/oTQPVWeHCy4zBf9StFlfcObydI
         TZcLigcIhZ+sjO953rDRbSicAdikgpmtaTWvHqU2WaaiF3WWOu+GWhFa5eN/pVEIs8Eo
         ZkQa+zk7tHxJOLhNJ+sZdl6wzyjyGva2wu5EyDtxuINzqC16WnQZAU70fVLAXN6bM7Ew
         RTUQQronth3IaP2gSQ2eZdkks5qbEMDpVfzvekGoE25GVuqhMlEKedZv2DNqVDIg6Lgy
         Z3vje7XzzLeQAcQdcZqA6PoQ5QfJkXwAsRS6g1JhF/iCskydjfK5cj6YQgVTDuWZVMov
         RLwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7d6UXkMahura91g4bUv2nm+uefstJEJe2V4cl7HO41IG7VbTQzwQ3tlIA57/Jku9tu36Mwd8ERSX76Dx4NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3hmDnQT4S4HEbF9m7LCeOEasn4VNhTSXPzxODyjdGTj4l64v
	bS5LR1QGNNM5Vl/iHCvaBDv1PUAVlQ+xtj+/N/09D3lxQc/gyjL/uJZix4UJlnKoAQmC5TGGWZq
	eQul0Vjj2kztiosZempoSDUMR0HfPjCc3/Dqw9oeQPnxtAOJ7poe+u39EnwLC/baOMHk6
X-Gm-Gg: AR+sD13IFvDkyuWIxjkqHyQt3Gyms9KpC4r3Kat18ZbXijDO6D34xCDtU6uNzR6vkSg
	TPGSbNVTa6sJ3opYRnc3qcq6cLRaSrZ9K223/PZ438smczAqOEpVnrjO/m+BBvHs13gn65GNoue
	JCyZoNRi7dE9OxUe7zF4q0zHZSp6rzjb7CLPkEubpAYOKxypi7TgIOh350iPWvT/54m2NhTuvf3
	XWyk9QKuED7ly0n+159Tow5SyLOYZPfTavVzgkm8lARczSTOxu/vpzAWy7iSqC2iGAtwZhZU91r
	YGwDQsoBGXBeWzyFxKewvlqO30Z4Nb6DC5NPZ+U8NTMlvP4ItVf0vIs5jNF5DCB9QFV81cZJaAf
	0ONIBjPAxjV2JMGzW/LLeWbEOcJ4LAvejm5jefzL5nPYSsg==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5016795e9.10.1787245499059;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vgjBuRhRSD6hPkUJ8wkiITwkAVg6Pf2zp9Ntad3u7Is_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

