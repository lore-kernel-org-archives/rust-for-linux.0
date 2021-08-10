Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7895C4338F
	for <rust-for-linux@archiver.kernel.org>; Tue, 10 Aug 2021 08:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD78561019
	for <rust-for-linux@archiver.kernel.org>; Tue, 10 Aug 2021 08:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbhHJItJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 10 Aug 2021 04:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236991AbhHJItF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 10 Aug 2021 04:49:05 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C426CC06179C
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Aug 2021 01:48:39 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d2so14845119qto.6
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Aug 2021 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Sypb3SR/zj7P7+O4YIVr37bWZJtuV8/MKJ8YfuoFfwQ=;
        b=qnJ5kkVNjkVofx8+76JdqfUBy5ruDspTvjHH6RdyA3yFDAdlBFS8y0erKgsg44t8L0
         +AYJ813FvLIjNZuv7yCNYzNH0nTHqUel3BYZWHFGuIn9zMq4NFzZ04pGyqDVFk6dOwUy
         lhwOWGDo1E4xoR86xzNDet64UiEVjC5VMg9ebtRgmjn2kqu7EBDRyNCCGxbQlpBrmk1W
         KzU5WpiMp9WZQ1AoIfqd78+Nv2/E5K49WUY0UKOR2nbNjz2lJb993N4JRsD96ZyX0rmA
         aYdWCjHoZpUOSU8T/sCWHh5S0en4hebPFElxCwCR3qzT6JU9XA2a3maIZyNbEpjdjts7
         65kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Sypb3SR/zj7P7+O4YIVr37bWZJtuV8/MKJ8YfuoFfwQ=;
        b=q3Z9vWjD883aXiriwKgsCWZ4YWDUBIHlYeR6KhHYlJQ+2jMPeZG5lxvZu1JqsLuBfl
         VNvKMhFqj+GNl2+4a5V7Fj3rzVJ3piwCDbnC8jZ+DmBgXOv0+p4PmfvD3ljyInBSUsOA
         aUGbjYiIwfCgEiGcAVwvX+3RrmKm09K4AVArQ+srpAoqnr8TxWtndPnEjAxSbGjneW8I
         /LV/4NeByYxuveqUL8Iq6K03sY3Yvm+SdmAQ3S5wfEPj36N1M3NhKn9QJ9wsMLNOJrrs
         83uGYvOAMoJXZbOACAYcbgd1zaNgqzblojWfud+ETCRhGVZYi0PV/k7swVmTIRUkZtwM
         ZJ2g==
X-Gm-Message-State: AOAM533vwJCwgWJfBxuGXdG/DswzBwegTFx+r+alXJYQVPQQg3H+H30Z
        OUfU3PM+mCuwSDLTeddromF+lhfP6Hq6rmVFmAjHA6+FRbjUZA==
X-Google-Smtp-Source: ABdhPJyG7cbTah4tZygxjVI1yDpkMqVhestjyHb6zeawqJYLZCDVCs3cZhRZuB+U3WfizMstvrTAXsuMeu/ZpAw2aW0=
X-Received: by 2002:ac8:7515:: with SMTP id u21mr24139598qtq.80.1628585318636;
 Tue, 10 Aug 2021 01:48:38 -0700 (PDT)
MIME-Version: 1.0
References: CAK+vCJBQDt7w4TE5E-dPa8WHUDDvKL5jRXwi=pfuRLzwqKf2tQ@mail.gmail.com <20210810063241.7C774C061796@lindbergh.monkeyblade.net>
In-Reply-To: <20210810063241.7C774C061796@lindbergh.monkeyblade.net>
From:   Cesar Guzman <ing.cesarguzman@gmail.com>
Date:   Tue, 10 Aug 2021 10:48:27 +0200
Message-ID: <CAK+vCJBoEWS=aQF-O+b1srhV=YczoGG-3QctLP20DUiL1dx18g@mail.gmail.com>
Subject: Add to the list of rust for linux
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi there!

Can you add me to the list?

Thanks!

Ces
