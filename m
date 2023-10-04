Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2701B266
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Oct 2023 15:53:09 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E9FBF
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Oct 2023 08:53:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ae75ece209so431949066b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Oct 2023 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1696434784; x=1697039584; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hZDNFZC6WiTT02ULBJ6jIt5/1FUgLgt3WVljz4aDHFY=;
        b=Ls5YFI1iHeKJe7R9ObhOWxWOAdkDFbGSGmuerXZc5oJ9ZvxzqT6Z3Mjw//CJ0RogKo
         U4S5BxK78MCXwDfKUtDC7WT4xdYtO31BSlskDlzX3I/7fLG7SLJnFN2EpfpgWqXJZ8y+
         MHNh27Ai/0BPhPJ5nOpPVvTgMG8+sZpForTwXRqMHqmxcQB6OMLyGYTBquZkH2BNiKoq
         s/Cpajy/G6f0vzNy1GmxkXOAldS/DJkfsYBiZs+GxUW3j9UQQu0l7EIwT8UUlcfo2Cvs
         KGzSHJZ7yhy/+6eVyy5+zI3eCGlogsTFDigrVWoSQiEDiZyeZtowYevjeDNvuDO+40FR
         Apiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434784; x=1697039584;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZDNFZC6WiTT02ULBJ6jIt5/1FUgLgt3WVljz4aDHFY=;
        b=pp27imbYpoWgYx1XY3nhoU24+IZ0HwzYp3948Hn0qbTsNyDU99Wg1bDTb4zioYtI36
         c/2qU/vrN4JKAa+rC4YM+hruTOuz3cZoeyFYv1LdkZnurfBuyvhZ/gNIgwMcPwqBWYdj
         cswBlFKt/FG3DBaC+ozHv4YhMKabzkkNEnApZ/6tkA3GDalgrCsGo891j2yErrwt1RAx
         Cwg8a1gGCZgr6GDf3AMCfGcaYWNYBzLzBxYbzlh/e4/a7aQf5VdLZmQDfG6YqXckkxS+
         n9AvVxGtrldUXqvqhW0ySmjuHVhOX6k98mysLas7deYVf73W5nDlZubuRQnOHahBqQQW
         9zcA==
X-Gm-Message-State: AOJu0Yx6Oe4Pq8qMD6rcg4AxOfbK2+dVT74Z+jB/0pc28tqMzLzHaU3l
	YwprCkOsx7wNbi6uQx92W4inlA==
X-Google-Smtp-Source: AGHT+IHyhGmibidLlX+i+h3CeE+RkyvRJ1BmsD82yqONASQWydT4Q9HuIszDXGT+fFfHOEohePFpdQ==
X-Received: by 2002:a17:906:538f:b0:9a2:1ce5:1243 with SMTP id g15-20020a170906538f00b009a21ce51243mr2663645ejo.60.1696434783543;
        Wed, 04 Oct 2023 08:53:03 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id gh18-20020a170906e09200b009b27d4153cfsm3034424ejb.176.2023.10.04.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:53:03 -0700 (PDT)
References: <CVZ2KU4KK5YH.2HVL1F6X93YLL@pogg>
 <20231003222947.374039-1-aliceryhl@google.com>
 <CVZLU74VWMKA.GQXYH7WUNPS4@pogg> <ZR144pugIJQRAFjj@boqun-archlinux>
 <CVZQQCDA444R.KWA6OPEZRIBG@ftml.net>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Konstantin Shelekhin <k.shelekhin@ftml.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
 gary@garyguo.net, jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
 tj@kernel.org, wedsonaf@gmail.com, yakoyoku@gmail.com
Subject: Re: [PATCH v4 7/7] rust: workqueue: add examples
Date: Wed, 04 Oct 2023 17:49:30 +0200
In-reply-to: <CVZQQCDA444R.KWA6OPEZRIBG@ftml.net>
Message-ID: <87v8bm5qqp.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Hi,

"Konstantin Shelekhin" <k.shelekhin@ftml.net> writes:

>> This is not a problem until nvmet actually uses/switches to Rust, right?
>> ;-) We can certainly improve the API when a real user needs something.
>> Or you know someone is already working on this?
>
> Nope, not at this moment. I have an itch to experiment with Rust and
> iSCSI, but that's my personal toy without any plans to at least propose
> it to the subsystem maintainers yet.

If you are so inclined, I would suggest you take a look at the blk-mq
bindings and the nvme (pci) [1] and null_blk [2] Rust drivers. I am
available if you have any questions!

BR Andreas

[1] https://github.com/metaspace/linux/tree/nvme-next-for-6.6
[2] https://github.com/metaspace/linux/tree/null_blk-next-for-6.6
