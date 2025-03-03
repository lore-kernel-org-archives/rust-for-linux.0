Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A21D63C0
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994867; cv=none; b=nreAt3G4L1Vnew8qsDuh39QY6xae+U8SHhHM7hXEmxcId400sCslW2CQHATLUi5KWQX2oDBSyPcYvwewPwhzwVt6SivyzWK9zv8yUohTbGvxx/FlQ00Qi3G0ZFkD73o4TbJSDLZtOSH8Oo25YzpTpz8gqibjFNDQQ+X1U7jUTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994867; c=relaxed/simple;
	bh=dQLYc6BsEprEKBA6DtRFuQ16bOaLXoXn6GQNmtYK31k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0gXzv/40N+YpGXONTcFppj+0slRG79R2sS56azWPZCFvtBXMERd3ALLCf1m7KHPkcnyE9Ej3xhYuZ96ss8+qrzDhtpJktLM6EmhxMlaZLHMmH+umKtE7MNl3Oae2aG+K2LJfkIh1Fjqi07yheodJWpyLKyk2F22qJ+nRw9KeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YcCR0fRs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YcCR0fRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D46wI1otbQqaNSu8WnEzDU27WQjj8NKTR6dNsZngyNk=;
	b=YcCR0fRsg1F/EuM8Apasf7d4vJoARO4kJdviq96l7nwskq5Kn9/RNX4liVyFusBW4xXni/
	00eI/ty9S6zYiweI1ys3CXuKrn9A31W8QJw1gqmePGaqie6h9t0M6brm4xpBHwQv0MTx9X
	MMq1ElVqEM5YBcgG3JhQggBWj8Z3SJc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-JkRNLD7pNM6tZyYMVPxfXA-1; Mon, 03 Mar 2025 04:41:02 -0500
X-MC-Unique: JkRNLD7pNM6tZyYMVPxfXA-1
X-Mimecast-MFC-AGG-ID: JkRNLD7pNM6tZyYMVPxfXA_1740994861
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390f365274dso1022673f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 01:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994861; x=1741599661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D46wI1otbQqaNSu8WnEzDU27WQjj8NKTR6dNsZngyNk=;
        b=w4Xa4lGEWp3OHsgUQzgr0EM2ZM2AduMWrB/giINw8UOUO3gCAEmC77wiszBmpCXude
         i9XS2St1JyLSqMFSO8BGPni3bJx3rfZ8mllhhM9UnziPqYbFF36T6oh4kZEXnEZ2Ydq1
         MqzsunC5PEgMaq1tfJSMcapusMMwD+Jln/kMLuQw7hGN+8zwM2i3YZbG6qUQxJckuKMs
         YoKhfRgfZgRmlgngYO3Ml3Q9spOm41dxz6352pw5yaqAwR4pAiPryXZYb3Fa+TmTnSga
         HSklVuEUFpeAeEIMCY1bvXxsODJksnYLD4gd9pzaOTF7iR+vPh7Sv1uAfwcJ8zEcOGvq
         4ZPg==
X-Forwarded-Encrypted: i=1; AJvYcCW51WkmYsJk0zcrtdi/tVTeywe1n6Uv6OUkbU+bWIls5ITnztF0gZGP6P+L+MFswc2cEwDDVgbbfUJuZWA/yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtu4UTeUnNu0avc4bg1jPcKpCSoAMB+tRBWuWuU3hzyMVeNiXd
	n4/g4URky4exfVw9mkQf0Gjl0q9N2Nez+KMnm/LzKnUYRdja9bZkwtHk8RqLZIqNSK7Sc5iIr1h
	r0JXLmpP8iFxkuvxfHzbybzvGRgryyxyz6SKlgfEHLsrZkz7zikPA0YxpyqlV5Ysz
X-Gm-Gg: ASbGnct1FyD4S65WnDrsHbCWa0KWBsjF/SZvydfhSalLJMYPVSljH3p6nvKnwD3zAo+
	gezF00JqBrz8moir/22T4eG+3sDWEbgFY1mej9R//fuMy0KAMkzrGU0+Lg/heQXLx/RVy1/a07p
	vzNaTWVl7LUlzffhCS1QumkBY83G1VCPYBoS0SeqZyxEuQS01U1l9pha2lrROZsVbFG/O0tiEKd
	MuKqt7n5NlOVRE7q+DjsFSmorBi7VIHJX3zdd4v8C6gcVOO3ogHD72d1ATOyTrhpndTP3bV1ax/
	wUUwMFqUyrypoNFBl1BGjJrtztpSSXYyLV3w8FUgBE4TV1BVRCZwqqc=
X-Received: by 2002:a5d:47af:0:b0:391:a74:d7e2 with SMTP id ffacd0b85a97d-3910a74d9dfmr2504784f8f.26.1740994861451;
        Mon, 03 Mar 2025 01:41:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1de8HYVkepPP08FYSHZESNB6/TmqfVP389HdGHarD00Xh+lNows9m8q7gT93iwcJAAY8o5A==
X-Received: by 2002:a5d:47af:0:b0:391:a74:d7e2 with SMTP id ffacd0b85a97d-3910a74d9dfmr2504754f8f.26.1740994861034;
        Mon, 03 Mar 2025 01:41:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc63bcaafsm13675235e9.28.2025.03.03.01.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 01:41:00 -0800 (PST)
Message-ID: <b0dcc390-6e12-43ff-972d-1aca96fa374c@redhat.com>
Date: Mon, 3 Mar 2025 10:40:59 +0100
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
X-Mimecast-MFC-PROC-ID: _INZwiPBWlsxZomMUi9EES6kb3snfSiF27Pzy6Ybpgs_1740994861
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

Thanks, so that's the DIV_ROUND_UP equivalent I was looking for.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

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

