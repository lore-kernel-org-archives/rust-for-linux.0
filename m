Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF5A47DD59
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245967; cv=none; b=Hp1imhb9//aL1ZfNgnML0vFnwSSP0bnbuWeZsScylnxMuKiR43QsrBPeSTnoW/G21OCu+jzY2buSxe4zKRrIla8HGoH0cKpv/7jajGTY0Ik+mMnCyWoD0wYp5KJc30L2NqAzOzpTFHOUlvLyuJQLookj90auMMQSAzrd0I7t7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245967; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uhznf7GNDhIArDCdlD7MlNuuyEVML4oM1DZx7qZab+5cM+TxP14hm6ow3roHL3lzS2ioSMp18jQNFMzjC+30yrQKviC7VVN6JktecwAUNA68OlgFjUdtRo4CBQDuRpfTwfaMKFFfXRU3T/6FfgciwrM2Fsabt+DPrqiZszVXzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NoEikRvv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NoEikRvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=NoEikRvvJIAzGCqVeHpMYmaZyqwNeXYtWFmCUrJ6iwJSdmj4d8N/JxKGCRK3x+L78NWzQw
	ePpXZk41riAr8CwApp7591gcfBMt3z+tgxq+Re/FLEH3WgmNtNaHSWugud7ZayFrPlMgpY
	O2/opja3r6FCvwJVZW1wAPuXtKYMfhI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-2JhkOKsWOlqe5iJNKCo-mw-1; Thu, 20 Aug 2026 13:12:44 -0400
X-MC-Unique: 2JhkOKsWOlqe5iJNKCo-mw-1
X-Mimecast-MFC-AGG-ID: 2JhkOKsWOlqe5iJNKCo-mw_1787245962
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4957287363bso472565e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=KFZGeGNoMxTBfZ6oskCTZLYrMTYeWVoKPhQAj0l3+2h7LSXgLGIdAALO77bFuQmCV4
         dBbOH9K868fY4vfXw1m+Wb3EnsKoiHkW6qFC8aho/zv0nq+Pm++M7JJl8PUcBNJEKDdK
         kel/K/pfYN6FSJyZ9zmiDDR9zL6yd45UJmMhNmpirKob3TUjmMgqNxXWLu5O6jFX/ueZ
         WAsBHxvr7t10m8UMXWhna4SMOcm9CvkgHiiWrjflgd1OebgiNWFemp3HBfO7iiSk7+xL
         Ni2ZJ8s0+qMUxFrxatKiAVrZyvXHymbbGREAPZ07huDtu8R0zOp+8c6WlAmK3y9HbU21
         hojA==
X-Forwarded-Encrypted: i=1; AHgh+RpuYU7WaxHeLI5oqBWnTZ17S/suPAxyUA6zRrWrOYmfuY4q7IIopHnbIZhNEKqOGiDNt1TUQUeGGDjY4fQQBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMOqsXJ8dloTCiLblPRLBfGUiSXbl8/XuHa/a74RuCJmIB64G
	ukpByLQtfrfrs0SHmgT9KnMsjo27ns/HctamLhL6IZm6Ukl/1wNLcnl6E4dqjssAANR4BDjiq8B
	pfk7tqteMqg4rfgavJCdU/Y09v7j9U26lj0C4Lnvwid1/WiEP/F7ayyLs7nrEdSi1pbhi
X-Gm-Gg: AR+sD128/SUj6Kq+qJOnXQjvwpzClmWOhsYonkYQs62pEy9uoJhobBuPbNYTngIMOQu
	8SOrysBivnQVVbZnICDlKpFnxG9WXBb+KxVXCz99hJGWcmFkPnLjEsdbbbCHCy09bd7XM/clLTR
	tzDO6e2UxHb7Bn9nJVIX5FqFvMa/xVhFDfOG61KwiIvIAuUsmj3Nnefmdga+WUqhrWWEupBDfkY
	Zc559HpgiIW3OFG+8DAQ7PWk/CXcM/55LQio4H20+P8NI+ez7plNjEFS823fo4zC7bbikG8N3Ok
	4hpnRqsJOshnHMAsFMGTDSA+x6yUmB+h1odNd/PQoMK3MFqAsZ+Z/UgRKb46bxG9InFmHidbJIC
	2QF/t6OI6qXMd6iG9am19gzqtzWX+8wX6uws9mkLUAeq/Hw==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7853205e9.14.1787245961735;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
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
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 34eYasA19kG1kRZRKBwVvRs1dDXrYRS6G65e-x26gYI_1787245962
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

