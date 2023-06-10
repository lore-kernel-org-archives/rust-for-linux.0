Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53978C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 11:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjFJLTn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 07:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFJLTm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 07:19:42 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFA53598
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 04:19:41 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-56cf6f4211aso2373147b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686395980; x=1688987980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85lnm7EpbfdyPMqUDDckXuNVmEOYXizFOsQzIv6KFak=;
        b=WZVObSw3fcCCPcYJGfvVLutI5uFOh0jDRjFraUqORiFSDnQfEMk5Gy9z17rNG7/MFE
         f/dKfyg8WKJS+idzX4Cgw1mQus1YXiDBb5tA3efHXBzyN1MCCevFpC5diCWmPwF6QSdi
         s+owPRC0HNVd47/avA+frhaKYSJMh9rjme5LC9klSPB/3EN+b354UYRGBQZgm/2wA3XY
         MpMCCEgv6KWChmvDSPj2hHmrQycFh+5CUQozCVi9NjBktmH1/nnw1wzPfxpCehNgiTlx
         dnejar66Sa2EDOdoP2bkgIodXqNiz5XicWCvREC+aRtpaRDZ2RgdKm27IiKihm630DnH
         C62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686395980; x=1688987980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85lnm7EpbfdyPMqUDDckXuNVmEOYXizFOsQzIv6KFak=;
        b=lYC1NHVxXFkXc7J2D4lLTZXCwM1w+mWqFYQE8DvJn8X06Ls5G41UYnEF5bpPVmavJ2
         8DX35HckcCnmPm+V6Jl3mHfhS1qrMKu7PTuTZopi5XA9+EH/e7TSE+ost6KQQmNNlT7S
         GicCVHTv35qZ2yj8qgy8Bq8lva38ysKp9hCM0vPkhM9FvoI0K7CwTvqT3pysJHQ1waNP
         JvbTukpaM8HZlmanZP44n6uFsQku3wWzTJvtXj+xIkG3eghxMBAzh2x7juhYyqXDLlI4
         IcTpu2ecZhgTARYPnZv65tu8gOsvvWNc7fLXc6ZBtvIF0yXhXQM88h/WITD/fq4zDqeU
         W/iQ==
X-Gm-Message-State: AC+VfDz9kp3I3xcr6l4rI35lg9zpzg1V12E3nkCkot4GFy80NeatVrB8
        29GYyfNnV+AJ+3xdKrXZrLcvyhXK2izOdJtbi3A=
X-Google-Smtp-Source: ACHHUZ56gLsWc0OSQiigyj3KnNeSObF1p8P3CcsCj11e5WmOzDUcwYnZj2VW+e9rZ80tIfvLi9lRTyFpcDdJ1skpzsM=
X-Received: by 2002:a0d:e481:0:b0:56c:f090:36eb with SMTP id
 n123-20020a0de481000000b0056cf09036ebmr1285637ywe.36.1686395980275; Sat, 10
 Jun 2023 04:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
 <87r0qjisrd.fsf@metaspace.dk> <CANiq72nrmZkTHgXSpeCeueSXeQ+oFfp89BZC0a_pRpMbb+txRw@mail.gmail.com>
 <87mt17ipd5.fsf@metaspace.dk>
In-Reply-To: <87mt17ipd5.fsf@metaspace.dk>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 13:19:29 +0200
Message-ID: <CANiq72kfc7rLR-zFQhontV8X6YXOascci2wRPzZYy2gVGzFFgg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
To:     "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        "Ariel Miculas (amiculas)" <amiculas@cisco.com>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 12:27=E2=80=AFPM Andreas Hindborg (Samsung)
<nmi@metaspace.dk> wrote:
>
> I got it. What I was trying to get at is: can we fix the rust-for-linux
> list? Why is there a size limit? Can we increase it? Better to fix the
> issue at the source than to add a workaround that people are bound to
> forget before it is too late.

I have asked the admins about this. Back in August, the recommendation
I got was to Cc all patches to patches@lists.linux.dev. Also, the vger
services were planned to be transferred, which may have helped with
the size limits (not sure), but I was told that effort appeared to
have stalled.

Cheers,
Miguel
