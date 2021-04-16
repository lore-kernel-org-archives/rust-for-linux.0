Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D080C433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31B13610CE
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239778AbhDPNWv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbhDPNWv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 09:22:51 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F6AC061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:22:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id o10so30055550ybb.10
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8rTtVhJ6EMju428G2yKX4un2TNtCkhgU4Ff94+6qkPI=;
        b=iTf23hrS0u+uC8PHKSZUnW9r2anVxM0r3rwAcVU55832yI7KC/dkSf5fmOJsioELPE
         Ae1pK/svXWGe/kbZJ2cMC8iYBOI7GxkvCyM/efBQviJQa19enFxWvtGuy8uriOzRCADl
         xBvB34MSIAojtX/BZZtcQSBPRYvrXDsjnW95O1REYwdOXvSCtAml+4bcknOhf+z2QWfW
         WFIOL2+qk4qdQZ8P+KolN9GQl81Lpdsv5/B8mhvHpT9U0McqKCfXIelxcG3UUS1BVLMU
         HX4m6y753lh0X4NadhDiH7i181PjlSQ7RMeRyY1bL8uf5UlTD7p3xAT75wo+JejzJA2U
         bi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8rTtVhJ6EMju428G2yKX4un2TNtCkhgU4Ff94+6qkPI=;
        b=Jh3DTj9nUYO820fg3DPXRewSzPHcw+LNgHncQGESxJsPYidpAqcWgyA/tQo2F/hkEP
         6PkXhZE5UANBz8XTo0Ab8MZ0PlpTl3lFegntn/66tDw0Q/uDtnj4KFcsNucIlZ+MynjN
         tEgHWE+yfPfJm3/6gMu/o31ecplWYYesG+qBDpDMebHzwfI9IIiNnXA1hS58Eq3gz/04
         jEQ03nnGV5l1Es7T21vvHZc9Z2HMngHdGmUZ29k3YL6EOGX85XFeb9GLmCPgdEmrmHNj
         ziMwLP31svuhKudPBjZ7X4RAtZZtwxyEI4FMGPa99fn2gOsf2bLVg3babVJfdPBxiuB6
         /wpQ==
X-Gm-Message-State: AOAM5312aJH7Essn51BvrCW5Wc9w+mM+kDAuQWEQBQgdOlLQHiQwkV4K
        x9HDAPbi2X0668pG+3VxmbCbOGZ0D4nxz27KN28=
X-Google-Smtp-Source: ABdhPJzH80VC7+tkydCONjz9l13fDdxviB51m9DRaZ/Yt2N6hgdhp/fZxGDN/SH65x3kHoy75/GEafUxcbeX7HOKxzg=
X-Received: by 2002:a25:6803:: with SMTP id d3mr12186611ybc.422.1618579345195;
 Fri, 16 Apr 2021 06:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
 <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com> <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
In-Reply-To: <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 15:22:14 +0200
Message-ID: <CANiq72n4Mu8dzE3GaNOrRvJDD+5G0WXuNxj-e9RCyY5XkuQ4Zg@mail.gmail.com>
Subject: Re: Rust-for-Linux Hydra CI
To:     Finn Behrens <me@kloenk.de>
Cc:     me@christine.website, rust-for-linux@vger.kernel.org,
        linux@petabyte.dev, Joerg Thalheim <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 3:07 PM Finn Behrens <me@kloenk.de> wrote:
>
> I confirmed that rebasing breaks the build. But yes this is only a red st=
ate as the build fails, but it does not block anything. Ofcourse if we get =
around to build nixos-vm tests those tests are also blocked as there is no =
kernel that builds and so can be tested. But still, this is only a broken s=
tate, and does not affect any other projects.
> We can also monitor different branches of the rust-for-linux linux tree, =
where a rebase in one branch would not affect another branch.

Sounds very good then.

> Maybe Christine want=E2=80=99s to add tests, the nix derivations are at h=
ttps://github.com/rust-for-linux/nix and are automatically updated by hydra=
, as I should write my finals and not linux tests :-).

Good luck on your finals!

Cheers,
Miguel
