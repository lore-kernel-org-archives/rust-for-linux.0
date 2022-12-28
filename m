Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85027C10F1B
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Dec 2022 01:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiL1BeM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Dec 2022 20:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiL1BeL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Dec 2022 20:34:11 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F33DF81
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Dec 2022 17:34:09 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id h4so1995384vkn.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Dec 2022 17:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P73TkP1+5VQL6Z91gZwUfoi+6HNnkrmfQTfJfJd83JE=;
        b=IFjOogw+FPKIZ+gpJRehfz6J9I+F90wtPueFwW0Qry+bYatcXVm3PdTPUcGa+y2SMa
         psfWctL4FJHtdtfoxWAblAJeCDc8UMOeoFR9fjyH+GAxgyO0SlqHRq0w7DtNpN0vOlOh
         luL5OAZ+3ty+5zTzEt2hSG0tZuT2utM+XuphNxNh3ct1YGr4whvVi4MOQJP2WZWZL0Yk
         7CX0PCO7Avfzefv/UihfbtXnSpikNd+54LgZUQgK4LLqVJs8QZ7TIPnEzpOlWT/toPwi
         xfihRIFX+OxXv9tQSk0Wdr/eM/gbOGMao3hyjzTDwbckZioottBENUB6nH38+MC2BS8G
         fgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P73TkP1+5VQL6Z91gZwUfoi+6HNnkrmfQTfJfJd83JE=;
        b=anJdGvzBXDK3Mnei3hJrPJ2YMN6Z9knj5daUc9MRmLuuNjDGizvEqH9l+KWI/RwiuA
         TbLqDCbQIu+p1M9tYYKYC6xcbfZcbq3uyKAuV707j3lK6z6CVvBKLlY1tdcMkuBTMIgA
         vpMAiGvGT+NDqM050LLlRY2kvNbbfi6wVKFNyBYMejdSaVCxViuuofIUiogjssr6WpYP
         XXMa7hTQx020hNUhwN7AUwKQOFFQ4xAp0L47LdcVfcHUy9thtOYwJw4yw4olTEffGmIV
         B11C3ghWb7L99Soan33PXJCfo7/lNOqsUUCvOkO1L8ulbnivc2QbcKFtU8J3KFjp5Tiw
         N+hw==
X-Gm-Message-State: AFqh2krT9ZBO+19IybnRha6waWZv++U4qlIo50572W3x7ttzHxqtZGsD
        pG6QnC/hGn0g0S8eS05VEvlzAwvaAFfvr28A9YMC4hizuI998w==
X-Google-Smtp-Source: AMrXdXudb+Xj50kmJhgvHUF20YDGIggcNm7O1iDR4B3Lordra226mBIFEEjowA7y8K3+OPEhHx1Q8Fz3osg9j9r9RzM=
X-Received: by 2002:ac5:c970:0:b0:3d2:b9c2:4e89 with SMTP id
 t16-20020ac5c970000000b003d2b9c24e89mr2631502vkm.32.1672191248645; Tue, 27
 Dec 2022 17:34:08 -0800 (PST)
MIME-Version: 1.0
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
Date:   Wed, 28 Dec 2022 10:33:52 +0900
Message-ID: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
Subject: Rust in-kernel TLS handshake
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I've started in-kernel TLS handshake implementation in Rust.
https://github.com/fujita/rust-tls

There is some debate over in-kernel TLS handshake mainly because of
the complexity. I'd like to see if Rust could help with auditing such
complicated security-relevant code in the kernel.

I worked on QUIC as a consumer of TLS. This can establish a QUIC connection
with Quinn's example client, Rust QUIC implementation. Only minimum
server side functionality and connection establishment are supported.

From the perspective of Rust-for-Linux, the main work is implementing
APIs for crypto subsystem. Also libraries such as working with buffers
(like Tokio's bytes) would be helpful, I think (should be useful for
other projects). I'll work for mainline. Meanwhile you can compile
this kernel module
with my fork.

Opinions?

Resend due to a delivery issue. Sorry if you got this twice.
