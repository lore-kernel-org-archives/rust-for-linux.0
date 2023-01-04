Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41BCC4332F
	for <rust-for-linux@archiver.kernel.org>; Wed,  4 Jan 2023 11:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239087AbjADLmz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 4 Jan 2023 06:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239110AbjADLmu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 4 Jan 2023 06:42:50 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4051EC41
        for <rust-for-linux@vger.kernel.org>; Wed,  4 Jan 2023 03:42:50 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id e21so959952ybb.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jan 2023 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nc2nOVG+GYp4vssxqfieOu3bwgcsoLT3pRlzrOusA8=;
        b=jNpbBEooNLuFhvmjdNb9e5vzw548vqwUkYmRzstFY4TWCPIDgmvlmONDWhUtDqttSB
         7Pn42bh4CjPxvegRLUNbbV83WinllUPjZl6+X/FQfxsBdVV1kazgDudvQQSVvJL4f2kf
         zwIIxswIvpAUA8rk50zHsPzSMydPJM7jhLgD55Nn3U6Zpmsa3kJN2mECHmpApuX32/ac
         S+AdNKxk5GgQqm0yFEFY0YyCp5hYYoycYjh04MSrLWwStaSYv/noOkaJWXEuyni6AoMV
         mPpauGHWvvHT1KX3nifRgzEB3g+cr3Oq3x5zWv0zYwgJrobn29eRoEZEcaCzdklFCSC+
         6UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nc2nOVG+GYp4vssxqfieOu3bwgcsoLT3pRlzrOusA8=;
        b=eqe4+v+Pyi2f7OsJiwlQOXSFhfvAxuf3Iu8v73JqqQIJGC3GxxFnEkwfzWGTcFrIEJ
         UH5Z/rXcXUkgqG9bJkbmDJWEhoSSh/CnxnIZHrHDkKle0jIn/deokP9iF/BDwixjhhG8
         liPrxMWL8XnayPLsz3jiaeIACCzjItctiJXRFPn6Gpa0Q0RqoRhN9pR3WaE+5m6yRA4I
         VYfM7+rx2ywh4sZ+XXQqZ+zcigA+h6wCKgsH3O4KiXxpDEnRkNd7rH+IKW07TEaZjW68
         wVY0oBLCEphIQe3ocTCC/Fj1IfXjUM6v+hXytp9cLmlJ4udyVAkzs+nb1jxEoYmPilwN
         veWQ==
X-Gm-Message-State: AFqh2kq6/0QjpUQGfGls00NrlMZPZirWskGsqpULqI5/TEWKe/oRQZws
        Kpj7/pS8zYo3Do+5aR3lRxNnUZ2W/saqy6sDzvPSYATGlngmK3C6llQ=
X-Google-Smtp-Source: AMrXdXsTpwKX844DKlQX9BTYP4ni8XIyA/ys7DMUtTLDw0vf7vVibyLjUUG95OGUifz63jmf3ZGnER/Iiq6RJ/MiiVE=
X-Received: by 2002:a25:bc43:0:b0:7b2:343d:6b11 with SMTP id
 d3-20020a25bc43000000b007b2343d6b11mr232997ybk.75.1672832569394; Wed, 04 Jan
 2023 03:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20230103210219.5690-1-apantykhin@gmail.com> <CANiq72=4g2_m8uFZB4CHS6pYJgx1x7GrP9Ab4k39bDWZk57jwQ@mail.gmail.com>
 <CAPi66w-wG4vuOQzfYruHp7-+s1ex-snDougUkuW70Lrf-6gKhA@mail.gmail.com>
In-Reply-To: <CAPi66w-wG4vuOQzfYruHp7-+s1ex-snDougUkuW70Lrf-6gKhA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 4 Jan 2023 12:42:38 +0100
Message-ID: <CANiq72m-MJnfe6Th=5pLrbF5YiRRJWBro3Lz50vXSVBCr9-1ag@mail.gmail.com>
Subject: Re: [PATCH] scripts: store Makefiles in dictionary
To:     Alexander Pantyukhin <apantykhin@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 4, 2023 at 12:09 PM Alexander Pantyukhin
<apantykhin@gmail.com> wrote:
>
> Probably we also have to check if the Makefile exists. Or we can get FileNotFoundError.  Do you think it is reasonable? Or we can always be sure that the Makefile for the `parent` always exists.

On missing `Makefile`s, please see
https://github.com/Rust-for-Linux/linux/pull/883, which should
eventually arrive upstream.

Also https://github.com/Rust-for-Linux/linux/pull/914 is related to
this piece of code.

> Thank you for your feedback!

My pleasure!

Cheers,
Miguel
