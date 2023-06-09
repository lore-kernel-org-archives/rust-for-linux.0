Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D66DC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbjFIJpT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241828AbjFIJok (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:44:40 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA0E5BB5
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:39:39 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-3f9cf20da1dso12830321cf.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686303531; x=1688895531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKLWHjK4spY0c9f+d4CzXeWrrFilaCtxc/4NjmMP6xM=;
        b=VvdSi5634/9siULrNscg0VZ1uGSeMQuJGDbFUEU6T/AXp5oqvWSdwiQA37py+SFnbi
         jRTORF/aJeitFdo9wo8PMdylYMVx/o/nPRqyqKl3W2quaG2+IFz54/85C9pbO52afC9h
         IieGFIXJx5+LaqQn/05wCj2SmgK/288ip8+MrltT8FUsBvIv8fD9jVkKonbKoFCWn6JJ
         XOJ92IGJhC3NqGeHpDIIcco/QrSptaTKgVJHOpw9yfriLD3Z9SNTgzRcKb6gfZgK0Zoy
         hVxqcvITIImpbZTSZQtdYgl8wkCR3gDUg5Lp/px7YynpST6pVZ6X26FBn5gDykqebqTy
         0FiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686303531; x=1688895531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKLWHjK4spY0c9f+d4CzXeWrrFilaCtxc/4NjmMP6xM=;
        b=Ow712Cgh1zq+geiC72SOGTGTfjyFqnqFsb6wozuBmPxr1g6Qwd/m2+z3ypSxqkpXo0
         3cCfINmesrvHLDoPLH1vDWe+1iA8hW6AQewmee3P4MAfRE5Eiz3ILJ96JmQ3huHF+0fw
         CzZW3udr6h/ZCJhDOS+aaouulACAktut2QBQUSp7SaOyryyDMOIo3k2gmaI/B2nZH6F3
         8WyRi1OuNS32iIG6SFkaGs+pYyAFxqtU5Mb7q76zW4VHOJ+YNDbCuMtWBsD/ypyenbXR
         aK1OJZFoouLGSrFdaQgtvQ1wJryO5LseFH6mJeslbcuaXmvr7Ogsn4EoNAIqWV4h8Iqd
         gIYA==
X-Gm-Message-State: AC+VfDw0W9r85/UFrg0P38a9Ctup86He10r9yAElRWvQBpBlCi1fVOJt
        4OUzU9jvyzLvDpWLjsHrb+ePoucXkoZ+nK3qAKJp+yBg2Ik=
X-Google-Smtp-Source: ACHHUZ7o8uJbklwlFLlAGc1ThcIGo9Go4MQomM9Pn7UklrIk/h5zkFj++r7yQqJ0prKdS1HLb6FFF7wIYM7cdDvFAyY=
X-Received: by 2002:a05:622a:1a25:b0:3f5:c9f:1b27 with SMTP id
 f37-20020a05622a1a2500b003f50c9f1b27mr1294183qtb.1.1686303531678; Fri, 09 Jun
 2023 02:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-38-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-38-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:38:40 +0200
Message-ID: <CANiq72kkPxbYOOhVZ43PAZ7-3BrCZvLK98GwvRWk5cr9ijiZEw@mail.gmail.com>
Subject: Re: [PATCH 37/80] rust: kernel: fix compile errors after rebase to rust-next
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:03=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

Not a big deal since it is an RFC, but please note that we want to
keep all commits building (and passing docs, tests etc.).

If the patch is from somebody else (which may be the reason why you
split it), then ideally the original author would sign off on your
changes (or, even better, they can send the updated patch themselves),
potentially having you as `Co-developed-by` if they are bigger
changes, or you can otherwise use the `[ ... ]` notation in the
message to indicate what you changed (e.g. for small notes I use this
style: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3Df431c5c581fa).

Cheers,
Miguel
