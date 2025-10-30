Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B23358CE
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821019; cv=none; b=Zt6I3dJuszMIxoO8jI4hH5+jQSrTMC9T223G16WqlPsIXuZ8D8afw6eP2umyEVHK7QPpZSod3QTFZMy+En9io0fkSoC40vgBYe7fPLLeMNPm5DJXsC4dgYRi8PmddBgIGfZBm3urvMdWKF7LVCk7/v1dutSrtTpKxrAi/JtR1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821019; c=relaxed/simple;
	bh=Mnzw9pzNwrWCSgcH6ipQoH7G/IDDJyYaR2rylC0iQ50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7PWGQt9/0vteXk0JhgE8eiRhjU4Hf2Iq/3KZgJ0AfFTOL/TzVh8O2fq4G1O0E356wh7NQAvS6QyXfmHdWyEoeyuI+hIJyNvmFS7lmNSitxCNerzb7cI6dlXNhDZDds9U7oLf4nzYyU1WhDYDXbfdL9lxh7xV8R6s72okb4im9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVB3WO3b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVB3WO3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761821017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iWkyVjDEKA4UOcSqUcFeSMZtgpfTb8my2/eylF9zHuw=;
	b=OVB3WO3bIj1JfiAiZebH3qv/Lp0h1ZvxF8R+kXwrdKRJLshOrnz02DIePJ53CJOkiitObL
	Ad2yqhABfC9AXvEfApT/kN7t/YOmryEDs53054+BbYGwK+lEnjdm45ewYVOvZaarYj6wBK
	6sCQKiU+7MPWs0wczbVuz8SYPG4xeEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-y45MYu9FPPa-ZY27Y3yaww-1; Thu, 30 Oct 2025 06:43:35 -0400
X-MC-Unique: y45MYu9FPPa-ZY27Y3yaww-1
X-Mimecast-MFC-AGG-ID: y45MYu9FPPa-ZY27Y3yaww_1761821014
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so2864415e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 03:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821014; x=1762425814;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWkyVjDEKA4UOcSqUcFeSMZtgpfTb8my2/eylF9zHuw=;
        b=SFbiPrtxAODE7t8a2vokgFq04XMNI+ZRyCGZjf+TbNgWjvl5ogJG60dIO2g5Eygayh
         zW/tWjCHkZ2LNYOJqopNze3KxEGin+ri2PQTkpHg/tJl7Y6yqleDGcDgZwrPG4spafld
         HjFslfJ1kD8Owv0Ot0kv9X6JkvUZbazYG8KtCAUw55MZHiuGumHo/Ax3cIs08ZI0sv07
         WtbbZEMdKE29qylnpFGJ8pxqET1d5ZeIP5lMnEld9yGZAyp/EplZO8YAMGYlsC9nuwp3
         6wL0l1eniwA/CT8GB+MSqBiyjEuIJnYE6qyDQ4DHxt0vn+X5qP/SPTZ8bcRPdPEJYL4k
         X+6g==
X-Forwarded-Encrypted: i=1; AJvYcCV5HcgctvudnKe9kFSvV+vrblFHZqj26EE6Pz9fmwnvLfBk78XmpH1GvYJ2HnugmwnZ7EISd0YD5Sm8QOffkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEU50XTLjHazpaNbsrqKuu+onExL4wQDGxbOrIXHuUeripf03
	iLX894xMkpk5Z/SGyYwXkfQYaOSNwUpMILYottnZm3xxVChCxzFdyorC3rGD0Sbq3DgYZ2s2BbW
	PFkcb4MEV8GuIxHxnPPpIz2sTP0GwfL7J/K0jaoFstFh4FFS3r4rb9kD23VnEtetVrVWz
X-Gm-Gg: ASbGncsnxyuqZlMjdkAkXhCCKZh6xqgv3tfO2Hr2hgI2cDf924RUolGOdcH6lOWoW/W
	5RJeY9+6vVPpdfYIVP8/t737hWs5iaw/OAQhN5WCBAl8nNNDRz0RKREPSJzBPc6JNR8NbH5xX5X
	GgKWLstJqJpdjU+EIvbZmricN0jxip0D/HSLVJd35poXuj5jq48sFUgR/hJcW+gsiWZJtKPHiuv
	PHXC0ewZtpzYVcS3/Mr6RKWAkWG5mDxu6Xe1pPwSeaFbgbTTKHjwwg1bcbInjGjbbrf54aVZMnJ
	Y+LkANAfJ2AXIhWcTWSA/vcu2PUZTSJVgSJhT7arT3e2jVjU+gUQh0T2eG7H4gX6vhsqv2jVm2w
	iBKDuJjv3h3oQQK+8WtJGxMN4ojMcEuY4pZmp2GV4GBLusrnmmnjV3gIFwisAz6ACi00XFi7rNn
	9FHwE=
X-Received: by 2002:a05:600c:1c81:b0:477:e66:4077 with SMTP id 5b1f17b1804b1-4771e3fb258mr67787075e9.29.1761821014440;
        Thu, 30 Oct 2025 03:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEKBkwI3kEzk0dvSna5wULrQAwpdTmKacghf4l+mO6chSR/XMFmwmF5CVJi6e1CakfkwN9ag==
X-Received: by 2002:a05:600c:1c81:b0:477:e66:4077 with SMTP id 5b1f17b1804b1-4771e3fb258mr67786745e9.29.1761821013973;
        Thu, 30 Oct 2025 03:43:33 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.110.222])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm31532680f8f.38.2025.10.30.03.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:43:33 -0700 (PDT)
Message-ID: <c1ff48ea-53ca-40ea-9541-85abd1a528d0@redhat.com>
Date: Thu, 30 Oct 2025 11:43:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: lock: Export Guard::do_unlocked()
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
References: <20251029183538.226257-1-lyude@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20251029183538.226257-1-lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hCEHfbSbFA4AOoZGfCjWNJdzenShlXJuxYWHS8LuNCI_1761821014
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 19:35, Lyude Paul wrote:
> +    /// // Since we hold work.lock, which work will also try to acquire in WorkItem::run. Dropping
> +    /// // the lock temporarily while we wait for completion works around this.
> +    /// g.do_unlocked(|| work.done.wait_for_completion());
> +    ///
> +    /// assert_eq!(*g, 42);
> +    /// ```
> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>           // SAFETY: The caller owns the lock, so it is safe to unlock it.
>           unsafe { B::unlock(self.lock.state.get(), &self.state) };

Getting self as &mut is incorrect.  That's because owning a lock guard 
implicitly tells you that no other thread can observe the intermediate 
states of the object.  (The same is even more obviously true for a 
RefCell's mutable borrow, i.e. core::cell::RefMut)

Let's say you have a lock-protected data structure with an invariant 
that is preserved at the end of every critical section.  Let's say also 
that you have a function

     fn do_something() {
         let g = self.inner.lock();
         g.mess_up_the_invariant();          // (1)
         self.do_something_else(&mut g);     // uses do_unlocked()
         g.fix_the_invariant();              // (2)
     }

Because the function holds a guard between the calls (1) and (2), it 
expects that other thread cannot observe the temporary state.  The fact 
that do_unlocked() takes a &mut doesn't help, because the common case 
for RAII objects is that they're passed around mutably.

Instead, do_unlocked should take the guard and return another one:

     fn do_something() {
         let mut g = self.inner.lock();
         g.mess_up_the_invariant();          // (1)
         g = self.do_something_else(g);      // uses do_unlocked()
         g.fix_the_invariant();              // (2)
     }

This version of the interface makes it clear that (1) and (2) are in a 
separate critical section.  Unfortunately it makes the signature uglier 
for do_unlocked() itself:

     #[must_use]
     pub fn do_unlocked<U>(self, cb: impl FnOnce() -> U) -> (Self, U)

Paolo

