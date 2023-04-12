Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5274CC77B6E
	for <rust-for-linux@archiver.kernel.org>; Wed, 12 Apr 2023 18:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjDLSoE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 12 Apr 2023 14:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjDLSoD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 12 Apr 2023 14:44:03 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3D93C11
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Apr 2023 11:44:02 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id ly9so11528427qvb.5
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Apr 2023 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1681325041; x=1683917041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NA3yKE/A/kXoMe2VU/QiDPUbIiNd9/qULMU5+xukd6U=;
        b=T96QhM5Sh+19QAqixHf79oSq09AeNY57s1bb9hNgC1Fjdlfd+Lk9MayayE6mffYJ7+
         92/xlz+ghBXN+hpjI2YWV4wgPGFVyNVPhTSHBe17VgzAENIaAyOZdFv0nlM5U/q7QvUk
         LGWGdDIEvpN8UsXExM8Z74bi+XuMf72JY3Z8CI2zUMDkImIm8AA21IXU2qPuvHfepNYr
         RJCQ1dm8j/TPvS49mvv1Ax8VxFjAwJF5VyAh5UMRrGrgOO1f0RdTmhoK0Tx02Aw0sXyJ
         pqIlb4q/3rWhIFb2I/pcBbv1grpU0kbkpCRefnDTbSdtaVzc+NUNj1yqB4MWImjmYb+V
         8jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325041; x=1683917041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NA3yKE/A/kXoMe2VU/QiDPUbIiNd9/qULMU5+xukd6U=;
        b=hEgpxOg+oM0mGB/QteB4ntr0n+de3r/jir5jvJ6l5YBMhyn/3lMdrB1N6Dm0Y1s9Tb
         rc6NBWYF1S6m+28QZh91ZeD98zJoXyh5GyxAGojRIPeMY5EYSSErki3SNRkqbTHmxxg9
         DorwssB+l75uJm0UgaAoHOPsMgp/dBWd7HNHecFEXCd1ROa4INSlOlEaAR/r699ZoReW
         bB0Yu5DO2l4O6Fwp8BCxA6I9Fl1s67KoaA5RyUt4nk5WCOst6fzd/CQwZngX7BiN/qfX
         f+qE7XDdOd8BXTNAyiX2OFvqQxSA3mQqN5FLSu5nibpdL1HRhqGHiUUDfsOswlL3jg4G
         NLrQ==
X-Gm-Message-State: AAQBX9eXhNhGjZCHkFKtuJILaZOk7jQzxD6Q2KUQGpnGjm9JSNqfcTW9
        TwfU+UA8UQuod3cLzURLtDZOJg==
X-Google-Smtp-Source: AKy350Y3OC9A50D1pW6cq4oVehWpe37l+cmYeLQ8rIj8dC+wF1vYlypEuM8OFvq1g0Zqah6s+Gwivw==
X-Received: by 2002:ad4:4eef:0:b0:5a3:725e:425c with SMTP id dv15-20020ad44eef000000b005a3725e425cmr27210024qvb.2.1681325041277;
        Wed, 12 Apr 2023 11:44:01 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:199e::580])
        by smtp.gmail.com with ESMTPSA id m10-20020ad44b6a000000b005dd8b9345cesm4987525qvx.102.2023.04.12.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:44:00 -0700 (PDT)
Message-ID: <3fa75b5748022c63dfb75ff82e1d4a84d58a296a.camel@ndufresne.ca>
Subject: Re: [PATCH 0/6] Initial Rust V4L2 support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Theodore Ts'o <tytso@mit.edu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        wedsonaf@gmail.com, ojeda@kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@collabora.com
Date:   Wed, 12 Apr 2023 14:44:00 -0400
In-Reply-To: <20230412025834.GA301301@mit.edu>
References: <20230406215615.122099-1-daniel.almeida@collabora.com>
         <ZDSRSWhWsN34MghQ@xps>
         <CANiq72=n1b=fJ2XZZx_MLKkbKMTmnmTBMgA3GJ_hqyARPtwEiQ@mail.gmail.com>
         <20230412025834.GA301301@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Theodore,

Le mardi 11 avril 2023 =C3=A0 22:58 -0400, Theodore Ts'o a =C3=A9crit=C2=A0=
:
> And for those distributions that don't currently ship Rust, such as
> Fedora, if someone could build their own unofficial packages, until we
> can convince Red Hat to start shipping -their own supported Rust
> compilers, that might be a great way of bridging that gap.

Rust can be installed from package on Fedora. I sense a lot of unverified
supposition to justify your argument. I don't believe this contribute much =
to
the discussion. It takes about 30s to search on your preferred search engin=
e and
find the fact the Fedora ships rustc, and the version is very recent.

regards,
Nicolas
