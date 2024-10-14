Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46A013D52C
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895594; cv=none; b=GOOtNSArjpE4+fde/MDyzWEFQdqlovgqL8tZy+rL4/9f1LRcv3BSSF0jAOJa7pMIo67u7+osHMk82gPjGANUCNRmkK3nXDRtq5gIu10LF+QlbNHVl1YpWDhMzFrpaOR/Qxubc64lAYhZbxCpHmpqXdKQeUB/be6g6iYfhPduYo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895594; c=relaxed/simple;
	bh=DTDHdgSuKlw8QItjw4pvFY6tXNSrdp9VJN+KOLQxrm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zcy0JTN8cWNce1NcTUme+kVh1YO/pX24Q35+iLe/1WQtzOHMUZ7rwexV34S4YvtY6cOHfnHtZg1rj2l+1e75W+rjURxHo8k363yZxEWgjDgsb/9mlm+nH+WafbQl31pboB4yez66v0gadPgOfTn91vZa1JotnuJTKyq/TipA04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZRt5zMa8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZRt5zMa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728895591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8yMw1kZ4wSYjtEjMJHnAEl230IFSdVbMJQeMPPAW0b8=;
	b=ZRt5zMa8aousb9HUQlsybWso4Y4cvnzpgZcDF3/JsAvphkDXJoChJvb1liFRfiNRSA753y
	gWx7UW605UFAcFpeH5OGaaf+P7f1c676Zhv4LiAe3IUFIpZZuugitQQt7lQIGnCvvhwNzc
	znjg8BVzOsPJiHiTbjZt/L+Lr+SaXqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-Jz0munlAOiqdl8SY3Nx3Cg-1; Mon, 14 Oct 2024 04:46:28 -0400
X-MC-Unique: Jz0munlAOiqdl8SY3Nx3Cg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d4af408dcso1629612f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895588; x=1729500388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yMw1kZ4wSYjtEjMJHnAEl230IFSdVbMJQeMPPAW0b8=;
        b=XOogDNEGpRmlyiogT8bOVirnrWcPGlWf0Uen3IKgmX4sZPjr8WTHRyxulOER7F9xN7
         kV895Ey3hKArGHNN9PQ5tT+Y7ReXHTwC6SC0esz2OdjtgtyZ82fbojr0wwxmXB63DS4d
         5S3srMk0KV3UR/mM/oDm6ya6qPLhvhh8VZHCFXWxf6F3b75ujRGJ5xBQvFxRlrkPIs7q
         eP0zcWUNoGhLtm48cJk8eQXi4PgF8gzFbf6BfJBkcHh2jvuj619lq0Fp9nRiOu1rSz1r
         9Z3KJbkcmjTesA+V6LjmBQzI2/krLCGd3vnWrRC7NtSCTRHpNgd9k7Vun6u+10iJpYLI
         Eu6A==
X-Forwarded-Encrypted: i=1; AJvYcCVc+ZCYIMB646IZ9ZVyQHVaLHFA6kGYmGOz0EuwXfEOKzuV5Uj2e9ZATF4GKsFFPlOLdtZ3rlMQJ10ZU+sD1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaF+qS+iiJ6B8065mqI/z5oOiUBRwm1WfsPgFN1sOOgcqVXzVB
	kg0d62epydEHIE7wSWeqoj0si3qkw1V1q76HCqubvpilDnh/8rFDXgju1WU1F6M0t9My+y1nvTF
	TjQve/CDJnf7HrfTL/25tREwugjBNaUcOM5wL5NsSAco5Dnp0WwyvWJTT3nE/OumW
X-Received: by 2002:adf:b30c:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-37d5518e694mr6473263f8f.6.1728895587688;
        Mon, 14 Oct 2024 01:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFLIWKqOZJqqYjX4EN/6TkBMgfY/lAKwXdtrnkKX4U6krTF6dTWMvOHBK9y+++vFukzWCiZg==
X-Received: by 2002:adf:b30c:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-37d5518e694mr6473245f8f.6.1728895587279;
        Mon, 14 Oct 2024 01:46:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6d0071sm10661282f8f.62.2024.10.14.01.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:46:26 -0700 (PDT)
Message-ID: <567d7f67-291f-4483-921f-a03ecdf83c9d@redhat.com>
Date: Mon, 14 Oct 2024 10:46:25 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/panic: prefer eliding lifetimes
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
 <20241012075312.16342-3-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-3-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> Eliding lifetimes when possible instead of specifying them directly is
> both shorter and easier to read. Clippy notes this in the
> `needless_lifetimes` lint:
> 
>      error: the following explicit lifetimes could be elided: 'b
>         --> drivers/gpu/drm/drm_panic_qr.rs:479:16
>          |
>      479 |     fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>          |                ^^                       ^^
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_lifetimes
>          = note: `-D clippy::needless-lifetimes` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::needless_lifetimes)]`
>      help: elide the lifetimes
>          |
>      479 -     fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>      479 +     fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>          |
> 
> Remove the explicit lifetime annotation in favour of an elided lifetime.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 7adfaa3d6222..767a8eb0acec 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -476,7 +476,7 @@ struct EncodedMsg<'a> {
>   /// Data to be put in the QR code, with correct segment encoding, padding, and
>   /// Error Code Correction.
>   impl EncodedMsg<'_> {
> -    fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
> +    fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>           let version = Version::from_segments(segments)?;
>           let ec_size = version.ec_size();
>           let g1_blocks = version.g1_blocks();

