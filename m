Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEE17F360
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203910; cv=none; b=qOvOM/NFCrSaDQz28GbmBGC3lW8slVnu1bvTIwWZ3ir9+QhJrCxkhWeyBG1bSxU3kTT/oExtUCT94i5+XXGvIHGL0IVw0yPmnPip9D6Smh8h+rnq5+IMHKHB4dL7WUKGOCaAv1gtrrFS3OwbYoY6ydDXOCqTEgpRL+rC0dOQQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203910; c=relaxed/simple;
	bh=uQnPob09RXsb+k15cJ24zoa5K6h1QNmp6SDtPOiGCwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJ1xmo3cpFre+jyJ17FOMIUm/Z7bBdD7eanQR+oruiGZOnay10FkdTkwenAq7XYTft2u16N1g4Z6b/sEA1NnY6OBMeUEbx/Bl0mA0P6XaxodrjDnTG4lFCA1RsYUtl3sKdIvAMbKQ8kiK1WVASHHrD+9hlXBDHECD2zBM37G8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgUm2iG9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgUm2iG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718203907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVmTidelMG1PiYfixcVkCNJNOeFZsMw+GcpMsMjUemA=;
	b=hgUm2iG9Ng/CTy6S/E6IRNKoUOM2ZLZaDpogiLHU7SfMc34+6S2alfzViepIEQibo4PcMK
	wFrnXJB2GvJ/02NVLqv27X0A3KA9hTooz6uTTu/r47UTuP9qetztctJVq9eFAtCyfay/mo
	VhiigXOZUaTKaeI+zQd1AE8UryJpy8k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-Ntf0SJeDOAS4rXlmR5cfig-1; Wed, 12 Jun 2024 10:51:46 -0400
X-MC-Unique: Ntf0SJeDOAS4rXlmR5cfig-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6f2af30793so122911166b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 07:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203905; x=1718808705;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVmTidelMG1PiYfixcVkCNJNOeFZsMw+GcpMsMjUemA=;
        b=gjstnDDKBZvmR5PkgLnQUGnUAxE3NzYgy71jarjISn6AGIyeHv8otOcrfReVu1MpmA
         rk7om04iH3d6Xk5Zy9bGnB9HAusFXiw3qscoFkSrjcH5qame4YooVk4KNcw8df7DRZOm
         +aT+u95D/+qRrIE7QoIoVYJneY+zMwSMRcRl0A2VauEdtQnd8fMXgfKvlx2f3QcvbiCr
         orrAH1St8gAe0enMxwO+Hc3Wsd83qhOrCFVzB+Ju2lW9/ZDPBmP0+VFqsMrbNMtLAtQ6
         F9Nmg56JZ2pi1+9WitFCVBjuJ0cKU703PZLVecra60p+0+lUovbH8kgdEIhBumR/CMSE
         h8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8LlpdjVghl0U11yxj91+h6w5+e+rSk0uFdjJCZBEW0jAyYCpDqgxrhpl5+M5EeSWJErwsX3cRcS7rlnKB/H8i9/3PrU6Y5sdTKE+gNmc=
X-Gm-Message-State: AOJu0YykjkkuUkeaStD7pvJ27/g9BfVskCQ8SXU/1thjqQ/L7YZnMTP5
	gM/2Shg5G1lukyz5H3NGIDk0lH2WOQ45A+TO5JL2o5NYLHz4ltTdsoKM/+oG7yV/Ev+EpsVOMwA
	IIRHXrWCgqbnIsSwvzrh3cUVWacrB79vwwrMIiAVX0FiqH1RxXlIG0t5ExlG2MrEW
X-Received: by 2002:a17:907:7e87:b0:a6f:e36:abae with SMTP id a640c23a62f3a-a6f47ce6c8bmr168032266b.42.1718203905096;
        Wed, 12 Jun 2024 07:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbGf3kVGrfya669fPpWGOZYpQmZGTofto5bcgn7UtgXwLAm8zLWXejA536NlRPQkJg4vVVqg==
X-Received: by 2002:a17:907:7e87:b0:a6f:e36:abae with SMTP id a640c23a62f3a-a6f47ce6c8bmr168029066b.42.1718203904649;
        Wed, 12 Jun 2024 07:51:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f102c4494sm539231766b.112.2024.06.12.07.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 07:51:44 -0700 (PDT)
Message-ID: <d74edb73-1dba-43f4-a50c-36354c39d758@redhat.com>
Date: Wed, 12 Jun 2024 16:51:42 +0200
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

Similar to my previous reply, if we want to call this out as safety requirement
in `Device::from_raw`, we probably want to add it to the documentation of the C
`struct device`, such that we can argue that this is an invariant of C's
`struct device`.

Otherwise we'd have to write something like:

"It must also be ensured that the `->release` function of a `struct device` can
be called from any non-atomic context. While not being officially documented this
is guaranteed by the invariant of `struct device`."

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

