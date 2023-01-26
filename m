Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B55C05027
	for <rust-for-linux@archiver.kernel.org>; Thu, 26 Jan 2023 17:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjAZR4O (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 26 Jan 2023 12:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjAZR4O (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 26 Jan 2023 12:56:14 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92871EC72
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 09:56:13 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id jr19so1928342qtb.7
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJuwfpFYW+eXH7R21U6yFwqAqLt8Na8907/l2Ae61F8=;
        b=GbPlPE/wwMzPsrGnYe1d9K235c8Ke6xZyycw/gbg6Ele4DOGxCJvtb9UnRS3surBXM
         /2ydrEaCGscPHHj3NBeldzCvzKRpDXQbBBtzgQ6qEjUMg+MYBfiuKLnqT65O2jGZDXoz
         J0xOMVeWUFTAQ3QLS4E9VK82YYNfCc5oX8uO5p1znocIPtTQNz8Jr+GZ0+ZRmR1DKPSd
         M6NNTag3mIooi8Nuw9dEkl55IgYF/h8cJLkRP+Qp3MqcK9+tOO6KnP+RwtU89GhG4xzO
         n/AFzYtYO2GtcJrffUOMdB7wEmsGOpeRfSea+OSidq9HExxdtyxiOihCcurjgTWGyrUm
         Uw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJuwfpFYW+eXH7R21U6yFwqAqLt8Na8907/l2Ae61F8=;
        b=hTtxT882yb1ItdVC1XsbXpvhn74mAvPFUeSdLWLvolCA/wz6hmV1/zsBn6O5ZXBZRe
         o3y6m+3i9+6hc2ZQtAE3Mv/RqeTA6/DnhJWI88c+wRzVYB5P6srpeS/T27UYc5Szro/A
         6chWOjDKpfNwEb7sEBd8hBS1a9IT8+Jg0GWLDnWfSbofA9h5EOtIk80EMDQhsvO6CfLo
         LQV7onTtpBK2vFr9Rd0SNjsLv1ZLsxzDL4QmnkTP8EJu+i7qf2B5yZwSWavj2zH5zYXj
         0vir6VMPhAKQpWV3aBG12tvaI1h/dv/DQ+CE2qIttnF1SsID0yaXzfXfEBtUVqZRTskK
         TCcQ==
X-Gm-Message-State: AFqh2koqpq0pHzWo7KYSLVClM5cQBnJBB/b40wIPlU1Cf8FuhZ5VoBau
        6++QsEagDve1yaRZfwStTR6I5NWpq6VJC/5B8EI=
X-Google-Smtp-Source: AMrXdXtg2D0gCSXDTeij2nS3+Be8kkpxLFJ9/SBuj2PCFvGn4stOFSEMoYnP08k9tkCs0ywk49OrZvRX8cpUMWiYUQQ=
X-Received: by 2002:ac8:72ce:0:b0:3a9:7ff2:3b85 with SMTP id
 o14-20020ac872ce000000b003a97ff23b85mr1497994qtp.102.1674755772690; Thu, 26
 Jan 2023 09:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com> <20230126163552.GD29438@willie-the-truck>
In-Reply-To: <20230126163552.GD29438@willie-the-truck>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 26 Jan 2023 18:56:01 +0100
Message-ID: <CANiq72mpzRjT1ZHCHcGrOJ_71eQPR_-WgP=5YfDWDBNR6JNP4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
To:     Will Deacon <will@kernel.org>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jan 26, 2023 at 5:35 PM Will Deacon <will@kernel.org> wrote:
>
> Why do we need to specify this stuff here? LLVM already knows about AArch64
> and can compute the data-layout string in computeDataLayout(). Can we have
> the tools figure this out for us instead, please?

I agree -- the reason we have this for the moment is to provide full
control of the target spec, in particular for cases where `rustc` may
not provide enough flags to customize exiting builtin target specs
and/or may emit warnings for unknown target features etc.

If it is already enough for arm64 to use e.g. the
`aarch64-unknown-none` target spec plus flags on top, then we should
go for that, because that is the end goal: these target spec files are
unstable in the Rust compiler (and not intended to become stable).

For context, upstream Rust so far has been willing to merge support
for flags and target features that we needed, which is great.

Cheers,
Miguel
