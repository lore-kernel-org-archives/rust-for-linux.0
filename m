Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3678C6FD1C
	for <rust-for-linux@archiver.kernel.org>; Sat, 11 Mar 2023 20:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCKUDP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 11 Mar 2023 15:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjCKUDN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 11 Mar 2023 15:03:13 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E18CDE2
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 12:03:05 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4BFD33F1FB
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678564984;
        bh=9RT5poouHWXJaHXyeXepJzINE3dFJ0aEr/2LhdZr2rE=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=Yk3GYI8Z/jiv1tqP3i1PnuKfxlJ3fqF0ZRVXK14oHn6jBDlvG90LV0yfZMuQXeAc8
         nAEk4csb3EtvGkYQ+ZiTltQqEVEZ8V/j/uTX4VRcimjeiFtADlQUKLrxZBFDwsvahF
         BliUrj+RVOKFPDeHlcFipQOHnouhowyn49dYrqOvUnmPHAl5CFUwpZMo51faXY645F
         EacH6W+u50w2WyKfPdHA5VHPDQKMl/42s5N/ISEY6PaGkmKLxpogp+F32yXphgLDaL
         AfIlNVP/5e6UW3ocNeXV9GfwSBpBgnRmijPzbam732PXkqAMaaGJUpmdxFZRzBEAHn
         ob5DwlCXP1a7A==
Received: by mail-ed1-f72.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so11799864eda.6
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 12:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678564984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RT5poouHWXJaHXyeXepJzINE3dFJ0aEr/2LhdZr2rE=;
        b=vPLAAjdVqcaFQv14/qRQCqVPrVTWkddGQdCPCXQKNgE9OfBxpcenkMWwjjR045gOy3
         m4owFBRG6O+DLT2Mqmrp9p5bvwi+EAOniEdnBP6pLhuoTRMc5/2HWnb0Ul1eUoRXsxri
         hjWUo6W+bRr1+RtUviYY9TC/60sBK74nkhXEDhoFJ6VOzWj8uh4h5QaNxT7O1C4+idze
         aTl/UosrZiwrH2GYxmc3U52aVXpuQ7Zac20wSZfc4ujkvuC2K2ZD490iM29rnhH+zvh1
         2/jT1qlZNF9TouFHfrTiRIFkI/hCGQjslhVE87JwjcGn6sGv0eYJFTz+3Tu/kG4pQ/n/
         Bzdg==
X-Gm-Message-State: AO0yUKUZD4sNpJPcs+IC3vBhtAVm7An0TusbMn6K8LvMx8gOBqkhxEGC
        mJZcI24psU+vGaeK/EaUNWyzUysLjeHu+PdcCCQjonZTwYtWchOQs2ia8plXAsp568ohMG+3g1n
        CjZz59Z8/OcjxYnUJhcA3FcvtROKrdC+gwnxkwRGk356c
X-Received: by 2002:a17:906:2f0c:b0:878:61d8:d7c2 with SMTP id v12-20020a1709062f0c00b0087861d8d7c2mr28746235eji.39.1678564983768;
        Sat, 11 Mar 2023 12:03:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/j3A4HF0JqY2YxC2usRZqkb/S5QAthoWIxq0tVZy8YeuHzAhvo9cMtc4OyINWHq9zYseA94g==
X-Received: by 2002:a17:906:2f0c:b0:878:61d8:d7c2 with SMTP id v12-20020a1709062f0c00b0087861d8d7c2mr28746218eji.39.1678564983441;
        Sat, 11 Mar 2023 12:03:03 -0800 (PST)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id b11-20020a1709063f8b00b008c405ebc32esm1421896ejj.28.2023.03.11.12.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 12:03:03 -0800 (PST)
Date:   Sat, 11 Mar 2023 21:03:01 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
Message-ID: <ZAzedS9sx5l6gmzB@righiandr-XPS-13-7390>
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
 <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Mar 11, 2023 at 04:27:52PM +0000, Björn Roy Baron wrote:
> On Saturday, March 11th, 2023 at 15:01, Andrea Righi <andrea.righi@canonical.com> wrote:
> 
> > Hello,
> > 
> > I'm trying to distribute a linux-headers package (deb) that would allow
> > to build out-of-tree Rust modules.
> > 
> > Everything looks fine, except for the following error:
> > 
> > error[E0461]: couldn't find crate `core` with expected target triple target-10951614936105594995
> > |
> > = note: the following crate versions were found:
> > crate `core`, target triple target-3759196539525232825: /usr/src/linux-headers-6.2.0-16-generic/rust/libcore.rmeta
> > 
> > All I need to do is to "refresh" the headers by running a
> > "make modules_prepare" after installing my linux-headers package on my
> > system and then everything works perfectly.
> > 
> > Is this because my system, where I try to build the out-of-tree module,
> > has different toolchain versions (e.g., binutils) than the build host?
> > 
> > Any pointer/documentation to better understand how the target triple
> > version is determined?
> 
> The target id for external targets should be determined based on the filename and the hash of the target specification json file since https://github.com/rust-lang/rust/pull/98225. That it happens to work with "make modules_prepare" may be that it recompiles all rust code for the new target triple and through luck it just so happens to have the exact same abi as the original. There is no guarantee that two compiled rust crates have the same abi unless they have the exact same contents. To debug why the target id changed could you try running the following rust program in both the linux source dir and the /usr/src/linux-headers-6.2.0-16-generic dir?

Ah! This is exactly the problem I'm facing! I don't have
https://github.com/rust-lang/rust/pull/98225, because I'm using
rustc-1.62 and I see that this change has been applied to rustc-1.63.

So, theoretically if I apply this to my rustc everything should work
fine.

> 
>     use std::hash::{Hash, Hasher};
> 
>     fn main() {
>         let content = std::fs::read_to_string("rust/target.json").unwrap();
>         let mut hasher = std::collections::hash_map::DefaultHasher::new();
>         content.hash(&mut hasher);
>         println!("{}", hasher.finish());
>     }

$ pwd
/usr/src/linux-headers-6.2.0-16-generic
$ ./test
5559158138856098584

$ pwd
/home/ubuntu/src/linux
$ ./test
5559158138856098584

^ Same hash, but at this point I think we already know that the problem
is the patch above that I'm missing in rustc.

Thank you so much for your help!

-Andrea
