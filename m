Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3445347F77D
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246136; cv=none; b=U5ejJsnQ+1h41uY5zWciU3EcWUikC+HNQLSw7hN6QxN2Ff/97XrqVBq/S+2hcq41EIRGfVPH9D67KIlxoeGygENJtPiwB9EwS0s70iKq/jeikkkfwbUMTNG22tl0vxUZXAc1c/PN83QXqvl6afZvpdLzXmrUq6/p1JH0NIpgebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246136; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncQs+RdJeAomVRW3ojyYkOTKUHzgcx6FveWD9wyI3ALkYXkglo37zskUwVYfCNRe6gDkMlFMjIVtU7ISfQSrKlu3Pnnoy+NsY9deKAiBeFclM1zNF5Bn6tJEC9EvKa0Tasdqj8Qfy7m7yiR0ibpKk13b/AyiG4I2iWgOGxjY6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPoIXVf+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPoIXVf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=fPoIXVf+77RlPXLle9CI12IMDkb/k/iv6PSauMft9xTVx5kKI4CsDluWRe0cpDymrdf3/2
	S9ht1O4pkazLX29RJB+/NYwgGyHxB+4Ix+WpoG9jZTffjMYdNFdjWrMb+MybsXf2ci7MW/
	PVQ7qADVs3HcNqeFI1Xlm7KQLw4xC7s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-k-W6KDR4M92PA0SIDzxpcA-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: k-W6KDR4M92PA0SIDzxpcA-1
X-Mimecast-MFC-AGG-ID: k-W6KDR4M92PA0SIDzxpcA_1787246130
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994aebe932so393745e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=cc5oFBDvBd4NdevoSnvzNxA1fHt3yOZJynXJTmsuWR227v6j7xyuxgGILdvS2pReBF
         FcrDxOlQfcElBt5r902vOpjGlQlH/XFkF1L8qN15zZLGafOfiXpDxo1fCcEXfMY6DbpY
         hqrEaGTtrn0ZJqN50PVWXnSXnC71yCpxD1o4OakRxRlkGL5yP32/wOSzou8lj6Lq4aXZ
         w4nvv7KE0r+WaFwCp0wrsBWjez0D/j0kOczmXLs7I8O2a45IB0PgaxVHnij2oIkggQT6
         Lb9mz1xiyvNndO5SEk6MbuV0TJjGCtJf+p0sjMim6uxJr3A4W7qL21jxO5kqN5p5GrU6
         KquA==
X-Forwarded-Encrypted: i=1; AHgh+RogAsFarvFX0cicjxlSn+BOC5OG3Qa5hBjwDjIRHs2iTdpbGkSFZrOoXkgdfUILgL3wtxG6Ozv2aZuFGOvtOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznN9ifBEQA39olShaR+czdpcogKBTts8vWtXnNExkKl0Zi0TDl
	Xwz+ch98Cbo7UUqY6XsGuccljtJY8fs4GzhV/2G7R/BkZRRe1krrfyrzB6IsFC2RIxhwN5/ceK3
	RSi+U6uPEriFh8rq4USWnSchYTbnggdAJnRARWlUqiX+8341Ig720GjljQK7WgWG3NgBv
X-Gm-Gg: AR+sD10roKS1dVIalIDCAn1B4kJ4+RFDHVqKyyGTPlEL/FD2oSIUDQUNdr9hKS3Z20H
	uvct5G+vaSv/pb2SBIWH4p5GrP3C05vOZ39bsveQLoVbhwEE+lyF7N/zKerdgaHdFXskHXnvf0V
	VcnNyKTUVZh/U6Nv41wl3SmOW3IApXZphExa3Di4KVLPBayLS0Ma8Td7RHxhUNg6++Y0JBIiArS
	CDxmvaRS4fCrEOx9/1JLvWmzvSUeB40gljCYaA1SzwQiTSdNTKVLvrDf3xMw8ABghEiOXwK0+Rk
	cAfacaofVdes7C9IZG51c3/BHW3lKqbwGoUE6Zv7Xyqnw60VYTpFmB8VYbiAyv+ugaKgc22NtTm
	E028WKofzHnh/h/dKU9znrzPVaIy8qfLeIfjNnN46k/G9dw==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6845355e9.15.1787246130271;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
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
X-Mimecast-MFC-PROC-ID: 8pdQ0odb3K8EiZJRTLBQ7C4mnSVP7niYDVDzLAVcVyU_1787246130
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

