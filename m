Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C741EC433DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 24 Mar 2021 12:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A05E161A06
	for <rust-for-linux@archiver.kernel.org>; Wed, 24 Mar 2021 12:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbhCXMli (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 24 Mar 2021 08:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhCXMl3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 24 Mar 2021 08:41:29 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872E3C061763
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Mar 2021 05:41:27 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id m132so13930353ybf.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Mar 2021 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=hKzESqI7iY6YLSXWh3FrKcmyv4OAdeN9opeUfivnQ1M=;
        b=k/4prooiyzbmkbyw9a6L4JCGwZos/0vvsMM+CBKzi0IpePstUvkbcT0EX2euVurq1n
         pCLrMxNTZq/AUbIDYysQMZbFv1LmrUIMfcmgzm9qQl69+gVD/9OD9pEeSxQmwX8otN+S
         D/XxdPf1QGJbShyohhxGLBicr/Az8TS0q4A8GZj9VyGHlYlGM8PkJMMk7FWFIG9+KA37
         Cim1oVK4gQakHJ4HpJ7iCG8wE6ey2rK/fgd8WnbM8XqmmyuYIhEsie2NnwvVsqVW7vdr
         vmbRdrkxuCohYbDmUKj6DN+EtTsZ1IcR0JFEZ18wkYAMetHx/cZKdD+PkgJibGuUszJh
         ILBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hKzESqI7iY6YLSXWh3FrKcmyv4OAdeN9opeUfivnQ1M=;
        b=muBQeQDGhqdVNTd3KPMdRUQqB3N4hOV5Xcf1wZhYvoY77fHlbk88ptNqdl0N+D6Nii
         1hRg7md23zZRi07CA++6oEPOAfZaT4O4asthZyB6kZRXAa9862CO9eyLwaS2OKtxtMFz
         RRfnMECMTdalJv30E3kVNz/G8FCJJ9H8C+Kykc2SKaoXltzpQllhisjT/yWCzUU9ae2S
         3TfRfI6vQjtZqhOJ0YnImwDHT5vafqb9DMAtfAC8seWjQzV0j3ixuCpQr/Neh4ldbDNu
         QuNgTz+xyduXC5HtnwfzZDVrlpL9R2PVb4xbZI5OfL94hdgUae5w9juw2wxVKIJXjNHZ
         0dFA==
X-Gm-Message-State: AOAM530cJgKNHm/bvkRfle/OFyASV9+JPZCg6aqIsQURkS2/AX+ms2NW
        31z8qj7qnOl4voRZr2tdRC0iL0O6XLjCb/X2eVw3DiOHwIVtSg==
X-Google-Smtp-Source: ABdhPJwWZWgATFIEn6ekiuomS8vBjM9iI7nTf4O07rUlgtLbVV/jXrSBZfWQAiO30rY6XRgGkey13tK1QdMpDH8nyEg=
X-Received: by 2002:a5b:449:: with SMTP id s9mr4564872ybp.115.1616589686711;
 Wed, 24 Mar 2021 05:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
In-Reply-To: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 24 Mar 2021 13:41:15 +0100
Message-ID: <CANiq72mJMCgZxKyRDyQnkKi5U=6ejZq5yFRx-UyLC3yy7mYR2Q@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 16, 2021 at 4:14 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> so I propose Saturday 27th or Sunday 28th at 18:00 UTC like last time

Let's do it Sunday 28th at 18:00 UTC then.

Cheers,
Miguel
