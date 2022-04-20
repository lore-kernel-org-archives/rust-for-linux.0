Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA152C433EF
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Apr 2022 16:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380667AbiDTQhy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 20 Apr 2022 12:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380708AbiDTQhw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 20 Apr 2022 12:37:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF25011174
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Apr 2022 09:35:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id e62-20020a17090a6fc400b001d2cd8e9b0aso2504861pjk.5
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Apr 2022 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=XgbZFFRB50uMAb1NIv3zrsXcPeXXUqUV2277o8JPJHg=;
        b=PAW8xR0rmKtHprkwUeHxvYXP4Z+KnsALuowMK8Wgtubldrfe0HhpxszJBFKPkk1xMh
         LC65rUF649dvGbspb+WMDPCaBfSII09kos0fDOxriQNev/u91xk2MkSmwOh1mvLBOv5b
         1pN/C3nO7DBsMRau6/sYvY/w3Th43RLk/BUXvMTcTHzwnQm/FcXgJMaajNfTCLfz80VW
         7qW9nAGQLV/PHcLt4mQybSktsiKPTD/jzIXLdriPSPR1jkNAvtHfcubgWaPvOia+j8zl
         eacqWEnp3GOSNEF+CSNgNaGnjCEsz1ROPOJetVRxyYJlQmxD6IrXdkA/595MsfRLrL9/
         HSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=XgbZFFRB50uMAb1NIv3zrsXcPeXXUqUV2277o8JPJHg=;
        b=mIc3Hk0xXf6mucGd9CeO2O5Lhqli5hiGEzLIRCjdLkGWl8BVuTQasn9NIFfX6f8KEL
         2Nr1Or8jE6HJ8Y+yWiUKXoo7pawhKeG2IPxAHFv4fUOrYAM6h+1u4tiXEzDCpOSUulvl
         y6elv2RAEpJhAFiBwx+0gSumm03FU+7ysEGgKfEmld8E7czIxooVAGO+NxWRh6qvgKCc
         OJ52tM5fx0lTjTf5K7G2VrS3zWT4nMFeF59YoDCkqpyYTtSFsY1fjWNg2yVkc+AfnoRt
         0ryzugjGLeJP/AN2ILQ9DCUtUrC1QziaBgTCR1odSowsSpBxLixfaP4ib+xe87QdVmcs
         MSIw==
X-Gm-Message-State: AOAM533dU1OpEbktGiZRCc8LYTxKi527oUxImarfL3+o7j7jhgg07CXJ
        bgEgmzNtimS4SGKWVpzebNoFf8mEPbtTMw==
X-Google-Smtp-Source: ABdhPJzB9SaIUc4jO5V74aYGC0NgpkvtgwwubDojAOKikv8uSu323XZr1SQHGauXT70chxbLOPFXAQ==
X-Received: by 2002:a17:90b:1e4e:b0:1d2:8dba:67fb with SMTP id pi14-20020a17090b1e4e00b001d28dba67fbmr5440163pjb.55.1650472501102;
        Wed, 20 Apr 2022 09:35:01 -0700 (PDT)
Received: from smtpclient.apple (ao231150.f.west.v6connect.net. [122.145.231.150])
        by smtp.gmail.com with ESMTPSA id i11-20020a654d0b000000b0039d82c3e68csm20519595pgt.55.2022.04.20.09.34.59
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2022 09:35:00 -0700 (PDT)
From:   =?utf-8?B?546L6ICF6Ie76JCD?= <peterwrighten@gmail.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Request an invitation about rust_for_linux zulip
Message-Id: <A1DB8EE6-757B-42F2-BEC2-48C71F0103BC@gmail.com>
Date:   Thu, 21 Apr 2022 01:34:57 +0900
To:     rust-for-linux@vger.kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi, Ojeda, I am Peter from GitHub(username: PeterWrighten).

 I am pretty interested in Rust and System Programming, especially =
building systems by Rust. So could you give me an opportunity to join =
Zulip for asking some questions of Linux and Rust?

Thank you so much.=
