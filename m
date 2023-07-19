Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1EA360
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Jul 2023 00:25:30 +0000 (UTC)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A9130C3;
	Thu, 20 Jul 2023 17:25:15 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-56368c40e8eso988674eaf.0;
        Thu, 20 Jul 2023 17:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689899114; x=1690503914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyRltwBL40ly0dHFnfbd3y2RN2Os8N/El6xTnYycO54=;
        b=VEoewLVTPw3VAacMRS2+G/YMSswoX1AJOWmIGf6OlAXF1PDzp8t/cW+HxKGW2oYs+x
         4qivAv2RQ0xcpSo1KtyzwlqcbJBk+xTizat/RiuxqLb2z1c1ln/LHuIXYjNC0V/NhEuY
         xk2FfBRt5AbfysOKWY7C+8t30caQGbZDgymt95IoRtmqXeaaSDQBJxxDt73A1Jdn3Hd2
         AEm1V+KW1dpYKzs0FzJoMPpkpkSqiQX9BiA8vvE1D4PmJIKtzXEKD4gia8zb1iI4F7FG
         kjSngRxM4A2uN8J2xK/I+/p24u0IAtTCRJe/gte+FXq43fbuJw6Y7mWkzIteg32SEE5Q
         auAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689899114; x=1690503914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyRltwBL40ly0dHFnfbd3y2RN2Os8N/El6xTnYycO54=;
        b=gAXYCYrCoQy7Ng97Wp94WJ0o+Ex+7R19vwR+YJSj0gbi02uLPFIxxaGa1iqD3JpSym
         A6kwMju/oU4jExAb64XJgbThGVXMFHkrntoWSMQIxFo8Ma7ZwTgXA4FxqSyRppvvFk+C
         tjUkJv7/y3EWcJMRW5+o3O9fQ9lMY82OS/z0v4cLvrHJ6A7xN5nILWMmdu/yX9zFjdnd
         fxy2jKS4Jkqf1bT3Xar5pK4HcBGOlD32mGcXrNqcPrIQYtw7nSiPqAX6OMN0WuX+BjbC
         hKiFCAEF0SumwTgspSXHbgInamk/50rjeJlf7QEQE2m0X4O/Dde0EQUKXSsDLR77lWfL
         z5ew==
X-Gm-Message-State: ABy/qLajRzflFPQpo1Vrb3nX5yPcshDyvMCQEvq26/6VJJBdHqbzyc2D
	ndzfq4YlK5qwFby9SRuPEUo=
X-Google-Smtp-Source: APBJJlGNljnVlrTNP08cVwpF/RXFuvVlLrP64hNQ3+mZ7oj7zvUL6LixwtvNcZGF3oj59xDhX3w3tA==
X-Received: by 2002:a05:6808:210d:b0:3a4:8d82:2c1f with SMTP id r13-20020a056808210d00b003a48d822c1fmr543640oiw.39.1689899114300;
        Thu, 20 Jul 2023 17:25:14 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id t25-20020a056808159900b0039ee1de4e6esm928210oiw.38.2023.07.20.17.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 17:25:14 -0700 (PDT)
Message-ID: <ae33f931-e5e2-8e62-3d1d-b3bab83829d8@gmail.com>
Date: Wed, 19 Jul 2023 16:05:57 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] rust: init: wrap type checking struct
 initializers in a closure
Content-Language: en-US
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230719141918.543938-1-benno.lossin@proton.me>
 <20230719141918.543938-5-benno.lossin@proton.me>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230719141918.543938-5-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 7/19/23 11:20, Benno Lossin wrote:
> In the implementation of the init macros there is a `if false` statement
> that type checks the initializer to ensure every field is initialized.
> Since the next patch has a stack variable to store the struct, the
> function might allocate too much memory on debug builds. Putting the
> struct into a closure that is never executed ensures that even in debug
> builds no stack overflow error is caused. In release builds this was not
> a problem since the code was optimized away due to the `if false`.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
