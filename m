Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1B45F72
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYpCYvaT"
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B875493
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 16:07:29 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-692ada71d79so2297292b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696633649; x=1697238449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKyvM6ylbhTdR67AI9jZVPgkogDuDD04vi10dphci88=;
        b=LYpCYvaTwfkXfE+03qn5jVZDVIoM8NJ2LxTYUTC+pUWU6UKvS0QS9qNhfYD/waGAfL
         dADwDfET43AAdlkjiECrXPgwg1l/T5BqzQYL3zRjcChq01uTlLSnr7ECjKg1difkeDHT
         M0ICbIF5K1opWKXvOlY8Hk+z2F6l0ScUU8U9ZS2Pdn+EIbxT5ssnmJSf1q92iXhwyUAj
         2fCTSwPks7QHqeq+oVNtpQostD3yzHAcE9XJuixMdnpw8O0vNS5qakIOMuGjsMfBfXr+
         Nh6mikEkNVzYkaKWPqXXBx80SPf+GzBKQZQSpWwk5sYP35aXXlyf5j9gemEVlQ6sh529
         vVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696633649; x=1697238449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKyvM6ylbhTdR67AI9jZVPgkogDuDD04vi10dphci88=;
        b=AUifdaBqyr9rH2ddgKgf/9shDmURSjlaYU8m6SfjQYwTRo9QDEOzV6NjNEWTgb/t6d
         IvljTsMiML+jry1IR4McGH662JZANEV3mU4aAw2PmRTqZXyujqNbKPSjRQVXW2r8zTlE
         pB5K+P6ywb33Sx/5iuda78VCz/jj5aFymoXpwmCl35jcpdbJYgfAxdhyi8qbCVQp2y7O
         7yPFrwodziROK1z+kzzA+QJo3tgUmTeatWRbVG8+dc2xwjgty9VkHpqghSnpMRfrtJTL
         XR4NIJA4r5Hdcegi9oSkrL5t0EMoYUfvBcdlCwWnAAG029gDbY7jKcqSqANLlHHNi9RF
         MPVQ==
X-Gm-Message-State: AOJu0YxePC/nzjkh8oQj1AB3+2b2MY4A+5Kc1BT9xipfWSuGfB/hPdOy
	S1hFE0IGvTBI+dhJLE69EH0=
X-Google-Smtp-Source: AGHT+IHODLwNnd6ydPyKfu0PfI5BXRnfHFd+3Nc0BcuTy0VSSA+2tTY1JaCstzJ379/39+3oCP6YaQ==
X-Received: by 2002:a05:6a20:a11f:b0:163:4288:1c3d with SMTP id q31-20020a056a20a11f00b0016342881c3dmr10646062pzk.43.1696633649083;
        Fri, 06 Oct 2023 16:07:29 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c24600b001b89a6164desm4498195plg.118.2023.10.06.16.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 16:07:28 -0700 (PDT)
Message-ID: <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
Date: Fri, 6 Oct 2023 20:07:23 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20231006155739.246381-1-yakoyoku@gmail.com>
 <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/6/23 18:13, Miguel Ojeda wrote:
> On Fri, Oct 6, 2023 at 5:57 PM Martin Rodriguez Reboredo
> <yakoyoku@gmail.com> wrote:
>>
>> For now I don't have a completely working example but I have an MWE as
>> following...
> 
> Thanks Martin, I appreciate it, but I don't think this would work in
> the general case we want to solve.

Well, there's the network PHY driver series that is stuck on this
topic, I (and probably others) have local work that have the same issue
and said general case might not arrive that soon. So it'd better to
start on a feature that will benefit API users right away and can be
updated to fit needs. That's what I think.

> I have been intending to work on this for a long time now, and I still
> mean to. Hopefully I will have some news at LPC.
> 
> Cheers,
> Miguel
