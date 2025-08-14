Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF974253B7E
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755153708; cv=none; b=JWRvnKFBQ2cT0p6ju0xForLQ7SXg12wZfjVU9Tk+4iHvkF8tXxxpVzh7rFhFtv1jI8Bsja6/KIrDffTaHYGKxmCMp1RQtgcasspC7TChamcZSDXmzS3vbwnj4mc5dfjyoWiWH+kAN9k+00/aNgUGnakR+FPaBycuxVULbeKuff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755153708; c=relaxed/simple;
	bh=GCbPMefnp9LdOOPenXhGV0oJ7QE490/uj4sFARHm2Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1Bw1PWBNsIWz2SBIe51tS6yAQXZAD3HyR1j9pJJehVO4FkliFhP6g4UkR/l1To1MW+1iFgJK75/6WpskXytoR2IOMBhM/fyeca44UyMFUjhjGYBr0Ffnia8Eqne2q12eRtctyti/t/vaDSKjG/2M9tv8X4Ya/yaZRp9tPU+bxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSwgMKHi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSwgMKHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755153705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9gfDC3XT5JH5+UXZeFk4ANri2tI0Wf8QHIFMwTkbME=;
	b=HSwgMKHigl2T+QYoX2h/Z2DlKJ0+BmkKMdZfKJZiyC6BS/HW8jVRJ1l4Y/REkw1LQhVRZE
	hWj3ua3RuXXUansSxeqy5T/da8qwNs9cpXaDh2E3PWZ7lNVeyP5dC6Ae89sQG3VYckiUOU
	9sWygH9kaw9Ky7I09yH8Wv09sGczInA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-TGTIGOJvOBurzSk4clFtIA-1; Thu, 14 Aug 2025 02:41:42 -0400
X-MC-Unique: TGTIGOJvOBurzSk4clFtIA-1
X-Mimecast-MFC-AGG-ID: TGTIGOJvOBurzSk4clFtIA_1755153701
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b1015f8so2668945e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 23:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153701; x=1755758501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9gfDC3XT5JH5+UXZeFk4ANri2tI0Wf8QHIFMwTkbME=;
        b=UM/y9YSWa0M8Oth1K8r2JrTx7g6G7h6slmVLusMMCHdbI3oj0Cz3d9XWWSeGvwJNGB
         zn2HsTp0hU06L5kLQJzEbvBoYd67T180iLZrPxOPTJME+bHfllmu4ZDuk3jpXMgOZBlp
         HXPx8cDr42bJfXmsrOsr5HPQaxnVrgvrXm4Lfdi/V23UhMgHdpJhcxVaWikb9wSQuqT9
         5QiHrF6CoRA1Ji2B4fKCrM41wr7J7b3LcKXTyoqDyoFYn6SYG749UCHfRG7xxFpFYND0
         unagOBVDWAQgQ2fExfV5LOnMSiBMA/j0Ppgr8UdiK390eqHCqnqvjuBMBUny7OgjCnZK
         0c7g==
X-Forwarded-Encrypted: i=1; AJvYcCXbZ+Y6MSwrJOlo4HFQh34JM2ha7jrlf8n2CIxl8Ce3vDBrBbkcb50mTwFDG7g4wBqYfyXqQCiVs+KU2Z6alQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jrgUgIszWdyFPWGTAVTLb/8PPaFjXtrQU48FFtzf0ls+YDK6
	H7Gj53gPZ21N0Uyk83LKV4LDufvA+QndOHAE1h3Sm7mblEA5AUbAJxAPtWPVu9n037fB3EAtEDl
	ll7FENS7yb0s10Spe56KxnuzlFR3qZ2zXDUI1+2NtAilVd+XDCo4XFQvJg9uwYDuMXwX4
X-Gm-Gg: ASbGncvW2iHrFrmr/1Dm99pg+FfG/qXgXUilBbU35G3u/+jAPx0+VU6Tr1yeb4BAsWj
	6aJ7SegwqkC6ET/ochD2EoVwoWuGvNiEorGi4Q0RgLivY/tklmNF9BvZaeiADRgX2MJ91Fq6d58
	GMRLBGe2r0Y6vl2z5F4bmUurYOC4oUEyDEcMHkJgRmqfralj/DWxIapNc6w+shXpf3iNzTlvCXs
	tHXNWnenv9rkthdShCfiaEOIr3TXuCQQV6j27me7ZbLb+C3hO0PPSi8I/b8TvP3ZS+FwHrD1HCt
	isDcX+0pnlKAHSusucTFxX9BpIiH0DX7OdRcLkrtXNg/eVKUHvExpPygCW7iyeetB5BJDFZmmfk
	LXp0=
X-Received: by 2002:a05:6000:40c7:b0:3b7:8a49:eed0 with SMTP id ffacd0b85a97d-3b9f1a13965mr1378448f8f.22.1755153701030;
        Wed, 13 Aug 2025 23:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpLaxNWs2oFsAZSrN9kqR+39ayEAZmpXcMUMLGDC+7HLlsr/ah//p96eCfa0Qd8T4sw00vYQ==
X-Received: by 2002:a05:6000:40c7:b0:3b7:8a49:eed0 with SMTP id ffacd0b85a97d-3b9f1a13965mr1378416f8f.22.1755153700568;
        Wed, 13 Aug 2025 23:41:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc932sm9252735e9.3.2025.08.13.23.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 23:41:39 -0700 (PDT)
Message-ID: <0f3a72c0-f52f-4ccc-acd8-861824fb762d@redhat.com>
Date: Thu, 14 Aug 2025 08:41:36 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] drm/panic: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
 <20250813-core-cstr-fanout-1-v3-1-545c14bc44ff@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-1-545c14bc44ff@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nAgaaXg-G6aDFJRDCY1P-tUbVrIjtnTRS2qdyoCU7PE_1755153701
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 17:41, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.

Thanks, it looks good to me.

Acked-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09a9b452e8b7..10bc5bb16992 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -948,7 +948,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           // nul-terminated string.
>           let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
>           let segments = &[
> -            &Segment::Binary(url_cstr.as_bytes()),
> +            &Segment::Binary(url_cstr.to_bytes()),
>               &Segment::Numeric(&data_slice[0..data_len]),
>           ];
>           match EncodedMsg::new(segments, tmp_slice) {
> 

