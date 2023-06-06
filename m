Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7DFC7EE24
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 15:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbjFFP0J (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 11:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237942AbjFFP0A (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 11:26:00 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A21A198D
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 08:25:47 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so6549939276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jun 2023 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686065146; x=1688657146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD+KQMthMZ3rJgGdK4c7DF2xuqYdLn7Y45h3Icr6TxA=;
        b=XMyqN33NQUNvozPrKNFuIsX471klAEa2YF1gYGS8N6FOuvz61NbKXDs4sgdvvQX3gr
         kssiJLKvN0j8Vxq8OMEmeY3LUCqYuo3vSX/uli+96zuZsuHjycQcSAbAgwCSWcGa4qFk
         c9Y5QvpO60e8WIS8GpumxHXpar9D0AeHzIpkJs36zYYTl3XAfk3s7FGCeecEkPKQIYYZ
         VLpOy3b0NeFP0dXwOqrYIwk2c7ha4ZRODwNX5XY7panhOVWW6SHQ86Em/tM10UVhDBy7
         VKS00xsxNglhzRXtgZcXEkNQ+YLagEzWQlqSdLaRFyDvNTFcnzLdclYPz0RM7eMIdvS3
         LXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686065146; x=1688657146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD+KQMthMZ3rJgGdK4c7DF2xuqYdLn7Y45h3Icr6TxA=;
        b=Ok157jvSSa3U8eTsYuunvKH/SfvUgEKlD3HSJZ7NjVjTIN5jkIVT3FMdbaYJEsfWOt
         FF54bmN+OPmmf8+Yhn3GADAV47P4j0/GDzv+4CCPEquauQNMFTLPC66h7SdXPXOnO7Cu
         hIoSgXdW8DHjf3Y+VnYNSCakBamtyZmawLolyCrH5PAhm2KD0Teos01kEKWth5UhSnkZ
         OrLLgHsjduKT4nzR5ZuDXtvfzUzRlPzQUzWjOy/dc5GOfBH8P2LUlji4vcKaCyF6/qcj
         WR5I0jaLARXVArRSrgQyRgtaP6iSu8DE707Eo4qrGxL4ESfgpWvZlvo39qzVlezUA1Ui
         vT+g==
X-Gm-Message-State: AC+VfDzklah97a+AdQJV7m0vT5fll+zLQNpLTHqDiWp4WqwEwBWfUwKe
        gSDqkFEKAgHcYsY7I4B6bObWOxumpk7IoWaM0kE=
X-Google-Smtp-Source: ACHHUZ7T6NVYCbB46cdO+JO2072QES55TqR6UQySc7srvuIDffOdzF047vHSQZnlPKVPHybK+/cfzLrY75Px3GpM3r0=
X-Received: by 2002:a81:a190:0:b0:565:c4af:1a90 with SMTP id
 y138-20020a81a190000000b00565c4af1a90mr2412342ywg.40.1686065146190; Tue, 06
 Jun 2023 08:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 6 Jun 2023 17:25:34 +0200
Message-ID: <CANiq72kceCV1CDHpmDCq8QR0u+=71-DOYYkVQeGpYfMdSju8Gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Rust enablement for AArch64
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jun 6, 2023 at 4:56=E2=80=AFPM Jamie Cunliffe <Jamie.Cunliffe@arm.c=
om> wrote:
>
> The third patch disables Rust support when building for big
> endian. Currently there is no `aarch64_be-unknown-none` target which
> would allow this. Support for this can come at a later time either by
> using the target.json approach, or upstreaming a new target definition
> to rustc (preferred). We also might be able to use the
> `aarch64_be-unknown-linux-gnu` target, however, this can be done at a
> later time.  It's worth noting that in Makefile.clang, it's
> recommended for arch/{arch}/Makefile to set the endianness based on
> arguments rather than the target triple. It's currently not possible
> to do this with rustc, a different target triple has to be used.

Thanks Jamie for this!

It sounds like upstream `rustc` should support setting the endianness,
but if they are OK with maintaining another target, so that we can
start to get rid of `target.json`, that would be great.

By the way, should the patches be merged into one? i.e. the first
patch applied alone would be "wrong" in that BE is not supported
anyway, right? So why not put the constraint directly in the first
patch? Or am I missing something?

Similarly, for the second patch, I think it would be better to squash
it into the first, especially if the build is not correct if those
flags are not set.

But maybe I am missing something, or perhaps the arm64 maintainers
prefer otherwise.

Lina's `Tested-by` for Asahi would be great here.

Cheers,
Miguel
