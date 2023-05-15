Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E8BC77B7D
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 May 2023 18:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242672AbjEOSDb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 May 2023 14:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244614AbjEOSDF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 May 2023 14:03:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7C61CBBE
        for <rust-for-linux@vger.kernel.org>; Mon, 15 May 2023 11:00:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc394919cso19293571a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 May 2023 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1684173634; x=1686765634;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv44/oK7XAF3kNs9Hd3WVTKEAoxAVlltHbODTzVPgm0=;
        b=wVxuHi3JGUdKZWHcPplYc3dLd+E6j45iHTX2VumJoo56zKFS2xdKCGuDV/70lEKk35
         8NdcbP40UUakOoeAjdvDkRU06v8XqvPKD4Apj3s8IQwMBHSKWuBVjdlzeVKN6yClCsOY
         4fPY7h+OfjkvbKEzWkFr557O85ya0BWeaBZsN3dCtOGhVrIxhC6JQCd3CLNg/i1a4Hnv
         p5K7q0o7zEdu//6B5RsyTEdYUxg+SLBBLoRhdDeNT/QW4jd+O3vhGTN76thNn7Iy8cMA
         MXLISuQWoTAFq5iDQFlZ8wC9J7AbqjlZgW8NbPrW/zeY4aSP7fliXrFDOsctP/sdvuGA
         UUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684173634; x=1686765634;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cv44/oK7XAF3kNs9Hd3WVTKEAoxAVlltHbODTzVPgm0=;
        b=K2J+462mFpKoyJi9NvmmHXYk74n3AkHIn0lnbLhy/N+NZ1jXKDIohdyNWgbtJII6Ar
         zngpMTHb+b85EIcOg7xE5XlJHCPKqZCu4dkzUuVeq7jM32AAJOgofZQqDWs7SMc48y31
         ggOSiQEJnIYr4kipW/PxNAfjqar6QMCh4cjn50BAtUUdaCM9aTCmNv0Fnq2sq+CsN1EL
         +um6B+6wjijU4+5TsP8iNNsA+jFyWZweUVs6TJe4Wa1gNdvuKaYJokTp9pjBIdMqM/T6
         /ah7p5vb6deppvdmnm2WpWlcgmcW285BWmR/ljuhGU+xg5sU6YMBvlwNRnImUj941/+x
         837A==
X-Gm-Message-State: AC+VfDy9h+xysJYVO6CIT04yzahqIJv3bLJiBE/KoBHUbdUEDCpV1cl+
        sCWottDunqZarHR7w1kuuUkHVA==
X-Google-Smtp-Source: ACHHUZ4WT1UAlsxx5OXxwKYq1+o3pEblQqSQiYai7Baqo00KRgYm1nJbLdJPZSjPzQMONfZn4ODqbg==
X-Received: by 2002:a17:907:70e:b0:965:6b9e:7ded with SMTP id xb14-20020a170907070e00b009656b9e7dedmr30999391ejb.42.1684173634592;
        Mon, 15 May 2023 11:00:34 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709060a4400b0095ed3befbedsm9843257ejf.54.2023.05.15.11.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 11:00:33 -0700 (PDT)
References: <20230507152232.803-1-ben.gooding.dev@gmail.com>
 <CANiq72n-swO1L1zsPNDz=ZMMm=Ox5MOJHzXBbxgX0f_vWFWDmg@mail.gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Ben Gooding <ben.gooding.dev@gmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj?= =?utf-8?Q?=C3=B6rn?= Roy Baron 
        <bjorn3_gh@protonmail.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: lock: Add intra-doc links to the Backend trait
Date:   Mon, 15 May 2023 19:59:34 +0200
In-reply-to: <CANiq72n-swO1L1zsPNDz=ZMMm=Ox5MOJHzXBbxgX0f_vWFWDmg@mail.gmail.com>
Message-ID: <87a5y5eapr.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sun, May 7, 2023 at 5:23=E2=80=AFPM Ben Gooding <ben.gooding.dev@gmail=
.com> wrote:
>>
>> Also fix a minor typo in one of the comments
>
> "iff" is not a typo. Even if it were, it is best to avoid mixing
> different types of changes in commits, to keep them as small as
> possible (though sometimes there are exceptions).

We should change the wording to "if and only if" to avoid confusion.

BR Andreas

