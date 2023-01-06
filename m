Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9405CC3DA7A
	for <rust-for-linux@archiver.kernel.org>; Fri,  6 Jan 2023 09:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjAFJ5O (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 6 Jan 2023 04:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjAFJ5N (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 6 Jan 2023 04:57:13 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265B562F3
        for <rust-for-linux@vger.kernel.org>; Fri,  6 Jan 2023 01:57:12 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t15so796367wro.9
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Jan 2023 01:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxUJaj8xIJdTpg9qSQsal7SxODx6dsSDpKMMCtyhpcM=;
        b=EB9mTVIfRL2c7cB1LZZfsYJ33qUku/fSrUm82O1aG48Pv3nscMAKbwsXynULCLpPrc
         WJicJL8hVVCDOZnK5GxYAssqFiNEGuUE8THuJ8XhT/+My+DAfDhrjgIqlmsEj+olbYDw
         3f82VY7koN/3Zdv/DxtlbGaWh6Z+6rMlh3kEHhCx9GsGDRApPsw0AdlSKAE/J//ip5Zw
         Q2GtXvzVu4lRGwb/K5afTVKZQB+CygDLVk5zpXN0cFuSzWw2NH+X6Kg8kBY31++jrNtq
         WDTXzROR2jhs0a3XCdwuXA6UnVcZ12QnUzkjg0RvTR+6I1fzMVJiP7z03ewq55KPhIkW
         kW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxUJaj8xIJdTpg9qSQsal7SxODx6dsSDpKMMCtyhpcM=;
        b=hJc51lVF0vSMzGl3TCZbLDJl4tJySeptizAJd8tODWq4X/Wp3nKqccAZdBgeQCIsqx
         qztgX31bhI7hnDNfVZnMuv8WNwR3CklwAvF+TEC9fmafa9pFbZbkZCyZNcLEbAXwBAiN
         ZTTEfZqREY2jhpxAYVjrmti16ffCuBImN2WGsQpWCUB8KuHXbEJiF3bPf8eiXjUCG/Ad
         0oe8qyvPM4pWX3t1+fYmbdJ0ERoOc7FUN6UUhXhl3c3PNXn8OA01ZvFO/HxE/W8rCRmz
         sLiVW50MGXDgeQM6uSYuuRtDpMvP19xzRxvQHjhC8nYyTSfsgAm/X4+khdynMDzyFRXX
         +cDg==
X-Gm-Message-State: AFqh2krwe/1Ri/XkwozFZLcBwpxeMgTFCz5uQYwctWt0ca6JRsXRLAzN
        g+QayRekdFIPTbtoI817K/B03VU2z0af67ebXf8=
X-Google-Smtp-Source: AMrXdXsFZ9hYirwGQmiKXlmbjdXy3KpxfLyZWPuVEtg24RioGWHlbgJbDVdSYCy2pUtsqcisy08h4Q==
X-Received: by 2002:a5d:5a09:0:b0:2ba:bce9:8aec with SMTP id bq9-20020a5d5a09000000b002babce98aecmr1237321wrb.24.1672999030621;
        Fri, 06 Jan 2023 01:57:10 -0800 (PST)
Received: from localhost ([217.138.219.182])
        by smtp.gmail.com with ESMTPSA id j10-20020adff54a000000b00283c7b5ee3bsm661066wrp.101.2023.01.06.01.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:57:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 06 Jan 2023 10:57:08 +0100
Message-Id: <CPL0NRGMD1WF.1FI5PCWZWOZ19@vincent>
Subject: Re: Rust in-kernel TLS handshake
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
        <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.8.2
References: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
In-Reply-To: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


This sounds pretty exciting, and I think to play with it a little=20
the bit will help to see what the future looks like, also this=20
seems a really good use case of rust in the Kernel.    =20

Let me know if there is a need for help, I had some free time in =20
the next coming months.                                                    =
                                                                           =
                                        =20
Cheers!
                                                                           =
                                                                           =
                                        =20
Vincent.

On Wed Dec 28, 2022 at 2:33 AM CET, FUJITA Tomonori wrote:
> Hi,
>
> I've started in-kernel TLS handshake implementation in Rust.
> https://github.com/fujita/rust-tls
>
> There is some debate over in-kernel TLS handshake mainly because of
> the complexity. I'd like to see if Rust could help with auditing such
> complicated security-relevant code in the kernel.
>
> I worked on QUIC as a consumer of TLS. This can establish a QUIC connecti=
on
> with Quinn's example client, Rust QUIC implementation. Only minimum
> server side functionality and connection establishment are supported.
>
> From the perspective of Rust-for-Linux, the main work is implementing
> APIs for crypto subsystem. Also libraries such as working with buffers
> (like Tokio's bytes) would be helpful, I think (should be useful for
> other projects). I'll work for mainline. Meanwhile you can compile
> this kernel module
> with my fork.
>
> Opinions?
>
> Resend due to a delivery issue. Sorry if you got this twice.

