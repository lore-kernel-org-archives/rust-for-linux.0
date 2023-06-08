Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D92C7EE25
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jun 2023 08:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbjFHIK3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjFHIK1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jun 2023 04:10:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1906426BF
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 01:10:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bb39316a68eso646681276.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jun 2023 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686211825; x=1688803825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8g4dBw6AgL/38LjrpkJCX4TWGsB9t9aAJXd+9jEZg/k=;
        b=Yun5QQqgwrEH4+Kwddfl1GrfpWa76LrZ78ni+mAgf9vWgF92tLYy3dgT5Giz4PkNwx
         60xDCEcGtcBNtE+K+IEBO0nsgRikUfrzjB+3JLrk9cY4hVwX8CmJWbAZ7RK7ZYDhApcP
         r9wDfL0xfvAAQ0KpiB48xe9RdrTHPtWtWXqscchCozfoBwryGijCgyEQK8UlSjp6JscB
         KbKaSoQtB/OWmKrbelQZTx981Qkp9PVmh6KqsihTQ1E+vncT8IAh/j5JhcIi8zkrXAxQ
         3HCzKdCr7rkayVcdTsv8Czb0endE2WSb3wtVEJppwQ27ERfsNOFk5KUrp5VkPfQp9fKv
         d7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211825; x=1688803825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8g4dBw6AgL/38LjrpkJCX4TWGsB9t9aAJXd+9jEZg/k=;
        b=bHzxZbXQEAwWXySjTzZ7L7yEOX74T1wFpUOitSYa0URDp0NnGCmRj5Ln3cYjxKgw+t
         tNzFSGg7uZ8BooTuoYxVDE6SLw/IIy6/m2G4uj9pSG8N3In+9hcpIsAAxsAIqV1LSB13
         saPf+a069i3UDLaWcr+tXxWzi5odSLMkNEWlnM6nbiaIgUDlRv2+wkWhzNAffYKPKgLB
         vSJKYI3FJjKTZu164jq/pt8HnqqfqxVLO92VGM4nQHAJ3noYOaiEALHlD6xotGqsQxKV
         xpnpTPBnOtD6qimmdWF7m8nPeWi1CMokwglWRMiQ7SXxw+00KeWB5RAcSkA6S+CgZd4s
         dXGw==
X-Gm-Message-State: AC+VfDwcvGq9fuGcZLKoLMk4vzPvGWOAtHsxf2Ea/Jw/ZaE5zYUmDxDq
        90jNaZEp3XjFPIey1Z2+GfHidr3pyrcgAXU=
X-Google-Smtp-Source: ACHHUZ482YiBImjeLr4mMjJpk/R2jBqEcAfnodL5UIqorl8globiYXPpmgAXVR96btmnsmZpTyMTgEFghmzIz6A=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:100c:b0:bad:14ac:f22e with SMTP
 id w12-20020a056902100c00b00bad14acf22emr2866049ybt.5.1686211825325; Thu, 08
 Jun 2023 01:10:25 -0700 (PDT)
Date:   Thu,  8 Jun 2023 08:10:23 +0000
In-Reply-To: <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
Mime-Version: 1.0
References: <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230608081023.1365292-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   Alice Ryhl <aliceryhl@google.com>
To:     andrew@lunn.ch
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
        tomo@exabit.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

>> +/// The pointer to the `net_device` object is guaranteed to be valid until
>> +/// the registration object is dropped.
>> +pub struct Registration<T: DeviceOperations<D>, D: DriverData> {
>> +    dev: Device,
>> +    is_registered: bool,
>> +    _p: PhantomData<(D, T)>,
>> +}
> 
> 
>> +    pub fn register(&mut self) -> Result {
>> +        // SAFETY: `dev` was allocated during initialization and is guaranteed to be valid.
>> +        let ret = unsafe {
>> +            (*self.dev.0).netdev_ops = Self::build_device_ops();
>> +            bindings::register_netdev(self.dev.0)
>> +        };
>> +        if ret != 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            self.is_registered = true;
>> +            Ok(())
>> +        }
>> +    }
> 
> I knew ~0 about rust, but i do know the network stack.
> 
> You need to be careful with the value of self.is_registered. The
> network stack will start using the interface during the call to
> register_netdev(). It can call any of the netdev ops or ethtool ops
> before register_netdev() has returned. You can see this in particular
> with NFS root, but there are other use cases as well.
> 
> However, i do see value in self.is_registered. One of the common bugs
> in drivers caught at review time is not completely setting up the
> device before calling register_netdev(). The way you have added
> setters for the netdev ops and ethtool ops we want it to error out if
> these setters are called after the interface is registered.

Another possibility is to use two different types:

 * `UnregisteredDevice`
 * `RegisteredDevice`

Then, the methods that need to be called before registration can be
defined on the first type, and the other methods can be defined on the
second type. Using Rust's move semantics, we can prevent people from
using the `UnregisteredDevice` after calling `register`. This means that
the following will not compile:

device.register();
device.setup_step_that_should_happen_before_register();

This is called the "typestate pattern". [1]

Now, the above only helps if the setup operations don't also make sense
after registration, because in that case you would need to add the
method to both types, meaning that you're no longer prevented from
calling the setup step after registration. I don't know the network
stack well enough to tell whether this is the case here.

>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>> +        ndo_init: if <T>::HAS_INIT {
>> +            Some(Self::init_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_uninit: if <T>::HAS_UNINIT {
>> +            Some(Self::uninit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_open: if <T>::HAS_OPEN {
>> +            Some(Self::open_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_stop: if <T>::HAS_STOP {
>> +            Some(Self::stop_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>> +            Some(Self::start_xmit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_features_check: None,
>> +        ndo_select_queue: None,
>> +        ndo_change_rx_flags: None,
>> +        ndo_set_rx_mode: None,
>> +        ndo_set_mac_address: None,
> ...
>> +        ndo_validate_addr: None,
>> +        ndo_fill_forward_path: None,
>> +        ndo_get_tstamp: None,
>> +    };
> 
> Is it necessary to list all these members, particularly those with
> None? New members do get added, so it would be nice if either the
> default would be None, or the compiler exited with an error if there
> is a new member and it is not listed here.
> 
> The same is true for the ethtool ops.

With the code in the current patchset, the compiler will exit with an
error if you add a new member.

However, it is possible to avoid listing all of them, see [2].

Alice

[1]: http://cliffle.com/blog/rust-typestate/
[2]: https://lore.kernel.org/all/20230608073807.1353371-1-aliceryhl@google.com/

