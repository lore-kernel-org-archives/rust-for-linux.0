Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE077185E65
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426846; cv=none; b=ID6SnD/Q5yqNNa2NLTQczyyTJvqHzEyAHpb/zOYkVL4q/vTE5nFMlZi9tgvxOjdGRuVRtM+I7vfTOwwqglvIr96TjsVfAHthrSEOiFgGz+dbuizG1uXBtON3iQsB90NQM8JJIzHGkk+u4DSvxlIUid/AxJpkHADH0cjnUPOctFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426846; c=relaxed/simple;
	bh=O8KG/D6uPISL20H1DALsDSf/fVopzaQT53Dtv9S+W7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JG2GJWHlzaahFF0UP6WmqZ1oCdejWuPXerpxJG+mpunBcQMCHl68np5jOVXNIo9TVxrOjO8E4JoooFKXJKzurFYhI2vM7bshXr3sdpq5uyODNxMq2FL4gD5SKLChKGChfB+b740YlfITTc92JgKdVtEftyDYr3pNKNafL4ogfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHqwBXPZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHqwBXPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724426843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4/dyRUnY/iuiFMDxWTjvRFMkHQ1Z/QmRVEZS2BZPy0=;
	b=DHqwBXPZ63oR7eCIqnO3ts1KxoTeE8Tn6+80w6YaYLGqZ0NMSPcG52JLc4DS0HcWGkrSR6
	y7lHEKi5FMM202JLzIYVMSEgWUjq0HmcZDzH2cPDU2vzPONQ4ZiDO4MiJUUcjNT2aON7U8
	UMb9gWGsNbLGRltk4ONhSc77qIpzCRg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-eGpvuUYGM1usabTF12mVeA-1; Fri, 23 Aug 2024 11:27:22 -0400
X-MC-Unique: eGpvuUYGM1usabTF12mVeA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4281310bf7aso17170085e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 08:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724426841; x=1725031641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4/dyRUnY/iuiFMDxWTjvRFMkHQ1Z/QmRVEZS2BZPy0=;
        b=Tqsog+Z95Kywu74ck5q1ej+I9FSAZbFIZzEc1gdAEhdPauLSYFThz6H2B3BKt0I5WR
         Dai1sknn5E4vhN+sAQBDXRbBk8bVnM4K8/XQhEBO5YolHlqWxyXVHM7YekNt/7QoKF9J
         d/ZZP/fJeb0tcwvP+id/jigLTxyqMNMyCa+B2Qvg10AernciBAIjQulOt2hSZB8+I8LO
         aYUL+5Zkv888CF+4l6Bn5wlfYJiMS6dsIq8qd7TXBdohZn54WTf04dmdCdTtV9W4VEDI
         GBpJZ5NjJvbGUYpwOF5Ipf/4C9okBCusDNdwfVqYTr7wW0zOvILLA59PFa26xYkcfE5C
         UuTA==
X-Forwarded-Encrypted: i=1; AJvYcCVB3kP2KG1/5LcP8nTegm4Z0MJEE44nHKntpVvDySVfuohuUaTKzEV4w1N13uK0ws4+lphKRjVl7yENC97ZIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAFdwJqsh8H9znxX80K9AmAAeKMNTdnagU4VSdvT3XhPIGC7S
	UUWLmHzGyuEA+WgzzxD1C/k+C7KRvgW2lemnFjlmyIfRjGCsgQOfJ3z7LY4822TJmkkhgvY1/+Q
	greSVkAFdC9EW4iR5q/kPyBgZVQhyBY5zuwpRrjvnh8/0wEhnCrYKFYW2JmGitD1m
X-Received: by 2002:a05:6000:402a:b0:368:3717:10c7 with SMTP id ffacd0b85a97d-37311841b20mr2021664f8f.4.1724426841227;
        Fri, 23 Aug 2024 08:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOBru7mHCqg9nue8AE7aYDW2PQBZruAIOea9WMnfc/MqA3Ee2rU2cYatt4ua+7FcM9Pbv9cQ==
X-Received: by 2002:a05:6000:402a:b0:368:3717:10c7 with SMTP id ffacd0b85a97d-37311841b20mr2021629f8f.4.1724426840658;
        Fri, 23 Aug 2024 08:27:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815c0f0sm4390019f8f.51.2024.08.23.08.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 08:27:19 -0700 (PDT)
Message-ID: <699b9d24-97bc-41c8-82c9-3bed34b18be8@redhat.com>
Date: Fri, 23 Aug 2024 17:27:18 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] drm/panic: Add a QR code panic screen
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
References: <20240822073852.562286-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240822073852.562286-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2024 09:33, Jocelyn Falempe wrote:
> This series adds a new panic screen, with the kmsg data embedded in a QR code.
> 
> The main advantage of QR code, is that you can copy/paste the debug data to a bug report.
> 
> The QR code encoder is written in rust, and is very specific to drm panic.
> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
> The rust code uses a few rust core API, and provides only two C entry points.
> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
> 
> If you want to see what it looks like, I've put a few screenshots here:
> https://github.com/kdj0c/panic_report/issues/1

I just pushed it to drm-misc-next

Thank you all for your reviews.

Best regards,

-- 

Jocelyn

> 
> v2:
>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>   * Use CStr directly, and remove the call to as_str_unchecked()
>     (Alice Ryhl)
>   * Add a check for data_len <= data_size (Greg KH)
> 
> v3:
>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>   * Change the wording of safety comments (Alice Ryhl)
>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
> 
> v4:
>   * Fix the logic to find next line and skip the '\n' (Alic Ryhl)
>   * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
> 
> v5:
>   * Move drm_panic_[init|exit]() prototype to drm_crtc_internal.h
>     (Daniel Vetter)
> 
> v6:
>   * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add panic description")
>   * Fix qr_width should be a signed int, to handle error code.
> 
> v7:
>   * rename r1/r2 to a/b in drm_rect_overlap() (Jani Nikula)
> 
> Jocelyn Falempe (4):
>    drm/panic: Add integer scaling to blit()
>    drm/rect: Add drm_rect_overlap()
>    drm/panic: Simplify logo handling
>    drm/panic: Add a QR code panic screen
> 
>   drivers/gpu/drm/Kconfig             |   31 +
>   drivers/gpu/drm/Makefile            |    1 +
>   drivers/gpu/drm/drm_crtc_internal.h |    4 +
>   drivers/gpu/drm/drm_drv.c           |    3 +
>   drivers/gpu/drm/drm_panic.c         |  340 +++++++--
>   drivers/gpu/drm/drm_panic_qr.rs     | 1003 +++++++++++++++++++++++++++
>   include/drm/drm_rect.h              |   15 +
>   7 files changed, 1357 insertions(+), 40 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
> 
> 
> base-commit: 04b5b362bc2a36f1dfe5cad52c83b1ea9d25b87c

