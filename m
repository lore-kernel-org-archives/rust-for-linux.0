Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC45C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 12:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjFDMsf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jun 2023 08:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFDMse (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jun 2023 08:48:34 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35812AB
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jun 2023 05:48:33 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-977cc772639so47230566b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jun 2023 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685882911; x=1688474911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ev+tGdyHl8IfP6HS7B9W+OFmngXIiq8y5dxfSrbnk1E=;
        b=5yi0MvnuUQLp6D1+2/PBbecs3vKan9oPyURuH2zt82QttkRzmrfX1OuHityaojc/6/
         BCFOBK0ycoVObX6+3t1YF9y+F7g9i/Ngz+qIItZV+7XnVapU7FffacjBGuuJU9yabMJv
         +kSdwnaIlAAhgyRr/bSNMNmesFynRH/kTQp5IztIBhZmKklx0mLq1M1WbQbNItLWoLSZ
         WLSmjqwC1knlLc3KIqX2Picezv3MGVYNqPYLAVvi/SON5gRXgYOvNpCu1By2/O3b+QvU
         iurcy0E6bblN5gPWlpyo9+MQy29h4lCkdz1uw/MHiYpBOBJAeBuCAynaFDX3ap9wxB78
         8nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882911; x=1688474911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ev+tGdyHl8IfP6HS7B9W+OFmngXIiq8y5dxfSrbnk1E=;
        b=f8jvIUvhHJHIrMcUxPCUyBq3oVTed+8tEYwI+Ceo9O/BU4QupKmwyRMzl/pjiZwAzM
         JUZBWKRGqE2niywckjJn+3yxbBOkYE1qerKQeFW7QfrqXA7d8RRJhZ4/uThkyrqVpWO3
         5i1MyDtTC+nFvjfX+uqmDQ7OXdaaulgz4V40+8NcgCWH8L79UHi9Twc1NDVPOxicZiVW
         EV2BRsk7sgBLnVGwo79v4kcYF4VooCNSasCk2L6Zw2rp08NOQhoPpN5l0kRMZKKP0HQV
         fj86zKn2nGcBhAUgOdn1KawfG3LODFki0f/ANdx951P6JZUOg/f7L4BAwThGQL/bC8gK
         G6zA==
X-Gm-Message-State: AC+VfDy08zDeR3A71RiORN0abfHqeAtwEBvnz32cn4cba6TKZget3dyY
        d8gmwCmMywIuxqGpxPI4aBME9CUWvG7IwkI=
X-Google-Smtp-Source: ACHHUZ5CzO7cMe12fF54lRZflrDPqlF3Fsv9niIev1KEskgZTMLgdBgs2RAnTIjvZVzX0WLhQ0oqDeodCwNgrgM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:5a68:b0:974:62a3:9c96 with SMTP
 id my40-20020a1709065a6800b0097462a39c96mr1411519ejc.10.1685882911750; Sun,
 04 Jun 2023 05:48:31 -0700 (PDT)
Date:   Sun,  4 Jun 2023 12:48:29 +0000
In-Reply-To: <0101018884325b30-c6344630-ec10-470f-b027-514e7a20d5eb-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <0101018884325b30-c6344630-ec10-470f-b027-514e7a20d5eb-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230604124829.1381069-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/5] rust: add support for get_stats64 in struct net_device_ops
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> +/// Corresponds to the kernel's `struct rtnl_link_stats64`.
> +pub struct RtnlLinkStats64(*mut bindings::rtnl_link_stats64);
> +
> +impl RtnlLinkStats64 {
> +    /// Updates TX stats.
> +    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
> +        // SAFETY: The safety requirement ensures that the pointer is valid.
> +        unsafe {
> +            (*self.0).tx_packets = packets;
> +            (*self.0).tx_bytes = bytes;
> +            (*self.0).tx_errors = errors;
> +            (*self.0).tx_dropped = dropped;
> +        }
> +    }
> +}

It seems like this type is always used behind a reference. Your current
approach has the disadvantage that you're introducing an extra layer of
indirection. You can avoid that like this:

```
/// Corresponds to the kernel's `struct rtnl_link_stats64`.
#[repr(transparent)]
pub struct RtnlLinkStats64(Opaque<bindings::rtnl_link_stats64>);

impl RtnlLinkStats64 {
    /// # Safety
    ///
    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
    /// may read or write to the `rtnl_link_stats64` object.
    pub unsafe fn from_raw<'a>(ptr: *mut bindings::rtnl_link_stats64) -> &'a mut Self {
    	unsafe { &mut *(ptr as *mut Self) }
    }

    /// Updates TX stats.
    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
        // SAFETY: We have exclusive access to the `rtnl_link_stats64`, so writing to it is okay.
        unsafe {
	    let inner = Opaque::get(&self.0);
	    (*inner).tx_packets = tx_packets;
	    (*inner).tx_bytes = tx_bytes;
	    (*inner).tx_errors = tx_errors;
	    (*inner).tx_dropped = tx_dropped;
        }
    }
}

unsafe extern "C" fn get_stats64_callback(
    netdev: *mut bindings::net_device,
    stats: *mut bindings::rtnl_link_stats64,
) {
    // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
    let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
    // SAFETY: For the duration of this call to `get_stats64_callback`, the `stats` pointer is valid
    // for writing and nobody else will read or write to it.
    let stats = unsafe { RtnlLinkStats64::from_raw(stats) };
    let mut dev = Device(netdev);
    T::get_stats64(&mut dev, data, stats);
}
```

Alice
