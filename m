Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC2C2C8
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Aug 2023 17:16:34 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C8B4207;
	Sat,  5 Aug 2023 10:16:33 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1bbb9fcac6bso2111120fac.1;
        Sat, 05 Aug 2023 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691255791; x=1691860591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6y50NR2irE5urGpda0xl21YV3UXebTTCX+LMVGBuRNs=;
        b=gP/DA1lVKziZe04i6d0qbJ7kzZ4uNG01eiyH5lyfzXLUxZbacvxD27orx4MUpF97J5
         xlpwmdGw9hjAEnyV3bZDrdlvGApjDM/rC/lPNGwwYOjSH9z8Dx7lWN9udoflTxZORHtq
         NI424AJmBu2He1eQZYwj5reO+GxBEV0CBpDK6WciyzqqdJPYpQusXnoJo9MGpFy/71vv
         kHh2ih6WLPLE2LeQvSTrqz365ny1nPST9CDiMxAYPOiE0tkkPUBUcC6fysG0Xg1kjCXj
         aj0JLVvBliEm+iNBH5QgUlU1vg7NFfHR4eOfgpl1it1EVFzo1TSZGhcNMrMVPQbZubnE
         BAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691255791; x=1691860591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6y50NR2irE5urGpda0xl21YV3UXebTTCX+LMVGBuRNs=;
        b=jOYzNEFuVD054hFAzzaLqyrmB2mO5Kfhw4PCGIlucWBrUcwSG0Etp1ZiA0ipA5C9hL
         +IZtTn3DuibkOeWDGbXdiA/YM5P7M2tGR72aQgjCy/RSbu9zLBiEIQ+KkKXCRZa4GRJq
         rvSpuKLvyGLD9UYy2p8U5Q7c7LO5vtOiUu8MEK5MhvVboeMv/JPnUxmdlZDi9vBIqNaG
         qBXlveH7z3SkmpzxawPDJgGZNQzQNqlaH+4R2x2DsD6Ikmh0q0/d/yGsBoxK7sOWXHeQ
         WEZZ7UkE0m8IJqYPQHzzek5r0jNLj6qT044HNFHGkJ9eRTNCFLSW3LokGizt2caj/QwG
         b2Rg==
X-Gm-Message-State: AOJu0Yxa1LArCKWxhYClBIUCJHnS7zKGCneU+XulmXhg9BWcKxJ6eizj
	HyEaZ0XpPnNJjOqFHklqYZw=
X-Google-Smtp-Source: AGHT+IGdooMiXINaIZaNyQskDIODo0FSzWUu69x8z7DyOkCt8Nprf1EZEezhrkXirhxaJDdPH5oKCA==
X-Received: by 2002:a05:6870:b522:b0:1bb:9db3:ccf2 with SMTP id v34-20020a056870b52200b001bb9db3ccf2mr2705649oap.19.1691255790802;
        Sat, 05 Aug 2023 10:16:30 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id r7-20020a056830134700b006af9d8af435sm2702963otq.50.2023.08.05.10.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 10:16:30 -0700 (PDT)
Message-ID: <0f7185dc-51e5-461b-8669-5e1cae550b76@gmail.com>
Date: Sat, 5 Aug 2023 14:11:51 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] rust: init: Add functions to create array
 initializers
Content-Language: en-US
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>
References: <20230729090838.225225-1-benno.lossin@proton.me>
 <20230729090838.225225-9-benno.lossin@proton.me>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230729090838.225225-9-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 7/29/23 06:10, Benno Lossin wrote:
> Add two functions `pin_init_array_from_fn` and `init_array_from_fn` that
> take a function that generates initializers for `T` from usize, the added
> functions then return an initializer for `[T; N]` where every element is
> initialized by an element returned from the generator function.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> [...]
> +/// Initializes an array by initializing each element via the provided initializer.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// use kernel::{error::Error, init::init_array_from_fn};
> +/// let array: Box<[usize; 1_000_000_000]>= Box::init::<Error>(init_array_from_fn(|i| i)).unwrap();
> +/// assert_eq!(array.len(), 1_000_000_000);
> +/// ```

Ahh, nice!

> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
