Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A1364AB
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537804; cv=none; b=lV7rASrQ5tXoCQeuEj/0Sq2QLd2ByW2sANqpo0h3hkYM6rIkNZxWVdRPjGVRTN+ZQvsBt92QE1pTSFv9GYmIKNegTf3EnFFwDC1+mx3TX9JvBmWlxtYGEL0TOZSiuNsxJqrj2Aj/GhX8t0i2EE/jqABMX2u3ahzqKcXqm0vAM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537804; c=relaxed/simple;
	bh=wFwICZ0x1jaqPpdTYw9PWppgonpXdBKdSE3tMe6h4aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/4IlMcpL9+BVR6yZZZkxSGgu8Sz17nNPTlQJ1n5i5sqEHofvHVi6Yc3jJKnNegSiONEy6iT1npc9T604REJacrM0qflZltn7TquaCxH6svA6m55SvFBkHXtFm4ADEBgBjj2w9JI6TKjKV2oJjuT3x1/4g+A5IXt4iseahtZ2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pp5ASy5b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pp5ASy5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720537801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9hJNJvkqtuDKnpGxwTSSK4Nn/qjZ9Q6M1TKqTLLGIg=;
	b=Pp5ASy5bJ+DQh+el9qTE4nKgIZcnYzDYb2oVIGZ5PcQZ3m8mLgrsdelt+F9rBbyZi1zr90
	UXQO+lh/QUBlVWUOCTnH0wIcYVwode0YlmDMVp4gLfkOuqKILeRY0G8IuJ6wkMsCgp993k
	HPhhEcJN83wi7/c95/uUTzPDY+EUs9g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-WNKOmON9NKieYsAc-TXtPA-1; Tue, 09 Jul 2024 11:10:00 -0400
X-MC-Unique: WNKOmON9NKieYsAc-TXtPA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e9557e312so1053688e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 08:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720537799; x=1721142599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9hJNJvkqtuDKnpGxwTSSK4Nn/qjZ9Q6M1TKqTLLGIg=;
        b=uR0zBuC+EV5KvrNhbVNQdxmgBrWBbGjEVa9FEGSvIU5LQT0gXl55o3jPW8jSKhJo/3
         WgFB5fYndfm4McuhvDmvfe60mHuWqp6n0L6cry/rxEF3CO2jFUDnXfxiqWq40Ei6ypOy
         UVO5rEhEgxmyfUBUFE3m5X9kNb/93YC6qcprj3n+fcabmtP8o3R9tvUQwh58n41kecRJ
         3YN+2aSz0y6kXS4Xo9qk+UQtyjr3VRwDbXmV4x9xWGbe7TjBKHMmm1djTxSonAjStEcB
         NxxqG+GSy3tEDSgrqTJOnR1l4Gd4pZbdCJcOwu8yvC0RP6NZfdez6m4xqR2DQvyQpIRX
         TFPg==
X-Forwarded-Encrypted: i=1; AJvYcCVJb2VTJQNWRxV10NSTdSy+xtRfgUul2UHzySQB+IW+V9NpB/PPMNH0Ic9gUNzq02gJUv1d1cxVyhXXfIXCpkt37Iy/Ltjfw18nz/+P8A4=
X-Gm-Message-State: AOJu0Ywnf9qSS9mSYKoSC1p9nFKC5EhfedipGyvBiXSCXg+ZLU13DWcx
	m5T7jckt4hljpTu5q+SfhM+aNyYfUcdB8IT03DbYEIZmXgSaX4mW6xFgin5sYv4ThpYBfcUTWIn
	RIQDGtRbHneAIPIx5RQ7ML/pVqHMxBblOAnWqiL4WhjMgrTEhDM7wk/OW+UzX1zz4
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id 2adb3069b0e04-52eb99d338amr2146334e87.48.1720537798937;
        Tue, 09 Jul 2024 08:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbH1TZziI+vUJZQonXRAiSIHPZ19o53LoqN4VQ+Pt8OUVGTPQhQfUV73ZUPjiRu5OPM35iUw==
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id 2adb3069b0e04-52eb99d338amr2146311e87.48.1720537798486;
        Tue, 09 Jul 2024 08:09:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09fcsm45581385e9.4.2024.07.09.08.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 08:09:57 -0700 (PDT)
Message-ID: <e19d875c-70b4-4e0d-a481-ab2a99a8ee42@redhat.com>
Date: Tue, 9 Jul 2024 17:09:56 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/07/2024 11:41, Miguel Ojeda wrote:
> Hi Jocelyn,
> 
> A quick docs-only review of the Rust side (some of these apply in
> several cases -- I just wanted to give an overview for you to
> consider).

Thanks, I'll fix all typo/grammar you mentioned.
> 
> On Tue, Jul 9, 2024 at 10:45 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> +//! This is a simple qr encoder for DRM panic.
>> +//!
>> +//! Due to the Panic constraint, it doesn't allocate memory and does all
> 
> Perhaps clarify "Panic constraint" here?
> 
>> +//! the work on the stack or on the provided buffers. For
>> +//! simplification, it only supports Low error correction, and apply the
> 
> "applies"?
> 
>> +//! first mask (checkboard). It will draw the smallest QRcode that can
> 
> "QR code"? "QR-code"?
> 
> In other places "QR-code" is used -- it would be ideal to be
> consistent. (Although, isn't the common spelling "QR code"?)

Agreed, I will replace all with "QR code".

> 
>> +//! contain the string passed as parameter. To get the most compact
>> +//! QR-code, the start of the url is encoded as binary, and the
> 
> Probably "URL".

Yes, I will run s/url/URL in the comments.
> 
>> +//! compressed kmsg is encoded as numeric.
>> +//!
>> +//! The binary data must be a valid url parameter, so the easiest way is
>> +//! to use base64 encoding. But this waste 25% of data space, so the
> 
> "wastes"
> 
>> +//! whole stack trace won't fit in the QR-Code. So instead it encodes
>> +//! every 13bits of input into 4 decimal digits, and then use the
> 
> "uses"
> 
>> +//! efficient numeric encoding, that encode 3 decimal digits into
>> +//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
>> +//! into 40bits in the QR-Code, so wasting only 2.5%. And numbers are
>> +//! valid url parameter, so the website can do the reverse, to get the
> 
> "And the numbers are valid URL parameters"?
> 
>> +//! Inspired by this 3 projects, all under MIT license:
> 
> "these"
> 
>> +// Generator polynomials for QR Code, only those that are needed for Low quality
> 
> If possible, please remember to use periods at the end for both
> comments and docs. It is very pedantic, but if possible we would like
> to try to be consistent across subsystems on how the documentation
> looks etc. If everything looks the same, it is also easy to
> remember/check how to do it for new files and so on.

Sure, I will check this again.
> 
>> +/// QRCode parameter for Low quality ECC:
>> +/// - Error Correction polynomial
>> +/// - Number of blocks in group 1
>> +/// - Number of blocks in group 2
>> +/// - Block size in group 1
>> +/// (Block size in group 2 is one more than group 1)
> 
> We typically leave a newline after a list.
> 
>> +    // Return the smallest QR Version than can hold these segments
>> +    fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
> 
> Should be docs, even if private? i.e. `///`?
> 
> Also third person and period.
> 
>> +// padding bytes
>> +const PADDING: [u8; 2] = [236, 17];
> 
> `///`?
> 
>> +/// get the next 13 bits of data, starting at specified offset (in bits)
> 
> Please capitalize.
> 
>> +        // b is 20 at max (bit_off <= 7 and size <= 13)
> 
> Please use Markdown for comments too.
> 
>> +/// EncodedMsg will hold the data to be put in the QR-Code, with correct segment
>> +/// encoding, padding, and Error Code Correction.
> 
> Missing newline? In addition, for the title (i.e. first paragraph), we
> try to keep it short/simple, e.g. you could perhaps say something
> like:
> 
>      /// Data to be put in the QR code (with correct segment encoding,
> padding, and error code correction).
> 
>> +/// QrImage
>> +///
>> +/// A QR-Code image, encoded as a linear binary framebuffer.
> 
> Please remove the title -- the second paragraph should be the title.
> 
>> +/// Max width is 177 for V40 QR code, so u8 is enough for coordinate.
> 
> `u8`
> 
>> +/// drm_panic_qr_generate()
> 
> You can remove this title.
> 
>> +/// C entry point for the rust QR Code generator.
>> +///
>> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
>> +/// if the data doesn't fit in a QR code.
>> +///
>> +/// * `url` The base url of the QR code. It will be encoded as Binary segment.
> 
> Typically we would write a colon. after the key, e.g.
> 
>      /// * `url`: the base URL of the QR code.
> 
>> +/// # Safety
>> +///
>> +/// * `url` must be null or point at a nul-terminated string.
>> +/// * `data` must be valid for reading and writing for `data_size` bytes.
>> +/// * `data_len` must be less than `data_size`.
>> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> 
> It would be nice to mention for which duration these need to hold,
> e.g. the call or something else.

Yes, it's until the function returns, I will add this precision.

> 
>> +        // Safety: url must be a valid pointer to a nul-terminated string.
> 
> Please use the `// SAFETY: ` prefix instead, since it is how we tag
> these (i.e. differently from from the `# Safety` section).
> 
>> +/// * `version` QR code version, between 1-40.
> 
> If something like this happens to be used in several places, you may
> want to consider using transparent newtypes for them. This would allow
> you to avoid having to document each use point and it would enrich the
> signatures.
> 

I used to list all QR versions in an enum, but I find it a bit too much 
boilerplate to ensure the version is between 1 and 40.
By transparent newtypes, you mean adding "#[repr(transparent)]" to a 
struct ?
I don't plan to add more "version" usage, so probably not worth it.

> Thanks!
> 
> Cheers,
> Miguel
> 

Best regards,

-- 

Jocelyn

