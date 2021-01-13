Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB763C433E6
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF5123434
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbhAMOlm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbhAMOlm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Jan 2021 09:41:42 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0A9C061575
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:41:01 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id 19so1740279qkm.8
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lfbK2QHjHHt69r0x0NrlPdO9ASsA8Us39LQzm9PHX9M=;
        b=feIKj1yUkv9e0TKD+CZC70e+he0QXoCJCEDXxburlJ7zusguvQm3uZpMEcvhcrcPEY
         +yXJu9zo59DRQqEnzfqE2CDesbu9NLcluCfNCZLCuusWC/abTfBQwLKCGKkB1Jovjjci
         HricYmK3Pt8dTxwlx4AKWMtiDbsQlCvb+vfwLze4YVnxXKah/BvesaB8S5ahpPb5e1VT
         /9jjSKJ1JHwXU9MKufxKVPp3iqBrziS9CMV8UcvqHRLQGs9FYH4ByNEr9523zNb5iKGj
         3FL5PhMXpcq29KAZP8LgZR2DE3ROkb0enb2QyjZbePN0UwGmwNM0NkJoh7zMlgYw4gWs
         XWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lfbK2QHjHHt69r0x0NrlPdO9ASsA8Us39LQzm9PHX9M=;
        b=YVmbBQj0ZuIjovOOICe14uWB35rWNLvOBDOE4s3L6ncrW6KR3IO+AuTDjXxjtmhYam
         2pjm79ief92g31pidRjPbEEmWE32dH4qMKfOCYSUPhEPTuO14Kj3GAQ5JeqqTyUfppns
         yeGuqLEuoCrEqFKSKkgQ2FZRyqU2B6Sai1ji8WnH+kl+jq9dr74lFMI/ggF5+2ZYX81f
         XOAsogMuTetTmtOhjlRL2Xe+SL3fMOXjI4rWONbxAAI2x0rxT1qQ/24IEajE547IRjRw
         utBHtLpoOq0lBuxvJkKEvq6YaFqNrLPrbAOO6nQpk9RQjGDfDTQ5OVf6jZx4pZrSQxtK
         DT6g==
X-Gm-Message-State: AOAM533ezD46CElgpR+NsKQGFvnbm+QdSTPaoJidHRqoZn0BdHzUnA9z
        sDlKbxVdjY0n8Zv5Nvj71hLLwW0pOxrmK90yxcE=
X-Google-Smtp-Source: ABdhPJxrWLmCN4nf7dFstE81bfO1Cd0kNEmkvQUQI2FvYxEZBjw5RRBX9Jg9tSBkiC90N5GhAt7k1Efeb2QbMP9GLvw=
X-Received: by 2002:a25:ef0c:: with SMTP id g12mr3743590ybd.26.1610548861049;
 Wed, 13 Jan 2021 06:41:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
 <CANiq72=Xh9vSf-pRFOZ73qqhZ9ushKfM1ei-0TqYxNfLyHJmow@mail.gmail.com>
 <CAFRnB2XcWKrPCBo04iVr9Z4xNvjMw8pFmqCkqB_xsaZJKc_CCw@mail.gmail.com> <CANiq72kdNJ5h0EMbPoXGepK_YAh=Wzb8RXvMz3jrxTDUhrmMRg@mail.gmail.com>
In-Reply-To: <CANiq72kdNJ5h0EMbPoXGepK_YAh=Wzb8RXvMz3jrxTDUhrmMRg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 13 Jan 2021 15:40:49 +0100
Message-ID: <CANiq72nEEoQeyGDHanV4O7QEFOJz+fbE=1jVUPLkrr-d4-NQfw@mail.gmail.com>
Subject: Re: Upstream Milestone
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 13, 2021 at 3:38 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In case you wonder: the `-` and `=E2=80=A2` symbols were chosen as the
> "category": Priority and Kind. I picked them as a single symbol to
> have something short and elegant (and also make force GitHub sort all
> labels by category :-P), similar to what rust-lang/rust does with the
> letters (I-, P-, C-, etc.) Hopefully GitHub will implement label
> categories...

And in case someone wonders: not all symbols seem to force an ordering
on the labels, so I had to try several pairs until I found one that
worked and looked not too bad :-)

Cheers,
Miguel
