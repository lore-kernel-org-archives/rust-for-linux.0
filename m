Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309D5C04A68
	for <rust-for-linux@archiver.kernel.org>; Thu, 28 Jul 2022 11:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbiG1LM1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 28 Jul 2022 07:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbiG1LM1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 28 Jul 2022 07:12:27 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57403664E8
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Jul 2022 04:12:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id sz17so2552352ejc.9
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Jul 2022 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc;
        bh=LuZ00naNZoibiVy8b6ea1T3Cr2RDAGIJpV2OqIiOy08=;
        b=CMlUzzysicMn9vqtQM67xa0Ymg2LB57PxQxzj+7YJIxA3Ct2C1IO/yWT7mU3d1jK+/
         Sli0aXjUdyrsZLyN+SlD91FT1S8ud0sIZSBHB0b1onf6pVy1x89lqi2dLdKvpLpUtg6A
         A0LDH4dibn7qJ1X/UZ1SzL1qRV97PIzADSczxoFUsDp635afcVbE309Kbh+llmKoWLsm
         GyTXLj0LN0ykFh4Q3ygf5l7Cxgi1GOxHYH985SfDzO9ZaWFlCtHPM/RaCPgjglslDFcS
         VyIPcrGXAhTCLNOtBiLWsxLuqHWikvhRliaGiqrjKkIfoaBkY38Me75E1eK2XkGlpITh
         W1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LuZ00naNZoibiVy8b6ea1T3Cr2RDAGIJpV2OqIiOy08=;
        b=hl2W+clZKvs1W6zrc9y0RrfAUZOOLmSFdFWahnDLXzNuOFhaiftPe8TgpB9qelu9TK
         rhz5HtsUNyxpVaLucfM9FI7vrOkunCKbHoWczQfv99U+hkAJbMrw4zAHXD9ZH3ezrRKx
         lgz3J4QszDuRglTs2ito3j5fZ3gj4eQePFr4c/uAEgCFckxC86Aq0NRRCMMpvrO+fvnD
         g0fL4i5vQVGbRm5wfwCN03v2AsbSW1/ESPZpbkiPEDPsQfTdKUVQ0paEumW7fpL/Efm1
         VQFzq6NPxIGEVyLrXYyrXc7cEYIHiEpWAKSHnBMwLfa3ak/TzWc1B/JW3dQ9rtOrthCc
         wPPA==
X-Gm-Message-State: AJIora+vDIHXz3GJ61cvc+plfEigdeGuTijMEKS/SJ7JFCYdbOxlaYST
        YOeFHD4EwH2n2ipOI1SfVed32Zmw1v2rbpZhTJYNVff/qHo=
X-Google-Smtp-Source: AGRyM1tvEvlcNOnNyop7yZzQSzcAfrSeUT46uaoD3YbzzsqCQf109FyXZfoZNjbVkGeeV2HCyGk0gAXUQRrl8Xg0lcY=
X-Received: by 2002:a17:906:ef8b:b0:72b:58da:b115 with SMTP id
 ze11-20020a170906ef8b00b0072b58dab115mr20154277ejb.417.1659006744632; Thu, 28
 Jul 2022 04:12:24 -0700 (PDT)
MIME-Version: 1.0
From:   Leandro Coutinho <lescoutinhovr@gmail.com>
Date:   Thu, 28 Jul 2022 08:12:12 -0300
Message-ID: <CAN6UTazwWDNMHSxD54nOjb_8QXpxjvB5dgz1-GGoQvZ-EWbPNg@mail.gmail.com>
Subject: =?UTF-8?Q?Rust_is_the_latest_addition_to_Meta=E2=80=99s_list_of_supp?=
        =?UTF-8?Q?orted_server=2Dside_languages?=
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Great news for Rust!

https://engineering.fb.com/2022/07/27/developer-tools/programming-languages=
-endorsed-for-server-side-use-at-meta/

"
- For performance-sensitive back-end services, we encourage C++ and
Rust. Rust is a new addition to this list. There=E2=80=99s a rapidly
increasing Rust footprint in our products and services, and we=E2=80=99re
committing to Rust long-term and welcome early adopters.

- For CLI tools, we recommend Rust. This is a new recommendation for this y=
ear.
"
