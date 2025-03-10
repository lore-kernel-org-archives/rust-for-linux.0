Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D355221F2D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741592999; cv=none; b=LiQJ7WNC5M8gw1BF6XaXjO5uJheLTf+6t5igmQ1VLdI0SoYiDdO81VskhfOIW5YfSTs3KLa+AD6+idCnCWOdpzKQ3RqC63d0OnCC8R2ykMb+tpe4z9ooDs2nIlVHxSpOKWH0bqGaUzzoE9LXUi1wdtZv20cuZ9boklXsptkGP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741592999; c=relaxed/simple;
	bh=2taqIQQXceogYRxl+WbwaFPfpyiONZBcxtV+IJvWGc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZD5DhtFIyMW0PlDp89Tbtn7EufwOBVZBH0VmswgTm5haTmeAgazr9P/lVSscgTWXCvgIlUIlJ/grkKAUKWqnp3ZaqDfBDGz/NvdFlwPkB1XIJHC5n7XWW2EdgMifajJaTd17R5UI0275y5E1mB+3trMqHqkaIM12HXH5YPlvWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zz5DdeFM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zz5DdeFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741592997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5kIvy1af+TbHcL/hyxVpb8RVtEt62vD4Y3oqmjYEDE=;
	b=Zz5DdeFMUL0kvUIPYLEFuObDIXQuk9Q86GGh+f/hKlLz2PMDW9wuWB8q29win75PRFFprd
	dBBcDFzbfs9st21zLbWB8a0sgoX2LdYvxEi+gzwF2LS2xIPagW/UN76632RroEy6HS1XYR
	VUrKdEQ7X7hmEnsGDZAEXyDz7+rRVaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-8tlE_JEkNZidSNIu3FohAA-1; Mon, 10 Mar 2025 03:49:55 -0400
X-MC-Unique: 8tlE_JEkNZidSNIu3FohAA-1
X-Mimecast-MFC-AGG-ID: 8tlE_JEkNZidSNIu3FohAA_1741592994
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39131851046so1102886f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 00:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741592994; x=1742197794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5kIvy1af+TbHcL/hyxVpb8RVtEt62vD4Y3oqmjYEDE=;
        b=J5BK+5veecB5r89edMTXy7wC9uMygdRXIDYRdGcBgYs7nET/2ucxaCpLC8FGW9YtFR
         ev0hBHM6aHHk5P6ktljNvLyva6jKu1nYkhw8U4AwrqVx1nKoKJh+CoUB+UmKUYbc4b5q
         MxgJPJJSCznJ2N7dEUEpJtsq/npU2ipYHj9n/RrpCC7H50bHR4kqqn754SeXb3Xi/icJ
         mgydMbIp0woKvptpKkAPUeDUhOv+YrF9dHj4OeUffJnMDLLsOzamHRTzaRt7nzVrcSon
         pDl6NHnWMG/O2IR3GDKYNJHgEC8ct42lv+C0r4Ppz8ybAFTAJY151hS4xFytn/mvj0LE
         SWYA==
X-Forwarded-Encrypted: i=1; AJvYcCVUK/HXXgfeWRnmRhLTVIEqBErEuY+IpDgvb8pQ9C0oWJrKBTidtRLmwaBnJIFcYSIoBKRLqyKGQubHXvF4kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTAjVDHB4WYpYZ/TeOpo1/wvDh16sDUt4AGYQRdcx17pjpdlDL
	4B33ajKWX5ZvDoz7TnpoaZLoBqjLmzjGE0JT2m0MKX/J7XVihW2GmNxXZOzRkphSfgtUYmOLgxN
	0m8cfswFDXIzcqgh8EZgEdUkXSgbNYQx8ApttxM9dCu4uSCBcFHQPNveIHknpbYIs
X-Gm-Gg: ASbGncs7fFIeUgmOZMfZOZaET8JfqM9WfDSeYQgHjUWb5J0PNzV6J9907T3XkLHqD10
	ijS8STOuXOJGu1eq74wbzxomTJA3gkH5jRLO7y6P9R7fnR93OojHQTEtkG4zVV+c2cuyDIPo03K
	RK+hI725Csw95MQA3Efoyq4aBFcYqgwbnDnxUBFjS6fbWijOIfxqd5vGL77IXXUN7SNq4QsM32H
	q0Eu9+2MZUU6Ze6mSV0dq1oC02XFpzpdvCi+1S2yS213ZoDU4Y3vcMqWQjGAynDEemoYPDk0dOK
	mhtfXqI5duNGp79vaf7vxwEwhiPleJEMSjLLxbhkcZ1pI25KsEqV+gk=
X-Received: by 2002:a5d:6d09:0:b0:391:34:4fa9 with SMTP id ffacd0b85a97d-39132b56eccmr8992840f8f.0.1741592994107;
        Mon, 10 Mar 2025 00:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFGDJo2dCkSOhn/W3s56Mf4MrQ0JYSQmeOFCRJ3rj6SEOpkuthbr1LKEQhE5Wn257lq7BmQQ==
X-Received: by 2002:a5d:6d09:0:b0:391:34:4fa9 with SMTP id ffacd0b85a97d-39132b56eccmr8992816f8f.0.1741592993752;
        Mon, 10 Mar 2025 00:49:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01cd31sm14138878f8f.52.2025.03.10.00.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 00:49:52 -0700 (PDT)
Message-ID: <7fa51125-3015-446a-93b1-57b07a7ee8f5@redhat.com>
Date: Mon, 10 Mar 2025 08:49:51 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250301231602.917580-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1H-_UM6xN07KVTiitBgQ5fiN2F5eWtO518vK-P_qgvI_1741592994
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 00:16, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
> 
>      error: manually reimplementing `div_ceil`
>         --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>          |
>      548 |         let pad_offset = (offset + 7) / 8;
>          |                          ^^^^^^^^^^^^^^^^ help: consider using `.div_ceil()`: `offset.div_ceil(8)`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_div_ceil
> 
> And similarly for `stride`. Thus apply the suggestion to both.
> 
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.

I pushed both patches to drm-misc-fixes, with the "Cc" tag added.

Thanks a lot for your contributions.

-- 

Jocelyn
> 
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..8bb5e52d75cc 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -545,7 +545,7 @@ fn add_segments(&mut self, segments: &[&Segment<'_>]) {
>           }
>           self.push(&mut offset, (MODE_STOP, 4));
>   
> -        let pad_offset = (offset + 7) / 8;
> +        let pad_offset = offset.div_ceil(8);
>           for i in pad_offset..self.version.max_data() {
>               self.data[i] = PADDING[(i & 1) ^ (pad_offset & 1)];
>           }
> @@ -659,7 +659,7 @@ struct QrImage<'a> {
>   impl QrImage<'_> {
>       fn new<'a, 'b>(em: &'b EncodedMsg<'b>, qrdata: &'a mut [u8]) -> QrImage<'a> {
>           let width = em.version.width();
> -        let stride = (width + 7) / 8;
> +        let stride = width.div_ceil(8);
>           let data = qrdata;
>   
>           let mut qr_image = QrImage {
> 
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6

