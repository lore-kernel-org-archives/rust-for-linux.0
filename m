Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE9171E5D
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093040; cv=none; b=Ic/kNprzbfCQxZxTwXZdj8XY/QorlXayx0QoYRIqEza2+N0iDBk+owmHHoHZjiaWK9v44ldxuzSpXVrbyytswgIBbci1bCoxoSxoL0scwC4U9IdR+YMBZMhMWhUvmiJFhc8YPbjcq2pn0oZbS0nPt/C/5MG+GlYhfbOfwRsUwvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093040; c=relaxed/simple;
	bh=WGdd1IuYyevNR0+ntRFyrYUo9pUJE79CWZqS/30oJHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOMMFZIOr0y1+t7a36NQx2Vnmta/k1QalHLgcXgvUIhPzSlLjumIshEW4oU4Pydc3FdNtQ0Zjn2VVsx41PF7nxGlDWF06EW2ddQmunKKKRq+n+xvcNLsQHQyRQLTRBqm7+CSVlwyUxmzGYhzjJlAv1+sZp6iq1GKqARIVr+L1aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bz5esc5m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bz5esc5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720093037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqyBX3zArIOTroiktpF738HmfBUreaQ6KV57xDF+BEU=;
	b=Bz5esc5mcft2fk6BgpeLa/GsquiN97j0OsaTw60AHQjHDgc9jq0qDu1Hik1I6gM1SVxS2d
	XEonE5jYuxpGkMFHsY5bWZtiH47zzjamTQJBjA7xPP/sktdC6p14uEqcm3jKgQG029URGQ
	NYChLIR1df8oT/CApUZfQFFDBJ1VNzc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-f0EZkivMOkuWWg6RjKw_qw-1; Thu, 04 Jul 2024 07:37:16 -0400
X-MC-Unique: f0EZkivMOkuWWg6RjKw_qw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee86eda4e4so5459921fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093034; x=1720697834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqyBX3zArIOTroiktpF738HmfBUreaQ6KV57xDF+BEU=;
        b=JkBJZeKkel2nj2NVlkVeAlF9wEEost+8iblx4rRLnu9J3yimjxeOklsZBzh2i2QfIU
         c88Pa0lGcfzaKL1UEqai8TtPfxtI8Of0/ilzyC3xNLCROlKele1GckHv7gHZMqjzYyQq
         lRr/pPplVI9kXk2IlHVeog44Dz2iaLQJQ3uy/u9k1X+Dxj4c46ZXC/9aBjuOA9JEMo1E
         9icoNV615LWADNFFu187XzBcyjCZJUIR+Cpu3lIhlPaiXUclCvzrLzNmsvGw0MWdQtXC
         RyJKrWWFYqwpv1qhT/bVo3qYWq3edf96e0bGdUjxSatyjZ98t86S+C8hwWOq6MU049A6
         GSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtk407zGLSjmpCwBAVQVjlkFl89OVvDvkTAEP3sys2Z2U259zoEgCk2bS/UCQiGVGL7ZFRKAULy70BLhm4s/3Vj9+twHXqSFnal+R2LhU=
X-Gm-Message-State: AOJu0Yxv3N6SPpWit9nwAmeoT0mHigeQfh4Cwx/ToYRY5WpyChoz0woN
	2Qhv+ZuEHlp9yBQGqbsmtMCIaUHMp20aKHOu14O0ViCxo7Av7HwM/RIlzpDobhNDEop1UexgmwV
	iVpJq+E3a8el3MQqKaqAJHdmsAfH6sGeaqS5GzYpO8JbPXIkr0GCmNbzCY7jx71/zqTSuuR67kc
	I=
X-Received: by 2002:ac2:5924:0:b0:52e:9d60:7b4c with SMTP id 2adb3069b0e04-52ea06e48cfmr845865e87.61.1720093034223;
        Thu, 04 Jul 2024 04:37:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAC+hNiL1prnnUa5FO1O3uWyIwQgxomTMRgam+LYoxR1V6bY9ndbxw7Fh3Zy/p1THh1JG3CQ==
X-Received: by 2002:ac2:5924:0:b0:52e:9d60:7b4c with SMTP id 2adb3069b0e04-52ea06e48cfmr845825e87.61.1720093033739;
        Thu, 04 Jul 2024 04:37:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm20944305e9.7.2024.07.04.04.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:37:12 -0700 (PDT)
Message-ID: <d35ed036-209d-43fe-bcf3-91b218df4142@redhat.com>
Date: Thu, 4 Jul 2024 13:37:11 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panic: Add a qr_code panic screen
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, airlied@gmail.com, alex.gaynor@gmail.com,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gary@garyguo.net, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, tzimmermann@suse.de, wedsonaf@gmail.com
References: <20240703154309.426867-5-jfalempe@redhat.com>
 <20240704091109.1453809-1-aliceryhl@google.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240704091109.1453809-1-aliceryhl@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2024 11:11, Alice Ryhl wrote:
> Jocelyn Falempe <jfalempe@redhat.com> wrote:
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
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> This is pretty cool! The Rust code looks reasonable, and it's really
> nice that you've isolated all of the unsafe code to a single place. That
> makes it much easier to review.
> 
> I have a few comments on Rust style below:
> 
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> new file mode 100644
>> index 000000000000..f4d7a3b8a01e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -0,0 +1,989 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +//! This is a simple qr encoder for DRM panic
>> +//! Due to the Panic constraint, it doesn't allocate memory and does all the work
>> +//! on the stack or on the provided buffers.
>> +//! For simplification, it only supports Low error correction, and apply the
>> +//! first mask (checkboard). It will draw the smallest QRcode that can contain
>> +//! the string passed as parameter.
>> +//! To get the most compact QR-code, the start of the url is encoded as binary,
>> +//! and the compressed kmsg is encoded as numeric.
>> +//! The binary data must be a valid url parameter, so the easiest way is to use
>> +//! base64 encoding. But this waste 25% of data space, so the whole stack trace
>> +//! won't fit in the QR-Code. So instead it encodes every 13bits of input into
>> +//! 4 decimal digits, and then use the efficient numeric encoding, that encode 3
>> +//! decimal digits into 10bits. This makes 39bits of compressed data into 12
>> +//! decimal digits, into 40bits in the QR-Code, so wasting only 2.5%.
>> +//! And numbers are valid url parameter, so the website can do the reverse, to
>> +//! get the binary data.
>> +//!
>> +//! Inspired by this 3 projects, all under MIT license:
>> +//! https://github.com/kennytm/qrcode-rust
>> +//! https://github.com/erwanvivien/fast_qr
>> +//! https://github.com/bjguillot/qr
> 
> Generally, documentation under //! or /// comments should be written
> using markdown. In markdown, line breaks are ignored and do not actually
> show up as a line break in the rendered documentation. If you want an
> actual line break, then you need an empty line.

Thanks, I didn't know about this. I'm now playing with rustdoc, and the 
output is really not what I expected. I will fix the rust comments in v2
> I would format it like this:
> 
> //! This is a simple qr encoder for DRM panic.
> //!
> //! Due to the Panic constraint, it doesn't allocate memory and does all
> //! the work on the stack or on the provided buffers. For
> //! simplification, it only supports Low error correction, and apply the
> //! first mask (checkboard). It will draw the smallest QRcode that can
> //! contain the string passed as parameter. To get the most compact
> //! QR-code, the start of the url is encoded as binary, and the
> //! compressed kmsg is encoded as numeric.
> //!
> //! The binary data must be a valid url parameter, so the easiest way is
> //! to use base64 encoding. But this waste 25% of data space, so the
> //! whole stack trace won't fit in the QR-Code. So instead it encodes
> //! every 13bits of input into 4 decimal digits, and then use the
> //! efficient numeric encoding, that encode 3 decimal digits into
> //! 10bits. This makes 39bits of compressed data into 12 decimal digits,
> //! into 40bits in the QR-Code, so wasting only 2.5%. And numbers are
> //! valid url parameter, so the website can do the reverse, to get the
> //! binary data.
> //!
> //! Inspired by this 3 projects, all under MIT license:
> //!
> //! * https://github.com/kennytm/qrcode-rust
> //! * https://github.com/erwanvivien/fast_qr
> //! * https://github.com/bjguillot/qr
> 
>> +/// drm_panic_qr_generate()
>> +///
>> +/// C entry point for the rust QR Code generator
>> +///
>> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
>> +/// if the data doesn't fit in a QR code.
>> +///
>> +/// url: the base url of the QR code. will be encoded as Binary segment.
>> +/// data: pointer to the binary data, to be encoded. if url is NULL, it will be
>> +///       encoded as Binary segment. otherwise it will be encoded efficiently as
>> +///       Numeric segment, and appendended to the url.
>> +/// data_len: length of the data, that needs to be encoded.
>> +/// data_size: size of data buffer, it should be at least 4071 bytes to hold a
>> +///            V40 QR-code. it will then be overwritten with the QR-code image.
>> +/// tmp: a temporary buffer that the QR-code encoder will use, to write the
>> +///      segments data and ECC.
>> +/// tmp_size: size of the tmp buffer, it must be at least 3706 bytes long for V40
> 
> The same applies here. When rendered using markdown, the above will be
> rendered like this:

Yes I will fix that too.
> 
> url: the base url of the QR code. will be encoded as Binary segment.
> data: pointer to the binary data, to be encoded. if url is NULL, it will
> be encoded as Binary segment. otherwise it will be encoded efficiently
> as Numeric segment, and appendended to the url. data_len: length of the
> data, that needs to be encoded. data_size: size of data buffer, it
> should be at least 4071 bytes to hold a V40 QR-code. it will then be
> overwritten with the QR-code image. tmp: a temporary buffer that the
> QR-code encoder will use, to write the segments data and ECC. tmp_size:
> size of the tmp buffer, it must be at least 3706 bytes long for V40
> 
> I don't think that's what you wanted.
> 
>> +#[no_mangle]
>> +pub extern "C" fn drm_panic_qr_generate(
>> +    url: *const i8,
>> +    data: *mut u8,
>> +    data_len: usize,
>> +    data_size: usize,
>> +    tmp: *mut u8,
>> +    tmp_size: usize,
>> +) -> u8 {
>> +    if data_size <= 4071 || tmp_size <= 3706 {
>> +        return 0;
>> +    }
>> +    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
>> +    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
>> +    if url.is_null() {
>> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    } else {
>> +        let url_str: &str = unsafe { CStr::from_char_ptr(url).as_str_unchecked() };
>> +        let segments = &[
>> +            &Segment::Binary(url_str.as_bytes()),
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
> It's very nice that you've isolated all of the unsafe code to this
> function. That makes it very easy to review.
> 
> A few comments:
> 
> First, all unsafe blocks must be annotated with a safety comment. For
> example:
> 
> // SAFETY: The caller ensures that `data` is valid for `data_size`
> // bytes, and that it is valid for writing.
> let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
> 
> Unsafe functions are those that can trigger memory safety problems if
> you call them incorrectly, and you must annotate calls with a safety
> comment that explains why this call cannot result in memory safety
> issues. In this case, you can just say that the caller promises to pass
> you reasonable arguments.

Yes, all these buffers come from the C side, so you need to trust the 
caller. I will add these safety comments.
> 
> 
> The next unsafe block is a bit more interesting.
> 
>> +        let url_str: &str = unsafe { CStr::from_char_ptr(url).as_str_unchecked() };
> 
> Here, you call two unsafe functions:
> 
> * `CStr::from_char_ptr`
> * `CStr::as_str_unchecked`
> 
> If you read the documentation, you will find these safety requirements:
> 
> /// # Safety
> ///
> /// `ptr` must be a valid pointer to a `NUL`-terminated C string, and it must
> /// last at least `'a`. When `CStr` is alive, the memory pointed by `ptr`
> /// must not be mutated.
> 
> /// # Safety
> ///
> /// The contents must be valid UTF-8.
> 
> Your unsafe block *must* have a safety comment that explains why the
> above things are satisfied. The requirements of `from_char_ptr` are
> okay, but is it really the case that `url` is necessarily valid UTF-8?
> 
> You never actually use the fact that it's UTF-8 anywhere, so you can
> just not call `as_str_unchecked`. The `CStr` type also has an `as_bytes`
> method, so there's no reason to go through the `&str` type.

Yes, I can use directly the CStr, so one less unsafe call :)

> 
> Finally, `drm_panic_qr_generate` should really be marked unsafe. By not
> marking it unsafe, you are saying that no matter what the arguments are,
> calling the function will not result in memory safety problems. That's
> not really true. If I call it with `data` being a null pointer, you're
> going to have a bad time.

Sure, we can't guarantee that the pointers are valid, when they come 
from the C side. So I agree this should be unsafe.

> 
> You probably want something along these lines:
> 
> /// # Safety
> ///
> /// * `url` must be null or point at a nul-terminated string.
> /// * `data` must be valid for reading and writing for `data_size` bytes.
> /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> #[no_mangle]
> pub unsafe extern "C" fn drm_panic_qr_generate(
> 
> As long as the above requirements are satisfied, calling
> `drm_panic_qr_generate` should never cause memory unsafety, so this is
> an appropriate list of safety requirements.

Ok, I will add this in v2
> 
> (You also require that `data_len <= data_size`, but if this is violated
> you get a kernel panic which isn't a memory safety problem, so it does
> not need to be listed in the safety requirements.)

Sure, I will add this check too.

> 
> Alice
> 


Thanks a lot for this detailed review, that's really helpful.

-- 

Jocelyn

