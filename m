Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C64C433EF
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 May 2022 00:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiEYAbJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 24 May 2022 20:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiEYAbI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 24 May 2022 20:31:08 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182699E
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 17:31:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r3so15873054ljd.7
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 17:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIL+KXV/8+NBssf9ngSmK+mNxumsLSZywSmvJ26xlw4=;
        b=i/BDUKs9OnPsTF1a2uNOc3jSovU5ZfMvfCl02aSAPEVOTwPIq29F/Tk3+FlnyRq6iU
         ckOKmdZAynKn/UGPvg3gjXIVf13erasUJwYVv3ikeHYSh6Y6vauJIpZUM9WfqajZTwbs
         qURkGBg2mhRnp45iCrL9BPoQ4a5jznExGGQH0XmwARrLxwvplEs2TDj4M7sKdudXU/+W
         8KTdjmntZlFDRhXwikITDMrKOHk/IKylFU4AEYhNzNh7nnGKipCpqlkHdkTo7YT4rM5y
         X+r3QrS4KKM28efh1+kffvEloOa1Mkrcjb0lDF8Kem2D0KfsJDFwWdKEQzlgC+Y720ao
         7wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIL+KXV/8+NBssf9ngSmK+mNxumsLSZywSmvJ26xlw4=;
        b=YbXTc+YQgZTFj83GWIXyRTXFYES/irRvHErG5D1Jj1a3MMGg2ZCyBZC39dFySUhiME
         QvvrwVReImGe2M5VBlYlG1d6CAlHsILp6c3DAqwBHnUmUuvlQJx0okMDTAy/r43ULKXH
         U6vPBhL3CBe09JX9y7Z8cxffLlAGWiUx15pWJ4FEWpRKutHHgtTitfH42ipA/mPXfPbX
         +Nxz3kakZhMrn4QU5Wqy129ykBDbNb87KBwyh5m/zRJhPIINmbXudLjeyCjY6uBjbaMg
         Hi4Ic8CmJMPit0ZJxfmAKbZS3bI1C5g0WCH56WVx1/w4FNJXpr9uDd3b9hLWu5O+CDPo
         pBrg==
X-Gm-Message-State: AOAM532+BT5Sdd6ZMD2/Q2xUXhpcLCAlHhnsqIYfG0wc2MQ4YrWqZdav
        +9PZHd5C23WMw7STRgNd58rhMiWXNIjTraqkxQDbLemPqVBt5g==
X-Google-Smtp-Source: ABdhPJz0L+A9i7gxq8+aRC6483N/7dQWGG8SuO74zhSeCrmIe+aHDlsnVKVZc2Gy07q80Aajql5b/gyfD/zdjf0ZnsQ=
X-Received: by 2002:a2e:98d0:0:b0:253:e3a3:ec6c with SMTP id
 s16-20020a2e98d0000000b00253e3a3ec6cmr10515798ljj.493.1653438661756; Tue, 24
 May 2022 17:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
 <CANiq72=dLnCpCLOKJ6+x+D0AV=tFNyy4hUEjd6KCOCw+eWbPkA@mail.gmail.com>
 <CAKwvOdkm+CQ3rd6YF_iJOegjZPUuwPfGVp7DxB6JozsKZa5npQ@mail.gmail.com> <CANiq72km2ULoGWh8ouYaOxH6+nSRbhC8bWHsZVDv26u9HuSB9g@mail.gmail.com>
In-Reply-To: <CANiq72km2ULoGWh8ouYaOxH6+nSRbhC8bWHsZVDv26u9HuSB9g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 17:30:50 -0700
Message-ID: <CAKwvOdko3rjPmbJgnaRL8Dd76F1hSnY7mbm33xDOgnRVVEOdew@mail.gmail.com>
Subject: Re: help installing the correct version of bindgen
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, May 24, 2022 at 4:39 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 25, 2022 at 12:28 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > There is a little bit of error handling; for my issue most of the
> > error message gets swallowed as shown above.  With the below diff:
>
> Yeah, that is what I meant by having a message, or as you did, just
> call it and let it print its own error. Thanks!
>
> > So it looks like the error is not fixed in 1.2.0 release of clang-sys.
> > Left more comments in
> > https://github.com/KyleMayes/clang-sys/issues/138.
>
> Thanks for following it up.
>
> > I'd like to find out why dependencies are borked first, before
> > resorting to env vars.
>
> Definitely, but I suggested because it is good to know that solves it
> so that there is not something else going on.
>
> > does seem to work though.
>
> Great -- thanks for trying it.

Aha! I think I have a fix for it:
https://github.com/KyleMayes/clang-sys/pull/142


-- 
Thanks,
~Nick Desaulniers
