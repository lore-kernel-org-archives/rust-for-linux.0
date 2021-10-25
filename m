Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA79C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 25 Oct 2021 12:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28CF860EFE
	for <rust-for-linux@archiver.kernel.org>; Mon, 25 Oct 2021 12:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhJYM1M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 25 Oct 2021 08:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhJYM1K (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 25 Oct 2021 08:27:10 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407AEC061745
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Oct 2021 05:24:48 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id l13so1126369ilh.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Oct 2021 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=69qpXCJeGs3MU3IFsVmxhrR2tnTn4JeF6kPM1n9V6H0=;
        b=qyou01+L6UlgQa33VPccI/d8SHh7/5vrL+DtludJNodyTI/NAmgTchSCi3Pd2GYP/z
         T4AqYna6NgAKhL5eTmKmTm9GmmlCTCXKefxfiB5y+vWUwrK+JLLLPftXZHbldBclvmY4
         SYKisorGJUNEf1tkaw+TG6yyYFvJM0BqxDnBTuuXVJjfMFO7oI9gMNrMaEtIpbrF+u9v
         CFptVtW1Q5Q5GHL+nzb+ndiASjQpy09WqCdpNG5h4wBFgMrfi6M5mNGMPTe2sIv0MgjG
         88IZDIPPy9OLtRA768AVdM2wtINYXplHKdINrBS5f9fYxhY+F8CA4ZsXB/0562zrEBf/
         VBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=69qpXCJeGs3MU3IFsVmxhrR2tnTn4JeF6kPM1n9V6H0=;
        b=XYxWImA2BhChjXJyfj610qKR2sjnFPWHNorbydj3xb/4TGUdUXqeU1xI7K8C9fWQX/
         z00qxdD9Xf80TvFnBCEn2Y37uxDfdSAA09cosz52Pa1YukKTBG4MdoBR1fPZ3FS2YUUX
         yOVV42n+dHK0mhAM5xjCEZIS1daUxwWfp2IXh6J7CQymBvnxJazTgRT0lt0qymJgnemh
         5SfpvgBpexiDMnAKXMdarTIEH7iQ4ab2xcnsMLiFJMiRRNO//O7jW3ixND37SCKV/+PF
         M2BilwUzd6YB0kLhSqHuycbHnIJ/94zKxRvc6cyfSxJwDjexe/d0uhDJwyyxJnCkQsv5
         01Rw==
X-Gm-Message-State: AOAM5303rcJU2itxZ3am+oEu4GG7zuvxvKGeDYtllNwgJvwpMqXfo01t
        jHzWz0f+iIUFNWj7DKJ9WKbOLK48KxCByILiyUA=
X-Google-Smtp-Source: ABdhPJxjmgUsz3K+cWhT+oD82RVyGv9gxb6TkurWKyEaxvTJ+X82acHXInYdJZx1iHWWAbMz+F4WpCA6FfstgA5D4Sk=
X-Received: by 2002:a92:d08a:: with SMTP id h10mr8374859ilh.321.1635164687646;
 Mon, 25 Oct 2021 05:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
In-Reply-To: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 25 Oct 2021 14:24:36 +0200
Message-ID: <CANiq72=pLwnECAYL+PpTL0NrCn8DLT7mGNOneVbEjO8V9BfGXw@mail.gmail.com>
Subject: Re: Current driver status
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Amy,

On Mon, Oct 25, 2021 at 1:49 AM Amy Parker
<apark0006@student.cerritos.edu> wrote:
>
> Are there any reference drivers or other running components written in
> Rust for the kernel in branch rust or rust-next? If not, is there an
> outlined process for building one?

You may want to take a look at `samples/rust/`. We are also carrying
`drivers/android/*.rs` in tree for the moment. There are also other
resources out of tree, e.g. in PRs, LWN, etc.

Cheers,
Miguel
