Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2934FC433EF
	for <rust-for-linux@archiver.kernel.org>; Sat, 12 Feb 2022 22:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiBLWhj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Feb 2022 17:37:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiBLWhj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Feb 2022 17:37:39 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AA25F9C
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Feb 2022 14:37:35 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id m185so15744345iof.10
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Feb 2022 14:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YdRY1vh187Ti2lNhE1cStNPG0E7OoEZRMCqSox6LPI=;
        b=FgIb53GclKHW/Dem1kAPZUD7TGBuLnh3J/g6syXNtGRja8YZ83qRRwuQTnRzpieC8w
         fKXQU1o0quQwgbV0tIYFvu41XjLzIYjMimbwkSRcjvdJqtrVNaAY2m8Bg75Ju8H8WOtA
         BBpr+HmMPAMk1R+I/R8IXXsJ8sDGdrVj+/xl13IM6kpV2lhoCtjWEMpPNmpYAJLq/B44
         BUyrEerWq6JN6OZGjyLLTexTeRAB4YxvzuF1w4Cm5PtEBBg9G71MTHBKdl1yRZlGBBjU
         Jf/34jO3QhtPFGwajFqFUrtaAeqJoxt8uEZfG2fP2Hcp9ap2KdptTv4oflf1VQvvTwx8
         jnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YdRY1vh187Ti2lNhE1cStNPG0E7OoEZRMCqSox6LPI=;
        b=j5GK/mcqfZFCtoblf3tTSy2MQ3GYxsHZlPpNLdKGvLYA75XtNTUa38T5tzkmWPl47j
         XW/d//x9tse3NedO2W/s6iY18Jw7tbgHntkpM+aXDXZARNRwmufNEuPDiSM+FpnEUjC3
         G2I+yVOU2IuG/EEcgrAOY6Eph9mRqIpIOYoADSk4TByxBBNoEM+JrZNtjind5tYI0Qv4
         WW2CJcJ2JFUY+nt1R667+Dda6sApZbzL+W+kX+q8MDz0qG7Na663Dd3vIX/LkG1PhpSU
         5wH8zzclX51vKBoDbpn2v2aMxxE4jeYSotYVGiASjeFuRynE+v8agVcS9GnIXbe99ROx
         KObg==
X-Gm-Message-State: AOAM5307bdfCLkaLwtsuXB+1zGupu6n5atZUuO/wh8vbR1Uk2Tr+wtr8
        eKVyNOry/gHr7GET0nGG7ohGdG7L9r4uqGfjYkg=
X-Google-Smtp-Source: ABdhPJzdH6b9QIMhUbZGTWgEGzFFCI4yKLf5IBcqvttq0NrZTiLI0b1JMRDi2wzSo7hyKbEiBcmXMw7fLNbNNB+n4j4=
X-Received: by 2002:a05:6638:380f:: with SMTP id i15mr4338869jav.308.1644705454806;
 Sat, 12 Feb 2022 14:37:34 -0800 (PST)
MIME-Version: 1.0
References: <202202121743.YbGELjcY-lkp@intel.com> <YggQeC0PuAseqtpQ@archlinux-ax161>
In-Reply-To: <YggQeC0PuAseqtpQ@archlinux-ax161>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 12 Feb 2022 23:37:23 +0100
Message-ID: <CANiq72kPP=o2NiE+r3Gt=Uhh79ESDwa6BRkj5HW3fn4VCY-evw@mail.gmail.com>
Subject: Re: [ojeda-linux:rust-next 18/20] ld.lld: error: drivers/built-in.a(gpio/gpio_pl061_rust.o)
 is incompatible with aarch64elfb
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, kbuild-all@lists.01.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Feb 12, 2022 at 8:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> + Miguel, Wedson, rust-for-linux, since it looks like this did not get
> sent to you all.

Thanks -- strange, there is a `TO` and `CC` there in the top.

> Possibly some incompatibility with Rust + aarch64be?

It is getting built for the wrong endianness due to the single target
spec file + the lax "depends on", will fix.

Cheers,
Miguel
