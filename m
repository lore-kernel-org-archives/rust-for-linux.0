Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A227C74A4B
	for <rust-for-linux@archiver.kernel.org>; Sun, 12 Mar 2023 22:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjCLWIm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 12 Mar 2023 18:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCLWIl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 12 Mar 2023 18:08:41 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECB523138
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 15:08:36 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 40CEA3F0A2
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678658915;
        bh=LUR9RNkAndr/2YAQ+JHA1yIa5gKcl3Za9V41r0HHWjc=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=ZZ1aVtEsKZ+MSWlSk3TAMJ0eUp2Qf/ds8803pmkGb93VHne6OQdALiJHYHeHXFlGr
         IScMC1XB3fclpD2js+nIdOGRbaqwSCRzE63ZIY5GkAw3jTSv23ayfpMFnwE3JP5iGd
         NoPq8hhhO3EpuTmlb7GgtQVeO4pKqg4AoiCx1OKq/gD21cqwv+iJlV6hLko/anayEU
         yMPOF/2PDm0GYcqYuWsNY8ubTAdQ256oVjOw5Ikbrkyz7FutJLRS+A2rqWAnRJLXde
         lZbDrXOrY810d97sGzSB0EGgmYMA0IcEZXxzs4wqYlOzkh1dlV2Q8Pp/ruca2mEnNJ
         OxXf3cBcW4DMw==
Received: by mail-ed1-f72.google.com with SMTP id g2-20020a056402320200b004e98d45ee7dso14121184eda.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 15:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678658915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUR9RNkAndr/2YAQ+JHA1yIa5gKcl3Za9V41r0HHWjc=;
        b=jdIRUoTzEDPDdnJRPFenf2vRCdFIEkvITNDZLKtF24ZJNHRaMGuxO/SEOYFU2NaFph
         qRwWVi8HzXGdzLMAfV02IW3jf/bVipFPwwOpzq2RnIUgZzmHmKf3dUdmqZ1Jtw76YLrb
         ORPz5GK0nJtfPoH8URqpd0J+qaeBSKkFRcvxCI5vYlrFUkSVc5Z0I3swVNuFtr0P14y6
         UrFhNPoR5NrGwe1G9pXSJM7y05qbeM9JG3asbqjZSOGA7J/nNUvmAABlKybKRw/tPfQc
         EV/fGkI0XdaRc5M+fvLdAEI28V6pEwfmM4wb/KCLL4eyFCLl5aAelGc10+IaforhcWpB
         hiug==
X-Gm-Message-State: AO0yUKUlf1xdpyP0Qx1FdVkowN3wOr1z6uyQZgZjvBbZY7I5GQ51NUDh
        YEUByOTcexhR9rqAMrU0gfB3tVxIW9FlXMMUe436/mF6dqWyBwLX9VIBLKP0ANgnUdimsa7m4Uq
        hfgmhy2N+sI2TLM9pG03a3japo7Swjjm3RCfjD5W4TqUwDltJ/AhZ
X-Received: by 2002:a17:906:3f5d:b0:871:178d:fc1e with SMTP id f29-20020a1709063f5d00b00871178dfc1emr32552248ejj.77.1678658914838;
        Sun, 12 Mar 2023 15:08:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ifrMke1TKPaXV/h9jQ1smGEbg8WmZ7YWVazgU9vc4s4llYIlb+CiWF97J8F1BNTFFdkm4cw==
X-Received: by 2002:a17:906:3f5d:b0:871:178d:fc1e with SMTP id f29-20020a1709063f5d00b00871178dfc1emr32552227ejj.77.1678658914479;
        Sun, 12 Mar 2023 15:08:34 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id x19-20020a170906441300b008f7f6943d1dsm2636965ejo.42.2023.03.12.15.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 15:08:34 -0700 (PDT)
Date:   Sun, 12 Mar 2023 23:08:32 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
Message-ID: <ZA5NYOzN0jU/l2YJ@righiandr-XPS-13-7390>
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
 <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com>
 <ZAzedS9sx5l6gmzB@righiandr-XPS-13-7390>
 <CR4G3AY4U6IJ.2ZRJBDCGH9Z0Q@vincent-arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CR4G3AY4U6IJ.2ZRJBDCGH9Z0Q@vincent-arch>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Mar 12, 2023 at 02:39:20PM +0100, Vincenzo Palazzo wrote:
> On Sat Mar 11, 2023 at 9:03 PM CET, Andrea Righi wrote:
> > On Sat, Mar 11, 2023 at 04:27:52PM +0000, Björn Roy Baron wrote:
> > > On Saturday, March 11th, 2023 at 15:01, Andrea Righi <andrea.righi@canonical.com> wrote:
> > > 
> > > > Hello,
> > > > 
> > > > I'm trying to distribute a linux-headers package (deb) that would allow
> > > > to build out-of-tree Rust modules.
> > > > 
> > > > Everything looks fine, except for the following error:
> > > > 
> > > > error[E0461]: couldn't find crate `core` with expected target triple target-10951614936105594995
> > > > |
> > > > = note: the following crate versions were found:
> > > > crate `core`, target triple target-3759196539525232825: /usr/src/linux-headers-6.2.0-16-generic/rust/libcore.rmeta
> > > > 
> > > > All I need to do is to "refresh" the headers by running a
> > > > "make modules_prepare" after installing my linux-headers package on my
> > > > system and then everything works perfectly.
> > > > 
> > > > Is this because my system, where I try to build the out-of-tree module,
> > > > has different toolchain versions (e.g., binutils) than the build host?
> > > > 
> > > > Any pointer/documentation to better understand how the target triple
> > > > version is determined?
> > > 
> > > The target id for external targets should be determined based on the filename and the hash of the target specification json file since https://github.com/rust-lang/rust/pull/98225. That it happens to work with "make modules_prepare" may be that it recompiles all rust code for the new target triple and through luck it just so happens to have the exact same abi as the original. There is no guarantee that two compiled rust crates have the same abi unless they have the exact same contents. To debug why the target id changed could you try running the following rust program in both the linux source dir and the /usr/src/linux-headers-6.2.0-16-generic dir?
> >
> 
> > $ pwd
> > /usr/src/linux-headers-6.2.0-16-generic
> > $ ./test
> > 5559158138856098584
> >
> > $ pwd
> > /home/ubuntu/src/linux
> > $ ./test
> > 5559158138856098584
> >
> > ^ Same hash, but at this point I think we already know that the problem
> > is the patch above that I'm missing in rustc.
> 
> Maybe we should increase the compiler version required by rust in the
> kernel?
> 
> Cheers!
> 
> Vincent.

I haven't tried with rustc 1.63 yet, but if anybody else is interested I
just applied these two additional commits on top of rustc 1.62 and now I
can properly build out-of-tree kernel modules:

 https://github.com/rust-lang/rust/commit/072b7db56161ee4c7a4411d8398c90512c153e16
 https://github.com/rust-lang/rust/commit/fc1df4ff170ec137ecab7d7aa7f4dc894bb17449

Tested here:
 https://launchpad.net/~arighi/+archive/ubuntu/linux-test

See also:
 https://bugs.launchpad.net/bugs/2011355

-Andrea
