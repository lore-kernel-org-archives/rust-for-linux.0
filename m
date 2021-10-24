Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AA0C433EF
	for <rust-for-linux@archiver.kernel.org>; Sun, 24 Oct 2021 23:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67E596101D
	for <rust-for-linux@archiver.kernel.org>; Sun, 24 Oct 2021 23:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhJXXwU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 24 Oct 2021 19:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhJXXwT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 24 Oct 2021 19:52:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295D7C061745
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Oct 2021 16:49:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t9so9027900lfd.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Oct 2021 16:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.cerritos.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=BHy2bQzM+8kJSViovqSnitaeIyIC3QYhJ+7DeTZlcjI=;
        b=Idr6i1OLUrj0FAIaT/WYGxyT6+1yLkWGdA/kEE88c/74+zFde7r4wFV9XQYzKnHPTf
         EJ7u5XQa17xRIy8pqWkzheJcugiG9v52c1iSaFTfC72lfpJpk4r28C4Lhp/fuooYeUcn
         ch9JWHwaq0yDskPrv0n/Mxr0cuwrwKW+ZHNjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BHy2bQzM+8kJSViovqSnitaeIyIC3QYhJ+7DeTZlcjI=;
        b=wadRdzsv80mzgV3A91LqStAOeTQsjuwT3hS0aW2zTFmXX8XB6+A/HclEPQ0QaHInie
         QHuY6g/ecq8eWZXSfKUxCnkBCI9V76zZJrAdHrbbqfyNYEDy43wPdi6HqYjK52B+LurP
         blr1WbkLYhzX62J+GNLjED2wdXsdi6r03CIKlEKeBY7xZFnZpQ2Ft8TWYFnEm0eWrOEX
         dhSs3w5JZjuuRcph+cZ2s9Zw3kCpYCQbNwayZUjd9q0j9jdf2qwO/GFEIx48vDU7OyAw
         tdLOZnEkHmmx5rq6/0Y8sW+nGQJt6UCEvAz3TVgpWp49twM1xK1u3gT8yPrnkvaAipTg
         UXgQ==
X-Gm-Message-State: AOAM530fctiLJCIJ5CGQbDQrih0ecq4rUrg1THLrCmM5GE1TM9Z5a7SR
        WVTxkjI60HWRTfQA4G/ekpN/Z0L0mdzWAEDm1mFHioIuXZM=
X-Google-Smtp-Source: ABdhPJxd/RyusbQphUNd47VFv0X51IM61jZaMTyam2PETSt0+fKLqXnWt8X3qu8cJJ8H+gdKfGt9a2gkWc/kstpxLXs=
X-Received: by 2002:a05:6512:32ba:: with SMTP id q26mr4865879lfe.207.1635119396186;
 Sun, 24 Oct 2021 16:49:56 -0700 (PDT)
MIME-Version: 1.0
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Sun, 24 Oct 2021 16:49:45 -0700
Message-ID: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
Subject: Current driver status
To:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

Are there any reference drivers or other running components written in
Rust for the kernel in branch rust or rust-next? If not, is there an
outlined process for building one?

Thanks!

    - amyip
