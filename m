Return-Path: <rust-for-linux-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgK2RhN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 29 Nov 2020 12:37:13 -0500
Received: from mail.kloenk.de (mail.kloenk.de [IPv6:2a0f:4ac0::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BA2C0613CF
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Nov 2020 09:36:33 -0800 (PST)
From: Finn Behrens <me@kloenk.de>
Subject: module as seperate crate
Message-ID: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
Date: Sun, 29 Nov 2020 18:36:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: rust-for-linux@vger.kernel.org
To: rust-for-linux@vger.kernel.org

Hi,

What is the reason for module being an extra crate? I would have to run
some generic setup code for kernel/printk, but as the module macro being
from an extra crate, I cannot easily run some code there. Should we
maybe move module into the kernel crate, to make this easier?


Finn
