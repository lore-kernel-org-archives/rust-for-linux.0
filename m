Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7675187320
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113113; cv=none; b=BjxYFZZj4ZXjX2h9UgYnerKRGThrXxGLkTmKrqk8LFYyhxOKDOfvuIqwfbLl2a5WcyulaZVJ0IziCbuEjzhPGhhWuHF0MCQkVlt72VqgRVO+f8/wIuq3neMr0m/he0r8UBWNkxEnGwQLq7a5qpG5P9GWsdhldrt7aFflxYW/j40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113113; c=relaxed/simple;
	bh=EIHMvgDe2pdWt9i8eVWoqg5/IcFQYMjzSSKbNrjCf20=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jrq0L6RpEY49/lO0pjGZlciBbtzy9YkU1L1hG+G1AWpCeSfy9LECO1m5PAUQoTJH8ljPldtCIOCELRI+na1C8IuFrpA+fdv/bTfAZVoWmupqdF9zz2rPYrYPWS3AHL3ByS7RpYh98kSgyFt4Zm/ymgn962vTiWFISxZa+UAV3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Np+LqWMU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Np+LqWMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715113110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETeKe+EVTr8lrQzcTSnY9OpFDqEqhqGps+Vn3qAcB4Y=;
	b=Np+LqWMUZQb8F8RJlG3pPDMnMy2Q4zntV90PNB46ASUxo9Ju+YY8eM5qViipd0/uPYiLpd
	b9QSJ9278K5qoEPgHyd2BScEWYurmpadVe+56rTq+ZiMgmmmScbqT6RdVtz+DafW/a8CbU
	eSAiixELM9o7oSGpvyVD8RDjoOhu71c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-CX2spuB_MA-sVBhpbnztvQ-1; Tue, 07 May 2024 16:18:29 -0400
X-MC-Unique: CX2spuB_MA-sVBhpbnztvQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34da8f1bf7cso2715992f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 May 2024 13:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715113108; x=1715717908;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETeKe+EVTr8lrQzcTSnY9OpFDqEqhqGps+Vn3qAcB4Y=;
        b=CBksnO3oIsdJN1TGzitcVdcUnM5nFWaSnQ76/f2M9XwVVQtgC+ESZ1ZT7iL9wg6TV+
         PJwyXtdCddw8S6ioPqrLO8t++JfwyGXZ8/8Pi3MxDwX3tG1u+zWJ82kZw+8eMc7HQzyo
         +3Lz6y5x4KirlOz8N7aBMyjwb2rqas3qRiPuUqK91Mih3+K6pWMqGg/M+PWzRa3qisYB
         dqCxFcp0VCaQlvpW29N/FeUZ2edpM6xSNmBtHQEXW/pWIa/Ti5Yp0ojEziKLJIATubV0
         vm6u68JMdA5K22uwB8l0EXTXStQ3ygPbd9scmniF1wGyvkvjabzUPSPFoCxMG75v3crZ
         YM/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdiFxuiy1SH+X3lEusDMTl/QqwGHxJxVAYE8QwAlft1UYxHuyHeN4i6lVgBXy5mLom/4Yu8fDLcQp4g6E6JimLpcVZlwkhHVj2xF+JhPQ=
X-Gm-Message-State: AOJu0Yw2aFBebRcGZjq8jc+nfDkZM00ovhxMdSkePmLbFSek8HpRMFAL
	0pBALDf2SnlzVQsUy5AU8pWkrjNkv5eSxU7X4gFij89H3YTFVO0Qv3rJwa43MQ/Jy16qqaISlP6
	pMwU93Sn43S6HhmbfEES+8N+avgGO+pEVuT+Er3kqYgZ7IOCLfs/eSAQkQFZZ3c37
X-Received: by 2002:a5d:4650:0:b0:34e:d065:ba87 with SMTP id ffacd0b85a97d-34fca055103mr641444f8f.1.1715113108188;
        Tue, 07 May 2024 13:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUdEwv7Q4FMBhNQ/2f4GI4UmP/Iu74UlbKSC4BMvqZ6bcPe7Yli4GAHkIkGFcK/ANjtj44tg==
X-Received: by 2002:a5d:4650:0:b0:34e:d065:ba87 with SMTP id ffacd0b85a97d-34fca055103mr641432f8f.1.1715113107821;
        Tue, 07 May 2024 13:18:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id v7-20020a056000144700b0034c66bddea3sm13720344wrx.37.2024.05.07.13.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 13:18:27 -0700 (PDT)
Message-ID: <7cc20453-81d3-4219-aca2-8f7d38574964@redhat.com>
Date: Tue, 7 May 2024 22:18:26 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2] rust: alloc: fix dangling pointer in
 VecExt<T>::reserve()
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
References: <20240430121322.2660-1-dakr@redhat.com>
 <CANeycqqRasM-k1WY8znPbF3_bRDGQHghnyMi=oy=Mjs9UQH0fw@mail.gmail.com>
 <ZjFq1uVXi4k1jjQc@pollux>
 <CANeycqryFoTk=7McpUY6UndO7RTrxCGLZvNx8-JgTm3uUcRfOQ@mail.gmail.com>
Organization: RedHat
In-Reply-To: <CANeycqryFoTk=7McpUY6UndO7RTrxCGLZvNx8-JgTm3uUcRfOQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, May 07, 2024 at 12:24:56AM -0300, Wedson Almeida Filho wrote:
> On Tue, 30 Apr 2024 at 19:04, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Tue, Apr 30, 2024 at 04:25:44PM -0300, Wedson Almeida Filho wrote:
> > > On Tue, 30 Apr 2024 at 09:13, Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > >          let (ptr, len, cap) = destructure(self);
> > > >
> > > > +        // We need to make sure that ptr is either NULL or comes from a previous call to
> > > > +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> > > > +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
> > > > +        // to be zero if no memory has been allocated yet.
> > > > +        let ptr = match cap {
> > > > +            0 => ptr::null_mut(),
> > > > +            _ => ptr,
> > > > +        };
> > > > +
> > >
> > > nit: why did you choose to use a match here?
> >
> > I felt like it reads nicely.
> >
> > > I don't think C
> > > programmers would use a switch to determine if a value is zero or
> > > non-zero.
> >
> > Well, I think for writing Rust code it doesn't matter too much what C
> > programmers would do? ;-)
> >
> > What is idiomatic in this case?
> 
> The idiomatic way is to use `if`. Even in cases where a match was
> required (e.g., when checking an enum) and only two options are ever
> used, the languages has the matches!
> (https://doc.rust-lang.org/std/macro.matches.html) macro so you'd do:
> 
> if matches!(a, A::X(_)) {
> } else {
> }
> 
> instead of
> 
> match a {
>     A::X(_) => {
>     }
>     _ => {
>     }
> }
> 
> They even changed the language with if-let constructs
> (https://rust-lang.github.io/rfcs/0160-if-let.html) so that we'd do
> 
> if let A::X(_) = a {
> } else {
> }
> 
> instead of the match above. Here's the first paragraph for the
> justification for this feature:
> 
> "Introduce a new if let PAT = EXPR { BODY } construct. This allows for
> refutable pattern matching without the syntactic and semantic overhead
> of a full match, and without the corresponding extra rightward drift.
> Informally this is known as an “if-let statement”."
> 

Very valuable information - thanks for sharing!

This is what I was potentially looking for when I was asking "Is there any
benefit using an if here, or is that your personal preference?" in v3.

> So the language designers and std library implementers provide a macro
> and a language construct to avoid using matches when needed, but
> you're going in the opposite direction where you don't need it but
> want to use it anyway.

Please let me clarify this:

It's not really that I want to use it or insist on it. I really just chose it
because I felt like it reads nicely. I did not feel like there is an actual
request for change. Especially, since you phrased it as "nit: why did you choose
to use a match here?", which is a question and even attenuated by the "nit".

When you mentioned in v3 that you "still think this should be an `if`", I
noticed that you might actually want this to be changed and I wondered why.

Me asking "Is there any benefit using an if here, or is that your personal
preference?" wasn't meant to read as if I wouldn't want to change it, but honest
interest in why it's more than just a question and more than a "nit".

Please also see my reply [1] to Miguel.

> 
> Please change this.

Sure, I sent out another patch changing this, since v3 has been merged already [2].
Feel free to melt this one into the original one though.

[1] https://lore.kernel.org/rust-for-linux/b57dde93-06db-405b-ab94-864779c76010@redhat.com/
[2] https://lore.kernel.org/rust-for-linux/CANiq72nSQAE7c8ypWQA__BMoaBYqiEjXvHpuzn-=CsCky9uu7A@mail.gmail.com/

> 
> Thanks,
> -Wedson
> 

