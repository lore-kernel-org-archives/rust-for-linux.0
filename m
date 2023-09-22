Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7837A323E
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 22:53:36 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCC81A4;
	Fri, 22 Sep 2023 15:53:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ae093798c0so1449214b6e.3;
        Fri, 22 Sep 2023 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695423213; x=1696028013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWtfZH7tGaiIwmnEvO8mV+o4279Gpy+HhBTgrQirf8Y=;
        b=gvmSZDNpzBKQ2GE9GlQh8xH0zH2kcavolV3G1nvmdggu+mHCeDSZNsoIwoWsQuZKqY
         k3UcJ9m6offWN4uD3xjEKwp4rNiGrX6jehw6UA9e4TumlYd/0C8Ea2zBLXffJ9MnkLBN
         ZDu/gkk0OnBYyQZfSl6TC6GY5Ltzvv+HIy+/7qJ2jYfQY8KlIsa6UP+RC+9hd+aCI/BP
         WrQGARloAmFxbF7TLT+Q4G79Tn36I5b94HhApw+nURD6gm0DSGT42jQWQFAl36dt6p8l
         jEwbLbt4G6/zIJWUUJ28exjkDx8V6vf8q/Tvmrsuc9gltLPDFh4yQ8oFI3rpkmJ2PTHF
         9ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695423213; x=1696028013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWtfZH7tGaiIwmnEvO8mV+o4279Gpy+HhBTgrQirf8Y=;
        b=pd0azMj/03IZManVCIsEUxebRx0j11DAcmEA96QxpxafID42DBGShOrlPWg+3I5V5a
         smbCA47rcwipy1L2trKLlXcwZLlQnYQRWeQcPSQ0Ap4aGId4ghxEKStfr9d8BM+LcTpT
         K7gltxIkM6W0eQDT/kzNnD3BsQcVsWYG+wSauaTbNsbYrEu9biKWh9n81UtNX8DvDmJp
         smZf/DuKbtOyvT4Bd+AiDavCIv0pVySRAL/x/wsyfO05YMH3bHRGZeHA9BF/R689SQrp
         yE+YJ1nLOBVIaXeX7nbCnaPUZDx4mUwx0poMTJQ2xAJhGKTes72cEYXwbfeYpliIYk7n
         K2dQ==
X-Gm-Message-State: AOJu0Yx2geIfmv/mOUH5bdiRQDuCJecoO2ydsaNolPm/UxZyDHPaeMVT
	mDH3UfnA9kRGwlCAJ7k8b1g=
X-Google-Smtp-Source: AGHT+IFCS3jDys7e01oXEQiG1OeU0lhUec4doT6wxCMQeMSWIybjMlWf6EkWRACUrQ+6RdJRkAQrIw==
X-Received: by 2002:a05:6808:2095:b0:3a7:541c:805c with SMTP id s21-20020a056808209500b003a7541c805cmr1400365oiw.24.1695423213283;
        Fri, 22 Sep 2023 15:53:33 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v11-20020aa7808b000000b0068a54866ca8sm3684191pff.134.2023.09.22.15.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 15:53:32 -0700 (PDT)
Message-ID: <04395810-7267-41a5-bf14-2b5d5d166570@gmail.com>
Date: Fri, 22 Sep 2023 19:53:15 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
Content-Language: en-US
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 Wedson Almeida Filho <walmeida@microsoft.com>
References: <20230921213440.202017-1-wedsonaf@gmail.com>
 <20230921213440.202017-3-wedsonaf@gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230921213440.202017-3-wedsonaf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/21/23 18:34, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
> 
> With GATs, we don't need a separate type to represent a borrowed object
> with a refcount, we can just use Rust's regular shared borrowing. In
> this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
> 
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
