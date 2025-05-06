Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60211280319
	for <rust-for-linux@vger.kernel.org>; Tue,  6 May 2025 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541282; cv=none; b=THm4GBYzRF4ZzIJczTSxFQhiQBOM6JiP7zD5bm1G0QBk7APJ6CS9SbfOElxJG7mzpxhpBNLHJQUt3DlyjrfgcqSzbH20CcQK/fSJfvbXQKk1YRZQ5YXFOOam33n7n5LF4fLiHNLJ2kXjE6JDwD4Ls2csHrwYGJuYJfquxdon5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541282; c=relaxed/simple;
	bh=v6tIU51WKjF1/NkIyoROw5WXrzlZQWyxho0C1tB5QrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pWsPtsXXS7fT90sbfUl7/TWEgRYPFS+fBSbxjgdIp6CDSpc/Qltuny6Dwufx50R3/oY1Jnts3uJPKVFxeUZL6Eu6MIfIzGZBA2HEWQxCYe+d6H9zdwonU7XoydbkeuUoMjGg5cZWlcsPS7eHHJFrDVCEeVZujLIjNVXdU1+HDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LW2NZVxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LW2NZVxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746541279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
	b=LW2NZVxRZo3I7VuPjsIncMfHo0m4ePjT35uwo+MPMnbqf7qbi7GMPl2xHkvK0/kHYyo0QQ
	pP46XIrr4H4kd998xVbWMIQikDQe9Bg0om+BkBgNMGiFyrvoVB2gdBJLbprHwTs3/bCJxd
	9mw7x9TufHxIGpWAx39bl7UseAukbQc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-WXN_D7erOWq4tU3z7wxq1w-1; Tue, 06 May 2025 10:21:15 -0400
X-MC-Unique: WXN_D7erOWq4tU3z7wxq1w-1
X-Mimecast-MFC-AGG-ID: WXN_D7erOWq4tU3z7wxq1w_1746541274
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso30523355e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 May 2025 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541274; x=1747146074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
        b=omCfUocUAN6eFK6v/LM0lkBCTSXSRgod+IF7wflkvyMKUjCf79uMZQzO0qWw9nzhPx
         839GaxoRS/jfGpppgr3JhHB9qe5pzm8eC+r0rQ8OeJqVPymi3muG/v/YCG6aWTy3zOXN
         2BFe+VkC+IQWMHvue0NbbREzJ42o0pigg9NpgkAgPeE30Ucfpg+qeejv7eljaHC78ZHp
         uVbgJqyRgnMFllFj03WDoOLGQ6YJI7F3fKfdGFFkCY+Nc84cA/nEpZUJa90VLSHqDEuA
         AcGwbxfnjXAjYh/aHkHXMrkcsHbGW/+UfFYWXOr9wDflYM97blsGGwD7lyisjXNdArsE
         Ew7g==
X-Forwarded-Encrypted: i=1; AJvYcCXA0XTCKDGUwACTrIz+ozB60k92aVEyXvr6++esa2Tf6jnHKeHqzpjYsFKjS7ohxJFp/BBLSC64OLL8GdW3LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sqIBWKYcyMmDT/dG/lHUBTZqRNV+/SyZ9V/KKTfilaH0rq0G
	Fx3q7h/74CX6jhqlfN5NtLm+R+pQoi5FRtJCerBX2zimQNVSd2GE8Sggl6+44A4QNzBJFhPO8w4
	G8CA3xbNBMI9GuzW2VWHMGFtfZeCFbyhq8G6WLs9DilU+t+09a2eGTyWZSAPr6m23
X-Gm-Gg: ASbGnctrIHGE2/WXC7uGcmZMpSKpVeGJrXLydOWkBFpDNgCOQAc1LiXaJDQ/uObibra
	eA35GItPaAwp5EKzk+OPxmLI2CMRVOzv2qXaPA9N+I1SmnrnCxQdNb8vudZ0XRTvGTkkCCysjt9
	RRd8pw0YEe9cnxNQv9I97eQKQDn7Ot2HNtX4TuDVniZ+UTz3r2CX6g4DyVjXY5BYriJaUgtIDlY
	RT6MDBHbiYmaYQvj6qpORoPVVYIFCx0xaxNOtxC+ECVwUyMmAd2kC8botpv9ncNxaVy4tPD9Gvr
	GxcD6N7aHd1Lk1DbDKNM8qFeJGaTLJ8ObIjCFXAAl0XqEKr6gIY=
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441d0fccc42mr27860385e9.11.1746541274435;
        Tue, 06 May 2025 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcl3pdRwGtR90YF92Wz2k29+8QkFp4HNoMWwAPK/gnK9MygK9LLY/Q0xnpACkC8ozFWRpQJg==
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441d0fccc42mr27860085e9.11.1746541274068;
        Tue, 06 May 2025 07:21:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630? ([2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm215496895e9.37.2025.05.06.07.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:21:13 -0700 (PDT)
Message-ID: <9876f066-d01d-41fb-ab6c-e474986dfec1@redhat.com>
Date: Tue, 6 May 2025 16:21:12 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code
 and drm_log
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506133143.156447-1-jfalempe@redhat.com>
 <87tt5xvob0.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87tt5xvob0.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OhpPEOJqMC8x9VC_c5LqFPvZSNM7eS8fYRjMK6fXAxw_1746541274
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 15:52, Jani Nikula wrote:
> On Tue, 06 May 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
>> and drm_log.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   MAINTAINERS | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 38df6b159a3b..df3abdcf1767 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
>>   F:	drivers/gpu/drm/panel/
>>   F:	include/drm/drm_panel.h
>>   
>> +DRM PANIC
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_draw.c
>> +F:	drivers/gpu/drm/drm_draw_internal.h
>> +F:	drivers/gpu/drm/drm_panic*.c
>> +F:	include/drm/drm_panic*
>> +
>> +DRM PANIC QR CODE
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_panic_qr.rs
>> +
>> +DRM LOG
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/clients/drm_log.c
>> +
> 
> MAINTAINERS is supposed to be sorted. See commit 80e62bc8487b
> ("MAINTAINERS: re-sort all entries and fields").

Sure, I will move the "DRM LOG" block just before "DRM PANEL DRIVERS"
The rest should be already sorted correctly.

Thanks,

-- 

Jocelyn
> 
> BR,
> Jani.
> 
> 
>>   DRM PRIVACY-SCREEN CLASS
>>   M:	Hans de Goede <hdegoede@redhat.com>
>>   L:	dri-devel@lists.freedesktop.org
>>
>> base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
> 

