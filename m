Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B26C433FE
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 02:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 544B523100
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 02:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389676AbgLMCMz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 21:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgLMCMz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 21:12:55 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0553C0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 18:12:14 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id y19so21321358lfa.13
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 18:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bxq9EiKcP9hGeNnb/ovBqJ99khxAoUlAaJ5qHHgSsnM=;
        b=MEbjeGmElKYq6EZAiFV1UIEIkNJDVlp2r3aBR3/DjEYhY2CGG7CdoVblCJNp9QzSHq
         zvL2TeCgbD1i+lmUQ3VAZgl21X1TLdAKA7XZBJMaUVEKblMdXfgtVwFRdsddVGKxPL7V
         67XoCQZ4/sZK3FwTcr+2Royv+Kvn0FH6F9JCehHsd3eCSvEBJ16jgWUPr3IFWhru4r2N
         ryWJnh1dh9HrPdNNe6t+f2iCp2V3I4t6m+IIIXIJ1sPywjTZK8J9Dnf3R6TIOzJoyJ+C
         tzgZ1A4vrwKPpXiWyquSDQ4qaWr8cODYXgGkn8D0maDrx7+pArDT+xExMM4i1mbl/dSR
         mLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxq9EiKcP9hGeNnb/ovBqJ99khxAoUlAaJ5qHHgSsnM=;
        b=C/MbOWtJm7ecOK88MbJi6ScsBD3qunu6QorAEEFqZV0OvnKdrZ2CcPknnt+B/s8zZb
         T8YybUCQUu927Z0isygdKZA1tuYidYI7eeLim6rrIlqhU/YFcmzMHvHnXH6Pddt/QobI
         y8eNwZ5785Nf4jp65sMP0yaz+LksGwu/YfsFmNULqpDFOVQeuuI4QYqITzisUbN8pLgJ
         PPOJY2KKbPxe6ax9Z1wFFuqb+nLvF8u05/lI99AsODpjrOiyf2WilgZr5x3WsHTlgtAv
         R2xeRKZ54Ti2mT4iCraBPnsmejTWXd9npv36VuNP2dY4GX/k/CaWTQwCDwVcr0W8Qsuh
         t4jw==
X-Gm-Message-State: AOAM5338dz+7K/XIqwzQGfDI93uncb9EjhWSQEO4X8AvwWsapFPzpk0G
        kDLigVdfN/knyKZp/zDBSqLWSLuAmOCD4Q2nadES
X-Google-Smtp-Source: ABdhPJxWDKNFpdVShuVW0jJb81fSo91riGI+pKL1Ofq0xWeFoDxeC037SDlNjZK/Qkiigj9ao4gsK2w7DFUnApKIjVg=
X-Received: by 2002:a05:6512:3305:: with SMTP id k5mr7013261lfe.35.1607825532993;
 Sat, 12 Dec 2020 18:12:12 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
 <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com> <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com>
In-Reply-To: <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Sun, 13 Dec 2020 02:12:02 +0000
Message-ID: <CAMKQLNKEP8PHptz=Zw392XV-Q+-DsvhkpCvnbhFaBfTAM-oqEw@mail.gmail.com>
Subject: Re: File operations
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, 13 Dec 2020 at 00:50, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Perhaps we should rethink how the file ops are defined altogether, so
> that they are easier for clients (i.e. rather than try to minimize the
> boilerplate that we have now).

That's exactly what I'm trying to do. We're on the same page. :)

> For instance, could we remove the `const`s in `FileOperations` and do
> it another way? e.g. give `FileOperations` all the functions with
> default empty implementations? Or a builder pattern, perhaps, where we
> pass functions for each?

Yes, that's what my proposal was about. In summary, FileOperations
would have a set of functions, all with default implementations that
just fail. Then clients would just implement the functions that they
care about.

With this solution, `struct file_operations` is filled with pointers
even for the functions that are not implemented by the client. The
problem with this is that for some of the functions, the kernel
behaviour changes depending on whether the function is null or
non-null, so ideally we should only have non-null pointers in `struct
file_operations` when clients actually implement them.

So I was in search of a way to determine, ideally at compile-time, if
a function implementation was provided by the type or if it was the
default one (provided by the trait itself). I couldn't find a way. So
I thought about the macro to extract this information for us: it gets
a list of functions that *are* implemented, then generates the
implementation of another trait that is used to generate the correct
`struct file_operations` at compile time.

For example, the client would write something like:

[#build_fileops]
impl FileOperations for MyFile {
  fn open(...) { ... }
  fn ioctl(...) { ... }
  fn read(...) {... }
}

Then this would be expanded by the macro to:

/* Nothing changes the implementation. */
impl FileOperations for MyFile {
  fn open(...) { ... }
  fn ioctl(...) { ... }
  fn read(...) {... }
}

/* This is added to the token stream. */
impl FileOperationBools for MyFile {
  const OPEN: bool = true;
  const IOCTL: bool = true;
  const READ: bool = true;
}

Then our vtable-generating code would use FileOperationsBools to
determine what should be null and non-null. (Similarly to how it uses
FileOperations with Some(_) to make the same determination today.)

If the client forgets to add [#build_fileops] to their implementation,
it will fail to compile because they won't implement
FileOperationBools.

Apart from the non-trivial macro, it seems like a good solution to me.
Do you know of a simpler way to figure out whether a function
implementation is actually provided for a given type or if it's using
the default one?

> In the worst case, if we end up with macro magic, we can go directly
> to a macro that implements file ops entirely assigning things to the
> vtable as needed if they are found; rather than trying to simply the
> boilerplate the current `file_operations.rs` gives us:
>
> make_file_operations! {
>     fn read() {
>         ...
>     }
> }

This also works. However, I think what I propose above seems less
magical because it has the "impl FileOperations for XX", so the client
knows that they're implementing a trait now, and with this knowledge
they can find the definition of the trait and figure out which
functions they are allowed to implement.

Cheers,
-Wedson
