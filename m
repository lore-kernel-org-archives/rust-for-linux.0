Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D55C12A
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emYBxCYZ"
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527AAB6;
	Sun,  8 Oct 2023 05:27:08 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6934202b8bdso3026019b3a.1;
        Sun, 08 Oct 2023 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696768028; x=1697372828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIJCmRFAc3w52ZBlV03fWhzbvsCteyyI9dHEKk2inD4=;
        b=emYBxCYZAREFj1XOPnf6WleuWesVaGzk89plTL6O8cxA3iSHXu39+hT5Sx1NT+yFtR
         Xb3fkUWbZyQmAI30rg3viAJKLD0dLge1LYfXZhcO/cs6L+FxKysq2tozxdrdCjvWGXh0
         B/Zssk+33lYy86L0tZNkZBOy4uFlR5qF0MMEy7PftL0g4ifcR5RD3a55vHluFrmGM1x/
         1blSD/21SSHFXR4qVJrHekqoU77Y8rmpWj0+5XophDq5R7k6/BmjObs4vXLRyBfVpDGI
         lHuoHy79pemYuSdzRcDNJ8rcU+xnBzvcM0AybNjYVh+UMnyXxj29E0EBlLd8vFvNObn3
         vrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696768028; x=1697372828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIJCmRFAc3w52ZBlV03fWhzbvsCteyyI9dHEKk2inD4=;
        b=AoRax0SiW6PbRRLe7aQ1y3h1JINLNOme7cFA0V03hiu4sBusErNTAnl03BKO4KoPCi
         oFpOEIynEwLQ3Rw+nFbrpPtShqG/MmFyzDVDAV82XmdgeLfSruo/mK8MP3nOaiKBrUK7
         CzILMyvpM0No37Rynbov0e4qhOs3N2RcoPlOqFMg9e7t/RDrExfTfPncS20MwKnzGbgN
         gkC3gs9a9ygnI1Qgr8LyVpWgZC1Z9MufbTwbl4b1tE1vwIbfBvBo/BDGMXdcNHDqSoS/
         pPqn3mmyKZT20lELfMULuegY9TaT72fAJxmWv4G/UgR6Fm8bvR9yNq6GnNZbJ5oQLI2Y
         2jzg==
X-Gm-Message-State: AOJu0YxbwIeOjX9tQJ0ZHkbyl+WJdR49k1ZpPGjnn91Cvijxusz5ioJH
	c4Vba4TbwYqL19C/NzKYSA4=
X-Google-Smtp-Source: AGHT+IHuczI96wJQON67wUKURseTXDj99o+ogAHQYLoBZA8oy9lxgh/611FeStWxXYTmcXXDHEmmBQ==
X-Received: by 2002:a05:6a00:1390:b0:693:3d55:2ba6 with SMTP id t16-20020a056a00139000b006933d552ba6mr16537033pfg.9.1696768027731;
        Sun, 08 Oct 2023 05:27:07 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id e24-20020a62aa18000000b006979f70fdd5sm4456798pff.219.2023.10.08.05.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 05:27:07 -0700 (PDT)
Message-ID: <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
Date: Sun, 8 Oct 2023 09:27:01 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string
 literals
To: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
References: <20231008094816.320424-1-tmgross@umich.edu>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20231008094816.320424-1-tmgross@umich.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/8/23 06:48, Trevor Gross wrote:
> Enable combining identifiers with string literals in the 'paste!' macro.
> This allows combining user-specified strings with affixes to create
> namespaced identifiers.
> 
> This sample code:
> 
>      macro_rules! m {
>          ($name:lit) => {
>              paste!(struct [<_some_ $name _struct_>];)
>          }
>      }
> 
>      m!("foo_bar");
> 
> Would previously cause a compilation error. It will now generate:
> 
>      struct _some_foo_bar_struct_;
> 
> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Trevor Gross <tmgross@umich.edu>
> ---
> 
> Original mention of this problem in [1]
> 
> [1]: https://lore.kernel.org/rust-for-linux/20231008.164906.1151622782836568538.fujita.tomonori@gmail.com/

Next time I think you should put this in `Fixes:`.

> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
