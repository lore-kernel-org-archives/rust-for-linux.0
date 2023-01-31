Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9AEC38142
	for <rust-for-linux@archiver.kernel.org>; Tue, 31 Jan 2023 18:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjAaS4P (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 31 Jan 2023 13:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjAaS4M (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 31 Jan 2023 13:56:12 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1692C5421F
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Jan 2023 10:56:10 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4b718cab0e4so215943697b3.9
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Jan 2023 10:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np+3tYk9rn7yw5a9dv/jRZyc1FKn78F5195S8Kv2g9I=;
        b=Ochb6R09NK0OdReHe5vdBBSpPnqa2joHM423FSqEyiyOrX5WeqJUbhFBprGFTgReZ7
         I07ox7KqxtCwrKiX47JndkObr7/r4OzhpwdHn5cFJ56pt1OK7oXa/wX9BOZH7JOrw1D/
         fipo1gjnBSZWLvwPlGwLFzwDzoSLQ+n/c/fyDLY8nr8Tk9En5Hi4DIrKty2St7Inu7sn
         YNp7wRu5HMntY9XRZTV4W1Va4RVy2QMIZz4oMtRkwBRxefNXFOrvuwYth2LSgvrsUreB
         Gzy0ozYP2nThjQEjlVD47sQhljMN4KjhFgreycexxCVsV/4Idz/01ZVI3esX6r58JNIN
         Z+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np+3tYk9rn7yw5a9dv/jRZyc1FKn78F5195S8Kv2g9I=;
        b=IaxK7uY9KL6YNf2rTVWLhMND/TGkbb+V3TCr5Weh8ETil/3eJchqrv6czH9USOn/09
         FoiveSE9htmQD25jrJ4VcfNnfBewwdqEqU6fEAoiu36wjwfLIGMdLqZ6zOIVYD3JEm+A
         cx65eGrFJ8jHUaGQThIoevt9faEiKbGg1V12wmVRwdX/6psnvq1zGmvGuupqLuL0s//r
         RhU9uEmvJ3bIP5Mp6EnrfAJiTTTGHvE6Uyxlo5KvOwAS/jbc3IouqYrq9elYdk3pIdOZ
         ZMKKoRvh7FHFwPeu9PnbLcZZBe0cyVOhM4iqDtsJ7gt+8kslCdJ2nWwpF9ZEEbN+Qo4J
         8RCw==
X-Gm-Message-State: AFqh2koKAwVzhBsWZrQrSYhj0BDA+WPQ+LWmAsCm7cAYFzb9oZpAzMln
        TkSSQIq/Rw2VWcAdkrXn7VXLOqqP7LKwqI4p8DI=
X-Google-Smtp-Source: AMrXdXupRq+9jt/GnEAZKmraD3Ja5cNIWpPfgQTKKD4ARUliYYwOxv0jq+1tstSPuSEtl/rgmL+h0cD60I3rfTH6lok=
X-Received: by 2002:a81:bb54:0:b0:506:c44:ca69 with SMTP id
 a20-20020a81bb54000000b005060c44ca69mr3381915ywl.67.1675191369275; Tue, 31
 Jan 2023 10:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com> <20230126163552.GD29438@willie-the-truck>
 <CANiq72mpzRjT1ZHCHcGrOJ_71eQPR_-WgP=5YfDWDBNR6JNP4w@mail.gmail.com> <20230131161905.GC2646@willie-the-truck>
In-Reply-To: <20230131161905.GC2646@willie-the-truck>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 31 Jan 2023 19:55:58 +0100
Message-ID: <CANiq72=cJPCLmbyAJhY3FEwMS4tonPtJspMG7Kb_EAEZ2CFwhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
To:     Will Deacon <will@kernel.org>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jan 31, 2023 at 5:19 PM Will Deacon <will@kernel.org> wrote:
>
> Please confirm that this is the case, but I really think we should be
> aiming for that rather than starting off my specifying this stuff manuall=
y.

Let's see what Jamie thinks and if he can give it a try.

> One thing I ran into while playing around is that 128-bit types aren't
> supported with ffi unless '-A improper-ctypes' is passed. Given that we
> use '__uint128_t' to represent the fpsimd state, I think this is probably
> something which will crop up as an issue.

Thanks for giving it a go. With what Bj=C3=B6rn has explained (I see the PR
he linked has `user_fpsimd_struct` as a test case, which is nice), I
guess it should be fine. We could also add some tests on our side to
make sure (which we probably want to do anyway for other reasons).

Added to https://github.com/Rust-for-Linux/linux/issues/355.

Cheers,
Miguel
