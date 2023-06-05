Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE6EC77B73
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 14:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjFEOlm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjFEOll (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 10:41:41 -0400
X-Greylist: delayed 388 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 07:41:39 PDT
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF12D9E
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685975710;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=T+tPRIGp4998OQzxyJ98V7F72ZTjtVwWLm5pSh12Vgc=;
        b=dWrGouv9s8g2JMw4zexdJZjjm6iW2Cd33KOGQcu5F6bJ1oRhJEzPCbKXCkKsoPJM
        q9K0F1gHfzrGTOvq2BvOcXnkoCcgCxvvVWCHseRMyv1PK2U1zDgEDxw1uh11gvPh7GO
        SsW6d7S5UTPe6ceQ7UyIIWuyE0on5hAcTP2IZGyTLbBaWLHkujoURdIVnViCj2Tj18i
        A5FwsOIUvDmbUX2KiOtNCDMZQf4YJ1ni7QIh7WdeOC4p4/p7g+qlIn19cpKsbb48m/j
        mnf2Mn7bpqJv+dF9f0ZKgQBwk31mX2B0s3pMxeoW/bajlFLVROvb486Nf6jzf7+24K4
        0A5F5Rcitg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685975710;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=T+tPRIGp4998OQzxyJ98V7F72ZTjtVwWLm5pSh12Vgc=;
        b=jUlpzZM5sh3t1ONQElMf/vVssnMfzo2ittNunYepFXMmvc9tnIWvBrktoIul0+So
        D6qW8JpaWgMwcITIMbxcaQYeQYHvDXg3BqgRnlpBk2UKc/+CnZmGBV1aF0M+dTgyHlk
        7Zn/Vxl2MRUaxpNN7YySpZswhTxcaGsGKEuZkZD0=
Date:   Mon, 5 Jun 2023 14:35:09 +0000
Message-ID: <010101888bfbb8e2-3b95ad31-0a7b-4d9b-bedf-26a70e4af72e-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230604124845.1381872-1-aliceryhl@google.com>
References: <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
        <20230604124845.1381872-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.05-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sun,  4 Jun 2023 12:48:44 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> FUJITA Tomonori writes:
>> +config SAMPLE_RUST_DUMMY
>> +	tristate "Dummy network driver"
>> +	help
>> +	  This is the simpler version of drivers/net/dummy.c. No intention to replace it. This provides educational information for Rust
>> +	  abstractions for network drivers.
>> +
>> +	  To compile this as a module, choose M here:
>> +	  the module will be called rust_minimal.
>> +
>> +	  If unsure, say N.
> 
> Perhaps a better name would be `SAMPLE_RUST_NET_DUMMY`?

Sure. drivers/net/dummy.c uses CONFIG_DUMMY so I used
SAMPLE_RUST_DUMMY but SAMPLE_RUST_NET_DUMMY works for me.


>> +struct DevOps {}
>> +
>> +#[vtable]
>> +impl<D: DriverData<Data = Box<Stats>>> DeviceOperations<D> for DevOps {
>> +    fn init(_dev: &mut Device, data: &Stats) -> Result {
>> +        data.packets.store(0, Ordering::Relaxed);
>> +        data.bytes.store(0, Ordering::Relaxed);
>> +        Ok(())
>> +    }
> 
> Do we not have mutable access to the data during initialization?

I guess that most of operations in DeviceOperations need mutable
access. For example, start_xmit() likely needs to update the stats
(the counts of packets, etc). Also the private data was initialized
when the device is registered. So I don't think that we need to handle
only init() in a different way.


>> +impl kernel::Module for DummyNetdev {
>> +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> +        const NAME: &'static CStr = c_str!("dummy%d");
>> +        let data = Box::try_new(Stats {
>> +            packets: AtomicU64::new(0),
>> +            bytes: AtomicU64::new(0),
>> +        })?;
>> +        let mut r = Registration::<DevOps, Stats>::try_new(1, 1, data)?;
>> +        r.set_ether_operations(EtherOperationsAdapter::<EtherOps, Stats>::new())?;
>> +
>> +        let netdev = r.dev_get();
>> +        netdev.set_name(NAME)?;
> 
> Should you not replace the `%d` part here with a counter?

I think that the kernel assigns an appropriate number to '%d' part
when a device is registered.

Again, thanks a lot! Your comments really help me.
