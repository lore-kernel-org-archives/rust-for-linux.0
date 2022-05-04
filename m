Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CAFC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed,  4 May 2022 07:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345174AbiEDHGS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 4 May 2022 03:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbiEDHGO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 4 May 2022 03:06:14 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207FC21260
        for <rust-for-linux@vger.kernel.org>; Wed,  4 May 2022 00:02:39 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso503829pjj.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 May 2022 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucsc.edu; s=ucsc-google-2018;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=B9V7rtsVkc29zPla9DLmuA4yeVAhIaGJ32BtMsNWMko=;
        b=cA9jrCPYRgfGe2al0lZwnW2E2luPMFN1v8O/FuBQMFeHjJNQ05TPi+aqXkr9yTk8pt
         Nlwqy8Qyk2URheQE32OWibML7Gw8j1r+YdP5rUZVZ2/yqkFT7coMeRdym1VX/ptQ6I87
         Zusr71QqBo4Jx+6rUofTYj1OMfuRDCunezGeJL6mKVHw8rmqSINUNvWigz5bUGhGw8ZN
         dRvOQm5k9TTqNPP85MdVgVtdz9Z8S5Xf7O7knGrigogbh7kYZpYr+7jgt7AzqEA9ZbQw
         FqV/eCByV8pg13A5TZ/IkYCkSaZuo/A3vc7yFSdDrFq+YtNRp2r7WVtAdPr3dZXoPCkg
         Ke4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=B9V7rtsVkc29zPla9DLmuA4yeVAhIaGJ32BtMsNWMko=;
        b=X46kqdKW9PKR/Dx0HVtEP5Xx+2PqXCKVJDmSvX3fRuquwoA5YC7AwJI94h6q3cetZZ
         zl9PHhJAJbTkkTml5R71YM0iop+EqnpxVsYsk69kCxQkPw6fdy7hdK7Ylron48rGUt+q
         uPcS86UR6qa75NywYmjdQlZa49NK6XDZlV6jA/DobbK+smlOlEhi+cHYixVHRKn0l179
         aLnh5N+XKpwJt5y2wDQ1TjWtKzm0MTvRWSdr36/yYln7x78Veu/hFtRbwtaPBQGwpCFy
         UKU+oegeMYAb30OzePdDbTQaUgoJzSxeszEIsr63z3s3Ltx+LkOGZELm5Ig7ha7plgT5
         a33g==
X-Gm-Message-State: AOAM530nblJe+29oq68euIBWdTPAbKJaVOATzdDJBIHdvy7M2/GWljFU
        FBAJWyZtIpaiTxp6X0NftqGx4Y1D4rfI1qNGJ4k=
X-Google-Smtp-Source: ABdhPJwBJI/6HmoaE3HJqFTNItOUQkj6aW1e1UkNE3xtFGmU6wFE26tF8mrK5uFypRiqkqSWnvSwVA==
X-Received: by 2002:a17:903:410b:b0:15c:fd57:aa34 with SMTP id r11-20020a170903410b00b0015cfd57aa34mr19975659pld.82.1651647758673;
        Wed, 04 May 2022 00:02:38 -0700 (PDT)
Received: from smtpclient.apple ([66.42.70.172])
        by smtp.gmail.com with ESMTPSA id p7-20020aa78607000000b0050dc762814dsm7452450pfn.39.2022.05.04.00.02.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2022 00:02:38 -0700 (PDT)
From:   yyang363 yyang363 <yyang363@ucsc.edu>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Request for invitation to the rust for linux zulip
Message-Id: <5D3D873F-97B9-4E09-8E78-0112ECB7CDA3@ucsc.edu>
Date:   Wed, 4 May 2022 15:02:31 +0800
Cc:     rust-for-linux@vger.kernel.org
To:     miguel.ojeda.sandonis@gmail.com
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

To the maintainer and developer of Rust for Linux

	I=E2=80=99m enthusiastic about rust for Linux and doing some =
research of Linux CXL drivers. I=E2=80=99m looking forward to writing it =
in rust modules. Please let me in to the zulip. Thanks

Best, Yiwei
https://victoryang00.cn=
