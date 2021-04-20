Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6C1C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AA8A613B8
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhDTRZm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbhDTRZm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 13:25:42 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D82C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:25:10 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id o2so15816714qtr.4
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=Wo8FkAYC+z3xbU3cxLqUOZQJPOjMpJFUGHG4MuWJtX4=;
        b=OYblu8vjjrnOuKVewPlwJ1I98YlGB4VA59KL6fkrFBn9D+DHNW/0UFm+5J1IYb5+q4
         /2duXq3fbybK1AtYbf0H3gnmJvztLQuo8vLuuWcdY3GRP1+xsbdt3rFQpP6a+ZSpQyfF
         yYnLl6QSiHMzKZFB4Mi147HFnOOFqkids91tsOwOL5ljyFmobwsY/70RhW+5qJOnk4z2
         Su5hN4YOMkaNOdteIxja5E5lfWrnzdKh7ZjlxWaly8SDwq7fVxLfoe4OTPUi40+DPOj3
         bPEysS8U2C3YnzDF4xYHcozO+nlkjgcD2N51qS8VJpnfd8/bBLjXyO8KRizND9d2xENA
         VwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Wo8FkAYC+z3xbU3cxLqUOZQJPOjMpJFUGHG4MuWJtX4=;
        b=QVr8GOw8yceXKU8LOm3782AqV39ZRpgfEqo2Lh89lxDn51+i6SX4VjcLV8RpjYMLXG
         GH2OoVt6mOgqOsMMreLUAQpla+89xLEBccYZu4X41Tol/L2uPUr0F7xysXsKWyTd3WHg
         SXw72BufSKDxkLW3uH9i4LWPm+b66wT4s0+egXqSZvAC4wscvlWAyJON98uZkZ+K4vww
         5fukSuhXX474XA92ymbArOEqyrqH7afg8Z2xSauaBKeiA5i0ju5FrO/9BSb4uu/5PabR
         +m5tUCnc21IKXb7mmTHvL9CjUGsPLMS617dqxuzuZdCKpDkipPw0qvdKp7cv2z0dy1iT
         3+RA==
X-Gm-Message-State: AOAM5313k3UuU0PeXzzZ6S73EhwVGdP0xS2t8sX2tzwcZzOYWbpLgRGa
        ATGunQEsufYxkO34FMLP/gk=
X-Google-Smtp-Source: ABdhPJy/OQdvlrukpSEDYSIIqt0Wn8U61TNG4DXlMIwuU0DAtURKRoJcY/V24J9kIbeElJMQZiZHOQ==
X-Received: by 2002:ac8:51d3:: with SMTP id d19mr17283092qtn.358.1618939509717;
        Tue, 20 Apr 2021 10:25:09 -0700 (PDT)
Received: from smtpclient.apple (pool-70-23-22-173.nycmny.fios.verizon.net. [70.23.22.173])
        by smtp.gmail.com with ESMTPSA id p66sm12659997qka.108.2021.04.20.10.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 10:25:09 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   "comex ." <comexk@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Video conferencing platform choice
Date:   Tue, 20 Apr 2021 13:25:08 -0400
Message-Id: <C3BF5681-DA8F-4DD6-9769-11A19C5FAE3F@gmail.com>
References: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Geert Stappers <stappers@stappers.nl>
In-Reply-To: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (18E198)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org



> On Apr 20, 2021, at 1:22 PM, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com=
> wrote:
>=20
> =EF=BB=BFHi all,
>=20
> Geert Stappers has suggested to use v1d30 instead of Google Meet for
> the conferencing service (and he has kindly offered to foot the bill
> too -- at least the initial one).

Hi,

What is v1d30?  Googling it does not bring up anything relevant-looking.

Thanks.=
