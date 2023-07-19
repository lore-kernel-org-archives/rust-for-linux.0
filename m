Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C84360
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Jul 2023 00:25:10 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8898F2D4A;
	Thu, 20 Jul 2023 17:25:06 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5661eb57452so901745eaf.2;
        Thu, 20 Jul 2023 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689899105; x=1690503905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2LOoq5wa2PNo+v2h4U3/KghZGFxfJMOz4EWoSOlPFk=;
        b=Fer9L/z8PgcD36Q/MXoQXxPZY46VpSXh6SBHwvKppq5Roeedl4kHEA0rxBkfmS6Grm
         Z7gSBoMA6qhjYufl+JNQMXVZxi+yv2DIVhtz1Zh52EH/7e0R6HSw+32L5DfuvutHYIRw
         wyeC5UjV8xlgDI6hH7GCTRBODLujEovNl50oBIq2D2RDT/wOGdf5N7EA+xd7XwrDoaCA
         BNeHswE0Zfux8IlHOvBqSfWwdOQY1W19FK+V8CwCMH6PC3gMmVvCOHyvE98nTOwpzoeu
         9mbZ2FF58F/aMuFTk8jlMDq4CA1RYt3xSDQ76MIT+3XBHqt/XF+j0hi3SatTfF4WRCMO
         L7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689899105; x=1690503905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2LOoq5wa2PNo+v2h4U3/KghZGFxfJMOz4EWoSOlPFk=;
        b=TfycyZNs5SVitkpRxJKCfjzatBYARuHmCFuV98NzMQWB2AgcS6nXbOAqc/Z3AxhLBR
         9VFxKPbTWSmSz0rWuVjJGhWlosj6By+wqMFKehFE0aH0kFIgeeTbG8EoDpHb4nqOqAGv
         vKOgBAkAdhLubSWtkiksVBF8E43ygTTwQdLkU4z6q7QO0ihmJYqvx4bT6NIgQDCegdMz
         ueOYKAQ0KggsNh2OzwuRYiZeU/aRKMvz/Y4+m/ROZTZWrQX6LftogAya6NcO/VS0XjIO
         lxrVWyjPMtEeIYJhhX1GpzVfX/i+ZtluRunbJ5HliHKu8XAXTx2UXb3j6QLfMjg+urVm
         xw4w==
X-Gm-Message-State: ABy/qLb8rA6NB/OZ9yvXkR/wzm3BtF/jkkSzJDcV6GKBs9dXQUeseoqU
	HxKj1BeBawHSAiGoPwHDIaM=
X-Google-Smtp-Source: APBJJlHOHgYbRdi9FdUvp5KlZEVsEF/kaSK1o7UHSQrvVYSrnEpjL8pbFZFy2XucpEpuMTI31G8krQ==
X-Received: by 2002:a05:6808:169e:b0:3a3:8e77:ddfd with SMTP id bb30-20020a056808169e00b003a38e77ddfdmr669776oib.8.1689899105479;
        Thu, 20 Jul 2023 17:25:05 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id t25-20020a056808159900b0039ee1de4e6esm928210oiw.38.2023.07.20.17.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 17:25:05 -0700 (PDT)
Message-ID: <2495cbad-977e-4187-547e-ccc18669b8e5@gmail.com>
Date: Wed, 19 Jul 2023 15:42:28 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] rust: add derive macro for `Zeroable`
Content-Language: en-US
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>
References: <20230719141918.543938-1-benno.lossin@proton.me>
 <20230719141918.543938-3-benno.lossin@proton.me>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230719141918.543938-3-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 7/19/23 11:20, Benno Lossin wrote:
> Add a derive proc-macro for the `Zeroable` trait. The macro supports
> structs where every field implements the `Zeroable` trait. This way
> `unsafe` implementations can be avoided.
> 
> The macro is split into two parts:
> - a proc-macro to parse generics into impl and ty generics,
> - a declarative macro that expands to the impl block.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
