Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88719C43334
	for <rust-for-linux@archiver.kernel.org>; Mon, 27 Jun 2022 17:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbiF0R7E (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 27 Jun 2022 13:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbiF0R7D (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 27 Jun 2022 13:59:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5CA644C
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jun 2022 10:59:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a13so17956121lfr.10
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jun 2022 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=1BEAgiywFic+mysPDihaAlRhDyDikqpPpWBP1vy/eIg=;
        b=e5/ycHoVV24dZBK0c024jtSDyMDbjH1o2mRCWJ3baiaVaSov40DTyi/s1BFt7uCxl3
         KoRkfY8ieZr3s9JIpMF9Qpe4oXM5wKg3pQwP4RL5y60ThaNW59GLN0nkEu9KoNEUN254
         K8L7hO21WzSqkZvqx0Ap6IAANjTfVjxwsipZ8y29hH1rCepwguviLVEYOx/dTKw25t08
         UbzcczD/0cCEa3BnWzgUaVXeIGHKg3MHsFZ6meXBzSHKB5Lm1D1q1+zmIKVATMC7jCdU
         XkrxRreeO6ELsjQOhU5W+DJ/gjZct4ax3h/5EOLCvxBBxKtqnoRrhKQzKRVTY3ouykcD
         8Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=1BEAgiywFic+mysPDihaAlRhDyDikqpPpWBP1vy/eIg=;
        b=uaz6tFraAI8W8+cmiwkYR6+zjOCgsVyXWd0wrLrHcM86UBzDsJKKndc+g/gIqcP6Dw
         hQ8CwVqYLTjDNfcYDUCj/+lfwTAs6UT8dR4o8B/XxqXWJxwktlBnibopy6Vo9x4rpksw
         xF8iFXZKqFxQL2qPmVTKg/JZ29LohjoB6JhJPUH+kQSH0qmjz01J6ofwbsfjxRYQbcbi
         dq2DY1r/VMgY63RYieQRs9D8WueqpeDohoPxs1Ou+utjHif5O5VJ9uJJFh9NUN5yn2aQ
         36ZVmWnIl/AG+cFQXlMb8BLcIuJw1JVdHtnoWsbY2Gkm3QfsOrZbaTouK2TJ8UfLjKf+
         Iq8Q==
X-Gm-Message-State: AJIora+p+NHVkJKzhcyczkvDgyKO3ytaxmRqwb2WsLLyI97plwk+Qv7N
        Tk4aalBg/9PRi//o28TfEf5/H1oCxAJUeuZFiLcj2JSvyXN3pvc1BuQ=
X-Google-Smtp-Source: AGRyM1sfGy1p84sCPVmtxP2oSOMOXqaYmHfMvjisAgvp2pAB/NXUG32pp63QFqmziz63IcfGoBEkryHqgdA+KN93jOs=
X-Received: by 2002:a05:6512:3c81:b0:47f:ad61:7edc with SMTP id
 h1-20020a0565123c8100b0047fad617edcmr9234666lfv.133.1656352739575; Mon, 27
 Jun 2022 10:58:59 -0700 (PDT)
MIME-Version: 1.0
From:   haris iqbal <haris.phnx@gmail.com>
Date:   Mon, 27 Jun 2022 19:58:33 +0200
Message-ID: <CAE_WKMwwq9ZDz9pERN6Tz-Ve1iwnXX+VuJUTsKmaAeXneRbKMA@mail.gmail.com>
Subject: Requesting an invitation to rust-for-linux zulip
To:     miguel.ojeda.sandonis@gmail.com
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

I am a kernel developer, learning Rust out of interest. I would love
to look into the changes, and possibly contribute once I have enough
knowledge and experience. Hence, requesting an invitation to
rust-for-linux zulip.

Regards
-Haris
