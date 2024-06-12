Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AB17E47A
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200791; cv=none; b=ZwdB5q1eZ4YNjqROlG0ohd0PoXOyQ2uOkvYyVHHnaO/ofe6FiU7lGqokYzfkQZcnu0/X/xv5vfd2nTCYXVasJuzMKQX2OMSDiGQagAZTJ6Azw4w7rEsgUlWFWy7rhJHot5Uk+eMLP+Ednzi0hyGC1kT6hZuRA1ih/OHaK7PZIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200791; c=relaxed/simple;
	bh=LnL6vXABxodRA0g/3uUnvhhic5N3VDGXGX/xdceAgHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLqjfGG0IU/FAbgjfsFAomaIazx9og9DcV5rOMwmOW9hd8FEjznHMlRttILqz4dg5VI/zWuUGT9cWXa2fhp+m+vYLCgLBCsCbaAd5Gw4/atlSHrJmd6ep3MB+mQCZjKlFNCpBQmJeBxF2ZTNOfGKI2xL9wl/JfcC7YubIf7horg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3cYhldV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3cYhldV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718200788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+lgoZYSUH8a1r7cAFWJj8pD+hPUc4udC9LVoFE9F2E=;
	b=A3cYhldVoCWBkin5rPCB8cwGi1SSiWDgdTgsht1N8jVZrnQe2FIUNzclOKHv+X9E+gTIIH
	T609l7ixgtwAeTFFs/fDr6D3ZYTAYQYpaaqL6xmRP66gQ8Z1e9Koy568B4VI7DxQHTSqdw
	2WrPXv5yHP5l5O6yT7JY4HJ4Pfr8q0c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-8gRGLgHWP_aiP1UWjvNn4g-1; Wed, 12 Jun 2024 09:59:47 -0400
X-MC-Unique: 8gRGLgHWP_aiP1UWjvNn4g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4210d151c5bso49777155e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 06:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200785; x=1718805585;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+lgoZYSUH8a1r7cAFWJj8pD+hPUc4udC9LVoFE9F2E=;
        b=eG+R+XJG/jG9EPlj+/YbAjBzVPu+M5GJvwRk5XZf743DGM0e4fnUgyACOynTx9TT2G
         tgAaH4O/xknuOVq1srfbL/2Qrt9+8UJHISC4GT0KCbapRkN3d0NnzD8iuNqKOtLBl5VJ
         hpspzrRsNRWrfKRDiNvPwIDkWvzCRtnlDv/UVzEcBFuMc8QmtwlFl+QDdibFMsrTxY3C
         3kaCnAMRgxE8wBwpKnfE8UtINocGOtxMrhh9N5YfwPFN80OM3Hee+HcrYToQH8waySgx
         301p3WKjk34mEluhbWIy1ZL5LAliRLsFWXSZyUwXnNCWuMUftX9deTxMzn3htac0HAg/
         uP9w==
X-Forwarded-Encrypted: i=1; AJvYcCXbc70I6x9rcdd1OSgn++rcAJTtjtc4fvtUg1hz6YnhNYxL/Cq8DsFyusHFxOOAypFh1NfsE6jYrbX3SOnFujuRmg44BLAnHn/cOgkjyic=
X-Gm-Message-State: AOJu0YyNx4OI+o9N+h2Fn3aGQB0fg+mspABb7zFctlGLXuxIA9D4Njz5
	r0g/+uT/i8/0q6fGTUOmgX99pPF/sUHD4ItsNTpkc5HFPF2io2Ic0eII1wNfLmeBVtfFRqfCJy8
	3fVFoYEVMPgQ+Zbjy1nAK47d0lj8ru989hOSLxe06NbjpjqqfB+CyWmqk7l0tJc05
X-Received: by 2002:a05:600c:350f:b0:421:7aa1:435 with SMTP id 5b1f17b1804b1-422866bcd1amr18073005e9.25.1718200785542;
        Wed, 12 Jun 2024 06:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd2vyH6GtmeuAXkuJpdbwpHi6ddrSvmUfaRuvR9d+72lJ6HKDEGhZiKptTfeidD7H06+zUvA==
X-Received: by 2002:a05:600c:350f:b0:421:7aa1:435 with SMTP id 5b1f17b1804b1-422866bcd1amr18072605e9.25.1718200785207;
        Wed, 12 Jun 2024 06:59:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0e49e898sm12964745f8f.22.2024.06.12.06.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 06:59:44 -0700 (PDT)
Message-ID: <975fec7c-6abd-40c3-9eeb-b718960ee206@redhat.com>
Date: Wed, 12 Jun 2024 15:59:43 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust: add abstraction for struct device
To: Boqun Feng <boqun.feng@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, mcgrof@kernel.org, russell.h.weight@intel.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
 fujita.tomonori@gmail.com, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240610180318.72152-1-dakr@redhat.com>
 <20240610180318.72152-2-dakr@redhat.com> <ZmdID8AlXtoxUfC1@boqun-archlinux>
 <ZmhPW9yq7y6jbmIg@pollux> <2024061136-unbridle-confirm-c653@gregkh>
 <Zmh3oN9sWamaYHOD@Boquns-Mac-mini.home>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Zmh3oN9sWamaYHOD@Boquns-Mac-mini.home>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/24 18:13, Boqun Feng wrote:
> On Tue, Jun 11, 2024 at 03:29:22PM +0200, Greg KH wrote:
>> On Tue, Jun 11, 2024 at 03:21:31PM +0200, Danilo Krummrich wrote:
>>> ...hence, I agree we should indeed add to the #Invariants and #Safety section
>>> that `->release` must be callable  from any thread.
>>>
>>> However, this is just theory, do we actually have cases where `device::release`
> 
> @Danilo, right, it's only theorical, but it's good to call it out since
> it's the requirement for a safe Rust abstraction.
> 
>>> is not allowed to be called from any thread? If so, this would be very confusing
>>> for a reference counted type from a design point of view...
>>
>> What do you mean exactly "by any thread"?  Maybe not from interrupt
> 
> The `Send` trait here doesn't really differ between interrupt contexts
> and process contexts, so "by any thread", it includes all the contexts.
> However, we rely on klint[1] to detect context mismatch in compile time
> (it's still a WIP though). For this case, we would need to mark the
> `Device::dec_ref` function as might sleep.

I think once we can detect it on compile time we should do that.

As for the might_sleep(), if we want to have this check, we should probably
do it in device_release() [1], rather than in the Rust code only.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2557

> 
> Regards,
> Boqun
> 
> [1]: https://rust-for-linux.com/klint
> 
>> context, but any other normal thread (i.e. that you can sleep in), it
>> should be fine to call release() in.
>>
>> thanks,
>>
>> greg k-h
> 

