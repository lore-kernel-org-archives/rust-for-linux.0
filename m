Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D79C43334
	for <rust-for-linux@archiver.kernel.org>; Thu, 14 Jul 2022 08:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237535AbiGNIiJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 14 Jul 2022 04:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237389AbiGNIhR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 14 Jul 2022 04:37:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BF63ED4F
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Jul 2022 01:37:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id m16so1445984edb.11
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Jul 2022 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5a3GsCy8bYwgAIT93T7zlIoIN2AnZaXQbtXMcpT/g/0=;
        b=GLPr3PsL+xK/aVwOn2p9TV/0RTQCs7viS7U9WFWt+BChbt4zp0MmAqzmKBcO09HssT
         oV7PjsBKkkPI8NObKtR4fqjL3qadcqEF/ja5mPQmQhfVrn+PQpKIKlJ9s86wcsa+w4i+
         rN6XQ8lxCNYqhzW9r5W6f+aRkAXhFc1Wimrz2Xpc0VUeuncBKZaDdlo1UuzCkS7n0PXB
         NtMgVfPV5dudMxU6YwmUXdvbFw9aNCSZ4910b9JRO8W6yb9/PPVojxiIZ+8MB5Ls55w0
         dEQJo7jZBpdnJyDkXMvkgzHSBRIWsLUHec7x1wd6DZFW6x9V9Mj1HbfoefAKsDn95/Ea
         y8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5a3GsCy8bYwgAIT93T7zlIoIN2AnZaXQbtXMcpT/g/0=;
        b=uEaaRHxPdCx9zxLw0Vx0tE0GYTyNnVzlVpF/vIjzwAiYKy3XVcL0jQVdCjU8GzXxsc
         Y9xm/vAd4165uhvAlwsmy/d9c95QkFl9pEju//DzcGOrVVcJAYEtTvDj9DV6t8qPoMkH
         7w6SkjWCDXPJzVZW7BPhUlC2gjmpBu1/k2rh1DDOpuon4oSSowXLYGfaR88xBC5V0RbI
         xTH9WRK8QJaSOi/vm+9iTozzZDcN06WPXNLCoJS+1W26kdYYlxVZL/aXonKok/NjKqMc
         sqZ3SuhA4bR9Qo/P08rO5wMieSVjRyS++FIf3KoeLdNxJJiI3nvXNIybz5FMFWFwNjKE
         RMhQ==
X-Gm-Message-State: AJIora9SXF7Vr1tupzMkjWfISgHVxtdx8++WPWgfR9C/SHNB+i6ejAyH
        sVqxpvxAiTlcd2nX9Snfomd8N1/aR06GALVj5SE=
X-Google-Smtp-Source: AGRyM1tHqAPF/6McgDC68HDtl6L0TtTzyExGs/vvSAY+VBiYZ8aYJ0gTYrxayFpsx+0gfbC0T4IzSYJNYQJQt6jilw0=
X-Received: by 2002:aa7:c392:0:b0:43b:1f5c:391f with SMTP id
 k18-20020aa7c392000000b0043b1f5c391fmr2442723edq.267.1657787834896; Thu, 14
 Jul 2022 01:37:14 -0700 (PDT)
MIME-Version: 1.0
From:   Yogesh Hegde <ydh7620@gmail.com>
Date:   Thu, 14 Jul 2022 14:07:03 +0530
Message-ID: <CA+pr8UBPjTSeUJVhtzivcCxQYSQZGZuk13S5gAN=+GKRGY08-Q@mail.gmail.com>
Subject: Requesting an invitation to rust-for-linux zulip
To:     miguel.ojeda.sandonis@gmail.com
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello Miguel,

I have always wanted to contribute to the Linux kernel, but always got
busy with work, Yesterday I attended the Linux foundation talk on
"Writing Linux Kernel Modules In Rust" given by Mr. Wedson and
it inspired me.

So I would love to look into the changes, and possibly contribute once
I have enough
knowledge and experience. So, I am requesting an invitation to
rust-for-linux zulip.

Regards
Yogesh
