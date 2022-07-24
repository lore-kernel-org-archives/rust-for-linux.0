Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33428C43334
	for <rust-for-linux@archiver.kernel.org>; Sun, 24 Jul 2022 19:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiGXTqX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 24 Jul 2022 15:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiGXTqW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 24 Jul 2022 15:46:22 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DDBDF9F
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Jul 2022 12:46:21 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u12so6587210edd.5
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Jul 2022 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=5AFJEEtCTWnxdWchvRXCw+JQkrITy2fNNxyRGEJXxXM=;
        b=PiV9dQVEWV3DNQBFnfiXZIGpZ9P030qBzp6McE0WCaU5IwtFgMBLLHvJbTGpBJfQSE
         IMV5pggxTurgP9TI9A6NuMHXGZq6PwXoasEAEC2PrmTGGJHAj2xY9yb7a9psAEHv+KYX
         +hqUJ62+OxmbFML/nHoSJI0CXQ0fNPG3XOyHUSU1SCcYyQTkkL39V7XICNbtA9xqjUco
         khZS18ZqMUX7V1fXyHprSCjJg7Y9XNoQKSF4rNMdn5H/6w6a1Rk+CgLASZ4SMS+isCUB
         csy6XRU1o2IAmC6SdaV9OtJn+9DbPx586Yn3PC0+nMY2N5QhP5X34ya1ZR5+6g8tZ7jV
         V50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=5AFJEEtCTWnxdWchvRXCw+JQkrITy2fNNxyRGEJXxXM=;
        b=MOplM7tP40QmbPL5FPF9oWs3CoDGwV9Dw4F+HUXA6Iw9l1Szc+ZYdlIyoXcB9MPfT7
         lxCrJ0P+3QbHP+SeEjuIo8BkUqgmE8PcspouUV/Xfo4o/I0oyy03sA/TnYflDfGrxV2p
         kUv/6i1i2VSbS655ZgWeF9HoTghz2QvK9wHRDzFZTZiY4apKYe03g+qVIOA8waRFJQab
         hptczX0HnuArIBHxZxaX7YUtZ0+LUBKfAjGFkvTzfHbEtXyH2pj9A1bwsZ8DVnMlybr5
         Q7OXfR47OgEZR9FimCoAJOiOGPQN0PSEHPTbda9IB4JG82EhmwD7V74U+ZIt4Cqz9F3y
         Ntrw==
X-Gm-Message-State: AJIora8yASq8+eI7n6V0VF059QGxrEuMs6y8hk4C9jHuvGd7un4NzF66
        GsZQsGMRd/mA3emti6Gr95RM4i09CCrhJQIexUbImLB+9Rg=
X-Google-Smtp-Source: AGRyM1tBixyEr2NjpKY/Ytke13+PbYA/MbljWVZHNo5oEevpI0aCN9veTVh1FxlvKiapqkjY8TiisHiegpZUx6bPQQc=
X-Received: by 2002:a05:6402:1003:b0:43a:75d8:a0e with SMTP id
 c3-20020a056402100300b0043a75d80a0emr9988888edu.303.1658691979343; Sun, 24
 Jul 2022 12:46:19 -0700 (PDT)
MIME-Version: 1.0
From:   Leandro Coutinho <lescoutinhovr@gmail.com>
Date:   Sun, 24 Jul 2022 16:46:08 -0300
Message-ID: <CAN6UTaywU8NfeNVi2ZDfwgjo3LCKiQRbD9PUWKsRp33Gxo+4gg@mail.gmail.com>
Subject: Mentorship Session: Writing Linux Kernel Modules in Rust
To:     rust-for-linux@vger.kernel.org
Cc:     wedsonaf@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I don't know if it was already shared here, but Wedson did a nice presentation
for the Linux Foundation:

Mentorship Session: Writing Linux Kernel Modules in Rust
https://www.linuxfoundation.org/webinars/writing-linux-kernel-modules-in-rust/

He uses Neovim with rust-analyzer.
It's nice that it provides code navigation, completion, pop-up
documentation, ... cool stuff
Here's a basic setup for those who wanna try:
https://gist.github.com/tivrfoa/e956f090ff549e9dd04c9ececd3912f1

And if you like to use VS Code, it's even simpler, just run:
1. make rust-analyzer
2. open VS Code from the project root folder (where rust-project.json
was created).
3. install rust-analyzer extension

I tested a small refactoring, changed a function name, and it renamed in
all files that use it.
