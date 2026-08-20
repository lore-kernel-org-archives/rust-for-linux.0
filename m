Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B947DFB9
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245569; cv=none; b=Kc84qi70ywYyLKvFGsofwE7ZzVzSBuFm1PfxADQg7Ph+bmh/2aDHJcRHHeu3+eVFVp1LDmYOs3GoN/4vySW7zyuFJsrIICXDdH5yBVGlm1ntsYXlLr+BlxhbeJgkckCsDNsPhtTIcTeHjWgKO7Xe+ad09Y7BE4G+a/prNEilkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245569; c=relaxed/simple;
	bh=s2lcFnu/Uj7kZhM6peVZ6x6b+Y7c35+ltIcEtK5cUCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFbD/nT6U3Awg3WYaSl4zeShiIE2pHjzPdOCCmY5uYZxw8p0SWhKUTjCp4Ow1MeG6YzBNzqeJ1OyZ/P77Md97PvH3oVoJrWnxfRsODUwYm7uKd6Rn20JuHZ2b+RV1SRhif2CqPcorPo23nAxhFUDpBTC8PPvsYFC22PF8a7jDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mbh0hZ4y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mbh0hZ4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
	b=Mbh0hZ4yy8JnolMJz/NQQAETN7Jbx1ewT1aZiVJB4rBmc6uOvCGc9JeRpqIe0+j1kzwjyH
	Hi2wu8KMBvzRnU0I2IzmFsXXXtqgZGzulKKDRIheO6UuUQF/Ol2zqiHm1W5w1+P0Gli9qP
	g0woBba5FjyuBVlByKRAvLR4oaonu5E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-c531fkOdP-aSCRnRqCDzJQ-1; Thu, 20 Aug 2026 13:06:03 -0400
X-MC-Unique: c531fkOdP-aSCRnRqCDzJQ-1
X-Mimecast-MFC-AGG-ID: c531fkOdP-aSCRnRqCDzJQ_1787245562
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f7039fa59so102765f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 10:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245562; x=1787850362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
        b=HnKXjdrAV0L6064d3uIM4U+ug1Sb5amBr1ITAR763lFESFS9xYKXiLM5alMzMUnJ1c
         vxocSaqB/R61Gi5fBBMQWoJYO4AX3NE8tbbeifDcefd+8JI3giMbMly4FXI48uYSjDw+
         y9lOBlZayO02Fvw6GMgu0TTT/Q1ULoKjfJl6u02ZeaD0nv0Smvg4IMe4+sR8lGeowbPr
         sbOdMV20oWMDNbYJ4fqHbxEAsdtrsMSfbpgwf6BCCMPc7sBQaO9RcfUc6EzM1NvMybO0
         GpNrwilJsjvL9PqzrAvolxdnylLQOnOJG4bQjYkK6RO12dGLiCIE4XPNOCTiIkwyNM95
         umBg==
X-Forwarded-Encrypted: i=1; AHgh+RoQUZL0g4AQYed6xiGc6l3sCv163jblLkTB64ldHLpUcK9FEREV3SPgWpvTd4rtHK/lRJ6e+/A646bSGfHglQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l5TvOwi1cJlZ93UuXIIehBN5srOA189nRBekqDbFyqHbWW/EwW
	aucbKXMHButFyDMX48X9o8oOeedDQA4xk4mDMRORRM6eGhIAdHHnRM89aKkdc7sl60jwc0tctPN
	8Y5auFP6ZgizHsOBVUxl6Cwe2GDr4GJTpeJRh0kWpYzOoonO30AJ1MalL2ZQrmSbz8CxD
X-Gm-Gg: AR+sD12YQwRb6RdN+umi9ktAJaPNfNFpQd/aRZfS9C0VQnqb4Oaoy2k/KA6PLwrhVFC
	l9XUI3GCYIEUQyT/6wJ0z4HqUBzpJYfoqT3FGHTh1CY/rrtH3PQ2wDQwFDW8BngKGgYO4j+SZwI
	1hOCUQgxCKbsZvf1xtxoZYH7up6mOcJ46m2a0UNd/P/lnrRe9ZhV6SaP1CF5GfdI2+zvnpms9I7
	bilJ38yJe4Gi+eWlds//+MtoZ1hOzrrdet6yfPzPxLoOiGLgiOxYSlsoiO7NRPKZarrEyFaEbwJ
	w6VHXnvMRqs0jOgX7CZTDeR0Ou8oSFoPh1vLRPC1pIwvZI4cTu4qFgzhqjXgPz3wUISBKZ8HJjw
	kA6yCmhIDdLd9Wyal8mFh21UNh2moeuHyR4P3wrZqhzR5eg==
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id ffacd0b85a97d-482c0ba220fmr134372f8f.22.1787245562178;
        Thu, 20 Aug 2026 10:06:02 -0700 (PDT)
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id ffacd0b85a97d-482c0ba220fmr134240f8f.22.1787245561785;
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14cf0a3sm13674489f8f.32.2026.08.20.10.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Message-ID: <5e7e0d9c-2fe2-4c0f-a854-1b1a495b1a7f@redhat.com>
Date: Thu, 20 Aug 2026 19:05:57 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/panic: Return errno codes if panic output fails
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
 <20260818125012.468092-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Gw-iisCb_W6-Vso7mEXhg7gdMwDTpI7FNaq_v8KXlU_1787245562
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Return errno codes from the panic output helpers to detect invalid
> panic handling. Avoid flushing the display if an error ocured. The
> unflushed display output might be helpful in debugging.
> 
> For now, test the result values in the panic test cases. A later patch
> will add support for retrying failed panic output.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 41 +++++++++++++++++---------
>   drivers/gpu/drm/tests/drm_panic_test.c | 16 ++++++----
>   2 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 96d238bfceee..594235661710 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -478,7 +478,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
>   				   fg_color);
>   }
>   
> -static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -489,7 +489,7 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   	unsigned int msg_width, msg_height;
>   
>   	if (!font)
> -		return;
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	drm_panic_logo_rect(&r_logo, font);
> @@ -508,6 +508,8 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
>   
>   	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
> +
> +	return 0;
>   }
>   
>   /*
> @@ -547,7 +549,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
>    * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
>    * and going up until reaching the top of the screen.
>    */
> -static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -562,7 +564,7 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   	int yoffset;
>   
>   	if (!font || font->width > sb->width)
> -		return;
> +		return -EINVAL;
>   
>   	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
>   
> @@ -589,6 +591,8 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   			start--;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
>   #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> @@ -814,10 +818,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	return 0;
>   }
>   
> -static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   {
>   	if (_draw_panic_screen_qr_code(sb))
>   		draw_panic_screen_user(sb);
> +	return 0;
>   }
>   #else
>   static void drm_panic_qr_init(void) {};
> @@ -888,23 +893,25 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   {
> +	int ret;
> +
>   	switch (drm_panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
> -		draw_panic_screen_kmsg(sb);
> +		ret = draw_panic_screen_kmsg(sb);
>   		break;
> -
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		draw_panic_screen_qr_code(sb);
> +		ret = draw_panic_screen_qr_code(sb);
>   		break;
>   #endif
> -
>   	case DRM_PANIC_TYPE_USER:
>   	default:
> -		draw_panic_screen_user(sb);
> +		ret = draw_panic_screen_user(sb);
>   	}
> +
> +	return ret;
>   }
>   
>   static void drm_panic_set_description(const char *description)
> @@ -951,9 +958,15 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	draw_panic_dispatch(&sb);
> -	if (plane->helper_private->panic_flush)
> -		plane->helper_private->panic_flush(plane);
> +	ret = draw_panic_dispatch(&sb);
> +	if (!ret) {
> +		/*
> +		 * Only flush if we have a panic screen to display. Otherwise
> +		 * it's probably better to leave the display output as-is.
> +		 */
> +		if (plane->helper_private->panic_flush)
> +			plane->helper_private->panic_flush(plane);
> +	}
>   
>   	drm_panic_clear_description();
>   
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index ad2f3a2f93b6..fdd77b0cc54c 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -30,7 +30,7 @@ struct drm_test_mode {
>   	const int width;
>   	const int height;
>   	const u32 format;
> -	void (*draw_screen)(struct drm_scanout_buffer *sb);
> +	int (*draw_screen)(struct drm_scanout_buffer *sb);
>   	const char *fname;
>   };
>   
> @@ -87,7 +87,7 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	const struct drm_test_mode *params = test->param_value;
>   	char *fb;
>   	int fb_size;
> -	int i;
> +	int i, ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	fb_size = params->width * params->height * sb->format->cpp[0];
> @@ -102,7 +102,8 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (i = 0; i < fb_size; i++)
>   		drm_panic_check_color_byte(test, fb[i]);
> @@ -119,7 +120,7 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> -	int fb_size, p, i, npages;
> +	int fb_size, p, i, npages, ret;
>   	struct page **pages;
>   	u8 *vaddr;
>   
> @@ -146,7 +147,8 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (p = 0; p < npages; p++) {
>   		int bytes_in_page = (p == npages - 1) ? fb_size - p * PAGE_SIZE : PAGE_SIZE;
> @@ -182,6 +184,7 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> +	int ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	sb->set_pixel = drm_test_panic_set_pixel;
> @@ -189,7 +192,8 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   	sb->height = params->height;
>   	sb->private = test;
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   }
>   
>   static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)

