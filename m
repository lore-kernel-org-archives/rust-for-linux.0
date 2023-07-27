Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDD1BEE4
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Jul 2023 03:47:32 +0000 (UTC)
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EEF10FC;
	Wed, 26 Jul 2023 20:47:29 -0700 (PDT)
X-QQ-mid: bizesmtp88t1690429519t1gg7p26
Received: from localhost ( [36.112.29.116])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Jul 2023 11:45:18 +0800 (CST)
X-QQ-SSF: 0140000000000070B000000A0000000
X-QQ-FEAT: +ZNNzgakf5KJJr6Nqak+JhV6UYRkmNdPtIbKCUHFwkxCW92IIKw4jY8hr7Mah
	fDBcrkgnsUJkkT6VQiiGFY1zCk/QIwokEUE1+9laEeO3R09iUEH+23R2o5CTtkeKaIHJGHE
	JIJy7L5dq0MMfHannho7PtskN8HRDZGpW4AVT5dzwfsT1wMsovcTrtvjlg0cl8U6LNOwzY5
	Shy8h89/DMDxKOXQd7JEkiUbsRsNoSkx4yoqHsBfVpNcPuhGogHjykD/oiIKb5ONS0Dchxn
	OTAQNn+2B2+uO1erXQtCqSVtno+AkVsn+rNzx+p1zdHr/Lguk3NFdysh4CIRJRRruuVqq5H
	gdVq4l6VScxnhq9iE3Vy/fvhhtO952llUafKGea2oN7a/02o5jmQ+V8LAtx4gw98wUpLghH
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11825006884825481710
Date: Thu, 27 Jul 2023 11:45:17 +0800
From: Yexuan Yang <1182282462@bupt.edu.cn>
To: 1182282462@bupt.edu.cn
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Hannes Reinecke <hare@suse.de>, lsf-pc@lists.linux-foundation.org,
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	open list <linux-kernel@vger.kernel.org>, gost.dev@samsung.com
Subject: Re: [RFC PATCH 00/11] Rust null block driver
Message-ID: <2B3CA5F1CCCFEAB2+20230727034517.GB126117@1182282462@bupt.edu.cn>
References: <20230503090708.2524310-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503090708.2524310-1-nmi@metaspace.dk>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybglogicsvrgz:qybglogicsvrgz7a-1
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MSGID_MULTIPLE_AT,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Over the 432 benchmark configurations, the relative performance of the Rust
> driver to the C driver (in terms of IOPS) is between 6.8 and -11.8 percent with
> an average of 0.2 percent better for reads. For writes the span is 16.8 to -4.5
> percent with an average of 0.9 percent better.
> 
> For each measurement the drivers are loaded, a drive is configured with memory
> backing and a size of 4 GiB. C null_blk is configured to match the implemented
> modes of the Rust driver: `blocksize` is set to 4 KiB, `completion_nsec` to 0,
> `irqmode` to 0 (IRQ_NONE), `queue_mode` to 2 (MQ), `hw_queue_depth` to 256 and
> `memory_backed` to 1. For both the drivers, the queue scheduler is set to
> `none`. These measurements are made using 30 second runs of `fio` with the
> `PSYNC` IO engine with workers pinned to separate CPU cores. The measurements
> are done inside a virtual machine (qemu/kvm) on an Intel Alder Lake workstation
> (i5-12600).

Hi All!
I have some problems about your benchmark test.
In Ubuntu 22.02, I compiled an RFL kernel with both C null_blk driver and Rust null_blk_driver as modules. For the C null_blk driver, I used the `modprobe` command to set relevant parameters, while for the Rust null_blk_driver, I simply started it. I used the following two commands to start the drivers:

```bash
sudo modprobe null_blk \
    queue_mode=2 irqmode=0 hw_queue_depth=256 \
    memory_backed=1 bs=4096 completion_nsec=0 \
    no_sched=1 gb=4;
sudo modprobe rnull_mod
```

After that, I tested their performance in `randread` with the fio command, specifying the first parameter as 4 and the second parameter as 1:

```bash
fio --filename=/dev/nullb0 --iodepth=64 --ioengine=psync --direct=1 --rw=randread --bs=$1k --numjobs=$2 --runtime=30 --group_reporting --name=test-rand-read --output=test_c_randread.log
fio --filename=/dev/rnullb0 --iodepth=64 --ioengine=psync --direct=1 --rw=randread --bs=$1k --numjobs=$2 --runtime=30 --group_reporting --name=test-rand-read --output=test_rust_randread.log
```

The test results showed a significant performance difference between the two drivers, which was drastically different from the data you tested in the community. Specifically, for `randread`, the C driver had a bandwidth of 487MiB/s and IOPS of 124.7k, while the Rust driver had a bandwidth of 264MiB/s and IOPS of 67.7k. However, for other I/O types, the performance of the C and Rust drivers was more similar. Could you please provide more information about the actual bandwidth and IOPS data from your tests, rather than just the performance difference between the C and Rust drivers? Additionally, if you could offer possible reasons for this abnormality, I would greatly appreciate it!
