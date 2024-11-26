Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD418C332
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608855; cv=none; b=gltsN2P/mUqrEQlVliLE6EeBbDbsgbtrEQr5XyQeX8I8gY+3xxv6hprbjAN360BCGrf+SUtO3MZmxJEfCnwb5mmhzxRTWrM2yqg8ECpXPfTvkk3Fesrck0IzvUKHTd/sV+r+tAdzi7XIfRS7x5fDLNuVXHXEidKA5okdnxWYyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608855; c=relaxed/simple;
	bh=ZQeVCrg2gM4bUqbiWZ2pSlGdT0JunQW/z1akXWflPLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQEKaLUIOJXeTtZ+zz/KXwedIOBaKqyicQdyxzX7R2BuoBjndngetkp+OK+2ECoP+gBygEcNZ7uIsXBO0ZXWOiqbpQIcE33V5F6OOzZQpQami9pMIIKCk/4ves2fIek+n5f7Pag/eHzforfnIAicvCMLAEnrmKNMLwoTP3RGt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEnQHXIb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEnQHXIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732608852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PYffdD3H7r/cAfrPT7BHSkeySn0bQnqTYRV8e9/iuM=;
	b=JEnQHXIbu6f2Oe124/0L15noFAxqoK0OChNQiVXbzXqLwqIFlPTRyfqcOT+ZX20jdoazBF
	bu1/WkwSZkjTsrZZ4SEEXGwhCThhkbdHG/hWH2eWll8bcUxFB0ONlubJcZFos+V5ckJ9p1
	dXOhhaysy65re2vU9RnhO06DPnFpyuw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-d6qsu7g6NzigHzOHyNjq3Q-1; Tue, 26 Nov 2024 03:14:10 -0500
X-MC-Unique: d6qsu7g6NzigHzOHyNjq3Q-1
X-Mimecast-MFC-AGG-ID: d6qsu7g6NzigHzOHyNjq3Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4349e97bfc4so19916785e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 00:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732608849; x=1733213649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PYffdD3H7r/cAfrPT7BHSkeySn0bQnqTYRV8e9/iuM=;
        b=LayQjsmjv764nmw80Cn5P6HdZtqhYLkv7t62ZKnoX1YV5vmBrXl6xh/FwO5v8hIkr+
         qYz+Sbu5pkgC5Fyu8VA0IXY2eFsU0ocI+19qoemP+uR80Z6k569m3r1z10JYtWmZ5Ojs
         LPS3y/Co0GatoTaHDOK6KGrnT44dEV/TRPap+zNHyD8Fs8+rTMJAhkOKSt94ckup9Ua6
         PukLtKk+0eYJmZmVgnmHSdzsZYpuN+X1ptfzxAdOgKCrPd+o76G+048Z81LgNZa7qWJ1
         csNo8H/0xOPz5OEOGS3aLX0+PvD6lTfEzV91RgpmTcDfJiEeEDgMEOrJnIM1Htd3e6Oe
         cLxw==
X-Forwarded-Encrypted: i=1; AJvYcCWsdBr7ix2kiJ6y5PLDFcyCp6R7PXmYqEGlHHr47iSK49jKEdqIl2EU8iXyVtzDjQ9I6lS9k32advHBMY3kGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIkQQKG2xgB/RXO4KwQBJGe8GDko+L2Cs3pcQs5h4/FJ+g3TyC
	BMY+KoB6ycDm5ZMONGNZE+VuIcDL3/C1C7Kg6v2xRlGBUBcEfZAWq3UmsiV5CkZlOJziVbY6xGM
	naaY+fmGNB/sPWAMhyltOr6r33JoSPfbY9BykQRi5yqetWRyLjdNMr1q9ftPrAJXp
X-Gm-Gg: ASbGnctEq5TkM2dtqyp64B69pi9MOolrbnf0fkJKtPjrFfkpcJdJ0Zl61RTQw90lY8O
	g1MeL8Td4ZoboJjTL0DCS1FbmvM9aEwFbB5UDdHixcIzcV+wnOcn4rsINxx9wR9EUslX9ZZeWcd
	s+VDBTMoI7QoVRFC3eaL4mh6nW/4HLtbwk26mckQznjgENU0NjXmq2qWlfBgp84RF7+oiZtIHrX
	iyj9EJiJfTTFfo33Ghod8cCRgCFXGnuvb12U/1Bnk9wKUYmf/YvauevTlMTg2GokQAT+NpB7Idk
X-Received: by 2002:a05:600c:4704:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-433ce48fd61mr143495135e9.26.1732608849605;
        Tue, 26 Nov 2024 00:14:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFDdTAUpDazICddTRcs7eSMYzBASIkdqWlmSDX50+bGNPsf6siZEZlwNs8sfrhDaZNnrQelA==
X-Received: by 2002:a05:600c:4704:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-433ce48fd61mr143494855e9.26.1732608849260;
        Tue, 26 Nov 2024 00:14:09 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349cc29406sm89394485e9.0.2024.11.26.00.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 00:14:08 -0800 (PST)
Message-ID: <1c980fea-75c5-4e11-b769-b6d6967ed681@redhat.com>
Date: Tue, 26 Nov 2024 09:14:05 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] rust: net::phy scope ThisModule usage in the
 module_phy_driver macro
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>
References: <20241113174438.327414-3-sergeantsagara@protonmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241113174438.327414-3-sergeantsagara@protonmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 80fSbxtW_M7o0E4kGAHTXcTSdPWC3W-4fP2cNbdYrSI_1732608850
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/24 18:45, Rahul Rameshbabu wrote:
> Similar to the use of $crate::Module, ThisModule should be referred to as
> $crate::ThisModule in the macro evaluation. The reason the macro previously
> did not cause any errors is because all the users of the macro would use
> kernel::prelude::*, bringing ThisModule into scope.
> 
> Fixes: 2fe11d5ab35d ("rust: net::phy add module_phy_driver macro")
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
> 
> Notes:
>     How I came up with this change:
>     
>     I was working on my own rust bindings and rust driver when I compared my
>     macro_rule to the one used for module_phy_driver. I noticed, if I made a
>     driver that does not use kernel::prelude::*, that the ThisModule type
>     identifier used in the macro would cause an error without being scoped in
>     the macro_rule. I believe the correct implementation for the macro is one
>     where the types used are correctly expanded with needed scopes.

As noted by Jakub, since this apparently does not address a problem
existing in the current tree, but cleans-up the implementation for
future usage, I suggest to target the net-next without a fixes tag.

Note that net-next is currently closed for the merge window and will
re-open around Dec 2.

Thanks,

Paolo

