Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A41C9EAB
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332495; cv=none; b=T0mwOVGAb+2yI+BX+Jx//YIR0AleJsrdb08B5e2CZ86iAFn9TJX0SfrAjuPA6NVWuJwp3XoUv8LJGHOgm/hUlezL/kb4W22RQ79P27kvBjeQIfLaAbwyxOmNumicpSlo7gOTcxNaj/VecsEMRU/2C3ZkxHfasV4pstB1HgeT1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332495; c=relaxed/simple;
	bh=L+6BNfcxDE5TGZrnfYWgLyBZkG5GqgShVafF874fWek=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=efmD8tJz5O1rxpQKUJrxkz8X86bAeV42HJTOG2YzQ0XkEl6ooiZPPHttByi5t70HO3UkvMMA+8imOs7Dq0B4+llOp+dU2Du8WknowGORyeYOxvomfN9lcgo+w0XQPJzK52YA+0FzJYyR09WKxAp6ZSoIjMVoHAppuCmNTUkTH60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CjpjZgG6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CjpjZgG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724332492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjpStOY2tZRsWe7659pvw1wDWH9gZfVqjlnowrqh2XU=;
	b=CjpjZgG6Z04cSYk5dKifG9h4tBAXvAnzsO4b0ZZ+LpR4IeZcM74HtqNTGn9OGloot748lL
	yLjhYRMmkuGWtZeVc8KY9+wkQnx8/GrzrZG5rTvsDawZGlXS09ovG0pXY0sVR2gXeTBZUg
	Qw85ZHDDyQs2i1q+QRzJ5PXM17NVy6w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-k6dLcYDHPoe1kN4lxCa5pA-1; Thu, 22 Aug 2024 09:14:51 -0400
X-MC-Unique: k6dLcYDHPoe1kN4lxCa5pA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-428e48612acso8057245e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 06:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332490; x=1724937290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjpStOY2tZRsWe7659pvw1wDWH9gZfVqjlnowrqh2XU=;
        b=QyFr+mCyNctsIfLrMwOkG2oSXKXl08yLXK7ji+pEIj/N+DHZFtk8H9AlBZNpmMmU1F
         9WqBgKo44KJuS/Jr2XCtjzY2rfNhaUaFoImLC5Mk0nN7Eh58tucay1UekBUe7GapH2f+
         Vwx/3w+0LEs5+giXi4kdyXglbzBEkeB3tPcs7Q3QvK1ihfKe6X5nQSINGdykWQjgqJzk
         YSOGWnTct39dM3a5tRWSt1SvCo33aFaTJp4tTEtf8ijlMuwMczRjp4RNxe8MT3EUtk4D
         e3KZzmo1Jafh7IzhlPDPON25bMa1F/6LlX6r0W+828n0GyKSVWO3u3h4qwJFZU+p5Y7M
         16QA==
X-Forwarded-Encrypted: i=1; AJvYcCWFqhkT44Vq2AJA1ZNSwHQa8ctzsKy8uPhXsMPKWz46k/sjN1035MahBqhWYcirRbsXYJdsVW91hYIdPJihiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMeyPREMrhXfz2sM9JNLQjJIqBzcWtqGzv9JLni6eYVXE0fPoA
	gJOIjr/o7K4F370w2E/SSXhNWGc5RFn17ceaaaNn9U5/Mt3+n5SgQ197u+ZcVJ/FryEKrSa31bl
	AzOwWa7F1eRlgG8ocXUDAqdUNZoMxchNIjxkU7sq+4IkeKCMy+ULbcsWuDH03tFo8
X-Received: by 2002:a05:600c:1f1b:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-42ac55cbf78mr16184805e9.14.1724332490422;
        Thu, 22 Aug 2024 06:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhA7gC2VdvVqzYSk0wAWJHB/+5+dYhcALlheQ+TK94kTmFHmle2ajWyTmgc1AUzZnwZ09QnA==
X-Received: by 2002:a05:600c:1f1b:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-42ac55cbf78mr16184405e9.14.1724332489857;
        Thu, 22 Aug 2024 06:14:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac515914bsm24052965e9.12.2024.08.22.06.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 06:14:49 -0700 (PDT)
Message-ID: <0e17c77a-75bd-4ee7-a0d0-8c164b300ea4@redhat.com>
Date: Thu, 22 Aug 2024 15:14:47 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/panic: Simplify logo handling
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
 <20240822073852.562286-4-jfalempe@redhat.com>
 <166850ea-ef40-4868-be26-681ea7a0bca4@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <166850ea-ef40-4868-be26-681ea7a0bca4@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2024 15:00, Thomas Zimmermann wrote:
> 
> 
> Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
>> Move logo rectangle initialisation, and logo drawing in separate
>> functions, so they can be re-used by different panic screens.
>> It prepares the introduction of the QR code panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> with the comments considered.

Sure, I will change the const int to const size_t before pushing.

Thanks

-- 

Jocelyn
> 
>> ---
>>
>> v6:
>>   * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add 
>> panic description")
>>
>>   drivers/gpu/drm/drm_panic.c | 58 +++++++++++++++++++++----------------
>>   1 file changed, 33 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 59fba23e5fd7a..473db5fafb617 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -85,7 +85,7 @@ static struct drm_panic_line panic_msg[] = {
>>       PANIC_LINE(""), /* will be replaced by the panic description */
>>   };
>> -#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
>> +static const int panic_msg_lines = ARRAY_SIZE(panic_msg);
> 
> This type should be size_t instead of int
> 
>>   static const struct drm_panic_line logo_ascii[] = {
>>       PANIC_LINE("     .--.        _"),
>> @@ -97,7 +97,7 @@ static const struct drm_panic_line logo_ascii[] = {
>>       PANIC_LINE(" \\___)=(___/"),
>>   };
>> -#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
>> +static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);
> 
> size_t
> 
>>   #if defined(CONFIG_LOGO) && !defined(MODULE)
>>   static const struct linux_logo *logo_mono;
>> @@ -496,31 +496,44 @@ static void draw_txt_rectangle(struct 
>> drm_scanout_buffer *sb,
>>       }
>>   }
>> +static void drm_panic_logo_rect(struct drm_rect *rect, const struct 
>> font_desc *font)
>> +{
>> +    if (logo_mono)
>> +        drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
>> +    else {
>> +        int logo_width = get_max_line_len(logo_ascii, 
>> logo_ascii_lines) * font->width;
>> +
>> +        drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * 
>> font->height);
>> +    }
>> +}
>> +
>> +static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct 
>> drm_rect *rect,
>> +                const struct font_desc *font, u32 fg_color)
>> +{
>> +    if (logo_mono)
>> +        drm_panic_blit(sb, rect, logo_mono->data,
>> +                   DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
>> +    else
>> +        draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, 
>> false, rect,
>> +                   fg_color);
>> +}
>> +
>>   static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>   {
>>       u32 fg_color = 
>> convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, 
>> sb->format->format);
>>       u32 bg_color = 
>> convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, 
>> sb->format->format);
>>       const struct font_desc *font = get_default_font(sb->width, 
>> sb->height, NULL, NULL);
>>       struct drm_rect r_screen, r_logo, r_msg;
>> -    unsigned int logo_width, logo_height;
>>       unsigned int msg_width, msg_height;
>>       if (!font)
>>           return;
>>       r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>> +    drm_panic_logo_rect(&r_logo, font);
>> -    if (logo_mono) {
>> -        logo_width = logo_mono->width;
>> -        logo_height = logo_mono->height;
>> -    } else {
>> -        logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * 
>> font->width;
>> -        logo_height = PANIC_LOGO_LINES * font->height;
>> -    }
>> -    r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
>> -
>> -    msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * 
>> font->width, sb->width);
>> -    msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
>> +    msg_width = min(get_max_line_len(panic_msg, panic_msg_lines) * 
>> font->width, sb->width);
>> +    msg_height = min(panic_msg_lines * font->height, sb->height);
>>       r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
>>       /* Center the panic message */
>> @@ -529,15 +542,10 @@ static void draw_panic_static_user(struct 
>> drm_scanout_buffer *sb)
>>       /* Fill with the background color, and draw text on top */
>>       drm_panic_fill(sb, &r_screen, bg_color);
>> -    if (!drm_rect_overlap(&r_logo, &r_msg)) {
>> -        if (logo_mono)
>> -            drm_panic_blit(sb, &r_logo, logo_mono->data, 
>> DIV_ROUND_UP(logo_width, 8),
>> -                       fg_color);
>> -        else
>> -            draw_txt_rectangle(sb, font, logo_ascii, 
>> PANIC_LOGO_LINES, false, &r_logo,
>> -                       fg_color);
>> -    }
>> -    draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, 
>> &r_msg, fg_color);
>> +    if (!drm_rect_overlap(&r_logo, &r_msg))
>> +        drm_panic_logo_draw(sb, &r_logo, font, fg_color);
>> +
>> +    draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, 
>> &r_msg, fg_color);
>>   }
>>   /*
>> @@ -647,7 +655,7 @@ static void drm_panic_set_description(const char 
>> *description)
>>       u32 len;
>>       if (description) {
>> -        struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES 
>> - 1];
>> +        struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines 
>> - 1];
>>           desc_line->txt = description;
>>           len = strlen(description);
>> @@ -660,7 +668,7 @@ static void drm_panic_set_description(const char 
>> *description)
>>   static void drm_panic_clear_description(void)
>>   {
>> -    struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
>> +    struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
>>       desc_line->len = 0;
>>       desc_line->txt = NULL;
> 

