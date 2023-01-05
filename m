Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90605C3DA7A
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 Jan 2023 18:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbjAESsf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 Jan 2023 13:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234525AbjAESse (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 Jan 2023 13:48:34 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9D65B14E
        for <rust-for-linux@vger.kernel.org>; Thu,  5 Jan 2023 10:48:33 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id t15so41141557ybq.4
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jan 2023 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X8X7yXlMO5s1pm0hbluzeVD3gYqaaqefpsl9mXjbriM=;
        b=c3XxVnBCuaHwqD5x1Df6cD8R4aJtQvGkl79uQRORSK4+WP82M2nF5/uiB26coCUdgA
         tj7uG9AdM4hwx0vp3ZKSAPQ5ypAZ9vzcqtMqVtgmKxgy4Aj+PTMfnlU0sVV7rwrFV4gU
         y5gcC/eJ/B7rFR2+hLOqb9JJz5kg+g/B2vluRN8O37lJwRNraFKE9FzylcyVhZToLKOF
         XC0IhZtBbuh4vcO3FtQyiisT3YFi1UqvdRVmgnzwyR+dRxHl8cJRKqURn2hssjn0gslf
         xl+z/qfngtL+eqyd8OH3TJrzDyHmPX7H4e3StxIbdK9aqux9PQDG2Vv0KlbVZkk/LCdW
         rAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8X7yXlMO5s1pm0hbluzeVD3gYqaaqefpsl9mXjbriM=;
        b=rf4sNk8iGmJ4S5GXY7V0p3nPApYX1gpLgWv6+z8pMzF8jgn01TcykQVCz+en6aMgxu
         iHs59FCA7Sa2kLelwow/UTHE+S6CRcfVeyCjOK2S1c5PpunxycwtK6KWQBTZEh8kTabJ
         Al/hnO+rw7CYypHCUvuEeL5st4NHvIjCLwmRH5kbbaUHY2yNGxqoCqN7ySGnM0gGuAQ3
         d4nCJe4JbDaNRnSZTFvMW0i69hmvKT8i11Hk7j7rk/EYkuc2tXBAe1Uq1pyuZxYb+d3x
         68Ej52s+h790pr4RgvIF4OBCjl+102EZZPpsA5lJnfkDeQxzh/ZLIWajrenY3n4teTYN
         6GhA==
X-Gm-Message-State: AFqh2kpLONhnPQ0a7vPXPyhuYJVgKiH7DnUbwKc2ssDU+aBVVxA5v9Id
        /WliIep8hHA2i19CUHnpATeL4gXt67L5yQ7htbs=
X-Google-Smtp-Source: AMrXdXvRuty3D24Q1JOzgyeGiuXLMwOJzGJbx5M3Trq+qk2ox15C1wFfrhKESXsJtZSsSSWbqek41Jv9Tu8yAsW63Is=
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr6135070ybc.328.1672944513255; Thu, 05
 Jan 2023 10:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20230103210219.5690-1-apantykhin@gmail.com> <CANiq72=4g2_m8uFZB4CHS6pYJgx1x7GrP9Ab4k39bDWZk57jwQ@mail.gmail.com>
 <CAPi66w-wG4vuOQzfYruHp7-+s1ex-snDougUkuW70Lrf-6gKhA@mail.gmail.com>
 <CANiq72m-MJnfe6Th=5pLrbF5YiRRJWBro3Lz50vXSVBCr9-1ag@mail.gmail.com> <CAPi66w_zdf73em8vb7WxCP33ST+R_VzCz-qWvckuZuzLagVQPA@mail.gmail.com>
In-Reply-To: <CAPi66w_zdf73em8vb7WxCP33ST+R_VzCz-qWvckuZuzLagVQPA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 5 Jan 2023 19:48:22 +0100
Message-ID: <CANiq72=BOtJAbyhiLUzXgdx9_tUV59KRDMH7HGqWtB-rQgfxOg@mail.gmail.com>
Subject: Re: [PATCH] scripts: store Makefiles in dictionary
To:     Alexander Pantyukhin <apantykhin@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Alex,

On Thu, Jan 5, 2023 at 9:02 AM Alexander Pantyukhin
<apantykhin@gmail.com> wrote:
>
> I changed the Subject name, so now it became a new letter in the mailing list.
> Now it's a ` [PATCH] scripts: avoid redundant re-reading makefiles `

Yeah, no worries -- please mark new revisions with a "[PATCH v2]" etc.
as needed when you want to signify that (`git-format-patch` can do
this with the `-v` flag), and ideally add a lore.kernel.org link to
the previous version in the new one's changelog or cover letter if you
think it may be unclear where it is coming from.

Cheers,
Miguel
