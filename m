Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE791411EB
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421686; cv=none; b=nSTkqRBdIVkhRJ3wFMBsyuLVgSyclso82LWJcuPsPRhFrG7dV5jo5D5OBiTSIA0AIs5nLRCrLFDriJgDSaUak0Zhb1K+ZEsgokfShjCqed8D/WdlryZTPXFcpdm8OKck0nCier40b41EQJHzMgdiEzYEtF/QpVO+KMbv2hH0DIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421686; c=relaxed/simple;
	bh=pzWtP8kr7lgSEV6tOy+qZ54glXeeWEPyNWM+bjA9ewA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=I5UukjCFE7nvdrlDvHPhyRwRaqMMCVhs4DeSBRKzLAWfm8BmVREZmc12jdWW9mVIOj4Tb8y8zFhqDtddd5pbvwfwXQcchjl/6apPyhmgRzfPU0LAFMrRSw8GIpOcfhiX+0kcsTQa02HqY4TiDyaBSCNZ6SEWSb8Z18iZZL6aRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVDYNUF9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVDYNUF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+deoMmPQLG+DLEK4zq4CzULvuFLJy4sLMw5MAgkMKuA=;
	b=iVDYNUF90JFI0EI4YCEveMAZvlgFVxZB7iiPNmqAfVuJcrEfdbiMfD0uILJ7Yd+N3IiuvY
	2fORBMdIYYO0KHvTBh4DUlCQusQKM6USu+bvoQi2k0ub042Iy2aKNpnqO/sxBJ+A/Qqdm4
	q6WgE7aeDlltzfsB7ItoC+q0dYENAnA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-wmHCuv49NROuX1ZgeK7r7A-1; Mon, 29 Apr 2024 16:14:41 -0400
X-MC-Unique: wmHCuv49NROuX1ZgeK7r7A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-343e54fc19bso2662351f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421680; x=1715026480;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+deoMmPQLG+DLEK4zq4CzULvuFLJy4sLMw5MAgkMKuA=;
        b=KC02ZOZHxzhbWzrIP99cOXog1jCWCpEtHdYXpVYYjzqG1XhvSJDm388vebnF1yqmpF
         yyMXZ87JsS84LzxbYiDuOLd4rqvup637nY0gDnkonUFYvey21NO90CO0QIVcovKNyseZ
         /2IZcb3Cx/pFzrf4619j5JOCSWiSU/1LtnvMZGt5ACSVW3MTq6D6jU0Qh8j+h+yCb20N
         j++s7DWy8LyAiGGTlI7ImQQHSTVs5bzxocFS/Kzk1B/cInQvVEW3kNpfxmBlpMJCgQb3
         uYzfdBfYbELwPvK2xFZ8UBs9qZQH08IJncuAjuqRFX0EQHn4PDrCpmkVVToK6wi6ETaO
         TeQw==
X-Forwarded-Encrypted: i=1; AJvYcCVh5cyqXXXKojnq6kxd3JQzMLoGJV10ozNhtwPEKYdnmOeDSoXCZxl0HIwfpK7DPF39DXOrfGW3fGfo7V66s5p7RVMJUvdJlhiUJRuHfD4=
X-Gm-Message-State: AOJu0YwrGHXafKqVZvswJtK/aiLBAWwHhW/zEjOnvWEXHIapWdpPZRc+
	yLbQXbV1DWyO2gXfzu67tWo9nRFrbAvS2YFcnBO0ryNuXK6ChGJNgycWJiRa3TsnW6ydprOVhXB
	r0zSKYwLuHbA5aCGimXqOU7Ih4gTrkAcdcE7V+dAYAmXcGtF51+Z52BKwIAYEB6Tt
X-Received: by 2002:adf:f1cb:0:b0:34c:e47a:c0ec with SMTP id z11-20020adff1cb000000b0034ce47ac0ecmr3962232wro.1.1714421679919;
        Mon, 29 Apr 2024 13:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz6SGFYqfUR2YOGE4FsoobYH1oyz8xWZzhOFj9WXmFKOjnkBVP3G06cW91bof5O7SDUrppyQ==
X-Received: by 2002:adf:f1cb:0:b0:34c:e47a:c0ec with SMTP id z11-20020adff1cb000000b0034ce47ac0ecmr3962218wro.1.1714421679563;
        Mon, 29 Apr 2024 13:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6442000000b003479bec98cesm30306324wrw.115.2024.04.29.13.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 13:14:38 -0700 (PDT)
Message-ID: <e29f22c5-3d65-4d60-af0b-a440b6746dba@redhat.com>
Date: Mon, 29 Apr 2024 22:14:35 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Allocation APIs
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 Wedson Almeida Filho <walmeida@microsoft.com>, ajanulgu@redhat.com,
 Andy Currid <acurrid@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
References: <Zip4dFpt8xhk7UBL@cassiopeiae>
 <74cbdaf7-360e-47e3-bda4-4661422a11ae@proton.me> <ZiqkIQTHe9apd-LW@pollux>
 <f71c4e07-9f6f-4709-a3bb-012e644c4845@proton.me>
 <Zirfyp_NiYCRQYvk@cassiopeiae>
 <71dd99fe-0d64-47cc-b367-8fdd4fcdbdca@proton.me> <ZiuCm4VtFiCfzTPI@pollux>
Organization: RedHat
In-Reply-To: <ZiuCm4VtFiCfzTPI@pollux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/24 12:31, Danilo Krummrich wrote:
> On Fri, Apr 26, 2024 at 06:32:26AM +0000, Benno Lossin wrote:

<snip>

>> So aside from being able to use `Vec` and `Box` etc, I don't think there
>> are any advantages to using `allocator_api`. The disadvantages are that
>> it's another unstable feature that we need to get stabilized in some
>> form. So it increases the amount of time it takes for us to be able to
>> support multiple versions of Rust.
>>
>> I think it's fine for you to experiment with the `allocator_api` and see
>> where that leads you. But when we discuss merging patches that enable
>> unstable features, we should be sure that the feature is truly needed.
>> And that it cannot be replaced by custom code (it also depends on how
>> complicated it is, but I think `allocator_api` would be simple enough).
> 
> I agree, though I'm not asking to re-enable allocator_api necessarily.
> 
> My original question regarding this series was what's the plan on how to
> implement alternative allocators given the changes of this series.
> 
> This series clearly is a huge improvement, however, before it was quite clear
> how to implement alternative allocators. Now it's rather unclear.
> 
> It's good that we discuss the options now and I'm also happy to contribute to
> the implementation, but I also think that within the context of this series we
> should give an answer to this question.

In order to get a little closer to an answer I sketched up a patch series [1] to
support alternative allocators again and added, besides the KernelAllocator itself,
VmAllocator as an example. The patches can also be found in this tree [2].

Please let me know what you think.

- Danilo

[1] https://lore.kernel.org/rust-for-linux/20240429201202.3490-1-dakr@redhat.com/T/#u
[2] https://gitlab.freedesktop.org/drm/nova/-/tree/topic/allocator

