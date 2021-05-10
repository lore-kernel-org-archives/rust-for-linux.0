Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635F8C433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 14:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F6C161107
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 14:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbhEJOLZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 May 2021 10:11:25 -0400
Received: from gimli.kloenk.dev ([195.39.247.182]:58430 "EHLO gimli.kloenk.dev"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238352AbhEJOIz (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 May 2021 10:08:55 -0400
From:   Finn Behrens <me@kloenk.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1620655664; bh=g+MZQ337x8UymChB3/PTKfEgGJ7pKaLj7vsZl76Q2ok=;
        h=From:Subject:Date:Cc:To;
        b=L9wEzTCrX6ufQ6Ho3GyINCS5QzThb5agBg2WgADjESUYTdUk6330uTHSQz18DB+rB
         U1Ml5Tk2w217MzEvVMUHM4I8Ea8ELkwgUZq4YcwmLf6Ohl1K6DiQVUvK8MpEWzDJ+W
         1d+xHl0yopatQkSo1qoJgwjvcXfQ7WvlV8Bnow/4=
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: German Podcast (https://akronymisier.bar/)
Message-Id: <76F51432-B120-4C46-BADD-8DC7B0051CDA@kloenk.de>
Date:   Mon, 10 May 2021 16:07:43 +0200
Cc:     rust-for-linux@vger.kernel.org
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,
I was asked if I want to tell something about rust-for-linux on a German =
podcast (https://akronymisier.bar/).

I would do it, is there anything I should mention about the project?=20

I got a bit lost in the current state of the project? If I see it =
correctly rust-for-linux did not get merged for 5.13, are we targeting =
5.14 again?

CU,
Finn=
