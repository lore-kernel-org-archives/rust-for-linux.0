Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09F5C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 21 Mar 2022 09:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241492AbiCUJmL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 21 Mar 2022 05:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345961AbiCUJmK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 21 Mar 2022 05:42:10 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECAF4D9F1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 02:40:45 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id s11so14887794pfu.13
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=De5WiKHaY1Hm4S0+1dDWK+bF8snDem4SPgT4SQxc1kA=;
        b=ovPp8mdSYExPucVFYFjW0cpgaoJM1WLGtfaDJadqxeycHOL3V6cqQgb3Fe9tEqm5wk
         aIsJa8Lz+bHoTQ7ZG2x68OU/yhedYqCy7tIvbtoObV84uifzy501SV9ZMwb014H2FjZG
         ZZif1XXfZQfnJaXprdBtVAFG4yLIFmqkSTEZYWecPI+SOr/jL3XP3sp8LF3AvQ+1KjqB
         i7/3U2obBv6wxENHU0QkcelBLaPmRTaj0Qh/h5ohXKzZw1SODwt+ZwipnBGiX6Ez14/p
         CX21eJ0HW5EWSdybxh0ippqPnF8tc6GKiBp8g4zkXATiO7JgNK3yNEBg8P1C0CtHmBPz
         thYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=De5WiKHaY1Hm4S0+1dDWK+bF8snDem4SPgT4SQxc1kA=;
        b=AfjLB9XQUMGTgUk03jSAQdmhfLdlXbjWjWe1WsfsfSGOXZcCrzxuNCmxETEBxN2gy3
         r1AFmVtcUa28HH2/crS224KNTdivu9vOlRyfijZtbWZQMZOaPvuOwiwjp2VZJSYquOOj
         Maw4AcvfXi8a/McPU+q5OqN8uelT7cTzsClI2Wu2/QjiB1tlqJmNgE1hEd2hxfRHEC9u
         jVeBlYilbC/SbuASRw5pLm7xWWu3xEYfwJILYhcpoJ33bF0Gsl7kSYKyg68U3jp15MUF
         4omqMpnjPN8WYS7OhBGGLjAZ2872OWlXfatWLgD1DsL3UjX2+4ub8JqSmAdqzzBcuusb
         argA==
X-Gm-Message-State: AOAM531nrj4qtni6hGlwnaqynFIsbG47GDDtBBM6ZASUz3nZc7GaCB+Z
        cucmj5LNJxpvNawcXw3JJwnawv6tUaAA5AP8skI540MeKpfaaA==
X-Google-Smtp-Source: ABdhPJyVau1dl/0ftWa+FoNV8Z0NAsVAYZ3qEbnETXinKWXL9QlqALeVLF00RGYCFrWSQrX9jADXIsryi5rLacYNeAA=
X-Received: by 2002:a63:5847:0:b0:382:b4e:50fd with SMTP id
 i7-20020a635847000000b003820b4e50fdmr15557937pgm.494.1647855644752; Mon, 21
 Mar 2022 02:40:44 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?TsOhbmRvciBLcsOhY3Nlcg==?= <bonifaido@gmail.com>
Date:   Mon, 21 Mar 2022 10:40:33 +0100
Message-ID: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
Subject: Using 3rd party crates in an out-of-tree module
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I was looking at the out-of-tree example at
https://github.com/Rust-for-Linux/rust-out-of-tree-module and found
myself in a situation where I wanted to pull in a 3rd party module
from crates.io which can run in kernel space as well. How can this be
done?

As far as I know there is no cargo support currently in the Makefiles,
but maybe I'm missing something.

Thank you!

N=C3=A1ndor Istv=C3=A1n Kr=C3=A1cser
bonifaido@gmail.com
