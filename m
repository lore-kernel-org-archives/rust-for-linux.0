Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141515EFBD
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538471; cv=none; b=IlY7+Owy8U+SA4C0HwKH2Ge1oXroSelE0bebuP5XAIpuibE+GeGy9NgwxDYS3BlM51/ce68/7huoB52/QAFPxxLL2EVAv3cljzpusY2zaaRSyAg4Hyy+z6BWJqSWPL6rXyMXZaQYpQjiMFg4KVks6g4+xp1nQL08L1erevpyOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538471; c=relaxed/simple;
	bh=7RzKNca/QkECcvWxVOO/myuk9wd5IFNswaBPt3004+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKZxC9DskintaWJ/TlKgyHegNIBOCNV4Ebk1WgYRZ7BicgOqAfhwnnCPL8cQ/m4rZy6Aq2huk/NdlQdJEx64DypTed/KKX0W6CQoa04co0vt+RVyfBcn9U91uhbQWGnOeipz+HbMXeORac3QPDIXaceG3SoYZLzBBZ8iAAO7QaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpG2S/ts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpG2S/ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720538469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNH/JUvn0+ysUAMzZYQyKI5q+v9u1tHdkHt4atLO+0o=;
	b=VpG2S/ts8GYxgQdqza1G0JD4GSGVhvTjjmPKbX7t9Yl8lNJicbMcKtLu3x9t2+mHUKyuNw
	TstWwpcHelBx2srTFN9rNVBsbz55XeoJAsqW8PKHZSYzX4T+ezgh3JvfK7g50Byszcu4IA
	UyEd3Hu8Fc84oWUbb3MAKaZQT6UKQGM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-LaFuSmiDNaya1CR58ymxyQ-1; Tue, 09 Jul 2024 11:21:06 -0400
X-MC-Unique: LaFuSmiDNaya1CR58ymxyQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3678fbf4aa7so3111887f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538465; x=1721143265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNH/JUvn0+ysUAMzZYQyKI5q+v9u1tHdkHt4atLO+0o=;
        b=Ob21kYcJmv0FVKrBphXNuspVTZEglMHSA5PCC+c7M03wZk8aroVcE2cYLROreUJzI8
         Xj1Xr7EdVKNOFeoQ/RwzOLcWIvEUPg8UCAaCZZq34tHSd6fP76qDWDglUsj8qwMiH8NH
         j70Ug4aqK2jP4sJkvuocdU+/xqDKD5t9f57b/r6PiA7QCnL/3eDstHAA0JnYTTrVSIoh
         nhm4YWv8JWO3UzsrULuUNwaqGL8cA3uWh09bxZhNY72P+R0dTcEO5qZ/s5ZRSP1CjCgK
         7YI57JYe8ScQ4l15bHhQ7BcfuC+g4Fc2ZlN1uVMqS1+7QPRpq3PogQncMOjecQljn8ok
         xA8w==
X-Forwarded-Encrypted: i=1; AJvYcCVsIGd0oOmAF1l1EvNSCOLpF2RrHr4GHLXgmdn9EDjICDF32BMzn49KapWOwIQoj3otw9kNnrtlEj5bscRgOTUeDCiF8uPbC4i4gOJYP9U=
X-Gm-Message-State: AOJu0YzppL41rcRon9wwB0iF2t7+vwCyVg5U9TzxNsKPhKFr338uMyEi
	KIzTFOnlHBQTIIig85WGdht6isdiwTw8upQ1U3wOS4JQ5C66S+tcp/A68kjj7DkO9NSeUmwmYAN
	8RRHQHXt/5FJeZAm5g0dM2KD1yl0xx6umBzsvLVOjMWYF9lEGcdVBGlRDif6IgQrP
X-Received: by 2002:a5d:4346:0:b0:366:eedd:afd1 with SMTP id ffacd0b85a97d-367cead16d5mr1592571f8f.45.1720538465140;
        Tue, 09 Jul 2024 08:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjxstTzYlo6ovTn9c0sF83judiGODYb/KLS0GR0HfYpANxaSpYmj1/aVoq/4YjEMxcvUDI8A==
X-Received: by 2002:a5d:4346:0:b0:366:eedd:afd1 with SMTP id ffacd0b85a97d-367cead16d5mr1592553f8f.45.1720538464661;
        Tue, 09 Jul 2024 08:21:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df5esm2868162f8f.22.2024.07.09.08.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 08:21:03 -0700 (PDT)
Message-ID: <a09beb08-ab58-4718-807a-112800fbefeb@redhat.com>
Date: Tue, 9 Jul 2024 17:21:02 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <CAH5fLgh5fb_NYUNPPXYepJg=pbmHAb+-+sOrCxc0n=fiNjTFTw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgh5fb_NYUNPPXYepJg=pbmHAb+-+sOrCxc0n=fiNjTFTw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/07/2024 11:41, Alice Ryhl wrote:
> On Tue, Jul 9, 2024 at 10:45 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> This patch adds a new panic screen, with a QR code and the kmsg data
>> embedded.
>> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
>> compressed with zlib and encoded as a numerical segment, and appended
>> to the url as a url parameter. This allows to save space, and put
>> about ~7500 bytes of kmsg data, in a V40 QR code.
>> Linux distributions can customize the url, and put a web frontend to
>> directly open a bug report with the kmsg data.
>>
>> Otherwise the kmsg data will be encoded as binary segment (ie raw
>> ascii) and only a maximum of 2953 bytes of kmsg data will be
>> available in the QR code.
>>
>> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>>
>> v2:
>>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>>   * Use CStr directly, and remove the call to as_str_unchecked()
>>     (Alice Ryhl)
>>   * Add a check for data_len <= data_size (Greg KH)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> [...]
> 
>> +/// drm_panic_qr_generate()
>> +///
>> +/// C entry point for the rust QR Code generator.
>> +///
>> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
>> +/// if the data doesn't fit in a QR code.
>> +///
>> +/// * `url` The base url of the QR code. It will be encoded as Binary segment.
>> +/// * `data` A pointer to the binary data, to be encoded. if url is NULL, it
>> +///    will be encoded as binary segment, otherwise it will be encoded
>> +///    efficiently as a numeric segment, and appended to the url.
>> +/// * `data_len` Length of the data, that needs to be encoded.
>> +/// * `data_size` Size of data buffer, it should be at least 4071 bytes to hold
>> +///    a V40 QR-code. It will then be overwritten with the QR-code image.
>> +/// * `tmp` A temporary buffer that the QR-code encoder will use, to write the
>> +///    segments and ECC.
>> +/// * `tmp_size` Size of the temporary buffer, it must be at least 3706 bytes
>> +///    long for V40.
>> +///
>> +/// # Safety
>> +///
>> +/// * `url` must be null or point at a nul-terminated string.
>> +/// * `data` must be valid for reading and writing for `data_size` bytes.
>> +/// * `data_len` must be less than `data_size`.
>> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> 
> You don't allow data_len == data_size?

In fact, the QR code will always be larger than the data you want to put 
into, because it adds segment header/length and ECC, so it doesn't make 
sense in practice to have data_len == data_size.
data_size must be at least 4071 bytes, and the maximum data_len you can 
put in a V40 is 3703 bytes.

> 
>> +#[no_mangle]
>> +pub unsafe extern "C" fn drm_panic_qr_generate(
>> +    url: *const i8,
>> +    data: *mut u8,
>> +    data_len: usize,
>> +    data_size: usize,
>> +    tmp: *mut u8,
>> +    tmp_size: usize,
>> +) -> u8 {
>> +    if data_size <= 4071 || tmp_size <= 3706 || data_len > data_size {
>> +        return 0;
>> +    }
> 
> Since you explicitly check the data_len, it does not *need* to be a
> safety requirement (but it can be). Even if it's wrong, violating the
> requirement does not lead to memory safety.

Ok, that makes sense, I will move it to the previous section.
> 
>> +    // Safety: data must be a valid pointer for reading and writing data_size bytes.
>> +    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
>> +    // Safety: tmp must be a valid pointer for reading and writing tmp_size bytes.
>> +    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
> 
> These safety comments explain why these calls are dangerous, but
> that's not what safety comments should do. They should explain why
> this particular call is okay. In this case, it's because the caller of
> drm_panic_qr_generate must follow the documented safety requirements
> of the current function. The wording could look like this:
> 
> // SAFETY: Due to the safety requirements on this function, the caller
> ensures that tmp is a valid pointer for reading and writing tmp_size
> bytes.
> 
> The wording is not much different, but it's an important distinction.

Ok, I will update it, and add the expected lifetime as Miguel pointed out.
> 
> (Also, safety comments are written SAFETY: not Safety:)
> 
>> +    if url.is_null() {
>> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    } else {
>> +        // Safety: url must be a valid pointer to a nul-terminated string.
>> +        let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
> 
> // SAFETY: The caller ensures that url is a valid pointer to a
> nul-terminated string.

ok
> 
>> +        let segments = &[
>> +            &Segment::Binary(url_cstr.as_bytes()),
>> +            &Segment::Numeric(&data_slice[0..data_len]),
>> +        ];
>> +        match EncodedMsg::new(segments, tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    }
>> +}
> 
> Alice
> 

Best regards,

-- 

Jocelyn

