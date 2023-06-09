Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F71DC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241310AbjFIJ43 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239512AbjFIJzy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:55:54 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320355FD3
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:47:00 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5689335d2b6so13630647b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304019; x=1688896019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn/HlDmXpJFb5gRajLYdnJPgaRdQ/ZSJk0qrb61141Q=;
        b=WEY1zgLxByQaEVc/ND48Ytszh6VSBHXgp71F/6sdDWe2eTqONnsJLiyXxzv/ZelnWc
         rII7lQv4Oe06FX0Fvu30E3q9VDKbslHDu7Ic/mjeB4Nw6DR3HVJWuOr4U4IwJxjWHM1k
         pNWx7+u4qyEeFGzGkFV5gRs4oo3VMPG/aIcHh0eS7wqGGU6+uPoy2soLGIxej4BO5xD4
         AmtvfhM0gkSPk1masnYTpBNWQ42pR8pI7jTJjm1ETsbHKxRVFT+2s2GGTWTbYcyVeDfR
         zNLxMVKSynsD8dcGdVeIX/Op33R++cTO5WKct4NWVTv26X4HaIoB1MKkNELGt3hiL59G
         gUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304019; x=1688896019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn/HlDmXpJFb5gRajLYdnJPgaRdQ/ZSJk0qrb61141Q=;
        b=ADBcSL+RFWrTZ6pvAmwdr9GkRlOeI1zgBdjoE78stFf5YRg9BUgOw1mhwmHQaRkMoi
         A5ol+G4KqF5Qd2NhXvbzsohQwCmjlyHeytwYsFQL179SOyxiQYBERH9kS4jFW5rW1wu5
         HwKNOKespKWyUBwO66XpLwsWcigW/ylq0jedKglVeQ/2Mg+IkmSW86eZa5Nxk1OVbUTW
         TnmdMGjAhjfWMA3mXQNMW2fu55EZhy71V77muakDAySyfEUYzB760IViYytNOP5LD6TO
         kIUMoqN+e9/qxoxBnFgVnkO6024XE6lvWk++TMDUe18Y/WlKxIVUgd87IYoFGhjMNa7v
         HIjw==
X-Gm-Message-State: AC+VfDx1xyADOIRWKEfpE2nnhNlN5+rSoBNSQUdFieIERUq0sLTujJs4
        E7Mk5wSGNii7w/QLc0EJS5eq8XmLZQa/CFqgiQTswoha85I=
X-Google-Smtp-Source: ACHHUZ5QXTSIVMzawJHF7q+PkWHKO+ITbMgKorNERDostDGYNLQypBiuDiiuayYGQCQ8chO7EV7tp289tf/ti0qHEp4=
X-Received: by 2002:a0d:e246:0:b0:565:c7dd:95b9 with SMTP id
 l67-20020a0de246000000b00565c7dd95b9mr790094ywe.12.1686304018693; Fri, 09 Jun
 2023 02:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-6-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-6-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:46:47 +0200
Message-ID: <CANiq72mUmb8oP47YcFp_58PRvhPwAGSHnn7G8WA7mo+7F7qqqg@mail.gmail.com>
Subject: Re: [PATCH 05/80] rust: kernel: add libraries required by the
 filesystem abstractions
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:58=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Add cred.rs, file.rs, io_buffer.rs, iov_iter.rs, mm.rs, pages.rs and
> user_ptr.rs from the rust branch.
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

I guess you added these in bulk for RFC purposes, so that is fine, but
eventually these will need to be submitted individually etc.

An alternative (for RFCs), if you want people to focus on another part
of the series, is to create a branch somewhere with the dependencies
applied and then base the patches on top (being clear that the
dependencies would be needed, of course). Some extra notes at [1] for
others that may be interested in that approach.

[1] https://rust-for-linux.com/contributing#submitting-new-abstractions-and=
-modules

Cheers,
Miguel
