Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59955C05027
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Feb 2023 08:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjBBIqd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Feb 2023 03:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjBBIqc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Feb 2023 03:46:32 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BB883966
        for <rust-for-linux@vger.kernel.org>; Thu,  2 Feb 2023 00:46:31 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id bf19so1141576ljb.6
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Feb 2023 00:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA8JDpIGSybcyecjAm1yP7YpxXYmALaMtPYTAIfl8QI=;
        b=i43zT4cTrxMg5QSe+BaoB3oS0//3yDsV7CgLHLHvtafF3lFDeOD3TJeP4WaHGyo6YN
         JHesGoL+zJyCek1OdaZkbFmjHtTjQUZICJOsLFBM2vjg4+JkLuYy/nB08tic/7+LSskW
         IamjMKRzlbldmVRUJMcrL1OPo3csQuVa9cRItuISGLnaU38MsTUe4XtaCFmN9yApYGZm
         VvyGaYPilB5+I4cOx8FZPwjgMeYeVofW9TBWnFg6TnXtyg6oD1LFMxeVm6Q2uKqgDtox
         H2Z+9U29otrMGhW0mcI2y68aqCc8TkOGSAl3kzkx15VBSXVWrWs2d1Uq4DBzLpFI6Zdl
         UGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA8JDpIGSybcyecjAm1yP7YpxXYmALaMtPYTAIfl8QI=;
        b=IYb6ArCkZrHmk5MRwrQFnURX56d+P0NqTXvQP+57zljvacbD1sQtdIlRwZgkGitGgE
         ANOfYR309NjrVT1u9qExGHYz7evu7QFmV3Z7XVZrL2LsX0ECVCoz5st0qGAUM4suSFry
         /T5Ze1f4KzDMEluNGORtTe5FDJbd5NNRq1zSs5gkHAb/xSb6uVvDBjq7wZbp1CAUFgl/
         AUcwJJ6vGU5uqYpyN09Us2NS9TYdaNUIPqjwhSmlBUcA4FErflv+Z06E4Wt847Ob+mas
         AqXnOyjLAiAGtr48SIeu2Au2BzcqN4AlKi/6OArYx3egw4gpvbXv3mR+3aQxN2klgFev
         fYeg==
X-Gm-Message-State: AO0yUKX23H5Lw4YCzp0T8+l8nPdAlk4vTPcfZaqLALz78TFbNnm2vrT/
        1Yn1ydaV+VIJXeNSoFde7iIIVUlqq3IW6Yl+cNFY
X-Google-Smtp-Source: AK7set9+YQHV1gAVbROorNlJcPuRIq/IYaTNwB99GqEg9PLvf3yQ6kv4YtB5417OJspqZ5laWIeBQGYpfBIhE6/QFn4=
X-Received: by 2002:a2e:b6d4:0:b0:290:5165:1f05 with SMTP id
 m20-20020a2eb6d4000000b0029051651f05mr797752ljo.182.1675327589517; Thu, 02
 Feb 2023 00:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20230128072258.3384037-1-boqun.feng@gmail.com>
In-Reply-To: <20230128072258.3384037-1-boqun.feng@gmail.com>
From:   Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>
Date:   Thu, 2 Feb 2023 17:45:52 +0900
Message-ID: <CANgtXuMVnROWhjz2su7hXHja6DPO9yjq35wtDyfKAtLDZLnFWQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: MAINTAINERS: Add the zulip link
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     rust-for-linux@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jan 28, 2023 at 4:23 PM Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Zulip organization "rust-for-linux" has been created since about 2 years
> ago[1], and proven to be a great place for Rust related discussion,
> therefore add the information in MAINTAINERS file so that newcomers have
> more options to find guide and help.
>
> [1]: https://lore.kernel.org/rust-for-linux/CANiq72=3DxVaMQkgCA9rspjV8bhW=
DGqAn4x78B0_4U1WBJYj1PiA@mail.gmail.com/
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> v1 -> v2:
>
>         *       As suggested by Greg KH, add commit message.
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42fc47c6edfd..30161207f365 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18219,6 +18219,7 @@ R:      Boqun Feng <boqun.feng@gmail.com>
>  R:     Gary Guo <gary@garyguo.net>
>  R:     Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
>  L:     rust-for-linux@vger.kernel.org
> +C:     zulip://rust-for-linux.zulipchat.com
>  S:     Supported
>  W:     https://github.com/Rust-for-Linux/linux
>  B:     https://github.com/Rust-for-Linux/linux/issues
> --
> 2.39.1
>

Looks ok also for me to try out the zulip:// URI scheme.

Reviewed-by: Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
