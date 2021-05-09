Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57246C433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 14:21:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2902E61055
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 14:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhEIOWx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 10:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhEIOWx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 10:22:53 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D65EC061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 07:21:50 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id e190so18187210ybb.10
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kyaF2P7ThiMl/iYw1QgCbJL1KUqxm3TAreVgkZOupTo=;
        b=QqZ4bMfJNgl/1U94aBe+nbm+LDWzhFcxuxm/YIeajvlvM2OcIEtjlFN3eFTbMu6qp/
         /eSDBG5KLPoGD4naVOG2XdpxB/rrbxZCtWCto5rzWnP3M4tkzr12dTm+go/j6aOAHVGj
         EAbebB/GQA/o1H08us20APzLTdQrSPbZwfZrVQ/o8nFLrPFPp28+DpAq0tyE1m7fm9V+
         OObR6ypuvsyK8aGMYBS78MoLZqifpn8saqeYC3j23EQvQpx9q4xyOC0Aiy7zbBu4EvYN
         ZDg5frKXxViUiYTcgmLH3xc2Gc2X+z99qTjmYpQVhDzdXmf2Mjy6m5KDwYquaxdZ8ikL
         k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyaF2P7ThiMl/iYw1QgCbJL1KUqxm3TAreVgkZOupTo=;
        b=VWk+w7ZCtrgxoEG4zQKyNlzuYk84YJXBTdxBac66uf+qiJ7NyVGI0qvfnt0prvM2ds
         885ModF9K2K7UQB7ucqNJifvexyF/gteFvY/PGvr50N1I0F4tQEdke1eiSi2L/6lZzwY
         KGQafQD29ZVUIW7zgjTvl8UlOQOIfMy3yj7LLIEjaSsbkO9Th93sJ6gX3gKWK8JmznyQ
         XVac64JWVaPi+pEFcinSkM9nZqp78COYOUc5nJqe1usQgr4AvLmJ21Zar6O8isVdivp/
         X2b3iG0sfEKHQkNHQIjYSt5h6fcm/CTL+IPX8FFerVXd1TGW/gIn1L2o2JDe1UqJeqWs
         iSBw==
X-Gm-Message-State: AOAM530P15fxMbc0/A/pJNqsSy5paLHFW4+zEMkOObQns/9qxbFnyjCi
        m8GUK0eHTKomXW8EaERGL0VottxTRHZ8TbeHWxE=
X-Google-Smtp-Source: ABdhPJxE4n9ttFP8MNe3MbNJi941LVNHCy76rLpO+nhoxsJGwh59TIyRG6iIuU1um3CfstjyCUvlY/NJHhZjsB4eEUM=
X-Received: by 2002:a25:880f:: with SMTP id c15mr25522745ybl.247.1620570109494;
 Sun, 09 May 2021 07:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <97E4F6F4-2391-4053-89FC-BB00F9184340@kloenk.de>
In-Reply-To: <97E4F6F4-2391-4053-89FC-BB00F9184340@kloenk.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 9 May 2021 16:21:38 +0200
Message-ID: <CANiq72=8M3ALxrmdYvHNfDVX9F4Se0=a-EbzrZPgVv1xsh932Q@mail.gmail.com>
Subject: Re: PointerWrapper Trait vs croe::ops::Deref
To:     Finn Behrens <me@kloenk.de>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 9, 2021 at 12:25 PM Finn Behrens <me@kloenk.de> wrote:
>
> Maybe we could also remove the result, as it would possible be an invariant, and never happen as the pointer should already be valid.

If it can fail, we cannot use `Deref` to begin with. So yeah, to make
the examples equivalent, the first one should not return a `Result`.

Now, assuming it cannot fail, what I mentioned in the meeting is that
with `Deref` all this compiles:

    wrapper.deref().number
    (*wrapper).number
    wrapper.number

The question boils down to: do we want this shortcut or not?

Having said that, I am not sure I understand the traits shown here.
Isn't `PointerWrapper` meant only to save a `Box<T>` and similar types
(which already implement `Deref` themselves etc.) as a pointer in a C
data structure? (which is why `into_pointer()` consumes the object).

In the examples shown, the new `get_pointer()` does not consume
`self`; and `main()` creates a `Wrapper` using `from_pointer()`. But
the idea is that you already have an object (constructed via other
means), transform it into a raw pointer, and then later on
re-construct the original object back from that pointer.

So `PointerWrapper` trait is like a `SavedAsPointer` trait, if you will.

Cheers,
Miguel
