Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15999C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jun 2023 04:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbjFHEqt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jun 2023 00:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234175AbjFHEqs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jun 2023 00:46:48 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF1126AC
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jun 2023 21:46:43 -0700 (PDT)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230608044640epoutp0293d613851032630fc614ce7cf408cfdf~mlZppy4za2024920249epoutp02Z
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 04:46:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230608044640epoutp0293d613851032630fc614ce7cf408cfdf~mlZppy4za2024920249epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1686199600;
        bh=g35/Rmb5/3gDCUZbHMH5pOAyjsXeQj2q9TbNz8qFsdI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=i4RNGYX1S7+qP4mHDlfmUwCrn+4NbOGAF+6W/BwvU/6WdKYoqXvtxOmHib7TtOhr7
         Z/nccckS2QUo0GTme/bCWAHLKf/j4qr1Pyz6puai+cyIrgXuVfezz5fwB5djD8Mcmo
         ZzVZg1FBFEmENeYHOgV5LWw+igl4p6ZIKvsmUsQw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20230608044640epcas1p4bfbb43e2739058e9247ba1860e53f7c8~mlZpT9Iw93072930729epcas1p4P;
        Thu,  8 Jun 2023 04:46:40 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.136]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4QcBWM4l1Rz4x9Q9; Thu,  8 Jun
        2023 04:46:39 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        F4.AC.48553.D2D51846; Thu,  8 Jun 2023 13:46:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20230608044636epcas1p459afcb7fea358534476e817eb1952c10~mlZlu7QlV3072930729epcas1p4G;
        Thu,  8 Jun 2023 04:46:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230608044636epsmtrp19f88f97c73594cb84d570a8a9526e1e4~mlZluVPWX1603816038epsmtrp1v;
        Thu,  8 Jun 2023 04:46:36 +0000 (GMT)
X-AuditID: b6c32a39-36dff7000001bda9-a2-64815d2d3d65
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BD.92.27706.C2D51846; Thu,  8 Jun 2023 13:46:36 +0900 (KST)
Received: from kson001 (unknown [10.102.7.58]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20230608044636epsmtip1c5435f2704ab4eb13b206c8966a7dc26~mlZlcI1SF2070120701epsmtip1J;
        Thu,  8 Jun 2023 04:46:36 +0000 (GMT)
From:   =?ks_c_5601-1987?B?vNWxpMjGL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?= 
        <k.son@samsung.com>
To:     "'Conor Dooley'" <conor.dooley@microchip.com>, <ojeda@kernel.org>
Cc:     <linux-riscv@lists.infradead.org>, <rust-for-linux@vger.kernel.org>
Subject: RISC-V: enable rust
Date:   Thu, 8 Jun 2023 13:46:36 +0900
Message-ID: <000001d999c4$34e9d640$9ebd82c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdmZxDKDUHXVIC6YQfizVx0vqjWB3g==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdlhTV1c3tjHFYPoREYspm3awW2z73MJm
        sXL+ckaL9c8OMzuweGxa1cnmsXlJvcedH0sZPT5vkgtgicq2yUhNTEktUkjNS85PycxLt1Xy
        Do53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAHaqKRQlphTChQKSCwuVtK3synKLy1JVcjI
        Ly6xVUotSMkpMC3QK07MLS7NS9fLSy2xMjQwMDIFKkzIzvh3Yg1bwRrmivbeiewNjDeYuhg5
        OSQETCTajx5i7mLk4hAS2MEo8bz5IROE84lRYu/tKewQzjdGicknTrPBtPzY9YARIrGXUWLX
        z41sEM5jRok/n36yg1SxCaRKTPy1Fcjm4BARcJXonMgDEmYWcJfY1TYFbJCwgIzEstUNYHew
        CKhIbLhzkBnE5hWwlGjfuIoRwhaUODnzCQtEr5HEktXzmSBseYntb+cwQxykIPHz6TJWEFtE
        QE/i2PZHUDUiErM728B+kxC4xS6x8sJtdogGF4lLW3dB2cISr45vgbKlJF72t0HZ2RJHP+6F
        +rhE4vqsRawQtrHE/qWToYGnKLHz91xGiGV8Eu++9rCC/CshwCvR0SYEYcpL3Oosh6gWlTjz
        9CPURA+Jz6fPsU9gVJyF5MtZSL6cheTLWUi+WcDIsopRLLWgODc9tdiwwBQe28n5uZsYwalR
        y3IH4/S3H/QOMTJxMB5ilOBgVhLhzbKvTxHiTUmsrEotyo8vKs1JLT7EaAoM+InMUqLJ+cDk
        nFcSb2hiaWBiZmRsYmFoZqgkzvvlqXaKkEB6YklqdmpqQWoRTB8TB6dUA1O+XpOE5/NmjXre
        ++dfVNxwEp5X6b7a7yBjwtriRw4/jkccKSzSlC3Zbu5UvZ/x2p+DKtfnPvt8fcPtgLfRMpcn
        TXk02f6J6KYnjk7c/Iv6zctt/k316fdrC/wQmLJa5s25nffb7j4q+brajkeuIiF07Ryvj/3G
        Cku+PqlZ8DDY9vD5muUVGvs277Surfva93H795tzfl0U42H2EA1Zs3sTK8dZBpXfJm15tUGu
        fPO3203ePklzUpHXL9WjDkuEQ67YWU3zdJihMG0Pm8epH7Nf12pw/jooO61PXO7eprVdvTVH
        rUPK5rNt15/FHqMu0JPGeo/L3E7gwOF/EzXKr/v7fMnteHpEZ4OLRR0HT7ISS3FGoqEWc1Fx
        IgCC34rNFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnK5ObGOKQddZZYspm3awW2z73MJm
        sXL+ckaL9c8OMzuweGxa1cnmsXlJvcedH0sZPT5vkgtgieKySUnNySxLLdK3S+DK+HdiDVvB
        GuaK9t6J7A2MN5i6GDk5JARMJH7sesDYxcjFISSwm1Fi896/jBAJUYmOy41ANgeQLSxx+HAx
        RM1DRomvT54yg9SwCSRL7Hw9iQ2kRkTAXeLxk1QQk1nAU2L6VD6QCmEBGYllqxvAVrEIqEhs
        uHMQrJNXwFKifeMqRghbUOLkzCcsIDYz0DmNh7uhbHmJ7W/nMENcoyDx8+kyVhBbREBP4tj2
        R0wQNSISszvbmCcwCs5CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0
        veT83E2M4HDX0tzBuH3VB71DjEwcjIcYJTiYlUR4s+zrU4R4UxIrq1KL8uOLSnNSiw8xSnOw
        KInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgYs9zKP0iv9ncabpJjwaPrNED3ocVX6dZvnJU
        O1Fe3i+1r/SFv++WtSs5Q5ZGe3CWTgvonb9la4/NNjezF+c3luhMrnSP/9itxrG/b8v1vm26
        3t/rs25x7y45+Fdv2cqv93Y52Myqtv6hwXhn1ubtOck6Pmmezhef1zt+LahMz3CWLprMqWvC
        lic/UWUy6yTv/oLyV45MPnkbo4V1DzmurNa9fl0qdcNOk6N1faKxR46zrd5rbbpg8Y7waslX
        f0x/Ze/6xfZFq7BA40B5vma/7/3gdQtebnHtY2z/Fd7xI7Bk9hH/ZpPqL3FJgesWO6ToTr76
        rGqjzP6iqBO3300ONjE96Ljvkv7dp7GOmqFKLMUZiYZazEXFiQByE4mg5gIAAA==
X-CMS-MailID: 20230608044636epcas1p459afcb7fea358534476e817eb1952c10
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230608044636epcas1p459afcb7fea358534476e817eb1952c10
References: <CGME20230608044636epcas1p459afcb7fea358534476e817eb1952c10@epcas1p4.samsung.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,
Recently I'm trying to put a rust patch on the risc-v board.
I saw a patch [1] and looked through it roughly.
Only if llvm(not gcc) is allowed, it looks good with no major problems.

> I'll revisit this when my thoughts have settled down.

If you let me know the problematic part, may I try the patch?

[1] https://lore.kernel.org/linux-riscv/20230405-itinerary-handgrip-
a5ffba368148@spud/

Regards,
Kwang.

