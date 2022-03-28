Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447FAC433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 28 Mar 2022 22:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiC1WOV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 28 Mar 2022 18:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiC1WN6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 28 Mar 2022 18:13:58 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9458429B7F3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Mar 2022 15:04:01 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so21138748wrc.0
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Mar 2022 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutes-me.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pdiYyxTh86m+NIEGWa4kMk7Z3g4WVFSb+/XBZhtRwBU=;
        b=owA4QJ9xWpNZdaWxJSfeucdDznxo4G5UXJvLUT2wOjidtkJIsXfejLnTeZ4SLlWeok
         VGk2yKo1YVmpHi+WLTi8PT12OgDRsUpnNGTLyoq76hBm2K7+d6+hjhz6pzJnvRHbSVMK
         7tVXvQWgWsIQk0abosoHTBHlpmlSI4XVKu4FvUMcTYrcvuTQrqnG/MPK3OG4CKEH7Et9
         iYRmtJyU1wnRzWbtOi5DXnu3+ENRsrcV6saKhm1x73rlZZFRZei3HGVBkw6v3iRXs9Zm
         p1BBuPzJz9Nj7vOOxI2eAyUVX5BXhW0qJupCvOoRNB+vtqSgii2yUEwm01qk2REIOH4I
         wGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pdiYyxTh86m+NIEGWa4kMk7Z3g4WVFSb+/XBZhtRwBU=;
        b=6Mv5WTO/GAv13mwF3cyULOZStqZgdzDZzHI8ZETNSSSUcRWjiHZn6iBkdC6XlvQ3D0
         b8V3U1Ic2ZI19AMRrJmjiNa9KqoeU33rzxQfTSPj5a1AdWtKAhQyFV0ijIPxknAwuQ3c
         eHZ89FWoRpicsX3VYMfisLwSLLUTBqDKVhXtW/O7dsd7vMPgvkw5sfn7g32YLi8m20KB
         cypVfV1+xzGZudpnmDAp2lIKuCxdnmSg5tNQuWkZ+WtllzIjPWUKAp36Yx9UqmXadDiP
         dGCpoVvArnV9gQDz7592dwhgvFmEX/jhhnW9JQ3AOncKSGN9u+++BZ+tMl3shFzOYruX
         QVbg==
X-Gm-Message-State: AOAM531cAKiStXPfL20ercsNQnDfkdN5jmsaCou67uziF1TtUg0ZByNs
        t1ljFsJx+7BbGRoPlYaYRUjsS3PXSknPnoQz+R+tBJWf//g=
X-Google-Smtp-Source: ABdhPJxWEZuVEL9avgWZPd9r8dIBvSQaN1k5VjqSmv1EFvku86ShJcnQFUpbzqTCLYXQECKdpZZgwlwhhbhzGiaWDvc=
X-Received: by 2002:a50:ab16:0:b0:414:39b0:7fc1 with SMTP id
 s22-20020a50ab16000000b0041439b07fc1mr18895788edc.214.1648503520787; Mon, 28
 Mar 2022 14:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com> <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
In-Reply-To: <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
From:   Chris Suter <chris@sutes.me>
Date:   Tue, 29 Mar 2022 08:38:29 +1100
Message-ID: <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
Subject: Re: Fwd: Adding crates
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I skimmed that thread, but unless I'm missing something, it seems to
be pretty much "don't do it", which doesn't work for me right now. I'm
just looking to get something working and from there I can figure out
the best way to integrate it =E2=80=94 I'm just looking for the easiest (an=
d
not necessarily the best/long-term) way to bring in dependent crates.

=E2=80=94 Chris

On Mon, Mar 28, 2022 at 4:41 PM Geert Stappers <stappers@stappers.nl> wrote=
:
>
> On Mon, Mar 28, 2022 at 11:41:43AM +1100, Chris Suter wrote:
> > Hey folks,
> >
> > I'm playing with a kernel module written in Rust, and for the thing
> > I'm working on, I need to pull in a number of crates. The most
> > significant of those might be some async ones: (e.g. futures,
> > async_trait). What's the best way to pull those in and get them
> > building with my module? In particular, I'm interested in how to
> > structure the Makefile to make it work. Are there any examples I could
> > follow?
>
> See https://lore.kernel.org/rust-for-linux/CANiq72my9N51hhryv-Cp79eUmPVCx=
6q=3D0fJrhkzmvT+nVPq+WQ@mail.gmail.com/T/#t
> for a recent thread "Using 3rd party crates in an out-of-tree module"
>
>
> > Cheers,
> > Chris
>
>
> Groeten
> Geert Stappers
> --
> Silence is hard to parse
