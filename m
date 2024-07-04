Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56C1A01BF
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720081942; cv=none; b=pKB2de1EyuOLtJsO6pOfcWTXU+BF8KNNVzsMZxYQExSiA2Eths1jJhTpb+FdMqba+CmX4FdRxD25z42O4i7mMCwlsMLihw551jcEWUNJHMAnnV0HJ9b8GI/5XLv3iDTbd5tVwnNVN/+NipxZoi5fDu/wqv4u0E5ffX78btxoJPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720081942; c=relaxed/simple;
	bh=3bQt6Rg3jjVTXtI7iS7tjYyueMP7my8CvPs9NFEUx5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cudRKsKzjm230Na30JU1xI5AxDUf8FeQCiViYmhBC8QGrEBHR0VYAFPqNI9qsxVVTUKhjxGMIoc1vIsqtkJ3JMlDyCkxIkTTi6Ku4Hv+OkAWHxbsBNQCVW9+VQdGBURpdTp2Y7HBYiVswbeKX9WoNS54n9AZ5KJWMmhTWAAA7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZrQXTsG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZrQXTsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720081939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fly4Axb2kq7yYa3s1bvRYz7zwAvd+XD9LSO+uMJgGd0=;
	b=EZrQXTsGO4t78IdYWn8y6pAn4X69BmQAfsLnonR6uPtYllkHDFUY4La9lmH6+MYDcf4W9Y
	mJ3Err9WnoX67UAILu5xknCph4q1YCJn9Nz+QVLPZ92/qZbNiLhKAHiAFKTvQjVQCAWoJa
	PhNeT5f8jtU7ChY6HO8yyPip+eEjoJc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-qzpbtcZ1NRy6gYW2xUa00g-1; Thu, 04 Jul 2024 04:32:18 -0400
X-MC-Unique: qzpbtcZ1NRy6gYW2xUa00g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4257dd7d462so2844255e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720081937; x=1720686737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fly4Axb2kq7yYa3s1bvRYz7zwAvd+XD9LSO+uMJgGd0=;
        b=u2njjZWsnGyYJb+4zxDq7hWn0fXtZCNEsWlkyY7+/klIWSuYwwzZEvghtq85Ijosgy
         3oinBQ7NT/u1J2W9OkB2DrVgPDW4GcKPdy7EaExh2+KSP1loHb5vZ1Gkya87OYgxOyAI
         NnH00fBDtTkAh7eEjrEKCIG2FG+z7OVlVSbAAU5Ol53jcFnVV8kYZyEGOeOZh8ykhjP6
         6IDZrzFrkF9RlI1C4ZEBU1lwER8IvuCZnajq3RFEyT7faYiOzHYYUvcFqHOTH80RrDZ/
         bDZpZJrk2hIxC4ACHJBdyUtz9fmjDo2QOatuFpkbkegfT/D/NeBWk0V0PA+1/SPSOTuY
         oMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpVDlk3GDHHxqKXRw2RNGWPr/r1swYZ3teS5VAQagexi3nFdHA1w1Ce4v7X8Ry4cGen5pP6hsK3wa9z9mr12f1cWDZRT3xIU6AMEvjeLk=
X-Gm-Message-State: AOJu0YwSaDrtIOurERI4znc5OnHTeRgaq98+Y5RP95QJx/lR5CZNwtQw
	kUBUJZ52IYteDzVsqL5PkdlpFqROpSx1eIqfDfuAsmYS1GgBzFzHBpBJYaq2ZdBM/EOXODPLW2f
	SBSpnczu07zD6f/SgKgarZpdGPXLJxHWCzBuFyBd9f1uHUiX3FW1DLcYER3IHy5kT
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id 5b1f17b1804b1-4264a48c4e0mr6049495e9.33.1720081937439;
        Thu, 04 Jul 2024 01:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnqR2vNBhJCq7+miK0hh0vE1WCYEKEi71Jb9hxbqW7v9GH8NeQk1sqkfUNsHXzGDgQk6MD+g==
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id 5b1f17b1804b1-4264a48c4e0mr6049255e9.33.1720081937006;
        Thu, 04 Jul 2024 01:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16e7sm14493795e9.6.2024.07.04.01.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 01:32:16 -0700 (PDT)
Message-ID: <c1f6472a-fbf6-43db-9b44-f5fb887f3a1e@redhat.com>
Date: Thu, 4 Jul 2024 10:32:12 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <2024070417-husked-edgy-f527@gregkh>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2024070417-husked-edgy-f527@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2024 07:03, Greg KH wrote:
> On Wed, Jul 03, 2024 at 05:33:57PM +0200, Jocelyn Falempe wrote:
>> This series adds a new panic screen, with the kmsg data embedded in a QR-code.
>>
>> The main advantage of QR-code, is that you can copy/paste the debug data to a bug report.
>>
>> The QR-code encoder is written in rust, and is very specific to drm_panic.
>> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
>> The rust code uses a few rust core API, and provides only two C entry points.
>> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
>>
>> If you want to see what it looks like, I've put a few screenshots here:
>> https://github.com/kdj0c/panic_report/issues/1
> 
> Cool, this idea has been floating around for decades, here's the last
> attempt at this back in 2014:
> 	https://lore.kernel.org/all/1395093587-2583-1-git-send-email-teobaluta@gmail.com/
> 
Yes, I've looked at this, but drawing a QR-code in the middle of fbcon 
was a bit complex. Now with drm panic, there is a proper infrastructure 
to display the QR code, and make sure it won't be overwritten.

>>
>> -- 
>>
>> Jocelyn
>>
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Add integer scaling to blit()
>>    drm/rect: add drm_rect_overlap()
>>    drm/panic: simplify logo handling
>>    drm/panic: Add a qr_code panic screen
>>
>>   drivers/gpu/drm/Kconfig         |  29 +
>>   drivers/gpu/drm/Makefile        |   1 +
>>   drivers/gpu/drm/drm_drv.c       |   3 +
>>   drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
>>   drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
> 
> Wait, we can put .rs files in any directory now?  I didn't think that
> worked properly yet.

Yes, thanks to the work of the rust-for-linux team. When I started to 
work on this, I needed a few workarounds to make my rust code compile. 
But since 6.10-rc1, I was able to drop them all. Also for this simple 
case, I don't use bindgen, because there are only 2 Rust functions, that 
I need to call from C.

> 
> thanks,
> 
> greg k-h
> 

-- 

Jocelyn

