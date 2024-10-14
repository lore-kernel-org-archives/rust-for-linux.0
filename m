Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739691CBE8F
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933817; cv=none; b=SCH6FQZ07hqjgXY+zU5VLWt9FKkNqxGIpNI0/hggKeT4J1nJEZAuQUVeYjPHUX/5zOFmQou1tOXHnqca3mfplTtz9wPJzTFo8iO/3pSTvAEb1G3j4tPt1bLL1e8Ws0jznpQQgCkg4YFCGMZSMhwh+ifmJntKb2tl3ze8W1RrB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933817; c=relaxed/simple;
	bh=XH0MSHzPKf/M1bjTm3mZJ/wFW21nCER+QGjM4lbcr+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5hsVvduk3GjNbOBevhjy4iiod0I3ybStwmd0XfOy+pEMlsvx1lJjoQaUiR4QTZPpdG67x0WPyk5IayAi+eRAq1R22wsMFIrweVPHSqOics5jFG4Vn4kAA6VP+clqyvAK42KCIN5OE94HloeG11Mza/8dlvMQSokOwKLkyyqHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvF48ByG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvF48ByG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728933815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pr8kBiDDyEnpolDm4TeW3ziQndwc2QwIlDCytPXA2jo=;
	b=OvF48ByGfUmCFOmxjMGKLFURYKmpAvdRPWxZzg30tm4vlGqbxWT1jttK9dGIw1LPEwbJYY
	QmsFFXvo4oMIIimNqG9IXzGMzF/BZG4swv/kPHhCm3w+vA+89lMN+knM191E1nNam4+Sv6
	GHEH5tX/vYxGTHgwvPQQU78MMLl4xpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-DnAevEW5NmS_KzR184djog-1; Mon, 14 Oct 2024 15:23:34 -0400
X-MC-Unique: DnAevEW5NmS_KzR184djog-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43111c47d0bso23954285e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 12:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728933813; x=1729538613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr8kBiDDyEnpolDm4TeW3ziQndwc2QwIlDCytPXA2jo=;
        b=Y1Zxp6qhOiDEd7yudri6ZnJxrm7o2Ne3Sg+9FwdbttPHEPKH6ElmFVJEieP0a+8LN0
         eNToxAbCEMWmU4PpYx2pu2DhHRWjt9IQs/TG6jZ/ImkaJsQv2h7E2/zR7nFmMTVhfdlu
         oD8P0UFoAn49eXRGkbSPsU5x94KDNlPPTOxaQhuTDawCqh1EHO+sXxPnoGTHckA0gN9y
         fpj43UDgqXyLyOVN57PLVIP9ah/vGWDk5F3LK9uAUQTN0N1MPcOCoa0MES6mH8N2eCuY
         vrzhY3NcTvRH5T1NzMkUDy2Nl2PIWF8qR1A3Hyo0+rLo6TEK2z4d3PJXPgybYR/Fcg1L
         VZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVU4HrCE4MRh94scO6PF1wumcXTTOceMMUJ9KjxQiZMSNr5rH5VEBOJj23Wo0geXO9lj399J0+dAH3EtaI3Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QKMRe3N8rjg211FQcmDlkIyUYCNfVrXm1l1CWOjliVcyTtvH
	aOEcvFAJedC9EA2vVQDJLey1CWdet7ow60a+GJn5LfXbw5p7NMLj7+ouasApTQROBlFqDb2PQtL
	TK/GFPumrqdVLCBFT8QYPVJedYOv3Nahppgk6Wed3ExjHgemAWIOx1lmA6R45DnNQ
X-Received: by 2002:a05:600c:1e88:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4311df5875fmr105232545e9.29.1728933812984;
        Mon, 14 Oct 2024 12:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbTqTqdJ+uV85hzvy4tOJlJO5ZFnRlJoc3kwSn95A8eOaOkt0awKgBPBHzu+zMwf2VvN13PQ==
X-Received: by 2002:a05:600c:1e88:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4311df5875fmr105232285e9.29.1728933812596;
        Mon, 14 Oct 2024 12:23:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d794asm129792535e9.1.2024.10.14.12.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:23:31 -0700 (PDT)
Message-ID: <2e5e6280-eaa2-480f-b89c-c9b832328d07@redhat.com>
Date: Mon, 14 Oct 2024 21:23:30 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
 <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
 <CANiq72kE0QtiC6OjyV32r_0V2KxhtPk+-8mQGkCvtexif+04vg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kE0QtiC6OjyV32r_0V2KxhtPk+-8mQGkCvtexif+04vg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/10/2024 18:59, Miguel Ojeda wrote:
> On Mon, Oct 14, 2024 at 10:54 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> With the suggestions from Alice Ryhl to not introduce a return, and use
>> expect:
> 
> +1 to both.
> 
> `expect` (here and the other ones I suggested) require `rust-next`, so
> if this goes through DRM, then we can clean this up later. Otherwise,
> if you prefer `rust-next`, we can change them to `expect` already.

I don't plan to touch drm_panic_qr.rs, so I think it's better if this 
series goes through rust-next, to avoid an extra cleanup step later.

-- 

Jocelyn

> 
> Thanks!
> 
> Cheers,
> Miguel
> 

