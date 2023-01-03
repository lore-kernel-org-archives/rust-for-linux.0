Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70275C3DA7D
	for <rust-for-linux@archiver.kernel.org>; Tue,  3 Jan 2023 23:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjACXXv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 3 Jan 2023 18:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjACXXu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 3 Jan 2023 18:23:50 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCAC13EA8
        for <rust-for-linux@vger.kernel.org>; Tue,  3 Jan 2023 15:23:49 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4a2f8ad29d5so115902967b3.8
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Jan 2023 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5sH4KwIjfz20B8XfmS4St1BXKaWxm0svjmxhB6o7nU=;
        b=geCa09/Rf6E/PPO0aJtX/VAPbL1RMCpAtlW9OZfqbScvHdXmRe1qVf1+jss+Tsslmi
         QCfEK/0Xj30c/TxwydyDoqaCPcXMjOQMbmIeg2ZZ/BSllwVOPsUHzJlWDrRl72djeCMV
         PjS03pubMAl0VqWuL6LUjJ0nfyxoGq1B9AZE4fxsBuRO8KOE9O6bHcSynwkWrEDSMxZn
         fNx2nivhDhtWh4wIgZgZGQjDcBPuNY8LEbwhQIN2Gu4vV0198KO0VlSzxrkD/NJCkdjI
         J1ZIuYLf5d2jyFAU3pAwXQHr9RQ7Z7mSDx4BY+Njb6diFnR5c0mlQLj2prtKb58XyrGn
         3B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5sH4KwIjfz20B8XfmS4St1BXKaWxm0svjmxhB6o7nU=;
        b=VzlHTcViNEgbMJHAWdP87ov6QNlEvdGX7LUZmR7Xbq3244P7aEb4Lk/4cgSqZ6xsuH
         G8KD8/IzPtMdlTWgCPi9hDVqAZIk3c0FsmwmvZriiV3EjzusRwqNJ6aCeTmtEB98RuNb
         o5cRP5Ao2iJIkOmMtvd1DHt57bBZx7NobSFYyZJir2MS4vYLt4nwJ8eco6xVSO1cd+uu
         5wbEtWyTP8JYRBR6NfnOfl8aTBl7147HwwG86RvoKGre+8ixcWCPWTgsrg0dxDcORJWB
         CJzGyaeLdHeeCCKKHxziPnnEvyT+3cgbG77iHY/xs8jsfnTFfXnxgGb5NLjbWDiEeWJG
         sGKQ==
X-Gm-Message-State: AFqh2kqm8n+9HVPQKizkJJzithLE/cU+m4E/BDPTdDwEjcZYkoqxrB4g
        kXjDqcfjhaWsYGPoHXHQuJkx7zZiLvzmYroQwGc=
X-Google-Smtp-Source: AMrXdXsxXyivT6mdotYPtUXgCJJWgWlDuli7vmn+qVLDHkeOk+N6EWNSD5EE2J93Zu5Ty94FmrUmX8jncx/2YY4OsPE=
X-Received: by 2002:a81:94d:0:b0:3bc:7270:cb70 with SMTP id
 74-20020a81094d000000b003bc7270cb70mr5548357ywj.83.1672788229042; Tue, 03 Jan
 2023 15:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20230103210219.5690-1-apantykhin@gmail.com>
In-Reply-To: <20230103210219.5690-1-apantykhin@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 4 Jan 2023 00:23:38 +0100
Message-ID: <CANiq72=4g2_m8uFZB4CHS6pYJgx1x7GrP9Ab4k39bDWZk57jwQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: store Makefiles in dictionary
To:     alexpantyukhin <apantykhin@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jan 3, 2023 at 10:03 PM alexpantyukhin <apantykhin@gmail.com> wrote:
>
> Signed-off-by: alexpantyukhin <apantykhin@gmail.com>

Just to confirm: is this your real name? Most `Signed-off-by` lines
are first name + surname (typically capitalized) or written in
non-Latin alphabets. Of course, if your name is spelled as you wrote
it, then that is fine!

>  Store Makefiles by paths in dictionary and use these if required again

I think you intended for this to be the commit message, but currently
it is after the `---`, so the commit message is empty (except for the
`Signed-off-by`).

In any case, the commit message should explain why a change is made.
For instance, is this approach faster/simpler/... than the current
one? Or, in other words, what was the reason behind the change? (I
guess it is meant to make it faster, since you are caching the
contents, but by how much etc.?)

Thanks!

Cheers,
Miguel
