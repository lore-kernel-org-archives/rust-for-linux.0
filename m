Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D3130AD1
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389191; cv=none; b=S6JP5PvnoTrJ4hS/SyJW/mLohRXfgmqzgUU9cighYtovJk+i+uJWotjirsGX8M7KNBfp4m+lju/OXl5mhR5tC5lXm4K8aZPR/vyzH83M7E9eD8XaPrbYhCc8VsAxG8AiTmYNFoepQAKkV1N5ZIMr0lQlDMo21TFWceDrwY+xxUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389191; c=relaxed/simple;
	bh=psr5z/LfipgjHoDYbWzk4ufCXlgcQCaqDDrc+lgYd1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jF8dSk3MhziVHnItTyndR9UA13xR8kzRY8FT81GkAeJ7d2LMDCaK8O91YY+4KlsZIEJjP0DrPAn3F+e/JuR8A4bgj3IbaUdWdLs12Yt3xEoYmHdKGowIs0hvrlnprOrVpYNZT7sRIFpdk1Q4GtO9PRW8Lj16AaxAKk7ucTQBJ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGYIdyFv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGYIdyFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711389189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSTFl3hACvw6cZYxH2tg8DbmgXprGLFq2bsIr9Uj77w=;
	b=SGYIdyFvLLzsAQ7C0/WSAWd4w7r7YiibQ7U8dvc0qOWxnZZlEpjl0GqGv2haiB7x+QW3Dg
	f3r0+YLH0oZJKled2fn8n4OYupWU/kVS2LOXL3RUt7JtNd6mEzuxSKdDkFUKRTz9y2X18T
	hUoJciX79GkciYGfQ+y1kL7TAsY8X0c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-YfeCh6eJOo6Q1aqslz_C8Q-1; Mon, 25 Mar 2024 13:53:07 -0400
X-MC-Unique: YfeCh6eJOo6Q1aqslz_C8Q-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d47e55dfd1so44435801fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389179; x=1711993979;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSTFl3hACvw6cZYxH2tg8DbmgXprGLFq2bsIr9Uj77w=;
        b=tOMjZZbEM87vy7KENVqrzjzih/DpIzn06RSAHBLe95I8wBrsYGoGRiu9gg+djHIVeD
         TmSPIk91yYlNEEziRqvqvuXlL03ehsLpD0Uhqq5EtSM/nAU7Z/V6X/oMTawm90XT7DYQ
         y/JDeJ2E0OcQ3dQxfgOuGANta31VVx8DjeO8qTlBBFjd/9ihMaM/7ysqm+CClfrG+T58
         72qV1aqHkhnrqdYNagoBnCBV19Q4PQakcqX5lqxxz5XC0LwH9cil1U78kwvKeDEngWGs
         FIQc2ux9BK9XTFJ0IeZRt9zYBi52jVUXFY6d64wIPy5zEuSmd0++d/AdEUDV22alcGwI
         fJjQ==
X-Gm-Message-State: AOJu0YyVevg/SIdPcG7QcbNbDQICqW1RQlC1AqSozpRrE6CTuufxK711
	+V8f37Yt0PDVzbM3T2llXYUp5e+1OmV0vHNwF5rSWdC90gKbuUKafQmbjk5+0XqGZs9N0FCl00+
	DJAotq7wgzhnohROJRuWgJC8cauRQM006Eik8SGK0/D0C0c7g6Wi73i/xVMFLHFWv
X-Received: by 2002:a2e:9845:0:b0:2d6:acb7:936b with SMTP id e5-20020a2e9845000000b002d6acb7936bmr5048390ljj.20.1711389179349;
        Mon, 25 Mar 2024 10:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErFfYKN6mJZuqgyNGrVlMo7m+gsQbKeFkmn09iM/Ous6KaYLGNo6+Cfla6TjsBW2bCmVjigg==
X-Received: by 2002:a2e:9845:0:b0:2d6:acb7:936b with SMTP id e5-20020a2e9845000000b002d6acb7936bmr5048367ljj.20.1711389178981;
        Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b00341cb49f83bsm4254224wrz.79.2024.03.25.10.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
Message-ID: <7dbc19ee-ac0d-426e-b2c5-ed4d4a778962@redhat.com>
Date: Mon, 25 Mar 2024 18:52:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
To: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
 pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
References: <20240325174743.95542-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240325174743.95542-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one, I fat-fingered the version of the series.

- Danilo

On 3/25/24 18:47, Danilo Krummrich wrote:
> Hi,
> 
> This patch series provides some initial Rust abstractions around the device /
> driver model, including an abstraction for device private data.
> 
> This patch series is sent in the context of [1] and is also available at [2].
> 
> - Danilo
> 
> [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> [2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
> 
> Danilo Krummrich (1):
>    arch: x86: tools: increase symbol name size
> 
> Wedson Almeida Filho (7):
>    rust: device: Add a minimal RawDevice trait
>    rust: device: Add a stub abstraction for devices
>    rust: add driver abstraction
>    rust: add rcu abstraction
>    rust: add revocable mutex
>    rust: add revocable objects
>    rust: add device::Data
> 
>   arch/x86/tools/insn_decoder_test.c |   2 +-
>   rust/bindings/bindings_helper.h    |   1 +
>   rust/helpers.c                     |  28 ++
>   rust/kernel/device.rs              | 215 +++++++++++++
>   rust/kernel/driver.rs              | 493 +++++++++++++++++++++++++++++
>   rust/kernel/lib.rs                 |   6 +-
>   rust/kernel/revocable.rs           | 438 +++++++++++++++++++++++++
>   rust/kernel/sync.rs                |   3 +
>   rust/kernel/sync/rcu.rs            |  52 +++
>   rust/kernel/sync/revocable.rs      |  98 ++++++
>   rust/macros/module.rs              |   2 +-
>   samples/rust/rust_minimal.rs       |   2 +-
>   samples/rust/rust_print.rs         |   2 +-
>   13 files changed, 1337 insertions(+), 5 deletions(-)
>   create mode 100644 rust/kernel/device.rs
>   create mode 100644 rust/kernel/driver.rs
>   create mode 100644 rust/kernel/revocable.rs
>   create mode 100644 rust/kernel/sync/rcu.rs
>   create mode 100644 rust/kernel/sync/revocable.rs
> 
> 
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba

