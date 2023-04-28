Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D116BC77B60
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Apr 2023 19:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjD1TX7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Apr 2023 15:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjD1TX6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Apr 2023 15:23:58 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F453C1E
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Apr 2023 12:23:57 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54f9b37c634so3401197b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Apr 2023 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682709837; x=1685301837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzjHijxBW2NZ9pbmYdnDNU5ub/ivxUn65yt/lllntBg=;
        b=o4GJjzxJPRigqYcDFq7MrVv3pBiKJiBzkW22nX5n44GRSxWJGUH7e/U8/X+2Y3RVlm
         aFYDCPor5JrcS9oQ/HL8Ww86HcafoP+9zYfHq3mNR1sevd8X+sqqugo3/39l6zk9lNpg
         kaoVlnBuBAzNDJRZLlCySujrL9BMWSq34IJfyQvp37WxDMBhnbYvAl1GGnzzKP2ITwsu
         eM/Fr9sdP/0aHZnVEz1VKZzqMvK5ivhwR+M7YXAn6X09IZe/uEVD8iwIQvNqlOYGXuXN
         23+69xXHIcDVtHEXG3YdT0/lduwcLUsHty2Y8RpB15ObG9FzYzz82Cj4EkAQgOYEeHDK
         H3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682709837; x=1685301837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzjHijxBW2NZ9pbmYdnDNU5ub/ivxUn65yt/lllntBg=;
        b=GNHGb4ooQhzaqcPDsIKelo3+I/HD05+/ksBbwfas3peN5PwkOrogvYgaiScK2MJUR2
         8dmdgxYtu2FKFdPgQU0Et+7ak2MwyWgL0divv9ttsdacH9TikFa7+wWuqZuzIweUW/h+
         LYYm47LI0Ua6mR1KTQvv0OTXt7xFf6XCxefqvRgL162ujGZXilk1SJndD58K1A3VIrOw
         fI+6yigyLKmSMYNGjejO//eGkJAOqaIESlsSGba1D7FdTOHEyLbFrltjDhirCnYQS2s3
         Ux4+HFnx2MV5sf0NrJahrZmjNhzsWU2MVtKZQbXZXLSupuHJcIxHNV8gs1v9DauRRHwN
         jErA==
X-Gm-Message-State: AC+VfDwtxlLx+rpM8KSxXC7qLOXDHdqGvIjcqUub++wrFvI04qKy1oaD
        a7sfA6roQs6sRgLpfH+gc4wEEOsKRlV3GxpcMmqmf+1yKes=
X-Google-Smtp-Source: ACHHUZ7D89Rr8NIzs9zgVNnF+uAoJwKsX4u/M6ve1lQX59Pzf/3m2hrNKPj5LeAILQZfVFUpcEgUaWZjjhItq5rejSg=
X-Received: by 2002:a0d:eb44:0:b0:54f:b88:c751 with SMTP id
 u65-20020a0deb44000000b0054f0b88c751mr4970532ywe.44.1682709836617; Fri, 28
 Apr 2023 12:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAN7_B6rKwLxt3R2bBPcDfmwCGL81Cnu0SLE8dya=sn1byBQSag@mail.gmail.com>
In-Reply-To: <CAN7_B6rKwLxt3R2bBPcDfmwCGL81Cnu0SLE8dya=sn1byBQSag@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 28 Apr 2023 21:23:45 +0200
Message-ID: <CANiq72ncyiVY2-VAgO0S7rX6Y0zCO_XZJ-iEE8DCvxpQmtUiSw@mail.gmail.com>
Subject: Re: Hello, rust-for-linux folks
To:     Alfo314 Sanchez <alfito314@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 28, 2023 at 11:51=E2=80=AFAM Alfo314 Sanchez <alfito314@gmail.c=
om> wrote:
>
> I'm right now with an end-of-degree project trying to implement scull
> into rust, but the one in wedson's tutorial has a cap of 4MiB, which
> seems a little low for comparing with its C counterpart. While trying
> to implement a linked list of vectors and an array of vectors in rust
> without success, i saw linked_list.rs and unsafe_list.rs, but they're
> a work in progress.
> Do you think these are good options for declaring a linked list of vector=
s?

They may be different from what lands eventually in mainline, but
please feel free to give them a try.

> If not, I was planning on comparing C and rust by using bindgen and,
> in a C program, including a rust function for matrix multiplication
> and measuring the times.
>
> Do you think this approach is more or less simmilar to what
> rust-for-linux does, as far as bindgen goes? Rephrasing it, is this
> more or less what rust for linux is all about? C communicating with
> rust and vice versa via bindgen. More than anything, I'd like my
> experiments to be significative.

We use `bindgen` to avoid manually writing the equivalent to the C
headers in Rust; however, that is just the Rust equivalent of the
information the C headers provide.

There are, of course, performance considerations around FFI, but
`bindgen` is mostly orthogonal to this: the tool could attempt to
translate some more things automatically that then you could take
advantage of, but you can always do it manually too.

You can definitely compare performance between a C
driver/program/function and a Rust driver/program/function, but you
can approach it in different ways. For instance, how close are the
features and the implementations going to be? Will you allow `unsafe`
blocks in the Rust side, and if so, which ones would be worth it? Will
you try to match codegen (assembly output) as much as possible,
disregarding other aspects?

In the kernel, the general idea is to wrap the C APIs in safe,
ergonomic Rust subsystem abstractions that match C performance, which
then Rust drivers/modules use. Those may actually contain very little
to no `unsafe` code, but the abstractions themselves may contain quite
a bit. This is similar to userspace: your Rust program may contain
little or no unsafe code, while particular libraries (e.g. the Rust
standard library) may contain a fair amount (depending on what they
are/do).

By the way, you may be interested in the first Rust NVMe driver
benchmarks: https://rust-for-linux.com/nvme-driver

> PS: I may have more doubts so, if you need me to speak using a
> different mean other than this mailing list please tell me.
> Thanks in advance.

We typically use Zulip for discussions like this, please see
https://rust-for-linux.com/contact.

Cheers,
Miguel
