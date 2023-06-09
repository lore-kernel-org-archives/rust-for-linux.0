Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0261C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 08:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbjFIIbf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 04:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240819AbjFIIbQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 04:31:16 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B883C3D
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 01:30:37 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba86ea269e0so1490719276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686299434; x=1688891434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8g40gZru4mDpkgfcRT9f0WNQfjTe0beJciUFwToTGmc=;
        b=b4MVknMfCN9clKLra7vzjPkRERtlDPeKJi2zIi5k9ahPHZE8eLmPG8e+slRWLEyhn/
         dimu4Djwxk2SZ/pGRnDZt3RDYcfg4P8kMvXka6AnAGrusHBno8WbH6XEZ7JscClWFgvA
         Tk0BoKoh/6bP3es7RjjeIR7QJXwv1mjQhwZX/lH1IjLxppSLA71d5/qs329WGUW3u19D
         w8VynB5vvflDDqSPsioUzKMEr3TSxmj7eAiNRBT7/j2NnrY+hs54joq9d1QhEj2ru0Ir
         QaiVK1vSDR/fb21c3wCihbLEIfwNh+WF/Rtj3Lfhi5zX6FWTJkcEpGBed9IuuTmNO/YS
         awKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686299434; x=1688891434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g40gZru4mDpkgfcRT9f0WNQfjTe0beJciUFwToTGmc=;
        b=FeXON9q3/SbIw0aQzkrG7rsRjgjd/On0tcb6EFSIRnMw4elTdRzpwtx4Zzm9UMaH1k
         WSo46+y068lYCv7YxeTTLenqmHjqKkThD0gIj5B1gmgq9hkjGHbVTSJzrrCxLMGDNd8k
         4M2MPSM4Sz8HSrE1Tq5W+4qXSbnKqKgj1R7vwxWcdhNcf6wafa3MjpOC/vo2NafzGPlR
         3YTU1aqEpqBZwNMJRJUFXwFLnXj+0Qm+NLr8I3t8YYHQxsbmZ190dPnJFID0P/m3YCGm
         UzJWFkkxG4DhJKW/9+A06cAoW3QUDGuiL44QNucocWJ+pyNnKMdRpZGfCF2aySxUQ0JL
         RjXw==
X-Gm-Message-State: AC+VfDwhW/vzz6k0Qx+5mTuke95XF2pYnv8M1msKMQvrPXNayexBQkdp
        MMuUj3IQgKLO4r/oflLusNAf9OkjcHMqTYs7M28=
X-Google-Smtp-Source: ACHHUZ461McMbLH3qupp5408bVV93dmB2V4EQBGMNDaGjoT0MEt0Db/3R4bAPcsf6eq91j0O47PXqPZ3V9LrGH4z09w=
X-Received: by 2002:a25:f308:0:b0:bb3:8945:d57a with SMTP id
 c8-20020a25f308000000b00bb38945d57amr516841ybs.0.1686299434500; Fri, 09 Jun
 2023 01:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 10:30:23 +0200
Message-ID: <CANiq72njK=6TYt1z8WBpRFhPJY=yVtxytxDUi=_Jtp1dZ3hKLQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
To:     "Ariel Miculas (amiculas)" <amiculas@cisco.com>
Cc:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:37=E2=80=AFAM Ariel Miculas (amiculas)
<amiculas@cisco.com> wrote:
>
> Some of the patches were bounced by the rust-for-linux mailing list, you =
can see all the commits here:
> https://github.com/Rust-for-Linux/linux/compare/rust-next...ariel-miculas=
:puzzlefs_rfc_v1

To ensure Lore sees them, you can add a Cc to patches@lists.linux.dev
for future submissions.

Hope that helps!

Cheers,
Miguel
