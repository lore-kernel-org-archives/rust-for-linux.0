Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2788C636CC
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 14:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjBMO3T (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjBMO3I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 09:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53B161B1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676298494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kK42BBncE8PZ59rH1v6n9IiUvkFQ/XyA56zF53ME7Os=;
        b=TSDvXQkjm2JIBfdvlvinoc3PCFNId6qUWuGIgtOhFccRChMWVvxp32ov9xDhLZcuTIbOcf
        fUnUus/jrLef/PNOO+nc75Z1xWl8srNEpwWHOMLOl7cEadqUSXdfMJ1y8zyewzrB9yNMBX
        pEJyPWr+UZ41iNqKWnmfyqH7lbdaDzc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-NdyPOEvCMWWn0LcCQ_J0qg-1; Mon, 13 Feb 2023 09:28:13 -0500
X-MC-Unique: NdyPOEvCMWWn0LcCQ_J0qg-1
Received: by mail-vs1-f69.google.com with SMTP id d14-20020a056102148e00b00411c70e9579so2582120vsv.17
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 06:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676298492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK42BBncE8PZ59rH1v6n9IiUvkFQ/XyA56zF53ME7Os=;
        b=dujcxYpiZ5ItB6Yc5dQL/H2IFxLZxoHbt+pN+270VqsZmFXS+/aqXjzhxqNiHuHZ1+
         xBGA4qIXn2ZMIXycvZGPD1LhDDWnefBjfeDeWBClK62vTW9mAHPgWwxS95oZfBrebTvY
         HYvoE1wsTa/f5o/V5dlmaMkvNQlwwcrMbFHpOpYZ0iF6MOEX7CQY8JeTNR3EgcE+IeNG
         mVsAswksqXze8Ebk9AquNkq6gZajKhuq99z22ZtqNs291lCjzjkakBzqj6vnsIt3MsYH
         AW7j3gg3ATjjj5l5JPgaZtjCaGrBqxnEHaBe944ghMRzamqOuL1yWArJubG6HmhV5Qek
         Gzjw==
X-Gm-Message-State: AO0yUKUIDjHT8nQME650nJdf7V7DlGSU2Hk3nNpjNIDyHJstFIrBf9QD
        aEXHwou1j9ZPvmB/b+3sHuyzrxiubM8PDvIpQK4Nk5Qwn+SXxraTxhIWOOLcEt8E3VpgSKS0oDI
        bK/9jqJVFPW63pcQWNk0nr+coU8AxjU4QF9TbgCDb7Yk=
X-Received: by 2002:a67:ab4d:0:b0:3f9:b1bf:c0c3 with SMTP id k13-20020a67ab4d000000b003f9b1bfc0c3mr5038665vsh.66.1676298492614;
        Mon, 13 Feb 2023 06:28:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/SsY53V+VLbpCXMW5aGtJJ2R4A1hJbZOgUQ2Hdncg176hFttc0MFBMVZV6AaeEpH/HV4GS7XBaZyY7CC5yvyU=
X-Received: by 2002:a67:ab4d:0:b0:3f9:b1bf:c0c3 with SMTP id
 k13-20020a67ab4d000000b003f9b1bfc0c3mr5038660vsh.66.1676298492370; Mon, 13
 Feb 2023 06:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20230210152622.92912-1-andrea.righi@canonical.com> <CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com>
In-Reply-To: <CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 13 Feb 2023 14:27:56 +0000
Message-ID: <CAOgh=FwWzHW0bWuErn6++ngS2-JOoXnS3mB0-3hQoiFqyeda_g@mail.gmail.com>
Subject: Re: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Martin Reboredo <yakoyoku@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, 13 Feb 2023 at 13:19, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 10, 2023 at 4:26 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > nm can use "R" or "r" to show read-only data sections, but
> > scripts/is_rust_module.sh can only recognize "r", so with some versions
> > of binutils it can fail to detect if a module is a Rust module or not.
>
> Do you know which versions? If so, it would be nice to document it here.
>
> > Moreover, with this patch applied I can also relax the constraint of
> > "RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
> > enabled at the same time (of course BTF generation is still skipped for
> > Rust modules).
>
> Even if that build succeeds, can you load the modules? i.e. the
> constraint was there due to
> https://github.com/Rust-for-Linux/linux/issues/735.
>
> Also Cc'ing Daniel, Eric and Martin since they are the ones working on this.

Don't have any issues with the change. Seems simple enough!

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

>
> Cheers,
> Miguel
>

