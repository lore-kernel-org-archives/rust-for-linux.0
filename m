Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98762C6FA99
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 11:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCGL4o (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:56:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjCGL4n (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 06:56:43 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D338B2D5D;
        Tue,  7 Mar 2023 03:56:41 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536b7ffdd34so240009557b3.6;
        Tue, 07 Mar 2023 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=HlTlFZ6JpzfQr4iv30oIdQyWt5EKVG4KlPTb+CtXgnhcokg9agdArzRPjQaAhjClKC
         ZdKh92km6nxWkT3uQOqDjCk/L1h0yTo3J3/U6pK8OkC1WlgHQdR+UJzqYNSNfKh56g1h
         P6SjgUcedkQsE7840DprGK0z/3YIOuMtgwSwzxamhNMXCsjz/bOD5MvATFVETc5SR+UT
         iBVMPMKPl2EtwWqT8Im+I1/eoqcIyrslwnxUhawQPD4rEIjHRjbkTYaGZlWu3279wo1m
         o9hRTRw9GolZcvpByHOv1j8JCWQJ9mYMpP+s0DjAfQlcib7hjtoM8L2U5RyjFmGHJHtj
         o/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=cHALOOMvsCyHU1iZevMB7BNvTmCEuGZ2QrVW+xMmkzlu1fZWWQEpOsx+BE81RwGuaX
         i3Qwy24l9zkQ+fvWX8GyPJF9HLRWND3W2vGGTIGJ4mz2GPVNtMiT/IHqb7YvCrLZqtPK
         9DCONtTxtUhKUMj4FK5OHzAqPYBdy46K2NHMTEbTT/VAQNLq9AO6tbq7JYYsG6mRXifL
         4apwYv+s4Q0T8I42gKDHqAOX2yjW1Lj2NPhyO1W2gd7qw+nNxINOiWGtKKjhCScvFX/z
         Yowgqg6AXw9MKABOd5LXb301jsw0OGr43Lszzb8AYQVmN9gAXb0a6PRWubmi73JBqHvF
         j+zg==
X-Gm-Message-State: AO0yUKVniY7V+qj2Hrl+BiLwk0F355pCLoZ9CKPZn4FPbXnqs5NAp/H3
        jNiWcVj+yAFa4rVVf8HpTKKmDtzSgk/2/OHM1kY=
X-Google-Smtp-Source: AK7set+XuApmsHpeE59OAObEV85h6yLM1xkplSm7PT1n4hNgCYOTpCcCuw40R2D3CdnvscfMkze9+dwV/8bTBkxG6YU=
X-Received: by 2002:a81:b61a:0:b0:52e:c79a:cda with SMTP id
 u26-20020a81b61a000000b0052ec79a0cdamr9075327ywh.10.1678190201054; Tue, 07
 Mar 2023 03:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com> <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
 <ZAcZeWYUU75BK5FO@wendy>
In-Reply-To: <ZAcZeWYUU75BK5FO@wendy>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 7 Mar 2023 12:56:30 +0100
Message-ID: <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust support
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.infradead.org, conor@kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 7, 2023 at 12:01=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> Cool. Git should resolve that, probably without even generating a
> conflict in -next, right?

I think it will conflict.

Since the cleanup is elsewhere and it may add work for the -next
maintainer, it is probably best to take it out in v2.

Cheers,
Miguel
