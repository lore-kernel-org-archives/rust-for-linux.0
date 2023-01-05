Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AACC3DA7A
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 Jan 2023 19:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjAETvU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 Jan 2023 14:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbjAETvQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 Jan 2023 14:51:16 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CAC17E15
        for <rust-for-linux@vger.kernel.org>; Thu,  5 Jan 2023 11:51:14 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1322d768ba7so44092316fac.5
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jan 2023 11:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APpeYaUURqdG9rfn9AvF67XifQrUhEyQQb1Eem+3FuU=;
        b=IhlFr1YCW0JUXt0hzc0ARslNCXfG4jrN/xD1EyJ2cMxdgWKgbQmirVVyEEdjB/ZTuh
         FiaVH4HTvbccE4JYSrCj3nVQA9+i3A0zLDUi8V40bz9w3ZXKvfL1FDXe4Wm5z1FEsD94
         Be+J3zSU0OgmhBjq5EuDtEV/m3VxsKG7wVBrOI6Xmm/ZSkMAHIn6pit6Ypwv4hjfDPCr
         JDwP267qRDhLsx4PUTGoyRf3rIDDfu1bXcvfBH08jUhwlTcmvpYfE5fj4DYp53fO0nWN
         qL4lmW8jfyfeXu7wUaW9Uj62jr4+dXnByt9BHm0+K6VWT4Ko0djLnF6Y3zqvvVEwXUlY
         ZfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APpeYaUURqdG9rfn9AvF67XifQrUhEyQQb1Eem+3FuU=;
        b=EPQXqaNDC3RWrtYzTI/vNX71CkSvNITTKueY9u7Pe+zwZTpXaNuvLFgKSg3HP/TdF1
         uead0aukigAepmFbnmDh1ss+uL8L0zeoFFY6ei4MMCE1jQSnqKIUvkZzYP3c4jwtWlol
         tbIMCCPYkQWP1Z1TWZ7AbdToHPThyZIQnRt8f2GMPCxLRf++TIbCV102SUtAOYglTCHQ
         8tup6hpunk2odWrACgRgIK74BUUO63bhoOCMSJgRAPKbG8vAEtD4DXu781nuybf5RYnd
         TFfS9P8JLW7G2YJ5C6kXTGsmWsH09j8OZ1X4zON8RUk7KbGXCzifGfmrBCnuSIDN8GmW
         D0XA==
X-Gm-Message-State: AFqh2kprkO7rLZVhi0RoYzNUzVGkHgDMLjaoMp9yRsvud6B41SG2Pj/v
        c1NItUD6ipR9imqEDmwt8jaGlHaQuaYRbe4rR4dCZZjD1dxPp5ni
X-Google-Smtp-Source: AMrXdXvI35gT5BEd6eKOnDSHuaWfFFc+dTVkZHc5aUGLkg4av+0IKc2c+mAynt1q4fVVT0THYv5Y6R8+D6EUg/f9p0E=
X-Received: by 2002:a05:6870:c18d:b0:132:79b1:f85 with SMTP id
 h13-20020a056870c18d00b0013279b10f85mr4362438oad.274.1672948273742; Thu, 05
 Jan 2023 11:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20230104160405.5530-1-apantykhin@gmail.com> <CANiq72=mgZCC7ECEO=bqLQ2rJKQjqS7Sg7CW51_mpX4VcG7o6A@mail.gmail.com>
In-Reply-To: <CANiq72=mgZCC7ECEO=bqLQ2rJKQjqS7Sg7CW51_mpX4VcG7o6A@mail.gmail.com>
From:   Alexander Pantyukhin <apantykhin@gmail.com>
Date:   Thu, 5 Jan 2023 23:51:02 +0400
Message-ID: <CAPi66w-2aV8CQs6xGSR4xZn4+39HdUqvwTZEidYKqUR-11thDA@mail.gmail.com>
Subject: Re: [PATCH] scripts: avoid redundant re-reading makefiles.
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel.
Please see my comments below.

=D1=87=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 22:44, Miguel Ojeda=
 <miguel.ojeda.sandonis@gmail.com>:
>
> Hi Alex,
>
> The commit message is looking better, thank you. Please see comments
> inline below.
>
> On Wed, Jan 4, 2023 at 5:04 PM Alexander Pantyukhin
> <apantykhin@gmail.com> wrote:
> >
> > The main goal of the patch is avoid redundant re-reading makefiles
> > if these were read before. This is performance improvement.
>
> Like it was mentioned in v1, could you please give a rough estimate
> about what is the improvement from old to new? (in particular, without
> the other changes). That way, others can get an idea whether the code
> complexity is worth it or not.

I checked files now. It seems only one place in /samples  has 2 files
with 1 makefile in the parent folder. So it looks like the patch is
untimely for now.

>
> > Additional code improvements are using 'with' when read file and check
> > if file exists.
>
> Note that others submitted an improvement for the missing file case as
> we discussed in v1, so it would be better if they submitted their own
> patches for those. I am Cc'ing them so that they have a chance to be
> aware of this patch and potentially submit theirs.
>
> In any case, their approach seems more idiomatic for Python [1], so I
> think we should do it that way.
>
> Finally, the title of this commit should probably start with the
> "scripts: generate_rust_analyzer: " prefix, otherwise it is a bit too
> broad.

I see, thanks. Still have a question about using "with". Is it reasonable?

>
> Thanks!
>
> Cheers,
> Miguel
>
> [1] https://docs.python.org/3.11/glossary.html#term-EAFP

Thank you!
Best, Alex.
