Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE61531E3
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896143; cv=none; b=bcsOENpb3iFnjeKjHA4/cZf00XTq4NlbI8wSf9IfMRWdWEbNwYsKDhay1VPeiYCni3R0VwLoKKQ7sEbBwRTrSop5X7xXXzWW38zeWPYhGSNnNuDMp3J2Y9K0JCCJJJvpw73XaYwJUf5OvX9vNl0vwXbLuvP9eALZ3bo5dHVBz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896143; c=relaxed/simple;
	bh=q5AtrCSAA7vrYMLlA/eP1eHpMODMlqvnRe1smcyIJKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8FUjl4tluW7t6wlIiQRDv/xbAmvlX1exBqeC+gcsV1Uqop0PpmnIXazhbhbk7QU6lLyH3gqZK1kQP5oKQgx0GCvWNFru4lqXB4aEDM+v1iVllc85yb/2dEM++HwzJa3lGe4bQK2Kv8qX6B+RjVvJaYNIsl1k0pK79mFdCzIHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HP2mzy2x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HP2mzy2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728896140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZZV3eCjwH17+qwXquSijSlOfzm3AowdcidnwQs1e80=;
	b=HP2mzy2xtdMmOSnu8DmWxwda1zdVy7IHCbzxGvcWJ3fGf2eRBObNn0V8KKj6kjEdhIUxPV
	T4j1XU1kjnKx73yoqoWsOW+GeQ0Grcu+JhwItFSXI1bck2xDno2zPyKqgPuMpqGw37nMml
	KGuiOtW88aTXQoN+K8bHw7jiajXWUy0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-ndyaXZCCMRa7AlDA_HnMUw-1; Mon, 14 Oct 2024 04:55:37 -0400
X-MC-Unique: ndyaXZCCMRa7AlDA_HnMUw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539e294566dso1805887e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896136; x=1729500936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZZV3eCjwH17+qwXquSijSlOfzm3AowdcidnwQs1e80=;
        b=Sve5uWQok/fQbpx6I4BTzxK/RNT2+F6EAF8uJPP2IcpWLbeWU3Fc/4TzXAaEErM3Fe
         TePFous6JQR+wIpWvzqQ2cFL9CFPMEbJ5qOuQ/SGCE5eaL3cM0PcitfG7WnsrAsvxagm
         TkdRTGEpV4cNWZjX6vXroDas3UYRt2vbX2KW00YkTldjAcVqS3tqPftAERhIAqKp7MYN
         pjKVQ2NIdbzF1Cu/W7VtVzD3iE1Ky/XCs7RzfTUL8laDWvQVDHG3crnnaqNKIYGFiala
         dobfxBonitP/Jjax9xf229So80dQVw2wyvhMiwnkbThFRphVe+tMM/Pt/6B1/P1Q+Tfu
         aNmw==
X-Forwarded-Encrypted: i=1; AJvYcCWP9u65/Ww9MgkREfRPEzMH34q9Coy0e+BhzUk8jl4pXJrotWOB5Vc7mt8wR630xDk/TZt/pWGoogGQI9DzKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvSlO14Z3UtJQTigzywgdJtKKTnHIgFhZoWqiV3KH0KO8wG9H
	xczgIRfJ4N25t3PC1eApDY0VvsTemZ6JYuJa2Yp7iIk/TQtDJOsbSa+OOuedsyrz1JnCvRsSzDD
	x4LdXJYI0UrhCmCZWnZwD+z4VKWandCTFQsAob570TGoJZZg92QtxrE5idq9fylUI
X-Received: by 2002:a05:6512:3196:b0:539:89f7:3187 with SMTP id 2adb3069b0e04-539da583db0mr4542271e87.47.1728896135550;
        Mon, 14 Oct 2024 01:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsnAdyTUOwoRixLAd99Kcrm/Heu2DZ1kp3SFQWf3sDK6kM96X3+KpLcEanEEOaqVXM5IPHrw==
X-Received: by 2002:a05:6512:3196:b0:539:89f7:3187 with SMTP id 2adb3069b0e04-539da583db0mr4542248e87.47.1728896135047;
        Mon, 14 Oct 2024 01:55:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b9190f7sm10761253f8f.114.2024.10.14.01.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:55:34 -0700 (PDT)
Message-ID: <8d1c8667-e032-4d9f-bc8c-f12d71070a11@redhat.com>
Date: Mon, 14 Oct 2024 10:55:33 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/panic: allow verbose version check
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-7-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-7-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> Clippy warns about a reimplementation of `RangeInclusive::contains`:
> 
>      error: manual `!RangeInclusive::contains` implementation
>         --> drivers/gpu/drm/drm_panic_qr.rs:986:8
>          |
>      986 |     if version < 1 || version > 40 {
>          |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use: `!(1..=40).contains(&version)`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_range_contains
>          = note: `-D clippy::manual-range-contains` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::manual_range_contains)]`
> 
> Ignore this and keep the current implementation as that makes it easier
> to read.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 226107c02679..fe842466d8d6 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -981,6 +981,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
>   #[no_mangle]
>   pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +    #[allow(clippy::manual_range_contains)]
>       if version < 1 || version > 40 {
>           return 0;
>       }

