Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DF154433
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008957; cv=none; b=FnRcdO7Ola28kxDlaWjPwY9mkdEfONz6pDHO86QxbraO0VwKdc5AlCu+loz2xRKMm4icvXqZfrXdV98sOZI4cpPhwk5rerlOOKzd/3CJDvNdicGcTmd+AMFWmh3J59KZGaj/twkdQux9uxw1t5Vl1oZ+YjEMD3xN7G0N/kafWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008957; c=relaxed/simple;
	bh=Ty1m/DVP2MMeZudKwC2T1ntAJv1x3TC51t0INfgaiPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfJHz/tR8iC74TgHzpGM941qfq7PAPMzExwIwAvKUWsAd45BLSQ7lxUBrfhdFLTbNrkHFo4d61y6xksFHXp+0KaH+SH2WNzA0+rh4L946vdNl98GnoaOTajlU4rhkSHADErMplmUFUeN5+HxHdIALhL46MnZGDWf/ceoh1h9aeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTVo9mb/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTVo9mb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715008954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HldSJSdjT3waT4EXckeNwGF9fZeNSn3bcC81mHLx7nY=;
	b=gTVo9mb/nd8RXfNE1TrSTvxe5LMf01gNNM5VBl4ClaGkf30UMx/rKWWeIQRa+sXQ/3E77X
	4TE1VW4TsrYqW4yq3rLsQHhbrXDDzRLGUCqys91M4A8i91OitDM6qDzZkkj25mCHczVV3l
	6k5z+8IbrFFSOaLChEpSBUHwRa6x52I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-CtoYgwrrN5ynHee0LzULaQ-1; Mon, 06 May 2024 11:22:31 -0400
X-MC-Unique: CtoYgwrrN5ynHee0LzULaQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34d8ccf34f8so1658570f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 08:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715008950; x=1715613750;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HldSJSdjT3waT4EXckeNwGF9fZeNSn3bcC81mHLx7nY=;
        b=Sfn/NZvYs5H6JinhhtUgBeeYBMl0a7xMbXJKAFGBFF4+2ZeNnn8CdjoZm38hCJCnye
         vghJj6DWdIaHfg3fcdinNT203Ctc4abwjBrb9hAWFApaMx6PuihKkosFeaDAEeFupv5M
         lyhBAXvZmZVCQ2zs9epFo6QTvttHi/xk5nvXyhvlKhKm4U3YF4ZVS1CyZPsadvhgeU8h
         FIKBOGtTDUnnzvbD6tgdnpyWr4utj2T63PFsr3LDBTgVkIh+4hWnLt/ZMUbvs9rOJ3FT
         bLyGDnJwgUp+GahjGGvu2E1xW9K4WZWgnsI2THlmxCD/Uwrf/RHQuJ41YAYowZz/4vpm
         5LoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTaP5DXaDjEE6OvCJmIfFLoQu2JzAJDuzIwJw3uuaYz2OcpPM496dkd6IKuuHOj/KI7+DXy5MAnheAqrOgQuFtAXoyBHxWmeGCp3jAQE=
X-Gm-Message-State: AOJu0YwRp8g6bN0+R3YVQ/bDLq6KPGHdiA8O5ZM0SUvhHIMo+qEnV3fx
	uY7HWMRsDxh1hIwbzUMJoJcf18DdBoFAHU6JxXCMAh24YXSbmWCurmXYGLktW++NWJ7xew+JuXZ
	0yp2PbZCT6hO7gwd+XQuWGkDCKrVoaasyVFEBO1HXx9mO2VchFaooJfFLEA20Qo4R
X-Received: by 2002:a5d:4d04:0:b0:34c:9e0b:f24c with SMTP id z4-20020a5d4d04000000b0034c9e0bf24cmr7098380wrt.37.1715008949978;
        Mon, 06 May 2024 08:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB4JouJfGowWWN7h1y/R1C01iL7fVilY0L8j/xwRjjP2CD+CQcUa+SefBFRG2/Rpis36NPzw==
X-Received: by 2002:a5d:4d04:0:b0:34c:9e0b:f24c with SMTP id z4-20020a5d4d04000000b0034c9e0bf24cmr7098358wrt.37.1715008949568;
        Mon, 06 May 2024 08:22:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5267000000b0034dd13d7a5esm10908464wrc.65.2024.05.06.08.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 08:22:29 -0700 (PDT)
Message-ID: <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
Date: Mon, 6 May 2024 17:22:27 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in
 VecExt<T>::reserve()
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
References: <20240501134834.22323-1-dakr@redhat.com>
 <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/24 16:11, Wedson Almeida Filho wrote:
> On Wed, 1 May 2024 at 10:48, Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
>> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
>> passing a dangling pointer (instead of NULL) to krealloc() whenever a new
>> Vec<T>'s backing storage is allocated through VecExt<T> extension
>> functions.
>>
>> This only works as long as align_of::<T>(), used by Unique::dangling() to
>> derive the dangling pointer, resolves to a value between 0x0 and
>> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
>> pointer however.
>>
>> This isn't a case we should rely on, since there may be types whose
>> alignment may exceed the range still covered by krealloc(), plus other
>> kernel allocators are not as tolerant either.
>>
>> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
>> capacity is zero.
>>
>> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Reviewed-by: Wedson Almeida Filho <walmeida@microsoft.com>
> 
>> +
>> +        // We need to make sure that `ptr` is either NULL or comes from a previous call to
>> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
>> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
>> +        // to be zero if no memory has been allocated yet.
>> +        let ptr = match cap {
>> +            0 => ptr::null_mut(),
>> +            _ => old_ptr,
>> +        };
> 
> I still think this should be an `if`.

Is there any benefit using an if here, or is that your personal preference?

> 
> What happened to adding the sample/test? It should be straightforward
> to do it...

As mentioned, I can send a patch for that soon.

> 
> Cheers,
> -Wedson
> 

