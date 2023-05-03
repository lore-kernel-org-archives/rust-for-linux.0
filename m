Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D7C77B78
	for <rust-for-linux@archiver.kernel.org>; Wed,  3 May 2023 11:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjECLC7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 May 2023 07:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjECLC5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 May 2023 07:02:57 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D38A5BB9
        for <rust-for-linux@vger.kernel.org>; Wed,  3 May 2023 04:02:29 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-44fbe7f0b7aso23793e0c.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 May 2023 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683111747; x=1685703747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI5Vmo1n9WVQ52iHISY1XSCymjgacKmLWlfwdFrbt94=;
        b=wQdFGYuqSsDhzrL443sj/TI+sREIt7TLgtUMwAJo2IxdDSlaOVfWHAlYXmtZifaesR
         BwDjv3sUvJ9L5Rqqp3hYulZy+Y5Z9mibm+i1LByHJ+48ThnV7k9TekyqIk3IYARbGuju
         XNku37Bg9ZmXnuCb7XXvuooX4el722Em2JyPemlnnQKZF2R4RA8iJqP5srpUVSYuxo3S
         qoZpgZ7gCnZq0z5bFX6joslypxteNg1ssnJtIk2eG2pMm7zLxzlQ7b2PmGeMPzaKdOLy
         Et+kQ616N1hGFMcbVWFB32CbY43U/afQF6bLC8Fljznlo/blu+Fcix/yQ4UO/s+OkdS5
         EhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683111747; x=1685703747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iI5Vmo1n9WVQ52iHISY1XSCymjgacKmLWlfwdFrbt94=;
        b=k3oX5RN78MilKtUU3DOTqVYUkP/XiQVY4tAhmYAsrdjTwaefC15Yl0jivg2FG42liG
         6UArJ8j6IFtaJL9qXdV83oGSHI6DPdbZelyTN6uCZ1ZqGDj+Y90LmVR/seAzLtC2fYg6
         TiX2zMpGD7+YqVGlOMt91t1CQkWxFkDOXLNiuynWKahlKuCl0vk0UAZlsyiHvypJLez5
         /m2U7Ytls3IKSBkuqRtViJN2/oC8pTj4DxT9ifCjq4siBYlGnqlha6Qoxi7OCCBeWQ58
         sWDWik+SSF5X2q9U9iAzMJszjgJwHen76wDVk8NzS0vFIh4d7paqUr6LTU4QFJj3wowx
         BYeQ==
X-Gm-Message-State: AC+VfDw2UKgk73kgK4Ks8D0P6DUOOK7pn33HgitW4bmekDMdO0+W+1FD
        XKpfG0qacbvLTdIR+ZImcVAuMozskXqD9yx/9CQ6hg==
X-Google-Smtp-Source: ACHHUZ7a5yuleZaxORTVPNKd+rxoBKRyDLVjIwdER/Rea+eKxqfnJsgDo4w/7lXvEkkRAjVgc3nJCSfw4PxyL8fRoZE=
X-Received: by 2002:a1f:4d44:0:b0:443:ddfb:d58f with SMTP id
 a65-20020a1f4d44000000b00443ddfbd58fmr5643234vkb.14.1683111747034; Wed, 03
 May 2023 04:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230426224748.34056-1-materoy@proton.me> <20230503105935.518315-1-aliceryhl@google.com>
In-Reply-To: <20230503105935.518315-1-aliceryhl@google.com>
From:   Alice Ryhl <aliceryhl@google.com>
Date:   Wed, 3 May 2023 13:02:15 +0200
Message-ID: <CAH5fLgjq8-pq_6mO6FVrnfeHwnUKPR+h_CF_XWvrvJ_w8SXXkw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: error: add ERESTARTSYS error code
To:     materoy@proton.me
Cc:     alex.gaynor@gmail.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com,
        yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Seems like I messed up something with this email. It's supposed to be a rep=
ly to
https://lore.kernel.org/all/20230426224748.34056-1-materoy@proton.me/

On Wed, May 3, 2023 at 12:59=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On 27.04.23 00:57, Roy Matero <materoy@proton.me> wrote:
> > Fix sorting of rust/bindings/binding_helper.h's includes,
> > to maintain consistency and rust idoms
> >
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1002
> >
> > Signed-off-by: Roy Matero <materoy@proton.me>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
