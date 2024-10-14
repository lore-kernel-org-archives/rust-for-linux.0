Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A43156230
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895650; cv=none; b=AdEUUzXAgKXjiBruKa06upNdR37PsWzTgC7VUfqajFhDnqq75v50DNfh86HhejrE4iW7af6iiuGsotr5vGyu01I7nWgTTgyhtR9VYjXXYqofMHG0/hOjwLMA/Usc3GaBacTfOUBEEJjUUp+RN7b1v+aWp9crxHyIRvqwE3MW9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895650; c=relaxed/simple;
	bh=CKAAFTOaYXzss3hbLk4LijIqfj37lvrsTUlUC26hYX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+XrW7iE33Mt9YYfxft6FdoGTZih9v9rCPq9jXW+ImNhl3zv5R0CI65gBTBcpqKuK04PzP8GRwCw4YbVIPlaAW04vy+thahdDcIeNvzaWlogViannty1iiM5aqr2aYv2/34gCgyddJFhkCEEGllZAUTjjBgSoUQTGGkggNi764g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REvDx4nr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REvDx4nr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728895646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHHrpd04LCN5U9FT9iT5XYMMgwb+6uYYFSdfvRXUjCQ=;
	b=REvDx4nr4WZSGevG2htoUjgMmLiuSyAqqPUwXN+xgNMDV4cQbl81mpAtpGmc5HxU+s96HO
	F5NdeyE36gC27ku/HyUJgqjXZMp8k3lMD3uzRNiU68864LaZ5St65+F/sMtymlNxagSeD3
	isyXajv1bHZkRetx3xozT3VoUc63J8I=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-6J4RBcOlObe3T0xs1Ymm3g-1; Mon, 14 Oct 2024 04:47:23 -0400
X-MC-Unique: 6J4RBcOlObe3T0xs1Ymm3g-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-539ebb67c28so645460e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895642; x=1729500442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHHrpd04LCN5U9FT9iT5XYMMgwb+6uYYFSdfvRXUjCQ=;
        b=oPuxpNu6Wa5AdEpiqY/A0DpfUbnmaVssa3mtk3QtKQ4BGbPvKBVbPKROLYRFcDXXr+
         2hiTFMRY+5Wty4cAs9xcejv/beTAks82kfO3+TNBGjCd98BTfWQ1N7cI0PitTbCpkD45
         ZU4g9pyoApFu47D1FCiIo5eydaNsmdfJ38jUVPmPzANVuyiK8n2H+z65P3JiuOO2/fDj
         UzvaydkEXZQetnQKu7UFOAAjRkN6ewTPog9L/LKqRTLtLVR/x/+HhHYQtrNBKMzHNd3x
         HFxfIhtnUh286OLFeQ6Y/e8DgkQvoQGTOZ2d/NAKjhaRANV8wzCYBhm0+AxNHU8DrejW
         iPKA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5UMz5ITT8rbpQiyNpvq//4w17YcuZCfYLGjt4ewyy+EsIl6AS9U6JeBF/pS/gFSEVS/dC1YQOo9M2hIT7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYugML2mwJBn7hmGL3TL23o/GPWnx0/HDF4uY4TOPkdDzUD62U
	QOtFgixrLoV2pyRiwYfc2okhZZrcETL/1SvDmc/F9JnzI/Rl/+0ELnK7v4l8Mv1kWqB21Ghjw8h
	RThqN23tmcpAnOufnWdsILJfpFS7pubx3urrrpC4xyePLDUW9TEqhERAbY4dMgOoAYCdsrXm3
X-Received: by 2002:a05:6512:3da3:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-539e551635bmr2803367e87.30.1728895641637;
        Mon, 14 Oct 2024 01:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNGzizcYSea0we+7mFRqxFtVg7tJgmmDdbFHqE+mDRdFYzekLDQxwTxv+nzZLoG0jBJLv5ag==
X-Received: by 2002:a05:6512:3da3:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-539e551635bmr2803341e87.30.1728895641192;
        Mon, 14 Oct 2024 01:47:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6d0217sm10791478f8f.60.2024.10.14.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:47:20 -0700 (PDT)
Message-ID: <08d47408-e15d-448f-9fa6-41a3d2ec953f@redhat.com>
Date: Mon, 14 Oct 2024 10:47:19 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/panic: correctly indent continuation of line in
 list item
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
 <20241012075312.16342-5-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-5-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> It is common practice in Rust to indent the next line the same amount of
> space as the previous one if both belong to the same list item. Clippy
> checks for this with the lint `doc_lazy_continuation`.
> 
> error: doc list item without indentation
>     --> drivers/gpu/drm/drm_panic_qr.rs:979:5
>      |
> 979 | /// conversion to numeric segments.
>      |     ^
>      |
>      = help: if this is supposed to be its own paragraph, add a blank line
>      = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_lazy_continuation
>      = note: `-D clippy::doc-lazy-continuation` implied by `-D warnings`
>      = help: to override `-D warnings` add `#[allow(clippy::doc_lazy_continuation)]`
> help: indent this line
>      |
> 979 | ///   conversion to numeric segments.
>      |     ++
> 
> Indent the offending line by 2 more spaces to remove this Clippy error.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 5b2386a515fa..58c46f366f76 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -976,7 +976,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `url_len`: Length of the URL.
>   ///
>   /// * If `url_len` > 0, remove the 2 segments header/length and also count the
> -/// conversion to numeric segments.
> +///   conversion to numeric segments.
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
>   #[no_mangle]
>   pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {

