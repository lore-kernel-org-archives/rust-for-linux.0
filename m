Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4A0C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 12:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjFDMsx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jun 2023 08:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjFDMst (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jun 2023 08:48:49 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B6DD2
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jun 2023 05:48:48 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-9745f301bcfso177018466b.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jun 2023 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685882927; x=1688474927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1dRRk6slLDmdJIH5g1VK904vw4RNeaZUQu5/9EqsJU=;
        b=B2HIm02hhdMnRx3FM6dGWNiRxlByqjJMIRC4MJwgssb4mNB7sX0mBGyOOTEMBYF0eE
         rgVznpnhn3pF3kOCSaUmtmUrWxE5mx5kkpGNOQpW7F7pFagDhe1LsaeCAPyTLGCUmkkF
         x3KhApgJmV+T3w8plaV791kW653yUo2Uw+cIZ1NCEkC3e4v+yKUtTFhIT0ZCFVFispBI
         tBk+dxJBix6u2BpigCAEqw66BsRgpgHR1fvQRUxJ0gaObVRxwgrdsh1ECOOydu28m4uN
         Y+Iygo1pj75/C9kzdwMf6i16JaVYTP5alYWHdCIuheM9ZzL+CJCGXkdGsB1JFGGqb6VQ
         y3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882927; x=1688474927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1dRRk6slLDmdJIH5g1VK904vw4RNeaZUQu5/9EqsJU=;
        b=cgk9ook10/t9tgHTSsREWJi4VP9TARiFJq6av2Ez2dOmMFYO7P+uIiydBy5fx85lbs
         8rEp5svVjqZC9KGsbRcJVP3YKd0o/IJ3aBwajSlhb8FYZQ3QheJT+qohXcy7lspbGp7x
         9jvRfyb7fN+bEzXcDh57brvfNBbAFqjZVG+sn6eaCEljXW11pQlfmk52+gkCeBAaHYSB
         Urwy0Xhq4PoH4wnGJUcP4Ol2ASuVNsY2cDdu0oC+W/EJO2U6GVjmvrVFUkRJL5e+xxa8
         Bve5rCY5+YbRp7oUUvCcsWX2cQQMdWOnKPQH89sv1M4ImdFV6/3SXavUGKMxJyA5WK9g
         rdSw==
X-Gm-Message-State: AC+VfDz21MVNApId+TqW8+siRC89Wjl/PIG2grpeTzv8GLo9QA7NeEeR
        Lvj+oc+b3TNvZSAQ8OlRrGx8AMbCLlrUQ38=
X-Google-Smtp-Source: ACHHUZ4o8IRzq+ABNWeRtcVSmmfByQg6acjEQj0eKyxrGTjbQR+b5zwF3HEFHoi3VCwaBIR447EOGVkC7N2/6rM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:846d:b0:974:484a:3aeb with SMTP
 id hx13-20020a170906846d00b00974484a3aebmr1479459ejc.10.1685882927081; Sun,
 04 Jun 2023 05:48:47 -0700 (PDT)
Date:   Sun,  4 Jun 2023 12:48:44 +0000
In-Reply-To: <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230604124845.1381872-1-aliceryhl@google.com>
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> +config SAMPLE_RUST_DUMMY
> +	tristate "Dummy network driver"
> +	help
> +	  This is the simpler version of drivers/net/dummy.c. No intention to replace it. This provides educational information for Rust
> +	  abstractions for network drivers.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_minimal.
> +
> +	  If unsure, say N.

Perhaps a better name would be `SAMPLE_RUST_NET_DUMMY`?

> +struct DevOps {}
> +
> +#[vtable]
> +impl<D: DriverData<Data = Box<Stats>>> DeviceOperations<D> for DevOps {
> +    fn init(_dev: &mut Device, data: &Stats) -> Result {
> +        data.packets.store(0, Ordering::Relaxed);
> +        data.bytes.store(0, Ordering::Relaxed);
> +        Ok(())
> +    }

Do we not have mutable access to the data during initialization?

> +impl kernel::Module for DummyNetdev {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        const NAME: &'static CStr = c_str!("dummy%d");
> +        let data = Box::try_new(Stats {
> +            packets: AtomicU64::new(0),
> +            bytes: AtomicU64::new(0),
> +        })?;
> +        let mut r = Registration::<DevOps, Stats>::try_new(1, 1, data)?;
> +        r.set_ether_operations(EtherOperationsAdapter::<EtherOps, Stats>::new())?;
> +
> +        let netdev = r.dev_get();
> +        netdev.set_name(NAME)?;

Should you not replace the `%d` part here with a counter?

Alice
