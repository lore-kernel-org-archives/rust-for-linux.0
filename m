Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00680EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 14:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjFPOnx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 10:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345570AbjFPOnx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 10:43:53 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2C330F4;
        Fri, 16 Jun 2023 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=Ocn+mJlPMF+It8K/6Pf5Zoynuphzl6lqslhZgF0QlQU=; b=2M
        uEk1etJt21QtE+AC+pdWsf3pKhvZn4aRW5y+5+XJkIUM2qBxF4DvGojVk7ZFfBSfxkkOrYr9Xj3Zb
        Z63yOQhf+qFmTjdfmIWEn6NRclh0hgGiB34LHolM+KoX72/tYkqPowQz5jnOkQfWsEzLOdMvEYmY9
        WPNfSn2efVz/5x8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qAAg1-00GjFt-5s; Fri, 16 Jun 2023 16:43:49 +0200
Date:   Fri, 16 Jun 2023 16:43:49 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>, kuba@kernel.org,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <a4bc8847-c668-4cff-9892-663516cf8127@lunn.ch>
References: <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <f28d6403-d042-4ffb-9872-044388d0f9d9@lunn.ch>
 <CANiq72mMi=7P9OxSH0+ORYDEyxG3+n5uOv_ooxMJ72YRBRZ+PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mMi=7P9OxSH0+ORYDEyxG3+n5uOv_ooxMJ72YRBRZ+PQ@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 16, 2023 at 03:48:31PM +0200, Miguel Ojeda wrote:
> On Fri, Jun 16, 2023 at 3:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > I think this is something you need to get addressed at a language
> > level very soon. Lots of netdev API calls will be to macros. The API
> > to manipulate skbs is pretty much always used on the hot path, so i
> > expect that it will have a large number of macros. It is unclear to me
> > how well it will scale if you need to warp them all?
> >
> > ~/linux/include/linux$ grep inline skbuff.h  | wc
> >     349    2487   23010
> >
> > Do you really want to write 300+ wrappers?
> 
> It would be very nice if at least `bindgen` (or even the Rust
> compiler... :) could cover many of these one-liners. We have discussed
> and asked for this in the past, and messages like this reinforce the
> need/request for this clearly, so thanks for this.
> 
> Since `bindgen` 0.64.0 earlier this year [1] there is an experimental
> feature for this (`--wrap-static-fns`), so that is nice -- though we
> need to see how well it works. We are upgrading `bindgen` to the
> latest version after the merge window, so we can play with this soon.
> 
> In particular, given:
> 
>     static inline int foo(int a, int b) {
>         return a + b;
>     }
> 
> It generates a C file with e.g.:
> 
>     #include "a.h"
> 
>     // Static wrappers
> 
>     int foo__extern(int a, int b) { return foo(a, b); }
> 
> And then in the usual Rust bindings:
> 
>     extern "C" {
>         #[link_name = "foo__extern"]
>         pub fn foo(a: ::std::os::raw::c_int, b: ::std::os::raw::c_int)
> -> ::std::os::raw::c_int;
>     }

I said in another email, i don't want to suggest premature
optimisation, before profiling is done. But in C, these functions are
inline for a reason. We don't want the cost of a subroutine call. We
want the compiler to be able to inline the code, and the optimiser to
be able to see it and generate the best code it can.

Can the rust compile inline the binding including the FFI call?

skb are used on the hot path.  For a 10G Ethernet, it is dealing with
nearly 1 million packets per second for big Ethernet frames, or worst
case 14Mpps for small frames. Subroutine calls add up when you only
have around 200 instructions to deal with a Ethernet frame.

     Andrew
