Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771B7C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 10:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjFJK1j (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 06:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFJK1i (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 06:27:38 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A0235BE
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 03:27:37 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-977c8423dccso776913666b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1686392856; x=1688984856;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TI2i96rjBKsVf39/NA7EDVrP6FPWXVrkXPsqIlIX2U=;
        b=Yk44Yadj5lq4syqNSyXPKT0fba0fwXEtbb/LJmSoeM+Ir6DCYhJFz+rKQ0V4yqeY6+
         5QoVSb3nRjpBfepOYh8OyfJil1TRwwLjqAMqNrk9IeK91S4YqUOi0KbAiOizqMzTNNuG
         tELrOmbZBRzOvEsPxdIdPWnIy0T92KqIzQQDKLiKtCqHsQHtotXc9jIgubILyhoJDvQA
         0uLItr95GoqvHnDwbD2hC4gpUOsOkj+15QKuFrjSomgeAIR91bP/Ar7ffX+e6BeBV1CX
         w9dY3Hj8EFWPHu60aSD7AvV/uz8ZxQfS7KnSJRr5Cvd0xYXKB/jbjvqnUzUH6h/GPm/p
         zLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686392856; x=1688984856;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TI2i96rjBKsVf39/NA7EDVrP6FPWXVrkXPsqIlIX2U=;
        b=JHDUV77M2bux5oBAGUDkp+mMkmrNvuk3FUXX/N6I2Wl3f8gnaxCpmFTaKI0BRdfuDI
         OlYK7UK7ACcNmvFRS5oAt5+yU6EZwyc5EbTrkdilwbo3U3iP8qYzLejENuGon/WhH6p/
         yAayHAYrdwIbks0GHeytvugtMN7a+X6qYk2JI9A1tuFF10OmOGu3rC+DghbX/lbTbxSe
         bwxxDADCLmdsVLy5lebyNx6F7vYAWCkCvKAB8B4Bw7G8vz19JWQnJBiH1qq4lSBXcNgK
         f5q6nZuf6eHEolzUEHC7x7iL5leBRRX/HZaAQaU8n67PqKlcDHpcgDLm3FmvOgnLa+59
         qJbg==
X-Gm-Message-State: AC+VfDwrp2wBxggNDY5y5tbD4AR2rje2yH30zKbQkw5evl4P17dM4VLa
        M7QQQ94QKgMiMbDf7HKq3mctFQ==
X-Google-Smtp-Source: ACHHUZ5dzZMv4j2/V27+nmVTToBSgRBs19twWOwFBbN4FM3rUTnPb+5FcxZ2ooWz8JOwHxu6clA75Q==
X-Received: by 2002:a17:907:3ea7:b0:978:9235:d450 with SMTP id hs39-20020a1709073ea700b009789235d450mr3995458ejc.9.1686392855266;
        Sat, 10 Jun 2023 03:27:35 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906684b00b0096a91ab434fsm2391166ejs.40.2023.06.10.03.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 03:27:34 -0700 (PDT)
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
 <87r0qjisrd.fsf@metaspace.dk>
 <CANiq72nrmZkTHgXSpeCeueSXeQ+oFfp89BZC0a_pRpMbb+txRw@mail.gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        "Ariel Miculas (amiculas)" <amiculas@cisco.com>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Date:   Sat, 10 Jun 2023 12:24:54 +0200
In-reply-to: <CANiq72nrmZkTHgXSpeCeueSXeQ+oFfp89BZC0a_pRpMbb+txRw@mail.gmail.com>
Message-ID: <87mt17ipd5.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sat, Jun 10, 2023 at 11:14=E2=80=AFAM Andreas Hindborg (Samsung)
> <nmi@metaspace.dk> wrote:
>>
>> This is super annoying when it happens. What is the reason, are they too
>> large? Miguel: can we do anything about this?
>
> Yes as far as I know, and yes, you should Cc patches@lists.linux.dev,
> if they are going to be big (I replied above about this [1] -- did you
> receive it?).

I got it. What I was trying to get at is: can we fix the rust-for-linux
list? Why is there a size limit? Can we increase it? Better to fix the
issue at the source than to add a workaround that people are bound to
forget before it is too late.

BR Andreas

