Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3116A399
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jul 2024 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721638391; cv=none; b=B9WnqdNzh0YML90KEiCaXeWuyIxggBvzXerNB4guHq6sIYk8r8YbJ6SYvjVEa1mM0Nt0sdmqAOwm6imkTA9NNqJsLhVecku4hSV+XupmTYp5U/HOxQVnRKkamDQ9xkADwQP1nOy+c0CBQzlKz+Wl5tW1RxytlnVQNUAAEnL2L+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721638391; c=relaxed/simple;
	bh=Bog4r9e4a8HTt0tdJ7Ud1DKFn+y5jKu+1ziEoOqlgG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f3KvljSIPf0qRlV4klz3nK9I2E7QnKMYv7F7hhDwqcTLeDyTuZfWB/ygbajv202YvZSaj9nkrDIoCyKI4pUVaKIU2lPF0jnWlAx5Pm25DiVxOJPToFy0EuP36oYXEkCluIuD48yqyUvchkNl66TWEe6WRoEAfzSGZI7KyAcwqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4bfZZ0N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4bfZZ0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721638388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxI9qiM4lzIxZVwtwjzIK8T0OrMcooauWHayA/UpE+g=;
	b=b4bfZZ0NYCpyAr/BB0sA73fQPkUxAOkKj0PSjmtzsOZrjc/DqLG5xSkrzfRVcJ4kvHl0Gc
	5/zFFdo99z4FU//xdUHw2E3WDIQcmW871v5fUgj7wgUR4VMcw9SmQAyGEPkbYKbIb5Znnv
	xhRP2MWbO7Ck2S6F1r8y/gW/252gZP0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-01hq8bNbOu23PHeMtnvLoA-1; Mon, 22 Jul 2024 04:53:04 -0400
X-MC-Unique: 01hq8bNbOu23PHeMtnvLoA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-427df7b6879so11269245e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jul 2024 01:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721638384; x=1722243184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxI9qiM4lzIxZVwtwjzIK8T0OrMcooauWHayA/UpE+g=;
        b=eyyd0JyPfbAV9KAM/D4RtXKsCwPN1rLB7zpdq634gXzKadOf6co9hVyLwHF4NycyKL
         qFTgSROjQdnfY3TiRgFBlmBap4xv85Wao1FXNS7F8zxqVs1zoNQhz7+QHpGPO3mgNmYm
         3aFLufzlTWtJt1HjRoSOS85gNLBOwdk84UMuPiBn3DJ5K7O6/QE+D0gMCw6oqdxBvKO1
         JGK3shRiVO8CTZUBPryfwgkysN3XQ7SSPVCOI0X9U/s+1p5vtqA21dBREZcU+SRfKg8F
         4gzVh20MYjnLKfkXxM5iFCtssJ3SYBscr8mFxWHp3J/hh/mi4JjJrxFKiUneVGKSURVh
         Uttw==
X-Forwarded-Encrypted: i=1; AJvYcCUuV2BLJ65jGHf69fojDlTHuPJhK7YX/4b+HB7+TU753UH4y8gSESyraes41FTSaf2gAmYiJpQIgu3lT7xehP/hzn16oPJSdXYcrPUbAoM=
X-Gm-Message-State: AOJu0YybkWt46lVpGBpqMgI8thjckU6PWTVvXKjiQYj23m3bSRVI5VhT
	T6hAE8ZyG7/eJabpINIFgNtx5MJQcxrFD05VWe+91TobcwHfVTEKqeEmSHJHetk8dRFKhj4vQ0i
	CnhquW0pqFM0hCU1FTfHTRkDy6SSqzwLSmicwzLhhhcZm4xxv790XdZCAFN9MPAkC
X-Received: by 2002:a05:600c:3553:b0:426:6765:d6b0 with SMTP id 5b1f17b1804b1-427dc51d30amr38064635e9.15.1721638383823;
        Mon, 22 Jul 2024 01:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQt0t4NSssP8bkkisHsnA8tLq8Iv91Jr480NjPHTYPZZEWC+ZnVhrLtxhOJzzrDG86YKQ7uw==
X-Received: by 2002:a05:600c:3553:b0:426:6765:d6b0 with SMTP id 5b1f17b1804b1-427dc51d30amr38064325e9.15.1721638383386;
        Mon, 22 Jul 2024 01:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6? ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a63c8dsm146615265e9.20.2024.07.22.01.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:53:02 -0700 (PDT)
Message-ID: <8803e15d-3531-4384-b641-25845176ded5@redhat.com>
Date: Mon, 22 Jul 2024 10:53:00 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] drm/panic: Add a QR code panic screen
To: Mitchell Levy <levymitchell0@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
References: <20240717142644.1106060-1-jfalempe@redhat.com>
 <0bad8507-22f3-38d2-5724-0aa6433990cc@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <0bad8507-22f3-38d2-5724-0aa6433990cc@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/07/2024 20:50, Mitchell Levy wrote:
> I am trying to test this patchset on my setup, but I cannot get it 
> working. In case it's relevant, I'm running under HyperV. Any 
> troubleshooting steps/suggestions would definitely be appreciated.

First, make sure you have this in your .config:
CONFIG_RUST=y
CONFIG_DRM_SIMPLEDRM=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_DRM_PANIC=y
CONFIG_DRM_PANIC_FOREGROUND_COLOR=0xffffff
CONFIG_DRM_PANIC_BACKGROUND_COLOR=0x000000
CONFIG_DRM_PANIC_DEBUG=y
CONFIG_DRM_PANIC_SCREEN="qr_code"
CONFIG_DRM_PANIC_SCREEN_QR_CODE=y

drm_panic is only supported by a few drivers. The easiest way to test, 
is to use the simpledrm driver, that should work on all EFI or BIOS 
based system.
To check the drm driver in use, run:
sudo udevadm info -a -n /dev/dri/card0 | grep DRIVER

If it's not simpledrm, you should blacklist it, and make sure you boot 
with simpledrm.

and then you can run:
echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

On a side note, looking at the hyperv drm driver, it should be easy to 
add drm_panic support for it. I will look into that when I get some time.

Best regards,

-- 

Jocelyn

> 
> Thanks!
> Mitchell
> 
> On 7/17/2024 7:24 AM, Jocelyn Falempe wrote:
>> This series adds a new panic screen, with the kmsg data embedded in a 
>> QR code.
>>
>> The main advantage of QR code, is that you can copy/paste the debug 
>> data to a bug report.
>>
>> The QR code encoder is written in rust, and is very specific to drm 
>> panic.
>> The reason is that it is called in a panic handler, and thus can't 
>> allocate memory, or use locking.
>> The rust code uses a few rust core API, and provides only two C entry 
>> points.
>> There is no particular reason to do it in rust, I just wanted to learn 
>> rust, and see if it can work in the kernel.
>>
>> If you want to see what it looks like, I've put a few screenshots here:
>> https://github.com/kdj0c/panic_report/issues/1
>>
>> v2:
>>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>>   * Use CStr directly, and remove the call to as_str_unchecked()
>>     (Alice Ryhl)
>>   * Add a check for data_len <= data_size (Greg KH)
>>
>> v3:
>>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>>   * Change the wording of safety comments (Alice Ryhl)
>>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
>>   v4:
>>   * Fix the logic to find next line and skip the '\n' (Alice Ryhl)
>>   * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Add integer scaling to blit()
>>    drm/rect: Add drm_rect_overlap()
>>    drm/panic: Simplify logo handling
>>    drm/panic: Add a QR code panic screen
>>
>>   drivers/gpu/drm/Kconfig         |   31 +
>>   drivers/gpu/drm/Makefile        |    1 +
>>   drivers/gpu/drm/drm_drv.c       |    3 +
>>   drivers/gpu/drm/drm_panic.c     |  340 +++++++++--
>>   drivers/gpu/drm/drm_panic_qr.rs | 1003 +++++++++++++++++++++++++++++++
>>   include/drm/drm_panic.h         |    4 +
>>   include/drm/drm_rect.h          |   15 +
>>   7 files changed, 1358 insertions(+), 39 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>>
>>
>> base-commit: e1a261ba599eec97e1c5c7760d5c3698fc24e6a6
> 

