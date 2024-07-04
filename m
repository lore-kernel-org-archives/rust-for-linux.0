Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116011AB520
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085413; cv=none; b=Nc7TTwfgxUPxpFRVTxSBM7n1FtOz604kIbJOLHv8dH58YB1PpACgSYYz3pvW0rG+KtaS5sXPYg5EptTRhwz5tLhg6T9ZmdIs7j/gfW2tvQlqdC7X25LZhFhoj1nfFmZHOkccmZ/9R5pRbxMdWmsi+vDqllHbdgo91qPKj70yL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085413; c=relaxed/simple;
	bh=phdmX/j/LbFHeyRQEwiYO6ssMoxuSZN3L21D3IE3sVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KL9zCISiSVuwZc6yaC4iZVEsvcU1u+QzzmZS6xOmKt4Qaz8AcGBM89/gN/lmscyAp2s5m3+pwuVX3p1G6I+l8DaLmn6ITy3NDt6r5zl8h24/Ad6Heg8EqYYndBZB4/eOUdH7gogPjs3irVudRtBBKqwdDvwkWAdjAP3fnU1vDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T4wemQFD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4wemQFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720085410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4uXprkwlvPamWZYVoqyTd1YcwUNvxNCyRkcYrhT/QQ=;
	b=T4wemQFD5DFnWYqeQg0PqF/qFMfIMbSvCPN06Ec1jlCEVtx1XIWkDDdgHUtm6vN9rhzk1b
	tDvTngePOF4Rkwjzz6Ehe15ppV/AG5RLJuupWj7bYvQ5gJ9iqRYPRb7aLG/CSEQOsAwWba
	RuRCG2x4V5ZtX5Jq0y6A4jnQkBoEyuY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-cKKtNND2Nnm0JjCgvnBJUg-1; Thu, 04 Jul 2024 05:30:09 -0400
X-MC-Unique: cKKtNND2Nnm0JjCgvnBJUg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52e969d34bbso447087e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720085405; x=1720690205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4uXprkwlvPamWZYVoqyTd1YcwUNvxNCyRkcYrhT/QQ=;
        b=seLbqB/+go9tRCoT8622HHgLiBMwJSjtQtCH1VCGI4Xidz8abhJxWQ4zEeR9WM9JBF
         P6DLPW/1wkUN41iNhH7vXEGQme9LscMz2Nugy6OBQelFzKbgm8Js+RxutV50ByE17oNv
         yQTpu8jJhb0eJCNZdDu2nnxLac7w16yXJx7TDdFizLoca2BFmPJijHWPCzgzUGt1FAma
         EqOFTr3UXm6BJ/Kii8rbnzj473d7iAQQT39prgliZKfkj4x4X2jaU0Ygtwc5/s10j0uo
         yMmzK+viikluw3gXDbPw2m6fgoFoM9iTsHm0T/SvaRApOFr6uglt4vU8LofZu5NmlPJg
         Fbuw==
X-Forwarded-Encrypted: i=1; AJvYcCWJTT/fJc8wiZdbi0erzPJ1PSu+Q2+lMeF+UuJJnwIq/r19w+l/31gxq+NKezYeFKx0vhUAQKbwgGUS0tdR6lW6so0GIjMWBX7bNaYqcZI=
X-Gm-Message-State: AOJu0YwoLSmnvy6K8d8rY3NBFNERP4sTb9i4f/i/1DBeHV+O0QkYsYu4
	et6ghC5CXY+OGbWgNjfNNtwgli3hYS+iTNHfyjlKcXv/GUbkKKeDnspvfI+aCYcKGHboUM4u83n
	UALrOt3kk8E9/WAGLq6W2gG37amK3nkpgy6B42yVHKDgk8QF4B9zvHgxosQhP6ILP/QM8IHuPWz
	0=
X-Received: by 2002:a2e:8e3b:0:b0:2ee:8a88:b060 with SMTP id 38308e7fff4ca-2ee8ee4e769mr6899051fa.53.1720085405666;
        Thu, 04 Jul 2024 02:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFDIi+xuW7Jy4FRnZjDg1+mTBblmfBJkFovRI6uIWmzL2R/6mOOqlUN8xD5v+Gn3jiKKuLA==
X-Received: by 2002:a2e:9b89:0:b0:2ee:4da5:be67 with SMTP id 38308e7fff4ca-2ee8ec7b181mr6771311fa.0.1720085384344;
        Thu, 04 Jul 2024 02:29:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d50b0sm16650195e9.7.2024.07.04.02.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 02:29:43 -0700 (PDT)
Message-ID: <df3b1122-1c05-4bd5-bbbd-2e7cff2934aa@redhat.com>
Date: Thu, 4 Jul 2024 11:29:41 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <CAH5fLgiMJZYhSiBVc7r3HP0VTCNVG=FuD68v-ni4=54t5vVPwQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgiMJZYhSiBVc7r3HP0VTCNVG=FuD68v-ni4=54t5vVPwQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/07/2024 11:18, Alice Ryhl wrote:
> On Wed, Jul 3, 2024 at 5:44 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
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
>>   include/drm/drm_panic.h         |   4 +
>>   include/drm/drm_rect.h          |  15 +
>>   7 files changed, 1340 insertions(+), 39 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>>
>>
>> base-commit: 3f5ea7ed705e8effe9cfabf912e769ccb6b7d389
> 
> I tried to apply this patch, but I can't find this commit, nor could I
> find any tag that it applies on.

Sorry, it's the drm-misc-next branch of 
git@gitlab.freedesktop.org:drm/misc/kernel.git

> 
> Alice
> 

