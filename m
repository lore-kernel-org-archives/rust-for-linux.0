Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F737F
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 22:55:51 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7203E8;
	Fri, 22 Sep 2023 15:55:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68fdcc37827so3197009b3a.0;
        Fri, 22 Sep 2023 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695423350; x=1696028150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idHM+ax9na/6V3/udEI+eC6dcKX8oMAtby8bCjW6dp0=;
        b=aVW+otOS5yuZRYXOJAAVd62XrsihPjd+GcUGG3an6fHVCUSMxBbApZP9WVIMIrfOgw
         XxJKalinnfbEb2z2FPVEhBtqYuyl3VTa5TlUDiJC8Ht6bqvOXWuH6QLkhNLKl10T3NAg
         k0WNWKp1I8oH65QNukr6zsOFgcShW1vbMssdGma4fp8OhF3yl1pPkFi/dlt6rp9QUVD2
         8hdK00llHWApoopFXRLqMLeX/NuPf67uxQTsG3Rh2MjdpDtp5KgXkjvtylHocE0NV4T4
         7srlHSx1YMMO4pu7qaRWLhYihxQZS+Cun9ByX92JX5pBHRG7SCYgs3JihkztI7IKOkQa
         634w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695423350; x=1696028150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idHM+ax9na/6V3/udEI+eC6dcKX8oMAtby8bCjW6dp0=;
        b=ltOcMELC4Z/I6ngyE7Ae1n5PHCjCn4XwTeT2VFKydA5EPEGffb+Wj4I1dukcxEBOk8
         0P66BRYdSIca2c4q+6++3KzpconcucYGtmTDzH8Lu92H7GnpYoRGARY9AD2s7K290zmG
         AfvHyG0lxB9Va6GiqRPUHIVTSd7HUP8JGOeVXVWloP7tM9XbC6OkbygWAQEup0y9fZDu
         KaHFxwFvuOa2URy7MXYFbPeqAEJqT9nrQ63lDgRyL4iuGs6aftmpcL+9L3qBg42Y/yZC
         JSNWBzuKanmZ38xjg5BLJHi5eUJGcR3kMd7vqOGaw03AknS4xjiJCKdBy0dSjxjfwHV2
         OYkg==
X-Gm-Message-State: AOJu0Yz/uhFSzvfHGlkLWgWRnr9kBCjIGVA0oWgbk1CZhxnL2WbfxUYg
	KhcciMWZyL6ZjQC7wayNXEs=
X-Google-Smtp-Source: AGHT+IEGi3mIoiz5nTPSGH06O6IIFR5zqa6EJ1KkXzC+4hY5UmXLJjdzGWXM7M/ptL3bktN7sWvJew==
X-Received: by 2002:a05:6a20:7d96:b0:137:c971:6a0c with SMTP id v22-20020a056a207d9600b00137c9716a0cmr1136315pzj.31.1695423350176;
        Fri, 22 Sep 2023 15:55:50 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id j17-20020aa78dd1000000b0068c1ac1784csm3728921pfr.59.2023.09.22.15.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 15:55:49 -0700 (PDT)
Message-ID: <cf06e7dc-c710-4fab-983d-2924544387c9@gmail.com>
Date: Fri, 22 Sep 2023 19:55:46 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
Content-Language: en-US
To: Alice Ryhl <aliceryhl@google.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org,
 Wedson Almeida Filho <walmeida@microsoft.com>
References: <20230921213440.202017-1-wedsonaf@gmail.com>
 <20230921213440.202017-3-wedsonaf@gmail.com>
 <CAH5fLgj_wQtmW4A6-4wPeP-Qmk2ga2NoVRwZDujjYvHWY7Bk3A@mail.gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CAH5fLgj_wQtmW4A6-4wPeP-Qmk2ga2NoVRwZDujjYvHWY7Bk3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/22/23 12:29, Alice Ryhl wrote:
> On Thu, Sep 21, 2023 at 11:35 PM Wedson Almeida Filho
> <wedsonaf@gmail.com> wrote:
>>
>> From: Wedson Almeida Filho <walmeida@microsoft.com>
>>
>> With GATs, we don't need a separate type to represent a borrowed object
>> with a refcount, we can just use Rust's regular shared borrowing. In
>> this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
>>
>> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> 
> I wonder whether "WithArc" is a better name? After all, arc is short
> for "atomic refcount".
> I also think it's nice to include Arc in the name of the type.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 

It can be read as `arc::WithRef`, which makes sense.
