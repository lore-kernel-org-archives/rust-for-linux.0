Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736138DE9
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715034622; cv=none; b=LMZsey+C16vPcbWTWnI7KpYRrncqxTwNNc0uzS9oHtETxV10FPKVjrIuem2/i+9ZVcExeCv6TSVq6Bf2tdunbnvBc3PAVsW3mFBfCqDF1qTEhmFePwct0CuxFLZ8LFehPNs5+qiJdei9Q29n9j5CBMY/NyibBXf4TtnSSApKQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715034622; c=relaxed/simple;
	bh=5Jao47yGNn5uWXmNME35hrE5cB/O2dzktMV49xtOG/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6MfM2RneCUg5sXkgnJ3Sp4sL7Bo0eV/5UYvC2qhETudNwBLz896n6W5BH1v4wfsJK8bJwCUMr2tVkGSJ8LSR9fL7LYV/6TMXS+7wo4mDrgplMVn7vM9pMCsUcwkyXWEnjYGRCpmYwFSDGlu4AjJy4bVaBgspZAcwdZuvN7CNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmpkEFM4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmpkEFM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715034619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuI9Uo2au3lLvKwKsRtdvIlF3og2vkLdxYmz96XBf3k=;
	b=SmpkEFM4886U+h5jpKjhmKk99I1vFpy856I/Z5XUrpkCmvfBIzd99IfZvUhWrcDt3tfCHh
	RwPKu2rbDJL0DJDNQrcFRSUZPlEjrLQDXeXnLuCOYt9HIFCns5L5oQcRvPLpmngbIFXJ4Y
	jIaHhk9Od1T385eMRpmpIF0oyo/kjho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-YkBE0_ATPcuegqoUWvtiwg-1; Mon, 06 May 2024 18:30:18 -0400
X-MC-Unique: YkBE0_ATPcuegqoUWvtiwg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-349cafdc8f0so1382821f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715034617; x=1715639417;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuI9Uo2au3lLvKwKsRtdvIlF3og2vkLdxYmz96XBf3k=;
        b=Nj/X1r7jgyhLuM3JqQN+yKEa2W5iXlZ7pKIUVoftJD3Dq0PW+UFIkIXLLZZZvOcddI
         zOS3UPuhJdKYih7rGxJNDiKb4ppg8ogjBUnvg/crh0rFADatT+vo0LN3DEDbNTyaQxwX
         wCVyXeTfxAYztDkKyIK648BhYGkPZ9Ti8YPGamIibU4QfQZIk1v9cUJ5ueJQHFohp/Yy
         EevURRHIIzSY79UYMK9MWIFJKaUoeir4/B4gTeTAT4vNN42G9Tqw0vDav3QIJzIXM0/M
         ZE9R2X9yUwRWPD6zQLGj5PcYNiw7iBKVXnz8JRQE8Pa5LyCtuct1wHQf7Sm2gU/KU0M6
         Qdtw==
X-Forwarded-Encrypted: i=1; AJvYcCV182M9pUVOa0Pb+rNMcPhraOXkIYXrprLB3p/vbdKZKirfj0UMtiR7Jly1mIzVMgLVX47ZQELlTNaeLR1bmk2QWGLJbEs4XHpSOeoaKrE=
X-Gm-Message-State: AOJu0YwqGrxCxnsLcSyFxIyQQ8atVa3LCWenkOHOfiRAUs+JGMy1tP4f
	IZAqhh9H0TdDYUVkvz/Eq05FRFIBjlzKnaqvmAx3cy8JlC7dUJBA1+1H1D9ryFPLBebnElj9mQG
	MGmC4jbq6TWVcaWlzC9EhQA67wfPCj7Ls5j6ek/xi7xgL9qgboOUG/mItSSrBmd6G
X-Received: by 2002:adf:e60c:0:b0:34c:71d0:1151 with SMTP id p12-20020adfe60c000000b0034c71d01151mr9708122wrm.10.1715034616994;
        Mon, 06 May 2024 15:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf7Ha3lBYpJRfv24nh6oaQZ2amr4RQGZKGH9W83Z0kwaRaoik6cKo2E5HLWOnGWLtKc5Hz1w==
X-Received: by 2002:adf:e60c:0:b0:34c:71d0:1151 with SMTP id p12-20020adfe60c000000b0034c71d01151mr9708109wrm.10.1715034616624;
        Mon, 06 May 2024 15:30:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id cw1-20020a056000090100b0034dec80428asm11510510wrb.67.2024.05.06.15.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 15:30:16 -0700 (PDT)
Message-ID: <b57dde93-06db-405b-ab94-864779c76010@redhat.com>
Date: Tue, 7 May 2024 00:30:14 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in
 VecExt<T>::reserve()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, rust-for-linux@vger.kernel.org
References: <20240501134834.22323-1-dakr@redhat.com>
 <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
 <CANiq72nHubtd7oB=JUTY8B0H9WA35jio1L0tfTSxDpJFLBcdMw@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANiq72nHubtd7oB=JUTY8B0H9WA35jio1L0tfTSxDpJFLBcdMw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/24 19:50, Miguel Ojeda wrote:
> On Mon, May 6, 2024 at 5:22 PM Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> Is there any benefit using an if here, or is that your personal preference?
> 
> `if` is meant to test a boolean condition, which is what you are doing
> here, so the question is why would we want to use a `match` here -- we
> should first of all try to be consistent.
> 
> Now, I can understand the appeal of how the `match` looks like (e.g.
> less braces, less zig-zag indentation), and if this were a `if`-`else`
> chain with several cases and the wildcard `_` was not used, e.g.
> something like:
> 
>      ... = match n {
>          1 => ...
>          2 => ...
>          3 => ...
>      }
> 
> then I agree it would be clearly better.
> 
> Perhaps you are arguing for something like "let's always use `match`
> in cases where a value is returned, i.e. when used as an expression,
> and save `if` for the C-like cases". If so, would that mean then that
> we need to do:
> 
>      match c {
>          false => ...
>          true => ...
>      }
> 
> to be consistent?
> 
> Then there are other things like `if let`, the potential `is` operator
> and postfix `match` that should probably be considered.
> 

Thanks for your thoughts, but style wise I don't have a strong preference
for either of those. My question was honestly about whether there is any
other reason other than style.

However, I don't think using match is that unreasonable. There are cases
in the std library as well, e.g. [1]. But again, I'm fine with either of
those.

> Anyway, I am picking the fix as it is.

Please feel free to change the match statement to an if statement if that's
what you prefer.

- Danilo

[1] https://doc.rust-lang.org/src/alloc/string.rs.html#1358

> 
> Cheers,
> Miguel
> 

