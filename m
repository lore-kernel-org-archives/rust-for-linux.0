Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0F5C98
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 21:07:42 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B165B19E;
	Thu, 28 Sep 2023 14:07:39 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-692ada71d79so9505397b3a.1;
        Thu, 28 Sep 2023 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695935259; x=1696540059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/JgCDvL4cTN//gomBsMCRt9yDQu7HdW6HJo7loOWOQ=;
        b=BqHBz5ywqCUgxRSi7fQ8u8BwzcpSSB4uKzRS5+6qGHhiyNq0zXCifzeZTGzBLkFduh
         wub7KGK1VrSHWZPTrvNHCE5YHeIgtruBaC6btUkAdoVGuSu3+XVbUcYqV6kM1EcKrZIk
         tsnyLCWNuHEqVPU5UIk6op3vS8PaOSabwT8H++w+T5comXFV+EbHhEH9rtz1f07J+gAu
         z/wgK3kExx5cM5+SYe3Op1JgqEh9CvwfD9zm3o/HW/tQzxieetJClNIg458Xvze3uy6X
         q+zA1kzqcm9DnERka3bo+pTsWBWS08c5tyPFbce/sIaqRwJkKjxfKJ8QajLvpwJYNLjP
         oi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695935259; x=1696540059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/JgCDvL4cTN//gomBsMCRt9yDQu7HdW6HJo7loOWOQ=;
        b=rc0A3ZK/JdTx3W7gm+nAtpnKmuZ+S4UKqNzirz/Dx1i/agBhTg3yjCsobIQUtBd5LQ
         If1k2RkgNq2ivbRaSsptJLuzhloopQxWlxGN6L+1JIS2G1x+wxb3zQBu3kG5o2KOVzrH
         YL9l/JCaIhY37PNYKNGHdfQKqpRniX4l5bUq+HEoByyRCuDvdMQ/P0+BOjFkJgleYVQi
         hZ8vHzlsP5U6SwqkDkAk4A/LHFvlDzzfN3qrXvxrv6xHM+2GNkwinMUErQshUG54aXWh
         TtCWDCu+H/t8qyhxiqc4G1Xx43GF6OG8Q8PdxoG43+xPjaSsyDL5RZNQ7lgaOpytz5CR
         A+7A==
X-Gm-Message-State: AOJu0Yx3cLKGRr+RN8taT1/HP7+qydp0L24tJ3jcLiDV4WBVLehLDg0r
	/Ou3J8OOCLig7HeRmnaUSXQ=
X-Google-Smtp-Source: AGHT+IFFs6U8W6jkUYBh4GlltimkUb3hwkKsyE+x1ztQgT1CKdt45v5Q1p8JkhHNxcMIy5aOhvgaXQ==
X-Received: by 2002:a05:6a20:104e:b0:159:1bd8:fc7a with SMTP id gt14-20020a056a20104e00b001591bd8fc7amr1810753pzc.40.1695935258707;
        Thu, 28 Sep 2023 14:07:38 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0068fda1db80bsm13766692pfi.75.2023.09.28.14.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 14:07:37 -0700 (PDT)
Message-ID: <3e719461-d53c-4c54-86d3-ecb2eac4e9bd@gmail.com>
Date: Thu, 28 Sep 2023 18:04:05 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Use grep -Ev rather than relying on GNU grep
Content-Language: en-US
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230928201421.2296518-1-mmaurer@google.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230928201421.2296518-1-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/28/23 17:14, Matthew Maurer wrote:
> While GNU grep supports '\|' when in basic regular expression mode, not
> all grep implementations do (notably toybox grep, used to build the
> Android kernel, does not). Switching to grep -Ev enables extended
> regular expresions which includes support for the '|' operator.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
