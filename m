Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41085C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 21 Mar 2022 23:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiCUXWl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 21 Mar 2022 19:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbiCUXWb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 21 Mar 2022 19:22:31 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000BF9FDC
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 16:15:09 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id w7so18504980ioj.5
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+IcaNCmQN3ppRhZiGk1fK5srwD7Uf9NTqmkx/PvkqU=;
        b=XfRoC9PpTSR9DUnFH4rVj4ouDsKu+XuYhHNEQOciOgTeWJ5CW2TAnosgVuSGpzRyGe
         33wg0STJd/vbddzi82liA60JzEyFQY3wgwU415xlvMLgIqEL1Pbual+dgA5G7AbK2OVF
         NqVb3VCdVsaVtGPOAA3LTCwPaf45nuWmAW7TQgxbnrSXSEHhf69DDqbMxUVsrnzHUk4I
         9p+siBbsByqLgX/4xP9NGmNVfJUEs6Ewm52NOB2QXGc/OlnYiy1cfxQOMx8HAIpoDHcu
         PYMlGaiDRHGbPOAepY1LDVj3K6CuhZwaK95ot/+YhvJVB5o0mve3VdsfH1TfSnQX9VH3
         d1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+IcaNCmQN3ppRhZiGk1fK5srwD7Uf9NTqmkx/PvkqU=;
        b=2F5RQPBR/mz9Z132p6Jlq2NLC73bY2Uy/fB7g+QPMg0WRLc0T/B1zJtxkNXPoSRE3J
         iDzBgU8s7BplqXF3gnNhzv6zFX6lNDMCZS7YY0Y/zwtnwc7EA3JtiYgH075Yr+x64ilQ
         KJeWMASqpd21MH2324GTe8cQ/s/Gr6DPXTLk33uM2WZJAvX+vEWGOY+z66tfKYnKcnpQ
         TJzRKMk3D/WG8ULSXjodoRkKhD8EvVNfC8U3myA3yHoQsY51YhhMBy6V4vTDsz+TtiN+
         2wo/Qh48ZvjQndjFxZBAlRAH1kKKvnsaP4tKsM/MV9boADuALuUpG/rOzjAy2+95cvBi
         +24g==
X-Gm-Message-State: AOAM532Y3yjBBY+OBbds2juoj4GW6Og75O26JAA628rLBVt8oDRj39L4
        dBYUKLLraIKAqwP6tv1Oco14eiMJiggIpiXFj64=
X-Google-Smtp-Source: ABdhPJx3EYruWWEpef5QFdGnZx3AKDWy14ZZ3W94HHrKvcCFxLyuXtqxSkaI3tjW40745zTuhSRWZMT6BhFMAhJvjwo=
X-Received: by 2002:a6b:b550:0:b0:649:a974:5e39 with SMTP id
 e77-20020a6bb550000000b00649a9745e39mr3126795iof.64.1647904509169; Mon, 21
 Mar 2022 16:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
 <CAFRnB2W+8XqOj0aL5DP2cMNLO2uR0DpPk-qB-oC7r=zT5N5gGA@mail.gmail.com>
In-Reply-To: <CAFRnB2W+8XqOj0aL5DP2cMNLO2uR0DpPk-qB-oC7r=zT5N5gGA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 22 Mar 2022 00:14:58 +0100
Message-ID: <CANiq72=q2FWAfyjPs+VC-H6o8RXCjrXwKbCFJ1kDKGbfYDYnGw@mail.gmail.com>
Subject: Re: Using 3rd party crates in an out-of-tree module
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     =?UTF-8?B?TsOhbmRvciBLcsOhY3Nlcg==?= <bonifaido@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 21, 2022 at 10:17 PM Alex Gaynor <alex.gaynor@gmail.com> wrote:
>
> I don't know if anyone has given any thought to supporting 3rd party
> crates for out-of-tree modules.

It is possible that we will have some form of dependency support
within the kernel (e.g. to split the `kernel` crate), which could be
used by out-of-tree modules too.

Extending this to Cargo-based crates could be possible, but we would
need a clear use case -- if an out-of-tree module requires a
third-party crate, it is fairly likely others in-tree also need the
same problem solved. It can also complicate submitting the out-of-tree
module later on to mainline if one relied on third-party code which
now has an alternative in-tree.

Cheers,
Miguel
