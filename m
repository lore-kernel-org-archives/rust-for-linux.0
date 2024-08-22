Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F1F13C90A
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332339; cv=none; b=m0oUH8MGRevXFc9y5LmkFFAn69qXajcfJN/s8fEWpKQu/ZNCVzRKcw86hoNe9MLCFamAEujGrNuwCCLmn+/UqH/M+h1KXAOgpUEsVgIkP8qYas+2YAalsbYmIR8zeo7tNXizwr/aTEPaTTi/trqzu+09iDD5ayKJr6Ck8lCt4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332339; c=relaxed/simple;
	bh=g04QUxDGFljTIVUlKt74J/ahXEP8Lgu6xBvNQasLdsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mN9frg3WJjcbVV9Za2TpHBSRlV3jtE5nLnArL/VN/G2398LnoOnUVdGvxprq47RsKn1ZChkv2eBOO0ybDPJjjyAzGslH+55ESBUYBS08uom9QbIifY3u5SZN+Eqm/TwZr5nsRaoEesgyCq5lwCs/Sek+Nr86wPWuNWcHIephE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyigHb/i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyigHb/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724332336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEF+0DDPl7ZNGl0E7zRKH64urw9RSLetJWerpVByaAw=;
	b=gyigHb/ipKj3Tprq8vFDBdGwG7q8ODFkK9S7hDKyYAOZBv6b7Ze4hvKBcFaKJ4im5Ipob+
	binFQGcv2XmXCV+YgTU5jnawd+Ei0CmfsQSF9v3ItS6Ado5etcNCJs7zTNHJ22GL9QsoEJ
	4Zhk9vwjpsxHnR+lAYN7elFv47ZJE8E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-Ee6Bi1edMC-Ypfm9nWPzEQ-1; Thu, 22 Aug 2024 09:12:13 -0400
X-MC-Unique: Ee6Bi1edMC-Ypfm9nWPzEQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-372fe1ba9a6so414157f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 06:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332332; x=1724937132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEF+0DDPl7ZNGl0E7zRKH64urw9RSLetJWerpVByaAw=;
        b=X+R48XVB28LLsbfr6xpPkDFK/UKNe9mp9rX4gITZCBQbSDWWYeMAYuUk7jT09qypd/
         PWmCZAIz4dUsXzMdMBPl0YQYeUrqOLJutsMaA2HeqVxo5WHFffu11C5OO6R9IH4JSCDP
         0pAwH4zamoMkHR44vXfVH6Nf3zZ9RM6v50kkhjTe2tJToVz+gwpzKQn8Bh3YboozK1GH
         AKWqStt/+QmXOIS9NrcYKR6Rf2DhvfCKnyI1eaLZMmfFjIDnynwK4OylhvBYXT3LTf9O
         k2wtDoNIcZyVvhdip34fGjXTXgXUX53pobzLC4v6zszViOG5uTRNVaCTyrXOEAKazOkP
         VXgg==
X-Forwarded-Encrypted: i=1; AJvYcCUg885D+inTEkDLQqpLtITZhOqIbDTKsgovz7Q5z92IMJx7vLlkw8H9+pI7vLBckmvwSxOB2ooA7MKJTyRhkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUhH3O/UAQl0GBPIXTWPgBOpR9Goaf9ska3xfH+ZMhbLL/6hM
	c08rRQCHueJ6RaNydPy+vrksuti1wfN9z/bE00qMbMbRHwRuYNdxh7hJSazs7WFF25pjaWQ0d2u
	hupZu1MgAD5C31Z9QnSxKPIpqTHU7F8xbdjPIAGSfyrpoypIGpLqxfjQFGxHrqvdK
X-Received: by 2002:a5d:5e11:0:b0:373:b3b:9f62 with SMTP id ffacd0b85a97d-3730b3ba074mr953652f8f.38.1724332331847;
        Thu, 22 Aug 2024 06:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDq2m7q4T8mvCQJ8ZlmkCjIjVWzVYAgF/3CVbiXdiB6c5TercGvJ578lxX8JpG5tDymv72A==
X-Received: by 2002:a5d:5e11:0:b0:373:b3b:9f62 with SMTP id ffacd0b85a97d-3730b3ba074mr953629f8f.38.1724332331294;
        Thu, 22 Aug 2024 06:12:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730821ab05sm1641474f8f.98.2024.08.22.06.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 06:12:10 -0700 (PDT)
Message-ID: <d5de80ed-adc2-4307-bb57-27fc4e611100@redhat.com>
Date: Thu, 22 Aug 2024 15:12:08 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/rect: Add drm_rect_overlap()
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
 <20240822073852.562286-3-jfalempe@redhat.com>
 <4b5c6ba2-e16c-4884-a067-8d9ab7ad35f8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4b5c6ba2-e16c-4884-a067-8d9ab7ad35f8@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2024 14:58, Thomas Zimmermann wrote:
> 
> 
> Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
>> Check if two rectangles overlap.
>> It's a bit similar to drm_rect_intersect() but this won't modify
>> the rectangle.
>> Simplifies a bit drm_panic.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> There's an optional comment further below.
> 
>> ---
>>
>> v7:
>>   * rename r1/r2 to a/b in drm_rect_overlap() (Jani Nikula)
>>
>>   drivers/gpu/drm/drm_panic.c |  3 +--
>>   include/drm/drm_rect.h      | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 0a047152f88b8..59fba23e5fd7a 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct 
>> drm_scanout_buffer *sb)
>>       /* Fill with the background color, and draw text on top */
>>       drm_panic_fill(sb, &r_screen, bg_color);
>> -    if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>> -        logo_width <= sb->width && logo_height <= sb->height) {
>> +    if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>           if (logo_mono)
>>               drm_panic_blit(sb, &r_logo, logo_mono->data, 
>> DIV_ROUND_UP(logo_width, 8),
>>                          fg_color);
>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>> index 73fcb899a01da..46f09cf68458c 100644
>> --- a/include/drm/drm_rect.h
>> +++ b/include/drm/drm_rect.h
>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct 
>> drm_rect *dst,
>>                 drm_rect_height(src) >> 16);
>>   }
>> +/**
>> + * drm_rect_overlap - Check if two rectangles overlap
>> + * @a: first rectangle
>> + * @b: second rectangle
>> + *
>> + * RETURNS:
>> + * %true if the rectangles overlap, %false otherwise.
>> + */
>> +static inline bool drm_rect_overlap(const struct drm_rect *a,
>> +                    const struct drm_rect *b)
>> +{
>> +    return (a->x2 > b->x1 && b->x2 > a->x1 &&
>> +        a->y2 > b->y1 && b->y2 > a->y1);
> 
> I found this hard to understand. You may want to use the existing 
> _intersect helper
> 
> bool overlap(a, b)
> {
>    struct drm_rect tmp = *a
> 
>    return intersect(tmp, b);
> }

I considered this, but it creates an unused rect, and compute the 
intersection rectangle, which we are not interested in.
Even if the compiler may optimize and throw all this away, I prefer the 
more straightforward version.

Thanks for the review,

-- 

Jocelyn
> 
> Up to you.
> 
> Best regards
> Thomas
> 
>> +}
>> +
>>   bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect 
>> *clip);
>>   bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>                 const struct drm_rect *clip);
> 

