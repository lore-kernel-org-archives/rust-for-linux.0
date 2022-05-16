Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C5FC433FE
	for <rust-for-linux@archiver.kernel.org>; Mon, 16 May 2022 21:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349529AbiEPVRK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 16 May 2022 17:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349093AbiEPVRE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 16 May 2022 17:17:04 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FEB12AEE
        for <rust-for-linux@vger.kernel.org>; Mon, 16 May 2022 14:14:09 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id s23so17333591iog.13
        for <rust-for-linux@vger.kernel.org>; Mon, 16 May 2022 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R10fGbfAwjyvEaLgEb4ePb7PNL0SEdEh5NxxALCjUHU=;
        b=L3OMuWQ0TNjB0cozuCOnc+Z7zy2Q8D7DrDyZ7lQPSWAY/4CMdOsm0q+sZK8DtgUvIf
         dFf7ACOm/FXei75jmVtnkTX2Emf7m3o0Y6XT9rVip2Nrm+Dupjh0sjYVf8MkidHrHomY
         wQqwxF8pZJn4z6A/IH2zGHbu4seg++LoCyqWdf66peQF8ZPQAFovBNWmp1S5iQVCAseL
         Y4DFQbn83tj9PlqAVLjr1Gw2IbOez1iZIU/GqKU6aOCTeB/CSDbyErUv4KYVcoaLNLR8
         ePZNiDKxTOKYGho9b2/t7uqFPVk6IeBJK49irMUEeAQTTtTOx7a4cseUcqfquGS6EeiH
         KujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R10fGbfAwjyvEaLgEb4ePb7PNL0SEdEh5NxxALCjUHU=;
        b=fjOGYlD1Syy2qhW15qQ1SBIvvG4nTjPnSrV7BGDYVao9/P8fsjeGqalLUB+Rg6fPQ0
         mqnrsGVITuiBkPHrRh3osv1XUD4Qk+QjQOr+xXv1Fgh9ABV0FEKevhVjw7yngFd6Jh0V
         kJsHIATc68/sQITn4P8G6WiZ++WNodlbx2cK+Pd3yH/kwnVgJqA91DAi1YRwFQQPZG0K
         BaLidcbD9AI8yfha6V2+gmANZ7hL+nkyy2USevGVPvi3gi0MgcBgLJy82+0owz7UiPOR
         QygSE0VtdIyVQsv36bJ1Be/7+aGO/Xzhpi8H0d763xgfs1xVmWKx3ojeY6ujwIPRl6Ow
         4qyw==
X-Gm-Message-State: AOAM533oOvLG+PZoLP4Ofd1//hflPAtssKlF29JtomdEGGW+8BdjcWQJ
        uZzDMRZTkAsQBOkTXUCFRDZr4DJewjpHp3M/KBZ405Tqceg=
X-Google-Smtp-Source: ABdhPJzjlaUtzzzGYr5rUGjNp+457o8cu3p0YnifaJ6euPx6zpV7VryJLNyJ20lGTQMebZJxZtTDYwsnODJSmh0zbAs=
X-Received: by 2002:a5e:c643:0:b0:657:b1b0:8e2d with SMTP id
 s3-20020a5ec643000000b00657b1b08e2dmr8855090ioo.64.1652735648756; Mon, 16 May
 2022 14:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <DFB00BA8-A9AE-4854-9CF7-082380402F20@lri.fr>
In-Reply-To: <DFB00BA8-A9AE-4854-9CF7-082380402F20@lri.fr>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 16 May 2022 23:13:57 +0200
Message-ID: <CANiq72=P76KwNBOnZ+h8kAWrfMCsvMJt4we69atDeW1ugY7_jg@mail.gmail.com>
Subject: Re: Taint Analysis for Kernel Rust
To:     Xavier Denis <xldenis@lri.fr>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Xavier,

On Mon, May 16, 2022 at 9:39 PM Xavier Denis <xldenis@lri.fr> wrote:
>
> I saw a tweet (https://twitter.com/marcan42/status/1526107814477074432) f=
rom Marcan about the need for some sort of taint / capability analysis in R=
ust4Linux, and was offering my services.
>
> If someone knows what kinds of analysis are needed and could let me know =
that would be great: is this intra-procedural? Inter-procedural? Are we dea=
ling with simple binary taints? Or do we need arbitrary partial orders? How=
 complete/precise do we need the procedure to be?

There have been discussions in the past about annotating functions in
similar ways ("function context restrictions", "colored unsafe",
etc.), and we recently brought it up in November's Rust CTCFT too.
However, how the feature could work is to be discussed and nobody has
yet put time on it (as far as I am aware).

> Given an answer to these questions I think I can whip up a `cargo taint` =
command rather quickly, so let me know if this is useful or desired.

Note that the kernel does not use Cargo at the moment.

> PS: I gleaned from other threads that there=E2=80=99s a Zulip as well, wo=
uld it be possible to get an invite?

Of course, invitation sent -- welcome!

Cheers,
Miguel
