Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAE0C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 09:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjFJJcg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 05:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjFJJcf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 05:32:35 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59783269A
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:32:34 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ba841216e92so2546753276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686389553; x=1688981553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzpZOa0hMc4WPRQo11zFUgmuNH8tAXQhTdXeNkdb6gk=;
        b=sV7vjUk+vsuLA/7jfeVhUv0GF5ySiDJrdJq0X5onX6XlzE9GR2axVNwur1nJNcSVzW
         cbAys6rtGRdjVAK4OFFPYX/duuS1K9A9nbqTGiVzwHo6cLLKJP82DcKQiSvkpYyMuhAT
         nk88b+pNXDtMUx+GXW+2IaBTmJAv5EFY1rb7Jt7kPZmSfIK/C4g0U5Lt4ZWLzn63wO3L
         vIf4sc1Uxll3H+Os1OhqTX1/Zm5Wyla8j5zrgUp+vimcl1GR3tl1WiGIdGYJFYShKhnP
         +Eu3nLO12rXu8VoHMDifh/W9Wbxbqlg9OqnFc3QgPIeOIRqcxEu+Gd3zEguPQJitimHd
         uEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686389553; x=1688981553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzpZOa0hMc4WPRQo11zFUgmuNH8tAXQhTdXeNkdb6gk=;
        b=f8BtS8VGenFIMBXpS5LwHYnn+fBucSmXtXel/QIjC9gMcjM60vIsPlwMqd5pWAZV1F
         GwZ9K0OrEF2qhwkxtGGRUYf485RrkZvA1/7tqAyZtf89UPmCaA99m1N17dDEhFMp57fX
         S7s/6F7wwWPBNz5Dpd1hay/qbf4+drFxFMsjoD6dXnpwoAXjdmYsqmYMac8wWn4GKGYl
         G01DA6dArQC1IqE2SbcciVnMKAv1K2n62rN4Ym0EOCM9mhjCzTXajAL5dMC6uJu2lWx9
         By1KkUpq/eYXqT6l/i3BT7n3nBVc7jaw8f0JqmFPNP/r0o46h4E/MKkS08Xb52YEH+DD
         RZpQ==
X-Gm-Message-State: AC+VfDx1451YemGZe9/uoLN29/PJ3qQBRAu/kdgc3UfkxAPbd6t7R/Kn
        Zopr2EvgVCnQyCuwwpWnSqAH9p8vHs/ElmqjXnU=
X-Google-Smtp-Source: ACHHUZ4PKVD+7yxiogOl5WUeoP46En4rmWG4n8WGDhsDgFg0wq5UWs/XBNTh9VDEWzV8UhdA7AZkENXXhOIRoCH2Zpo=
X-Received: by 2002:a25:4655:0:b0:bac:69be:9494 with SMTP id
 t82-20020a254655000000b00bac69be9494mr3102765yba.36.1686389553487; Sat, 10
 Jun 2023 02:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
 <87r0qjisrd.fsf@metaspace.dk>
In-Reply-To: <87r0qjisrd.fsf@metaspace.dk>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 11:32:22 +0200
Message-ID: <CANiq72nrmZkTHgXSpeCeueSXeQ+oFfp89BZC0a_pRpMbb+txRw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
To:     "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        "Ariel Miculas (amiculas)" <amiculas@cisco.com>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 11:14=E2=80=AFAM Andreas Hindborg (Samsung)
<nmi@metaspace.dk> wrote:
>
> This is super annoying when it happens. What is the reason, are they too
> large? Miguel: can we do anything about this?

Yes as far as I know, and yes, you should Cc patches@lists.linux.dev,
if they are going to be big (I replied above about this [1] -- did you
receive it?).

[1] https://lore.kernel.org/rust-for-linux/CANiq72njK=3D6TYt1z8WBpRFhPJY=3D=
yVtxytxDUi=3D_Jtp1dZ3hKLQ@mail.gmail.com/

Cheers,
Miguel
