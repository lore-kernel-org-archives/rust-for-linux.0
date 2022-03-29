Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D37FC433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 29 Mar 2022 06:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbiC2GEC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 29 Mar 2022 02:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiC2GEC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 29 Mar 2022 02:04:02 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FCD33EB7
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Mar 2022 23:02:19 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w25so19404162edi.11
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Mar 2022 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutes-me.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZyCpjpHhHEhBDhaaj89k0RTIohXp1+JgMt5pkX0r4UQ=;
        b=bwHllUzG/K+3wo9T0so1BSHweL3cDcOeFD7EeNPZLIUqQTsudkk4N98V3xWPnVevKL
         /FUQgkVF2mhbCGgYbSWPDqyKb4d4VtSgP5RTdzbwG/oU64rRsPwg6vbzYj741b2EzdMH
         IwLvtzWqq6fFF+im/5+NPhusb5a4iaQEervhDhrGi/USPe1wcrln94bIb1buMG+bnaat
         keubmjVpZ0cS5GgQXABhJINaaHcbHkFFxr/PrWjlFxaxrP6xYkNrnGO/YS6XcvwlnckT
         aha7le0N6bf9t16U2/iAlw1v5BX1zGto+d6A8dk0LmKtDeT4Zb7EKSDKpPSElBe55kYB
         dpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZyCpjpHhHEhBDhaaj89k0RTIohXp1+JgMt5pkX0r4UQ=;
        b=OM9fYd/6DIrWI5RzRM2fKk8LZyUHYAr/NAkTYEFb9yiRhOD8Q/My10G6NhHUnc9dXZ
         dU5N+eunMFPTohu723OEnVG9+HgYNmcOZe2gG6PEdAoZUDE1wSFQAU0X/LYL41DtUSQs
         kdP6UKTWD0RyWDezPujyXy3sUNuwKQJqj27jp1Hh3c1AT9ixHYx5XTtIxntbDHU5WUM8
         gAzNIRwzJzSK8e0kuCOdXPwcxA7LInCQ5MtHonTU6QNbFLT0swk+9YlZTTr9EZJHPfAI
         3qOUcUwHs4x2gsEOZ6fxesH/auOuYA77QaUKyk3nMRk3+AjL7lOlk7Mnr5WPANslzlTL
         tmWQ==
X-Gm-Message-State: AOAM5321ptQWIWUEFlUe3w2G/w5neeW9KzMQ6NaMTwZUTFZkpx4rsc9/
        vPzsotznQaLB4V8OrVhtlbMN/cK1cTFmuznfCm++7Q==
X-Google-Smtp-Source: ABdhPJw42pEKFB5erkdMM9DoUzXPRU8kT8HXmETCy7GpDEUuCF9sJ59Jp9RuXH32Lvk6H86A3lqUG9jod7xBfDapKOE=
X-Received: by 2002:a05:6402:84f:b0:419:638f:2bd5 with SMTP id
 b15-20020a056402084f00b00419638f2bd5mr2301815edz.283.1648533737760; Mon, 28
 Mar 2022 23:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl> <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
 <YkKXvnsvr0qz/pR2@kroah.com>
In-Reply-To: <YkKXvnsvr0qz/pR2@kroah.com>
From:   Chris Suter <chris@sutes.me>
Date:   Tue, 29 Mar 2022 17:02:06 +1100
Message-ID: <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
Subject: Re: Fwd: Adding crates
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 29, 2022 at 4:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 29, 2022 at 08:38:29AM +1100, Chris Suter wrote:
> > I skimmed that thread, but unless I'm missing something, it seems to
> > be pretty much "don't do it", which doesn't work for me right now.
>
> Why not?  What is the deadline?
>
> And what specific crates do you need and why?  There is no "generic"
> solution here other than "do not do this."

I'm interested in quite a few crates but the first and perhaps most
significant would be futures. I'm not necessarily looking for a
"generic" solution at this point, any solution would do =E2=80=94 just enou=
gh
to help me make a little progress and then maybe I could contribute
back later. I can probably figure it out myself, but I was hoping to
save some time.

=E2=80=94 Chris

>
> thanks,
>
> greg k-h
