Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA5F1FAF
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Jul 2023 06:54:38 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B79BA
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Jul 2023 23:54:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso2259386a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Jul 2023 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1690527274; x=1691132074;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=jbLVZA6GLdYVOmzJTJTIy97G+xSErqL2fwBMteHvG6U=;
        b=ME8bUHPXmCp2WyNtI7fWv/WvfvPz6H8bKBcPDxs24TfyA0qZz3pUF+5UYfdseXt9bJ
         PS5Am3gaf3WY+164knk9n4DiWAoAuJQSdfn9ZdhlrGVuwd5BWxQljCw1qO3qtYwkFhcb
         0qgPfc0BvWgHPwxIFToLSnVNKC7yQYzcyYvh6aC8E4Iha+bCR/kBZi3Gp5UVGhAU4H1R
         SVHsxCZqDE6VblfdrtN4ZgYspiQqYOYYguxYNvuczbskl0sdsf3tQ0VLkin/PqHVL+jW
         MsQsd9ZwdDwgVz8c0MzuoLTx2jJ2cAzUYMATkGHWnrqTqFTjVfSJHGjik4/xmlie+Uov
         YlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527274; x=1691132074;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbLVZA6GLdYVOmzJTJTIy97G+xSErqL2fwBMteHvG6U=;
        b=h1GscLq1ry9V8GngaUe+L6TaexbDXGCmwEqJd1QFWG29TOuU41PQx7hUN5WKDH83nL
         iV5P09vYiOdjxsPwUxvpVoWScZssQJrQqSx9AxaX6xesaWbs2MHpa2s/fdcTv1cq2luJ
         Wh1fkaNn/NV0uJVae1h9XpUAuFuUFlfLzsjRGAsaSY/WV8aUcMmpdboCQrjnox+vHNkn
         HeOeIZN3tQs8iDPThmpSvz9PctYi5t47joOPtLlkieWBHXO+H6jozVVmzZKWDS0FQx11
         ZZULQwLyo0dNs3/T5dpsvbdVabvz01zKdQAhUaU/4ANFP3k+wUtYlpSAHU1YOvtbSuNG
         JUtw==
X-Gm-Message-State: ABy/qLZTSpGxOsEgfpjzDkuB0hkfnIsaE+HRMQiXgfe0g2nXJnFaiIvW
	45NnOVBbf9/XF7sKr7JLs05oAA==
X-Google-Smtp-Source: APBJJlFwFT1CYbfHt9QePH98wDjc7kgS385mF3cKczDnQtT19F22NlsjwvcOxEyT3VqGtVnHNorAAg==
X-Received: by 2002:aa7:d311:0:b0:522:30d5:6065 with SMTP id p17-20020aa7d311000000b0052230d56065mr953242edq.21.1690527274073;
        Thu, 27 Jul 2023 23:54:34 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402516f00b00521f4ee396fsm1448246ede.12.2023.07.27.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:54:33 -0700 (PDT)
References: <20230503090708.2524310-1-nmi@metaspace.dk>
 <2B3CA5F1CCCFEAB2+20230727034517.GB126117@1182282462>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Yexuan Yang <1182282462@bupt.edu.cn>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Hannes
 Reinecke <hare@suse.de>, lsf-pc@lists.linux-foundation.org,
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, Matthew
 Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Bj??rn Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, open
 list <linux-kernel@vger.kernel.org>, gost.dev@samsung.com
Subject: Re: [RFC PATCH 00/11] Rust null block driver
Date: Fri, 28 Jul 2023 08:49:53 +0200
In-reply-to: <2B3CA5F1CCCFEAB2+20230727034517.GB126117@1182282462>
Message-ID: <87bkfwr0ew.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Hi,

Yexuan Yang <1182282462@bupt.edu.cn> writes:

>> Over the 432 benchmark configurations, the relative performance of the Rust
>> driver to the C driver (in terms of IOPS) is between 6.8 and -11.8 percent with
>> an average of 0.2 percent better for reads. For writes the span is 16.8 to -4.5
>> percent with an average of 0.9 percent better.
>> 
>> For each measurement the drivers are loaded, a drive is configured with memory
>> backing and a size of 4 GiB. C null_blk is configured to match the implemented
>> modes of the Rust driver: `blocksize` is set to 4 KiB, `completion_nsec` to 0,
>> `irqmode` to 0 (IRQ_NONE), `queue_mode` to 2 (MQ), `hw_queue_depth` to 256 and
>> `memory_backed` to 1. For both the drivers, the queue scheduler is set to
>> `none`. These measurements are made using 30 second runs of `fio` with the
>> `PSYNC` IO engine with workers pinned to separate CPU cores. The measurements
>> are done inside a virtual machine (qemu/kvm) on an Intel Alder Lake workstation
>> (i5-12600).
>
> Hi All!
> I have some problems about your benchmark test.
> In Ubuntu 22.02, I compiled an RFL kernel with both C null_blk driver and Rust
> null_blk_driver as modules. For the C null_blk driver, I used the `modprobe`
> command to set relevant parameters, while for the Rust null_blk_driver, I simply
> started it. I used the following two commands to start the drivers:
>
> ```bash
> sudo modprobe null_blk \
>     queue_mode=2 irqmode=0 hw_queue_depth=256 \
>     memory_backed=1 bs=4096 completion_nsec=0 \
>     no_sched=1 gb=4;
> sudo modprobe rnull_mod
> ```
>
> After that, I tested their performance in `randread` with the fio command, specifying the first parameter as 4 and the second parameter as 1:
>
> ```bash
> fio --filename=/dev/nullb0 --iodepth=64 --ioengine=psync --direct=1 --rw=randread --bs=$1k --numjobs=$2 --runtime=30 --group_reporting --name=test-rand-read --output=test_c_randread.log
> fio --filename=/dev/rnullb0 --iodepth=64 --ioengine=psync --direct=1 --rw=randread --bs=$1k --numjobs=$2 --runtime=30 --group_reporting --name=test-rand-read --output=test_rust_randread.log
> ```
>
> The test results showed a significant performance difference between the two
> drivers, which was drastically different from the data you tested in the
> community. Specifically, for `randread`, the C driver had a bandwidth of
> 487MiB/s and IOPS of 124.7k, while the Rust driver had a bandwidth of 264MiB/s
> and IOPS of 67.7k. However, for other I/O types, the performance of the C and
> Rust drivers was more similar. Could you please provide more information about
> the actual bandwidth and IOPS data from your tests, rather than just the
> performance difference between the C and Rust drivers? Additionally, if you
> could offer possible reasons for this abnormality, I would greatly appreciate
> it!

Thanks for trying out the code! I am not sure why you get these numbers.
I am currently out of office, but I will rerun the benchmarks next week
when I get back in. Maybe I can provide you with some scripts and my
kernel configuration. Hopefully we can figure out the difference in our
setups.

Best regards,
Andreas
