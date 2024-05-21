Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA373539
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716290578; cv=none; b=CxuouXG7DEVK2cBBzfsABPdFYlX3Q+eovDe0QpqWJlfa5AVTsxYu4m2UUk1wptk/LyFIUS95nzuqq9q2kJt06ONkqx3uPLTNmQAVYF0BOPzoFhpKXwx1ASyscGXVSt6lbvncII2C3rXcC0rmji28XitYEvTy8Je51vBHfy39eoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716290578; c=relaxed/simple;
	bh=k/JRGdMuDPu8HhJUTkcTAdkXQAVA5INw/irGgRh31Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZj7SNvKabxeKP1gU2JhKv/KOPpKMQmHKTI9ds+uK5AWqAGZWaTFHIYvTkHUneNVqxKDIqOa9XYRwPFDQ7Ub1rglHY6J/Xv6mk56MnG/srosz8P6IAx1ejGcwiss/flPmmuSg7Zca9bWaSabFpS3VRBesWQ8CXdFYVWW1c8FQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7+mZkCk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7+mZkCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716290576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHk/Aed3i1ecXpAXSTOJ91mw0z8jVc514DVco1BYwS4=;
	b=b7+mZkCkO11AVAu5QW5oVukuO+VxWe5zF1WFAw2zKlEQjPO6+UBab1cXnI11w01BEqtMOZ
	j4EP8m0XCnPHo/CON7AlXXgArAVQ9RTOKNPzlkQGGog8fwpywsoN4bxUU89Y9FRzbk+oVl
	vG0QGx4xaB5GwOCBujuAUaKinIzNe5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-VGxwLhQAOJqGD0H3krEhCg-1; Tue, 21 May 2024 07:22:52 -0400
X-MC-Unique: VGxwLhQAOJqGD0H3krEhCg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41fd1912f63so92158815e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 04:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290571; x=1716895371;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHk/Aed3i1ecXpAXSTOJ91mw0z8jVc514DVco1BYwS4=;
        b=T6uoWRiWcgDXattXKSuu2IVltLXBN8NyAxuhH0Xk3tZgBR5NWVEdUYzDSqR4lwvvAG
         fJri7Ys5ZfAaS29qeWIj14CeajBMmwLYDMiWV8OCe3XRGTPHQHpBjnzHWiUPqkBoA7IX
         e4E60Bn3ThkAZKX/P04OSJb+5VxKj3eJ0cEyb/HDFywNm2WoVNX1ZvoxDNJ1Ro8uOlVT
         8XCX8aEr65Xd5Qby9ZXk8cfzhqt0ajJv0foXcBtZeNFuLskN+exm+/QrnkOThwKVTB9D
         fpdLbxiXatWa6fzRXuJpvatB9asMAZh26cBW9+zaHBPAZ0SqhnXL2H38E9z7Kcv5IX9d
         VecA==
X-Forwarded-Encrypted: i=1; AJvYcCXOXdMa60D+RvkJl+oAPz7i7LxpT+WQwune0GfIob0dg3a8SR6uIp6u5AXxdPF6iVsxDnRIMchs3rN6odbEvNClZskNULSpxJFwO3K5sQ0=
X-Gm-Message-State: AOJu0YwKpEEBjO0gFqWXWGUkJ/yARNEhnVb/g0SeATarTLcpm7XeTPU7
	HQ0W9nke2owV2VVTy+pmgjfAZLIX8EkuNg0n9/yILgoKEh1XBMkBC6EebaVotOeaMmdYtoMBIqs
	90PpLe6N+p8N6xyAx5d36gMbS9Zd16yyYPfdFZLLrkpWtb9cnFFe3QXPIzJ/5fOrq
X-Received: by 2002:a1c:7910:0:b0:41b:bb90:4af with SMTP id 5b1f17b1804b1-41feaa44138mr310695035e9.20.1716290571315;
        Tue, 21 May 2024 04:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnDG2VXNjT+etdhjHBYITRzAAnJCTDKOcgyRnMS50oTbo2a8QHWU4X7fhBAgBVC3r+eIiCew==
X-Received: by 2002:a1c:7910:0:b0:41b:bb90:4af with SMTP id 5b1f17b1804b1-41feaa44138mr310694755e9.20.1716290570972;
        Tue, 21 May 2024 04:22:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad04dsm31724783f8f.81.2024.05.21.04.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 04:22:50 -0700 (PDT)
Message-ID: <8432d37c-c3fb-4404-ab74-fb0a9940f0de@redhat.com>
Date: Tue, 21 May 2024 13:22:49 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/11] rust: PCI: add BAR request and ioremap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, pstanner@redhat.com
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 airlied@gmail.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20240520172554.182094-1-dakr@redhat.com>
 <20240520172554.182094-12-dakr@redhat.com>
 <CANiq72kObXP7-YtcXnWQXJpEQ=N+RtcSeM6A+scBK00VkFj5JA@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANiq72kObXP7-YtcXnWQXJpEQ=N+RtcSeM6A+scBK00VkFj5JA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/24 01:27, Miguel Ojeda wrote:
> On Mon, May 20, 2024 at 7:27 PM Danilo Krummrich <dakr@redhat.com> wrote:
>> +        let barlen = pdev.resource_len(num)?;
>> +        if barlen == 0 {
>> +            return Err(ENOMEM);
>> +        }
>> +
>> +        // SAFETY:
>> +        // `pdev` is always valid.
> 
> Please explain why it is always valid -- the point of a `SAFETY`
> comment is not to say something is OK, but why it is so.
> 
>> +        // `barnr` is checked for validity at the top of the function.

I added pci::Device::resource_len(), since I needed to get the VRAM bar size in Nova.

pci::Device::resource_len() also needs to check for a valid  bar index and is used
above, hence the check is implicit. I just forgot to change this comment accordingly.

>> +    /// Returns the size of the given PCI bar resource.
>> +    pub fn resource_len(&self, bar: u8) -> Result<bindings::resource_size_t> {
> 
> Sometimes `bindings::` in signatures of public methods may be
> justified -- is it the case here? Or should a newtype or similar be
> provided instead? I only see this function being called inside the
> module, anyway.

I agree, I just added this function real quick to let Nova report the VRAM bar size
and forgot to clean this up.

> 
>> +    /// Mapps an entire PCI-BAR after performing a region-request on it.
> 
> Typo.
> 
> Cheers,
> Miguel
> 

