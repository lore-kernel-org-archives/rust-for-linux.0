Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D416F27E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611849; cv=none; b=C2tQW9eeJAYkE9fkki73rs3T0s9NxrRrvWjATNtvcGtThSjVzkPNJJnJjujb0zwiJjSoNyIHr8KAs4Kp5Ak2Y+rvPgkg2F82nO/RS4gy79nQXI4216tdouuf/Oortd0AZpttjiJIIGhmG/OPvyeTYeNAuPoD/upsA9KXxDSGPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611849; c=relaxed/simple;
	bh=ZWmrGQ6M26BhXo9m6RKEZU+fsqbwL7LzDsPFnAheZho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5AFLGbQAJinAm26qp/n44v5FU+kvgTN2ITuETvcAL/ZrCc/ncFuHAul1LeoW2Fi2Vtl9bc9y7FWUY3u/T5WLlxlKKYw4oZqU6V+qo9uybjtU33Hr+mqg/qf5hKnXrhfJ+GTRW9aktsIgQul1Vzi2L3q/p0muj5k/FVL3VhaZ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ilvXsY3F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ilvXsY3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732611846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=im/8o06WdRL6AvUGxWnBVgqT+amoAsT42x2YeIRHNPI=;
	b=ilvXsY3FGRmCyZ/VD1bR605p9kFGHFqKkGJcCDy69TqSM/ZOTYnWQZ9DtVUy+9RkmACxw7
	gkR5eCiQdlGeszD1iaKRrB25BqLAv9cdiEXrPeOUYQwdJjCg5+Yz19LoKsOCtb7/5G242l
	p7OH5hL/vXBwzA3hagTJoQsrJVvL76o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-SFhH7o2iNYqXrb-1zcDcNw-1; Tue, 26 Nov 2024 04:04:02 -0500
X-MC-Unique: SFhH7o2iNYqXrb-1zcDcNw-1
X-Mimecast-MFC-AGG-ID: SFhH7o2iNYqXrb-1zcDcNw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4349d895ef8so21976525e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 01:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732611841; x=1733216641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=im/8o06WdRL6AvUGxWnBVgqT+amoAsT42x2YeIRHNPI=;
        b=HrVsFMz9EpcPLfFjAcQ4vLOFnQcIYQo9rhRxAeYylLePU+c8PKnZXrrrvc0JQrVwwU
         K+9zg7Qccrj9xRS52KjFexQNKRN8GMcyJvZp4g6OMiTwDHZ6K5lR1wlUENXb8QzEKtS2
         MvWmS2aigijog0l36U+r2jVu5Z153XIOdzVzlGoiR3YZCyDwuGGqEQLOfLlViv2VbCwj
         2JYCyXFxG6TGD1NDmcFmZobofstCwHxaiN0i/r+FzHdqBO7MLJ6CYQYHIXkGMxhvNj15
         Rf+xjm044d/+T1DDw8K4CSHqeNXxK3IrJ/2BM80b+E8XJ1EJxB+e5a+hDtEla3WygZ9Q
         AcCw==
X-Forwarded-Encrypted: i=1; AJvYcCX9nUsXBbJnTiKBF6sblLp0uhllRwIzlRfAmYGdFOZindtNv7KxbUDvfkdMd1qIAGbJsMepZ+EqnVTLkJrDPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ChrBNb02SsygidnhbxO69fXazrxqDepdedaXUPSZ9jJSPlqh
	PuEZIbddey9svtg5GWsUH1Z7+DnZZV0zsUsp7P8ZpOjt7CCkF7weGWmoO9f1a6tALbNMersU6Hb
	F+cWdDMxlZR7tS11f9vopqQGkW5I17RjOzDohifEGhHktjmLDE/zOR07IZMXzEDwc
X-Gm-Gg: ASbGncuGtjZaCkyWV9o1koFnFAzHY2UwYJNDvbA4S7m+XvhJEPVoWHMg2D67vEFIugK
	OQfftTdJljH6akijR9aOiTX7q4FwDED3lB3GmjAwyoap2o8RnJssRaiEgTOE/VRNiloR0pg2tD/
	/kkuLUTTkGTTrdDJTo1+865YfyqipgNRqStw2HSlvFTWWZozGbiM+xCyZLg+AxkzrlgrSK8jO+S
	jR/rhy83qJInBLNv9V6hpSpsM+ZWPnFaAPTk3uLW9Ph1HJvHXPgOCth9dzqcLRKd0TmcT2cP07M
	TGSo+ZxrJENE/w==
X-Received: by 2002:a05:600c:a49:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-433ce4af26bmr148804065e9.32.1732611840678;
        Tue, 26 Nov 2024 01:04:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqku7owNzsRW4AuiyjR+T5rbYPu8TV/N4RKw6ZJEgH4GkTL9H/M9yM3mzoUSyueykAQvBQkA==
X-Received: by 2002:a05:600c:a49:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-433ce4af26bmr148803685e9.32.1732611840280;
        Tue, 26 Nov 2024 01:04:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafeceesm12715211f8f.37.2024.11.26.01.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 01:03:59 -0800 (PST)
Message-ID: <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
Date: Tue, 26 Nov 2024 10:03:58 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20241125233332.697497-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241125233332.697497-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KaWyaBbNnusSIqEj1bnbDLqXcwgYosijVIzlUo11n8U_1732611841
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2024 00:33, Miguel Ojeda wrote:
> Clippy in the upcoming Rust 1.83.0 spots a spurious empty line since the
> `clippy::empty_line_after_doc_comments` warning is now enabled by default
> given it is part of the `suspicious` group [1]:
> 
>      error: empty line after doc comment
>         --> drivers/gpu/drm/drm_panic_qr.rs:931:1
>          |
>      931 | / /// They must remain valid for the duration of the function call.
>      932 | |
>          | |_
>      933 |   #[no_mangle]
>      934 | / pub unsafe extern "C" fn drm_panic_qr_generate(
>      935 | |     url: *const i8,
>      936 | |     data: *mut u8,
>      937 | |     data_len: usize,
>      ...   |
>      940 | |     tmp_size: usize,
>      941 | | ) -> u8 {
>          | |_______- the comment documents this function
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
>          = note: `-D clippy::empty-line-after-doc-comments` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::empty_line_after_doc_comments)]`
>          = help: if the empty line is unintentional remove it
> 
> Thus remove the empty line.

Thanks for this patch, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Cc: stable@vger.kernel.org
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Link: https://github.com/rust-lang/rust-clippy/pull/13091 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I added the Fixes and stable tags since it would be nice to keep the 6.12 LTS
> Clippy-clean (since that one is the first that supports several Rust compilers).
> 
>   drivers/gpu/drm/drm_panic_qr.rs | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09500cddc009..ef2d490965ba 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -929,7 +929,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>   ///
>   /// They must remain valid for the duration of the function call.
> -
>   #[no_mangle]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
>       url: *const i8,
> 
> base-commit: b7ed2b6f4e8d7f64649795e76ee9db67300de8eb
> --
> 2.47.0
> 

