Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41636B910
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473329; cv=none; b=lv8LgjgjYoTxmHYEyezGaApAXr831WGVU2uxxYeiJSL0YKzk1Ii56wZzdPYW0Q4z0XHA0yuu0bcAstGWLZyVmYGyxb1ah7pGnt09gGt5XJGE9mZoCz0aprU8wxkElpRxOnLrnAmfe8z/fBuOa56AiIa2yZJ3B0itR/ychUpbZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473329; c=relaxed/simple;
	bh=w85i1U77RlMLmT8UloFRqnOX/JtK+B6wpoucYKebRew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddsOobcupWJuieaAYYsqUTrSBdsWnWd8lXSgGgGeo00byswehp1VnhaPjlrBZ0u1QtNSNRHmDuufdTS1A4/lkdzs+nvpejmU9orzwiKHx/dBA4Eu1Ri/X+3Ta1uwuJFMMkRfuNlQAPs+U+UHaGKPyaLQSSR2G2fqt9Ho6IA2+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCocL3ny; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCocL3ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788473327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSmQPXj8inEoKBdqECUOM+0RiHNGnxlFvDmP/jJyOY4=;
	b=QCocL3nyAH2b1ro3rWEPTufPjJl67zKNOcdu5O3vbpvGoR3+lX0NFssthQPFmNzTTr9pAO
	s1dKwdzErZjTHjvY0mOdRT1gEf2IqRZGvmzfA4oT2XFcnWnac/fcEFhEU1u9Xb4TWklI0Z
	BOWpakdVAjKdr14Xh3SCVM9oDu2vc+c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-ANvVICf-Mue9qM7CEjzQEg-1; Thu, 03 Sep 2026 18:08:46 -0400
X-MC-Unique: ANvVICf-Mue9qM7CEjzQEg-1
X-Mimecast-MFC-AGG-ID: ANvVICf-Mue9qM7CEjzQEg_1788473325
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482ea386bf6so141794f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 15:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788473325; x=1789078125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSmQPXj8inEoKBdqECUOM+0RiHNGnxlFvDmP/jJyOY4=;
        b=Q49bpYS+7wFdUv4sUhIWPv0+iEJqbi472olAKSgqvR8lj1rHXgL9ywZc+50bcDOrky
         Z2T//p06Mxg5Avum/ne6TL7wHr/xDESF4xkzbcauzH6Acth6OQgALriB1/Okof1VNV65
         r9z6jFr1zTbarDoO4VFiAAdilOF/SFRME+MR4tAM/jTJNXpAX+QvEQg8xLy08OYAhd3c
         yMjepMW4Ose31pZLkNEZgYYK3vg4OMoBPNZRxZvR8AAgZhxMkvCEg3RH64fjma2L16FH
         zIaDTTied54IK6U6HXylM65peYLvfvjSiGw8YvGklY7bgWol+Q0uJfJ+YWJDKMlzLM51
         C8vA==
X-Forwarded-Encrypted: i=1; AKwUvByKezqn27v6iZ+TL4BxJ9XxibwGOs/BcVKLO5G71U6VAQ6SrcbUEfK4h4yISdNVc3PrL1APQuiRIuln2lg0sw==@vger.kernel.org
X-Gm-Message-State: AFuF++mN3RMahlvWuD2CVegcDxKlySbWMkbMHqUB0n+JhL3NcyCx5/3A
	Kz6nY9PN52D5nGDndDE8QIFcCKWRExC2ZhiqKxEZ4AJKxvb362McIJRmKNJbiW6ijV/4gQX9nNv
	sLscX7fzpX4+x6ugcU6uCh+5ydtIPgl9ACWodHlMS3PKqze1Ck6FOw0EC/H11e8iLnBCx
X-Gm-Gg: AYBFou0nYck0+L5vdfXco+CIBPvOFQcHX6kzeoXr6SXfhkZ2lzQAcIiRt1U/VXfWTkH
	gdc8ZBjs3z+GcDOXJtaCvxeQqtJduH2S0coZ8zIn4PyOaiDIlOBxY89c5cyCX/squjQRvfN/vYw
	ubWq01u4B9m0h4SFF2r+EoJ53yoFsSavkJsYnDvpwUD0TO8cQG0Pz5O+rbUDW0bN4dxfhAn+5Bn
	xJHdlykG83X7o/+1dwKPoUfNLtBo0bwOWd43ZtaJgt5WBHMQyO+pplHKc2eh69Ip0WEYtJltZ5p
	HIZqQbGIpgmJgQnDHv5La9+Hqq2JA9BlCIKjVgLnnOVz2s1CSLY9+2oMhQYZSBDskGGRddz06Fn
	fuKWIqrQLLQP742dBCbTkmuSxlL1EZSz2SBTFYSv5fMdYyA==
X-Received: by 2002:a05:6000:2c10:b0:485:4275:f207 with SMTP id ffacd0b85a97d-48587099a2dmr2766259f8f.24.1788473324915;
        Thu, 03 Sep 2026 15:08:44 -0700 (PDT)
X-Received: by 2002:a05:6000:2c10:b0:485:4275:f207 with SMTP id ffacd0b85a97d-48587099a2dmr2766223f8f.24.1788473324542;
        Thu, 03 Sep 2026 15:08:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858791bddasm1786219f8f.0.2026.09.03.15.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 15:08:43 -0700 (PDT)
Message-ID: <101089d2-96ca-4a0a-bea0-6e936beebadb@redhat.com>
Date: Fri, 4 Sep 2026 00:08:37 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean new `clippy::needless_range_loop` lint
 for Rust 1.100.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 stable@vger.kernel.org
References: <20260826145642.43807-1-ojeda@kernel.org>
 <CANiq72=TjVOxDj631gCFMKAeXYbjycmZe74ChXL=rw4H53pQzA@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=TjVOxDj631gCFMKAeXYbjycmZe74ChXL=rw4H53pQzA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnntJDtjc47zBiDR8tmDbOYgFPY7GTfVH7yeLs6xSmQ_1788473325
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/08/2026 19:54, Miguel Ojeda wrote:
> On Wed, Aug 26, 2026 at 4:56 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>>
>> Starting with Rust 1.100.0 (expected 2026-11-12), Clippy warns:
>>
>>      warning: the loop variable `i` is only used to index `self.decimals`
>>         --> drivers/gpu/drm/drm_panic_qr.rs:410:18
>>          |
>>      410 |         for i in 0..len {
>>          |                  ^^^^^^
>>          |
>>      note: for this index operation
>>         --> drivers/gpu/drm/drm_panic_qr.rs:411:13
>>          |
>>      411 |             self.decimals[i] = (chunk % 10) as u8;
>>          |             ^^^^^^^^^^^^^^^^
>>          = help: for further information visit https://rust-lang.github.io/rust-clippy/main/index.html#needless_range_loop
>>          = note: `-W clippy::needless-range-loop` implied by `-W clippy::all`
>>          = help: to override `-W clippy::all` add `#[allow(clippy::needless_range_loop)]`
>>      help: consider using an iterator
>>          |
>>      410 -         for i in 0..len {
>>      410 +         for <item> in self.decimals.iter_mut().take(len) {
>>          |
>>
>> The lint did not trigger here before because it could not handle arrays
>> behind a field access such as `self.decimals` -- Clippy was improved to
>> catch those cases [1][2].
>>
>> Thus clean the warning by iterating over a slice rather than using
>> `take()` so that an out-of-range `len` still triggers the same bounds
>> check as the indexed loop.
>>
>> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.
>> Link: https://github.com/rust-lang/rust-clippy/issues/16631 [1]
>> Link: https://github.com/rust-lang/rust-clippy/pull/16634 [2]
>> Assisted-by: LLM
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>> ---
>> One may want to keep the loop in a shape similar to e.g. the one above,
>> though.
> 
> Jocelyn: I will likely send another rust-fixes PR during this cycle,
> so I can put this one there if you agree with it.

Sorry for replying late.
That looks good to me, and you can take this patch in the rust-fixes tree.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

