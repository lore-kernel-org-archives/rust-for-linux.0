Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99088C636CC
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 12:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjBMMyp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjBMMyo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 07:54:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B7E30EA
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676292836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LzebZ30kzj7N0BnPIfXYRkFkaGqREtgrrb1Fr7Y2rqM=;
        b=gDI7Uu6X9SNNrVYC8k5M/gC3pmSWzwg1Cj3lTJ+hgwNSsUAdPsWN4wJHDRCT94Yu91onNL
        eXuNhcH/vEKkos0V+xlMEZA/6jlMS8QxV8AvVIdZP81vb1h7+lsMkz2qAJUJxOJToyvXvS
        wdV0HGoqDgbKXsKmoi2hJeTM0npG4kg=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-b9sM6xQVNoucUDMohygNeg-1; Mon, 13 Feb 2023 07:53:55 -0500
X-MC-Unique: b9sM6xQVNoucUDMohygNeg-1
Received: by mail-vs1-f71.google.com with SMTP id o19-20020a67e153000000b0041221fdc3cfso437583vsl.21
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 04:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzebZ30kzj7N0BnPIfXYRkFkaGqREtgrrb1Fr7Y2rqM=;
        b=3C4GenipCPzzd5NS2Der2vRo+VQQSXYlYStTv4uKXAFX16zVp9CcQVH8kL5JXeqGzr
         yy8BiRi7PIh2S2h2cIglG6K2aO5ffKjf3GKmbVmlf2J2NcPGitPvXHw59abHTe7Zl9UM
         Jn81OaNuyQQ09W8yXm0n3Pd64+iD8//KoIGv6fFoxREhATbIk1p/g/oIVfbZK19nOiyZ
         AGAK1GqIK/oYEt9jGjry0/uRyeiH8aCOWpFSEuWccFKcrqQelUMzXW1Hlx1bKWtIUtSl
         2tx7Qs1zyPDGI+jRGKCiwi5DxFYTuo6JcE+VEUlEuYeahQpSi9E5VsP3HioEDFWhNXk0
         DUYg==
X-Gm-Message-State: AO0yUKW2IYQuhdQEkyj3TKC9P5gP5o7nm/MeG+KfpGsAIRewJYeQLrQR
        ZBChAkLtV+TVf+p9WFBnbaeeuEL5g5RMEBGXLkI6lQxAdNKYXIam9NxNn1LUr/TCZow1yWvuV4m
        xdGv0BO0/4I0krXJ0Y4V5dUSpgIirzE2zLEOEaxgP7T8=
X-Received: by 2002:a05:6102:50ac:b0:412:b77:7822 with SMTP id bl44-20020a05610250ac00b004120b777822mr612768vsb.74.1676292834620;
        Mon, 13 Feb 2023 04:53:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+uR4OQVakWkB0Q6ReN9flfEMIBV6WMTofHt8sSly39IdDoXb8ZlGABx4e3XLMo+mm4AgewLTiPoWd0xMM2jpA=
X-Received: by 2002:a05:6102:50ac:b0:412:b77:7822 with SMTP id
 bl44-20020a05610250ac00b004120b777822mr612762vsb.74.1676292834433; Mon, 13
 Feb 2023 04:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20230111152050.559334-1-yakoyoku@gmail.com> <aaf97a61-73c9-ff90-422d-9f3a79b0acd6@iogearbox.net>
 <CANiq72m+8D8OGtkyEjmyqCynp48DCKEw4-zLZ4pm6-OmFe4p1w@mail.gmail.com>
 <bec74b32-e35f-9489-4748-cbb241b31be7@iogearbox.net> <CANiq72nLrUTcQ+Gx6FTBtOR7+Ad2cNAC-0dEE7mUdk7nQ8T6ag@mail.gmail.com>
 <Y+atpJV5rqo08dQJ@kernel.org> <Y+oofL/aJmUjcxIR@kernel.org> <CANiq72=Ghy2awR_+DACyiq_DAtscx3yoKb4tJ+GkpqVCcV_HEQ@mail.gmail.com>
In-Reply-To: <CANiq72=Ghy2awR_+DACyiq_DAtscx3yoKb4tJ+GkpqVCcV_HEQ@mail.gmail.com>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 13 Feb 2023 12:53:38 +0000
Message-ID: <CAOgh=FzBjR7V+sQOy2OEV+YXxB0_YzapNTO+-Xf3uGnLfA0Vxw@mail.gmail.com>
Subject: Re: pahole issues with Rust DWARF was: Re: [PATCH 1/1] pahole/Rust:
 Check that we're adding DW_TAG_member sorted by byte offset
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
        bpf@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, 13 Feb 2023 at 12:45, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Arnaldo,
>
> On Mon, Feb 13, 2023 at 1:09 PM Arnaldo Carvalho de Melo
> <arnaldo.melo@gmail.com> wrote:
> >
> > The namespace.o seems to be ok:
>
> I saw the other message too -- this looks great, thanks a ton.
>
> > The core one needs work:
>
> If `core.o` works, then I think it is likely other things will work :)

Hi Guys,

I'll leave this to the experts, but if we get this to the point where
we are happy to enable again for Rust CUs, could we request another
version bump? It just makes it easier to integrate with the kernel
scripts when we want to enable again.

>
> I can try to extract the cases for those into simpler `.o` files, if
> you would find simpler test cases useful (perhaps for the test suite
> etc.).
>
> Cheers,
> Miguel
>

