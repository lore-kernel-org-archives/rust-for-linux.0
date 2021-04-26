Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E214C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 23:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38D3361073
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 23:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhDZXzP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 19:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhDZXzP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 19:55:15 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F1EC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 16:54:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n2so4445026wrm.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 16:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=ZTkydfT3YUEAeEeIZwpMGzNBcpvoKyU94bJQ5fpSfR4=;
        b=UnW6Jm3PT88dfKlxb9BRxMBxWPQOxRgDnwxyJhVqph/BGV7XL/HRCUwAVKg6AyjK7y
         jkJokpl7JUfSxATUX+m781pqvbTLLqxM3RezYP8VhfsxYygf3SJ5CZmkGNPmuvP3yP+6
         KA5x4P8ccMFVokYs6pyn33N7S8dJWW3mU3nrY5vvTWgKiFtNKu3qMxu0iKkKXzU4jBDV
         vKql+iaMC7Igyisla+3zUXkESe6XoYfrAe1+2xA7MyR7tSjoLorALDjZC45O7aTgLG3C
         UjRxMTu5VgOTAJW5CVemTaiBb273z9RjSQn42EgDPbp9gVo10Y/81sAze6Gm1fW/84zw
         o2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=ZTkydfT3YUEAeEeIZwpMGzNBcpvoKyU94bJQ5fpSfR4=;
        b=iFetaD16WB420QsmIg2kNkCtPTLC9wckQ+t7QO3SqUDntmcUHVfycP+gM7c2scFyyR
         JOZwvUiYAiY31v55GOMdHw+X1SGqzenBExdUP4d4fkp0E3BX+bRgDbybvTWCBVJgUiH2
         TL++VQu6yZNBzJ+G40IJnO3jacsA8rA2pPEj0nZ/Z/q83QJMHQlD6CY4MqG3TE6BEKGE
         mXHGnCgCyu13G4MFit5IaVnDIRamXmWESIbyLoTJ7Nj02B+hBlvqU3EJOTw6QPlOt1wT
         j8R/aTMRzOH+eyfJ319gbn9uVxVz8XWX5nUGSZaaQJifvoaJgIks7oeMsQ6Uni4VOdeH
         muXg==
X-Gm-Message-State: AOAM530gf1bUIvfO7TGDjN98+xVILOhbjGqyx1YJyCRbS9nCJLpp7Zap
        RQHwcH4WEufH8PIME1O4b+BDtlAZ7P8=
X-Google-Smtp-Source: ABdhPJx6HxvcUtX1bak8XYVjbcNoJrQ88zX5be9zw8IKkgqvmzqjijnlZ8F1SbfSo0/f9Thvc6Ay3w==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr26565987wrw.307.1619481270691;
        Mon, 26 Apr 2021 16:54:30 -0700 (PDT)
Received: from EDI-InfinityBook ([2a01:4b00:ea36:6c00:56e9:4ef3:28ef:7ef6])
        by smtp.gmail.com with ESMTPSA id a142sm820699wmd.7.2021.04.26.16.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 16:54:30 -0700 (PDT)
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
 <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
 <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Kajetan Puchalski <mrkajetanp@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [Question] import third-party crates in kernel modules
In-reply-to: <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
Message-ID: <87tunsr499.fsf@gmail.com>
Date:   Tue, 27 Apr 2021 00:54:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> Please note that we are still evaluating how to approach this. 
> The
> best way to get involved with high-level design is to join the
> meetings.

Hi,
Is there any way someone interested in the project could watch or 
listen to the meetings?
I don't think I have enough knowledge/experience to contribute at 
this point
but I'd definitely like to watch the progress more closely.

--
Kind regards,
Kajetan
