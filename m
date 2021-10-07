Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766CEC433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 16:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58A2161074
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 16:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241439AbhJGQhb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbhJGQhb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 12:37:31 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565C3C061570
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 09:35:37 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 24so9876014oix.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCRCBp29mQT9iVJuQWMc24xLxe6qTuiv5JwUggLsF0U=;
        b=PZu+JBrKVqMhu5LIKfgVd1WyTL9j7ppRFswNHTaAhNiNrFGvuweCxmMs07N/I+Jv0s
         XfRyBbfCaRu0X2e4MuNOWdN+qcmRFoCSJinGWDtJEk0d93Zgi2wlUF/D3KDX3T0UcV6f
         32sYlj+TrfSoxLzdwjRF4Mt89xtjHDOhKkuJFdEvPq3zAj8G2i2vE7muHvGhFjMrgnR8
         NVr8h9xrlWsLqFDdkkCIw2ZwsJsbFTzweB28qbrXOsfy1KgJsw+LGXeDhvi9OPWFU9Yx
         FFFxdLny9kGywaY13VZWozuoN3DH7kQUbBFUYuejSultAKWl2xrJrbohvlHvDd2k4Jgs
         M1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCRCBp29mQT9iVJuQWMc24xLxe6qTuiv5JwUggLsF0U=;
        b=F4JgdINszoWRndpXQLA93Z4CmNolg9bI8ewSD3qDTTazib2FQRdYfnWXALEtuaYqf1
         KLnfG9Hn3ZHm0ujn0V8Fsa2lW3s+i1KntOaZ1Plk09Xwez7pVatuCl6TePrcwd41K7mE
         js4dc1yQ0uLRsdER2JkSZmgeo34ZFvcibn/bEOQAvP5bpCWUXH2vcO9yDNUd6Cz+mFhC
         q076ZpGyRPZuDBeR9VIsp1oSQ3pQGi8GzuvCv+BIaB/LmnLkk8tTScNr6qVyH7oflgLp
         sc5FOFgsEcgZZJjXOR7nZROHW4zHOYW7G+lAB85POdplZapGPi9uXrNJQheApN+VNisk
         N4aQ==
X-Gm-Message-State: AOAM533AEakoXdNeLrniUuT2sEkiAMrIaSjxkUWBlt2LJTuU7msv0TEv
        I/XKyq7nAu1h+OD2FxzAKjSF3g60eTen5bndCaYLsg==
X-Google-Smtp-Source: ABdhPJw0icGnBSxeJRjhDKwmbmHUBN5jz6Pcs/ffOAlUAtHSrvJ+kjRJkrkHB2l6TJ1cv8lWRAMDZGPP+2xtRNQaoaA=
X-Received: by 2002:a54:4618:: with SMTP id p24mr3871519oip.134.1633624536556;
 Thu, 07 Oct 2021 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <20211007163019.GI880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211007163019.GI880162@paulmck-ThinkPad-P17-Gen-1>
From:   Marco Elver <elver@google.com>
Date:   Thu, 7 Oct 2021 18:35:24 +0200
Message-ID: <CANpmjNMqfVN=CfbxpMb9o=045thHLewB_eTOPFwT67gkO-vOuw@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     paulmck@kernel.org
Cc:     kasan-dev <kasan-dev@googlegroups.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 7 Oct 2021 at 18:30, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> May I add this information to the article with attribution?

Of course, please go ahead.

Thanks,
-- Marco
