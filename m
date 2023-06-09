Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228AEC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239354AbjFIKIW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjFIKHm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:07:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080D36A5A
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:57:45 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bb2ffa1e235so1505455276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304664; x=1688896664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlvIlo30B3J1xgAA5R6w1LyLvjPIbn19gZfZpVdh/bE=;
        b=q1yrfppNmrfXI7zACRSDyAcQbWwxtWSxBhQ5188Rk2RakKNARxpb4/P6LUFnxBQlKc
         nPiGROZo3S1KkuImFE64UuB2sV7D4uF9skv7/ZXhUrwYo6kt+gRKj9sN28JS1zC/HKua
         XFesMF2v5HeZt/Rt8fZkvZl19OjIPRD99Gy3J5CaAUYh6NmIgpEry7DX42mP8/ZMDCOl
         QsfysEHPLJlXyqG/6VNoDHMHhMP3bQsdDaw15DcHksyjq+0gLQVrtJd0ZW7spPETvc4V
         o9S9xpsW3By+RzhmTCzam+YSNsJYK4U+cXR8ZZKXceSL52+91EHQVM6MrG955xtq7C+o
         xAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304664; x=1688896664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlvIlo30B3J1xgAA5R6w1LyLvjPIbn19gZfZpVdh/bE=;
        b=kuc/kJxbIUOSIgyDMzKdnBypLLbSHwBei/Q+2ak1D1d/TTvQY9Y6sKTU1O22/vL995
         lY09NlWFHCjzaowqcuLFExlAhrk/rTVys5Ty+NbtCo2NiU/+ZsoNsrUHgClmYjSETwUw
         9qnoY5FCB4kefkCoDyQIsC1pMm27X+1xqp0PRuP2kwGIdcxmWFiYXaZ54Q8EkI+zrtXl
         MiPwFJ9hFmAMOpV+S4jmn3T4XXV5RAOxr6KE4bkwQFJkQOryBSoogktptHEaHDcgS+si
         TIEvcmoDssPnj6947QKOdvpZjo2rz03sRnY09N+1ipxvyLqUxSOOPY6xmEE4VFPX2jBW
         TeMQ==
X-Gm-Message-State: AC+VfDypPlRA7tnoOFwFCGJu9wcqF/qsmpooA6VtKytrUIyILm5PGC6E
        MfeIxSA03W4ArnqU7sShHBRezz1mtLfLqbdZ/B0=
X-Google-Smtp-Source: ACHHUZ6cxqNF9oVPQT800v+QjQyumOs+1IRUqMW2VQHExRpOeKEWRXyutuhAc+qMfFm9EXtvrBlhVB236x6jl64JK4o=
X-Received: by 2002:a25:5185:0:b0:ba6:984a:2814 with SMTP id
 f127-20020a255185000000b00ba6984a2814mr583299ybb.23.1686304664163; Fri, 09
 Jun 2023 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-15-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-15-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:57:33 +0200
Message-ID: <CANiq72k4s9m5S7EXodUyVFpbu1SoYqrfR=bxBVT5VDV0=CvENg@mail.gmail.com>
Subject: Re: [PATCH 14/80] rust: kernel: Rename from_pointer to from_foreing
 and into_pointer to into_foreign
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:01=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

This one should be squashed into the patch that adds the code too.

Cheers,
Miguel
