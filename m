Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5FB1FDE
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 10:35:03 +0000 (UTC)
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BE9E40
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 03:35:02 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-99388334de6so382848566b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692786901; x=1693391701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBSXO6qqgmHuKqh6bzP0tT7XEbpao57yrY6B+MWzUYg=;
        b=imZbjfBgPXvWMOgaH+hUcStjhZBiu6fzZipiqROt6F+8KEpdtPXQIWs+WEqdH3+aTI
         BgRDsVt5CQmUVGFWV3IER7szc7NKjgWyw1WfVZxefRjcONdn+t4XFHg3GUKTvwPqg9jd
         I94I7/tGXnqD5NTi2d5dIo72eDBJ59N+aG3KNcWnOq3SxT36VLOFObWUXdhOO+OX8UnV
         DFCvoBfq8MS+HCWsPjeOhmaB5TPtiv4YhjJBMyCKJFzUjE25STn0KfvfeG+uPJ2wcVFD
         uJHRg+hOquSGFE1DHd5ku0rjl3GCuDnpUNtu/BDpV152II0xibXMeyp5OfiUzaQk0JE3
         3Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692786901; x=1693391701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBSXO6qqgmHuKqh6bzP0tT7XEbpao57yrY6B+MWzUYg=;
        b=Su1O40lU6cZIrD2c8YRp/Qc4+mzX+zW1EltCbOgj4uFCZyRS4+UFE8eDYIFQit5exr
         U4HFzbNAa6wi05T0eUN2mrvxAgCiDG89w8NbpzwB8XJgBW50EW16rvvudYy8ADd+BmlH
         ePOBE5t9ojL6QyuMVfLad6xbBf4O3ctusJGQGu9P1aDnmDBhPLzQIST7x4Wx7Pffxi+C
         hY1ObdFvtgWiN1qlWRERRI94/iWyt0M6RM/SFh+j7pn6+lHUsQ1X1bVt5PD7GKgT3uzq
         rjzQGtNXjUnWd4Rpy1cncNP5nKu4qRLUNibnURRfz0aIj+C4gKMRm6gjrvBLPeNXuooP
         x/AQ==
X-Gm-Message-State: AOJu0YyT3Ysfiu82Ojj03fjx/8o41+501AkMlhqwwIK9OKPxa+AKBk7q
	3ivLYy36t/AzxM+X+2hQTQNeeVyifYBNf5s=
X-Google-Smtp-Source: AGHT+IHl5FcW1ZIDTb421nTXT/COFWJ7T+NTcJyQsV3MlUrkt79HVnSpJOzK3M/a4awKmbc1LYiRMFB3GGHK4Rs=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:cb11:b0:9a1:cbc2:e442 with SMTP
 id um17-20020a170907cb1100b009a1cbc2e442mr17162ejc.10.1692786901028; Wed, 23
 Aug 2023 03:35:01 -0700 (PDT)
Date: Wed, 23 Aug 2023 10:34:58 +0000
In-Reply-To: <87msyi406u.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <87msyi406u.fsf@metaspace.dk>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230823103458.243871-1-aliceryhl@google.com>
Subject: Re: [PATCH v1] rust: add improved version of `ForeignOwnable::borrow_mut`
From: Alice Ryhl <aliceryhl@google.com>
To: nmi@metaspace.dk
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, patches@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Andreas Hindborg <nmi@metaspace.dk> writes:
>>> I am not sure this makes sense. How about splitting the trait in two,
>>> immutable and mutable and only implementing the immutable one or Arc?
>>
>> I used this design based on what would make sense for a linked list. The
>> idea is that we can have two different types of cursors for a linked
>> list: immutable and mutable. The immutable cursor lets you:
>>
>>  * move around the linked list
>>  * access the values using `borrow`
>>
>> The mutable cursor lets you:
>>
>>  * move around the linked list
>>  * delete or add items to the list
>>  * access the values using `borrow_mut`
>>
>> The mutable cursor gives you extra abilities beyond the `borrow` vs
>> `borrow_mut` distinction, so we want to provide both types of cursors
>> even if the pointer type is Arc. To do that, we need a trait that
>> defines what it means to have mutable access to an Arc.
> 
> I don't see how that prevents this trait from being split in two?

Well, you could split the trait, but if you make the mutable iterator
require the `borrow_mut` trait, then you have to implement the mutable
trait for `Arc` too if you want the mutable iterator to work with `Arc`.

And if you're always going to implement both traits, then maybe it
makes more sense to not split the traits?

Alice
