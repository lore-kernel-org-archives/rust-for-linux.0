Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9BEC433E2
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 20:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F69061953
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 20:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhC1Umj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 28 Mar 2021 16:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhC1Umb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 28 Mar 2021 16:42:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD798C061756
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 13:42:30 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id w3so16345962ejc.4
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=TJzbueJuIFja4oXFEXrIFBrWU+FHqCEmxJUuh8OrkKk=;
        b=LUqxsqfCcCQCPBL282JpSrVEWHU6qmjsqjBSNFjWKlg2Mm5OtviZlnDE/KgQsdjCBE
         S7dkwd9MQ87KaobeJEmmdGGpcupaSKURBfjNycQQqtN7kb6OUX7RL8Y4OusPnUzRJG7n
         EZ8ibONqw3q9TcqVMk3/nlfoTrfD8qAYBzamhm5fBHgyGf1KX7CIw1bmeMtxovLhMfVy
         nXFd/t6s1IvOEYZweK2jzpQdXiMHzImraEOi8OMSXDrWtzAI1csCK3q4urtZNggYknec
         nCwxnsdQRRujtk10F/Nuy9hBpbFEyuzFUf0PU0VVPfj6eDMnlQ6/THXRXmx2AjDKml+l
         YWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=TJzbueJuIFja4oXFEXrIFBrWU+FHqCEmxJUuh8OrkKk=;
        b=oif2IRVpaBjG5i0Rn8lDeHpTZoYB0fYQp8sw3JWGZY3WHNx5WVWyf8kEBYbU8uvTvl
         cTD1zSFEWIUOSyOI5h94ZxclwtSIfdlE3hQI9SVvTVj2JcmZ4DeqMRKMbKUKB73dXSHJ
         rQOFGb9ajtWO/5XDwS1K8nl5YEkllbmu1fr3NfnT+7YsI2AKp1TG4oBsik36ncWqk54d
         CsZ3v66DbsilDjtVaNIq8fP/yTC/RAIhEmxbKNNxwqwuFyKzeknxODsg9PUEIrmqdwT5
         wOYsvJbTX5FzhnMH3T3w09F93fKHtFhb3uxumfPPzLb27vc/ucSxqPoLJK/tlR5uaQ/N
         Xo+g==
X-Gm-Message-State: AOAM530snDx8XXpmDWzzZq1bJg5DxrUFqarMsKKtA44eoXuu3v+pCVNi
        YGgPreVQgIWcSVV6fulUPMElbVHMaXb9jg==
X-Google-Smtp-Source: ABdhPJwMwHZ/1Ib3k18rmSS24L/MpRnrrGSypE/xfpwWbnVBxXHVT339cVMW/dScbdK0SLRpPydL5w==
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr25391386ejr.151.1616964149622;
        Sun, 28 Mar 2021 13:42:29 -0700 (PDT)
Received: from ?IPv6:2a02:a212:a204:cc80:8f3:1f28:96b0:5c63? ([2a02:a212:a204:cc80:8f3:1f28:96b0:5c63])
        by smtp.gmail.com with ESMTPSA id f19sm7793069edu.12.2021.03.28.13.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 13:42:29 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
Date:   Sun, 28 Mar 2021 22:42:28 +0200
Message-Id: <27CFDC30-F1B9-4632-9F77-F1CFD1DE2508@gmail.com>
References: <CANiq72nd6eLtx4N9GbHR_sGOHJ1H=czPyza=Gctc=HU68aQ+qA@mail.gmail.com>
Cc:     rust-for-linux@vger.kernel.org
In-Reply-To: <CANiq72nd6eLtx4N9GbHR_sGOHJ1H=czPyza=Gctc=HU68aQ+qA@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel!

No problems :) We can do introductions next time :)
It was really nice meeting you all :)

Thanks
Kaviraj=20

Sent from my iPhone

> On 28-Mar-2021, at 22:20, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> w=
rote:
>=20
> =EF=BB=BFHi all,
>=20
> Thanks all for joining!
>=20
> Kaviraj: my apologies -- when someone new joins we do a round of
> introductions at the beginning of the meeting, but this time we did it
> at the end (but you had already left). If you join next meeting, I
> will make sure we do the introductions first! :-)
>=20
> Updated schedule:
>=20
>  - We are still targeting the 5th for the RFC. We can delay a week if
> we feel it is needed.
>=20
>  - We will be adding a few things to the RFC:
>    + Some of the PRs in the queue.
>    + ppc64le support.
>    + Binder & a couple rust/kernel/ pieces for it.
>      * This does not necessarily mean Binder will go in the merge
> window -- it is more to show in the RFC how an actual working module
> looks like.
>    + Move/split of "Rust example".
>    + Kernel docs to be uploaded.
>    + Unstable feature list to be updated.
>=20
> Other topics & news discussed:
>=20
>  - Wedson joined as a maintainer!
>=20
>  - RFC:
>    + The patches' split (preparation, Rust support, Binder).
>    + Attribution, git-blame, kernel process, etc.
>=20
>  - `alloc`:
>    + We will likely end up with our own equivalent in the kernel, but
> this is medium-term. For the RFC and likely for the merge, we go with
> `alloc`.
>    + Ideally, this work could inform the Rust allocator WG!
>=20
>  - Locking: enforcing correct order/patterns (or at least disallowing
> known-incorrect ones) via the type system or extra annotations.
>=20
> Cheers,
> Miguel
