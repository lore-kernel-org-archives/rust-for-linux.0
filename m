Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAAAC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239878AbjFIJf1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241719AbjFIJes (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:34:48 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898C646AE
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:29:43 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565de553de1so23272207b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686302980; x=1688894980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj4T7LH5t7QJKeAME2rARLMTwDCGQfLYP65VyorTy5M=;
        b=jETcV7zH9FEMDaoBr4yhaK0abtlpBe8i/5pmSrW9z4USAtWiT8mN9+nfSzoVi6wexB
         o04FD6N9ZPOOvE4XM72phRwpFrLwM76tNdsbOA1ncRstiiG+8cUthk6y4PCOteVjqNbm
         2ECL/GiXfLi11sGAgtrXbnC6Nri7g+7c3+QokbS9UftLzBLv6LVhVvolT37FL8OBV74d
         tcICB+4qQqL6tDPz7alwVdmEkKdkF+3EfzBv5tEyAmQfyJeCmakB12Hg2WsB9KFtyujV
         B2kmTTUL6HdfTIdon4e0sbp0RQlsxT9VYcJp9X4uEKgjh8gsBidk7bfkLm0fEe0ajYWg
         TfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302980; x=1688894980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj4T7LH5t7QJKeAME2rARLMTwDCGQfLYP65VyorTy5M=;
        b=LoDUtn4PLFS5qPVz/I2G56xkDbb4FtuzRdzOMTBfXi5AOA/qvfCUOj1j5viMkbP7f5
         GUxXcqL+qSsgIoSoKOYeP3yKezeoiRiuuD7jCoO+CLIAlmycL5D8+maAZzgIgHStEBOr
         SyTI0Cy2iaaW9nE/iiCjTQ0lC8ZWaggviBuwk1ZvU9GJx2uIEAf4cLCcPP4LrU3aQQv4
         u6RG7xAlitXlTZZ9YLX2pRm/zJeD9OYzTQzp5M41j3mbsBu2OYHddc0QgkhK/5hOjJ43
         jNHIjex1K3nopFSay7J0Y9dS9ndtYyUtc6LNLv0eVrmgppXHt1X8mO8y6cpxeVIET/Ma
         v6nQ==
X-Gm-Message-State: AC+VfDyVqtjIyv1HjKJf5ph8h+4N9i/8RDT+GRX8OG7BUluIB4pW3RdR
        KM1l9NTzhZbu6xWArkOzDsQD5TRFOomZBLOsxx8=
X-Google-Smtp-Source: ACHHUZ7L2nLaqywytfjEK2yK5XbP4/Px9D0PlBMNogKqpbMhjXSORwohF3zhpuIyTbXz+K4VDH2I0Nx4zABKp8L/ukg=
X-Received: by 2002:a81:4f4c:0:b0:561:1cb6:f3d6 with SMTP id
 d73-20020a814f4c000000b005611cb6f3d6mr1449241ywb.0.1686302980338; Fri, 09 Jun
 2023 02:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-13-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-13-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:29:29 +0200
Message-ID: <CANiq72nUhVTUJKyfsPJshZ0hL40-GK=O4JuPyBCy_1cd_j1CtA@mail.gmail.com>
Subject: Re: [PATCH 12/80] drop: Add crate::pr_warn declaration
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:05=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> ---
>  rust/kernel/fs.rs | 1 -
>  1 file changed, 1 deletion(-)

Empty patch, probably due to rebasing fun? :)

Cheers,
Miguel
