Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F31DDC1E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024836; cv=none; b=bdqRtFJ28KzCoI00B7fqQcC5GwvbdVJGJfeYl44k/5wsSx8+dBGkeBGnXnu30x29euuEiwJ1sM39n85cdQlOxCxTD1iMFg0vEproG5Z3XPGj5/D+m6ujPPI7M0cfTSy5xgf7EGNRxKyt7/t8U2muhXfsJoelXzuz89JFoxLkABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024836; c=relaxed/simple;
	bh=8PEZkTYAQsra0d+4iBrpBpspdJWrowQONz7zLVMamew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGhOWb027X4u+DmiRemMLgYht2QDGtpRbvq5WF5DjSEb91QHv/bKQfHlB4k2ev0H5tpUnunrwu009FfuS+W9UnOAwbQXoi4Q0S1waHsh+bcDfOY2PR3ScRq8t4GXD/mpHrmTpXIijHFEK7Rg1x29cRYEbPcLc+wnLe6zet+/gRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hA3UlaIi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hA3UlaIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
	b=hA3UlaIil1RxKZjO70wss+29doKQN8SAcT1bYeyTl5xWlr37cooRebWmap8Yd2LMixQMMt
	iDCImAGuNoLqjwGpWv00uA4sTVWC19AjW/bfQUrKlIH9knGmN59lfj5v5ABpe1mKEjN0sK
	X2yVydjfOOMMsHkXJWrgXWr/9TUrXuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-aH3albSZOg6ThhFkbK8W_A-1; Fri, 27 Jun 2025 07:47:12 -0400
X-MC-Unique: aH3albSZOg6ThhFkbK8W_A-1
X-Mimecast-MFC-AGG-ID: aH3albSZOg6ThhFkbK8W_A_1751024832
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4532514dee8so13839205e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 04:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024832; x=1751629632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
        b=PKk2TbsKXP9y4SNsJgsOg5dCe2P+mdcldSDqEmyLmA9fWSnW7aIoCWUlREgsRsrCnT
         scbKA2rWZEDpoABtURp2sBsNaUXH9s5IWl3fLBdwLdqoEpycN3lC9tmTwaLnt5gj63Mc
         yk9Y0QIcR9ElNODZ3wNDq//YojwHHE6SwksyKWdlap7crHuPqAroNdKJ2y+W4bgfgx38
         YyRCI0MWBc9IyNO+SR+K+MCDFMz8KrOC1/nG1UwFPCq6Iif/wJ1D27YPzEVFfitDntne
         jMCqQcZzv23riF6AaqyMQV4tV1eSNHrM9XA5AlDA5HGJlxasaUlUngx7epVkabkDD0qg
         UzuA==
X-Forwarded-Encrypted: i=1; AJvYcCVf38ffKH83M2AZtc/YMnmIUL+DukzYKL1ELm5/R11uUKeA65bmDJxB9ilnPbIzTDLjs3Ci3zY/qiWBWagh0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7AQDK4eflxLJpzMB4GHPeQGVO3l+G0QirPUBFlwL5frM/eHx
	8VXXoviIqDFW68cPSepUuvczFBX84Rsy9/lDMhRWpHRkYhjQGkxM9PAGmZuGlpIILcRW9F/oOly
	jRUw7GKgrhN+P3hoAYCpKL453XhgS7b9HMsY6mFSAx2mhiqpLSu2++RSbFEgKU2pjKdEs
X-Gm-Gg: ASbGncvssAng/oKg28pYfteGERFaI9p8B+1o2Gi3BndkH7aoppbzS2f2PwNCGCFmgjm
	u7Z8yyp/l/6SBXt2MXP+Zxp3JzeXTsuZMl4cAwdzTNM4qAJXG4HUOg3IujuMerX6vFHQc8F2zq1
	D+9WEdsxwWBAzHU/Sgd7JGn/Wa9h3Tb6rapXvIzRcvt9BQZ1KWRacdpqj4hKka8aPgEcigsG958
	hi/3ZjW+Ip5AjvvWyK2ht6pfJq8sWNGI9wvt0UL6GovUdjyfnyKfjUV44bQz69wFJOhewJk5jKZ
	j2vHtm/FPOq9eRGb3J/iezwIgu7WPFLHj/9BcUbYyudCFetWqfnUJBmmeYzj8Q==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4538ee15b9cmr28114265e9.6.1751024831598;
        Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1rcgj8WhmZRm4aQKNgi4lgSW/cEGWUMdJSQbENUhm47d/UZivhsYn/wnlHMWu5iFMWgHIA==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4538ee15b9cmr28113965e9.6.1751024831098;
        Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59736sm2475960f8f.74.2025.06.27.04.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:47:10 -0700 (PDT)
Message-ID: <bc7efb62-11ec-4fbb-a911-24cc943a9968@redhat.com>
Date: Fri, 27 Jun 2025 13:47:09 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1MeRD3T__msKi-bdDB6AmLFzW37Wx4fM4qKkOoEQdDQ_1751024832
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/06/2025 13:36, Alice Ryhl wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 32bits ARM, u64 divided by a constant is not optimized to a
>> multiply by inverse by the compiler [1].
>> So do the multiply by inverse explicitly for this architecture.
>>
>> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
>> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
>> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Not to block this change, but I think this really ought to be fixed in
> the compiler. We should not have to do this kind of thing to divide by
> 10.

I agree, I didn't expect that would be a problem. But I'm not a compiler 
expert, and it will probably take time to update the compiler, so we 
have to do this at least temporary.
> 
>>   drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index dd55b1cb764d..82acecd505d3 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -381,6 +381,24 @@ struct DecFifo {
>>       len: usize,
>>   }
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
>> +#[cfg(target_arch = "arm")]
>> +fn div10(val: u64) -> u64
>> +{
> 
> Please run rustfmt on your patch.

sorry, I will fix that.
> 
>> +    let val_h = val >> 32;
>> +    let val_l = val & 0xFFFFFFFF;
>> +    let b_h: u64 = 0x66666666;
>> +    let b_l: u64 = 0x66666667;
>> +
>> +    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
>> +    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
>> +    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
>> +
>> +    tmp3 >> 2
>> +}
>> +
>>   impl DecFifo {
>>       fn push(&mut self, data: u64, len: usize) {
>>           let mut chunk = data;
>> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>>           }
>>           for i in 0..len {
>>               self.decimals[i] = (chunk % 10) as u8;
>> -            chunk /= 10;
>> +            if cfg!(target_arch = "arm") {
>> +                chunk = div10(chunk);
>> +            } else {
>> +                chunk /= 10;
>> +            }
> 
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

ok, I will send a v2 shortly with that changed.
> 
> Alice
> 

