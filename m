Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6CDC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239824AbjFIKdQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238240AbjFIKcp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:32:45 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5214F3590
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 03:26:19 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bb1f7c5495dso1651263276.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686306378; x=1688898378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugbKamWOXzmSGLGjFWe4ZEDiunfqisTTLcr83+1Jnuw=;
        b=h6B0yC0NVzTTXwOBgpNV2FS9ADXtd5Qedp1qwXiLEMRJVMJ5Y+LqM4SlgHELn5kq2i
         3Kuwy5je8bMf8s+nXq0CJB0US/JlAHPVJSFXiLGBwRt3HrEhCU8fCwwUB9ZggDS6Oabh
         Lxj0TM00AIOx1QlJ9a7A5FBCmLGQVWxDTooMXQE9vcqAtanmQm4rOZxU2MqCxrgAbVf/
         x9dD7gL/Il5KQezDxCkgapIHefzvA90y15YtqOJR7Y/GhWTc48JYFupN1ScCtr7jigZX
         pg5zfV5EkgQUGFVf9D+2tttyjaGRul3Fu+Kf3pcJqq/VFI8OZ0uvVVSo/hxJEsX0SboE
         6oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686306378; x=1688898378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugbKamWOXzmSGLGjFWe4ZEDiunfqisTTLcr83+1Jnuw=;
        b=FLT27LKl9eycHldRXmemQFsuHuH3SDO+IBfD9zT+cYRXBtyT1ZE/3/48MWOk8eib7Z
         kTxvbkDpGxpwCejdivVRuRoyqoRI3hMmKnUX2P3DIxwB+RIgJL7Ho/JAyask6VOf+JpP
         Ukv8++Q2Hgn+C9nMTPJySzosIE8RNKEtLvu0PO4TD1WUTHyc9twH7BRf2NGufdKqpyht
         oWAHK6V+nVb8Npa5IyjCj6Ae/KR8AgUYL5OtJRgrSBWOY+AMV9JP/GAIwEt/jiMFZhm1
         kgSnU6iK56OPPpoEAM1zFVET4voOk0ZuA+yXBp9cK0d4jcdZtin9BePWqWWoPCK4dIiR
         zsPA==
X-Gm-Message-State: AC+VfDx5E5lNcDfEPNtFsikpVYSKqyEWcSf4jOSsUh1SUIHs1hENGcmM
        SbGKygLVmmf+02vWwty76hGxc1YWtYZ9VfUEf68ZMBIu
X-Google-Smtp-Source: ACHHUZ5+hgBD8e1ObmlTBafLKOuQ1UdZr+nOBviUSlL6nW+w1KaU4HvaMdf7iwbbjmc1QGzQkf0himlobm/eSEVaJEg=
X-Received: by 2002:a25:254d:0:b0:bb1:f15d:587b with SMTP id
 l74-20020a25254d000000b00bb1f15d587bmr545639ybl.56.1686306378397; Fri, 09 Jun
 2023 03:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 12:26:07 +0200
Message-ID: <CANiq72=2J_N3GBAj+CZ9AJF6aVAF_qhMab5okBoVus8GA1Jmyg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:58=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> This is a proof of concept driver written for the PuzzleFS
> next-generation container filesystem [1]. I've included a short abstract
> about puzzlefs further below. This driver is based on the rust-next

Thanks for preparing this RFC Ariel!

I have left some procedural notes here and there.

Cheers,
Miguel
