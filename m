Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B990C433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 24 May 2022 23:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242076AbiEXXjo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 24 May 2022 19:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240644AbiEXXjm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 24 May 2022 19:39:42 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2195DA7C
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 16:39:40 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id b4so5199376iog.11
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iHOWTVU5bocXJnWjibHLIWl2PeqpH76w2V1dkS3vw+c=;
        b=Oy2F+69Sn9GztkhIan2P+S5PCHdwmij32tNbaUqt4eweMqeOcjkOOnRS0yArGfZUho
         09Cnvbokko3JGlr83XufwSEDyTRre6xgoIh94Di6WViOJ5c7NSKpfuM8DNv/lX2bpbwW
         uKezkl7pztvWqthQytBIyht9YTMnMkcvCedWDQccwAqmhYafZ46hdqvIrZd6ep9na51H
         wp7PIfjFvewZnyad0xeUr3gwiUprlMbKxnwoXBrpUuf4QqX8WOAJBRq5v4Ss5BWg5gp0
         Hp0JmlMFqSGxrDIX7knQOdMXcpBPTOi9RyoC+2tNX2q9vl7r4WknTjfXojhKkA5pafqA
         W4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iHOWTVU5bocXJnWjibHLIWl2PeqpH76w2V1dkS3vw+c=;
        b=yZgXaJIK0WDP3JsSgXpgOKmnT9jd6dbhHhNhPYZNn+kvXSNYPKOqNI27dz0XwGARD3
         WO7Nb2xzfLbXbgTDLS9Zdhr6kE1/WTd5cIdOvNRA5xyB3lERfJwHDiB2MA16Vk+6s8Gn
         +JrNHREjqpjUTUHIjdUHcbld6fHtNWGi9XF0gaGGAUDFIdccQtgCt4W1RbIv7x//Fk8W
         2dkbtp4+DZOEpffjx3x64E3sMhrmjRM5pPZhS5XTcGa5hjzxyGUBXSV1lj2bz1tUYO/8
         9i9rCuRr3HOzY06/TASE5Cvj2N8E9MXzOf3FEbJ2Iipi7Tok+MpdMFGceCYn3wfobg/f
         AmBA==
X-Gm-Message-State: AOAM531zwTJHnodhMjTUo2L8OUXu7L6CSuXzvYsV4Z2f4SCjAx0pqNL2
        AN+CtKT3vPT90Lf2dAsdgl74JhhY8/3l+sPSaAJBm620EqX/3g==
X-Google-Smtp-Source: ABdhPJyDnMQ5TiVygWeD0IPlVU/kjx/0XTAKVbJtwnYJoNlT/d1qzbTsrlgbiGOa2VnfyznhFw84wearghM1hvXiBGY=
X-Received: by 2002:a05:6638:16d6:b0:32e:97e4:ac16 with SMTP id
 g22-20020a05663816d600b0032e97e4ac16mr12135491jat.199.1653435580212; Tue, 24
 May 2022 16:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
 <CANiq72=dLnCpCLOKJ6+x+D0AV=tFNyy4hUEjd6KCOCw+eWbPkA@mail.gmail.com> <CAKwvOdkm+CQ3rd6YF_iJOegjZPUuwPfGVp7DxB6JozsKZa5npQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkm+CQ3rd6YF_iJOegjZPUuwPfGVp7DxB6JozsKZa5npQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 25 May 2022 01:39:29 +0200
Message-ID: <CANiq72km2ULoGWh8ouYaOxH6+nSRbhC8bWHsZVDv26u9HuSB9g@mail.gmail.com>
Subject: Re: help installing the correct version of bindgen
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, May 25, 2022 at 12:28 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> There is a little bit of error handling; for my issue most of the
> error message gets swallowed as shown above.  With the below diff:

Yeah, that is what I meant by having a message, or as you did, just
call it and let it print its own error. Thanks!

> So it looks like the error is not fixed in 1.2.0 release of clang-sys.
> Left more comments in
> https://github.com/KyleMayes/clang-sys/issues/138.

Thanks for following it up.

> I'd like to find out why dependencies are borked first, before
> resorting to env vars.

Definitely, but I suggested because it is good to know that solves it
so that there is not something else going on.

> does seem to work though.

Great -- thanks for trying it.

> error[E0063]: missing field `uring_cmd` in initializer of
> `bindings_raw::file_operations`
> ...
> better than nothing. :) (I just reapplied your series on top of
> a6b450573b912316ad36262bfc70e7c3870c56d1)

Yeah, a few hours ago ee692a21e9bf ("fs,io_uring: add infrastructure
for uring-cmd") got merged, which added a field to `struct
file_operations` so we need changes on the Rust side too.

If you try on top of v5.18 it should work, or if you apply a diff like
(may be wrapped):

```diff
diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index e1b3b324bb3d..4c6513702cfa 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -534,6 +534,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations>
OperationsVtable<A, T> {
         } else {
             None
         },
+        uring_cmd: None,
         write_iter: if T::TO_USE.write_iter {
             Some(Self::write_iter_callback)
         } else {
```

Cheers,
Miguel
