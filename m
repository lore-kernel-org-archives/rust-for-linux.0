Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC42FC433C1
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 09:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84DF161A0A
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 09:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhCYJCn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhCYJCX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 25 Mar 2021 05:02:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2234C06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 02:02:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h13so1537289eds.5
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=u3jA3uC9Awbp0jq4EVSFIoJhGWZerCcMkQRTdRTdsfY=;
        b=HhnYMtYGDhTNCjnCCeUmGuJOdEPEHHp22iC9qZYJYH7KxHrsJ6MOS+DHwZE+5phpD+
         sHbbLWlv/ZZ1Jt/+C1F+IB/WPCpx3Qltb/8aPR4chU0IU+3RzNx6c+D9f7TaPG8nFjdi
         ZmSbWy/qbea5y2p/4QoooCgP3rELmVyss8dmqeHHgDCez3fZ2T+bTizD/ic/qCkjChrf
         FRRa1ZOvMU/8zXeAReeKA+IKTc7VmjMOJ7VauE5hM+q9ZpNMWXdMP2IoJ/OeMhdVB1+m
         2P8Qy0wtKE/nlqPY25glcx8zCP6v33eoCsrjaadGA3MYkcMHVycP9WRFeIu66yb5Mimm
         0TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=u3jA3uC9Awbp0jq4EVSFIoJhGWZerCcMkQRTdRTdsfY=;
        b=tC9Xnzk5DjvZAVuSN48lcSLlOp+P3Tc+wlTZFFp738nLjp3fiHymyClHx4K+4Z98M/
         Lmz7uesqquPCdEdMECyYoSblhbaLHb5F3ZjrsLpU5JQ2jXIMta9zZ2nlPldD9aOdgANw
         qJ3WWOHPB/AclwQC6wKJLj9bFh8loiaQafrobhXfboDmb1nMMVFKhGnGKSFHb5i0cYan
         /MNHtgkvbvSk0MaUO00tXraXy1xU1+Ye0lDQtNLK2zfA+o8toGD7IKrLpFwrJo/8BaUQ
         raxGNswErw7oU6FCEXOc2ufEYsia7MO6vcR1gtaY9gUCTdhvR5hpO0Om4fWFGRWl7ghA
         2RWQ==
X-Gm-Message-State: AOAM531Bnwz4VeVwIbTOwv4mL3LnmcBlsRlkoq3gZKiam109XQGmPYjq
        8CPRDo9UO4RIedBS/Gir2RNgTMqILOhXVA==
X-Google-Smtp-Source: ABdhPJwN5iK3cjguJiyHwe/OKHSA8Z8d0k8VNNljIthc1w2vLZYtug09gF1hozb8C3YPPo99A7Ip4g==
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr7926534edv.336.1616662940516;
        Thu, 25 Mar 2021 02:02:20 -0700 (PDT)
Received: from ?IPv6:2a02:a212:a204:cc80:b802:7fa:a64b:7a7f? ([2a02:a212:a204:cc80:b802:7fa:a64b:7a7f])
        by smtp.gmail.com with ESMTPSA id c12sm2497548edx.54.2021.03.25.02.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 02:02:20 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
Date:   Thu, 25 Mar 2021 10:02:18 +0100
Message-Id: <2EE61073-1BD9-46C7-984A-1C0861B33876@gmail.com>
References: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
In-Reply-To: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel

Are people in this mailing list invited? Can you share the link here? I woul=
d like to join as well :)

Thanks=20
Kaviraj

> On 25-Mar-2021, at 09:17, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> w=
rote:
>=20
> =EF=BB=BFOn Wed, Mar 24, 2021 at 10:12 PM Geert Stappers <stappers@stapper=
s.nl> wrote:
>>=20
>> Okay.
>>=20
>> Where?
>=20
> We use Google Meet -- I will share the link privately.
>=20
> Cheers,
> Miguel
