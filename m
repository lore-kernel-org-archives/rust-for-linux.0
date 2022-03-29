Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F90C433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 29 Mar 2022 15:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbiC2PtZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 29 Mar 2022 11:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbiC2PtY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 29 Mar 2022 11:49:24 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88673488B0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 08:47:41 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id u13so3681086ilv.6
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PNt+cFOCLNs9ePGcf7dMzXYIOVcZQ0HEJpc57hb8lqA=;
        b=n5he/n8ddh5Dmjrv4IPKSXnvHOK6AZ9hrSUUvOTSeV+3u+aoGZEJabxnciyV5EjN9E
         a821ifefQ33Tas4yOBpfoWFdpXGo8xsTjDBY/YoN7bNKxtA0QZ3cXrwXnQ1geR81B+Lv
         W27zBZAyh22rKYe6mlmlr8tp/A9S5QdRHas+dLDUSc61NdFX3LOQ2leAhm7dmpT99bHd
         SMvKXE0Z5NhX2UXj7ZjmpefwsDLlhQ//P83Z0YXIhPv0wtkPCsmPUTj3Eflna2b+zt5Y
         3NCOa5hWFs1mcUXDj+YtKUqJu85L7JH+u42hEULmYeLO2EpgG6nIUyRHuNLWlFORddUg
         tYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PNt+cFOCLNs9ePGcf7dMzXYIOVcZQ0HEJpc57hb8lqA=;
        b=ixJArR4EtWk12WCUI2Q3Q07v3CyqP9dKo+I1exBpufsV53pHrxgow0pAvWSlPxQvFH
         SMsQ81yE3tW96QYHQlC969HEwr00RT/IAydhXsAO4ACk0VbiXEMzT8gde+rXDwD29slX
         u4HkheZtol0JdzMWWV25VYOgyRjJm4XQIDaRTRb6IsFzxtStpgaoF7EoonCNbgWG3CFT
         58Uqo+Z9Xumo2dHhzosRBnPERk/mhAdLnQgi61CTsr7+gxcsUv+0PDsv8+OD0DKvBl4f
         aNW+K4RTCuW7uA3qafYWOnC/0QHrWRohbLExjbOwypXoPv3k65MUmumsp/YYxT/UojdJ
         Y5XA==
X-Gm-Message-State: AOAM532BaiKy2BgvhtHej4yHTn+Ddp/g1g0nG7uMLcwBvJCPDYH3gZ1u
        IWN4ykWzKBUWIh2TW3a6hg5x670GbsE3U2AHnak=
X-Google-Smtp-Source: ABdhPJzpJHk3Z0XvsfgkvLTbAlXEr8rL+RxAJwkKHNUMIIg9aq3TiobkR1M97bGH9PWnVZgP8Sjo/oKfX5MGv0vRpz4=
X-Received: by 2002:a05:6e02:170d:b0:2c9:dc15:78f3 with SMTP id
 u13-20020a056e02170d00b002c9dc1578f3mr790054ill.72.1648568860864; Tue, 29 Mar
 2022 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl> <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
 <YkKXvnsvr0qz/pR2@kroah.com> <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
In-Reply-To: <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 29 Mar 2022 17:47:29 +0200
Message-ID: <CANiq72mrBpJm_6rjapicBoO_mkg4_hEpi9aRTAkj+gtiGkC3Aw@mail.gmail.com>
Subject: Re: Fwd: Adding crates
To:     Chris Suter <chris@sutes.me>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Stappers <stappers@stappers.nl>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 29, 2022 at 9:49 AM Chris Suter <chris@sutes.me> wrote:
>
> I'm interested in quite a few crates but the first and perhaps most
> significant would be futures. I'm not necessarily looking for a
> "generic" solution at this point, any solution would do =E2=80=94 just en=
ough
> to help me make a little progress and then maybe I could contribute
> back later. I can probably figure it out myself, but I was hoping to
> save some time.

If you are just looking to experiment with some third-party crates,
then as mentioned in the other thread, what you could do is copy and
adapt the code. For instance, if the crates you need do not use Cargo
build scripts, this may be as simple as copying the sources of the
Rust modules into your kernel module (which is a crate), so that you
do not need to deal with build systems.

But if you are looking to do something else, then please note there is
no plan to add support for building/linking against third-party
crates. This is why we ask what crates would be useful and why -- so
that we can consider adding similar facilities to the kernel (possibly
importing those third-party crates).

Cheers,
Miguel
