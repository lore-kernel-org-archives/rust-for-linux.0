Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A5C6FA99
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 20:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjCGUVu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 15:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjCGUVt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 15:21:49 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC421A3B4F;
        Tue,  7 Mar 2023 12:21:48 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536bf92b55cso265429537b3.12;
        Tue, 07 Mar 2023 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678220508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+IY8UzAM/RZ3TeWbW0ubM4NqyIzYaaPyJwWrG0C17g=;
        b=o3XBQrg0E7Gu4Bfj1UMKOqzr+iqyEw8RAolsQ0y0e9rP5fT6Ko80YcyP4xerW3tVy2
         uXftt5CH6v5UNl5a5kGaIGmV8RHWqX5zdXXKYop5T61DkG+3qC/ueohmOU4CbyDQkfq3
         5BmOVQCR3+QizmQhtYB8KgJ9Wi/R/dwAx+lQ2Ci81vxj800rVHtLcWP2AlA6+beu/D7e
         kn1JuRPQOCWTCPY7sWHQp00cP9+fXCDJc2PK5yUE3Kytzk39Cfzx4lLa34iqNy04afwa
         9/Uc8StrmKVSvZjXNfkWUvcCeA54MwgD7xk/iD6KiIa2Ue5EQD6sF1/NT1VH+54ynche
         /LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IY8UzAM/RZ3TeWbW0ubM4NqyIzYaaPyJwWrG0C17g=;
        b=VPa73ucpziHbF38DJMoeGQ4HSQRieiHspOkiYuDIG2TROaaA67rZ3s5sPRcCO0437p
         dPQR0lher3SI2Ka+AVR0kI40SPWOtRvJDUUh8XCHKds12/xt5seInWTILBrxonMFJoqW
         qsF5R8S3CgABf/8BBrCTslrpmWxbwBC2Qmnfgf0zIfophDcoGdx0lmtVjEJTuZjti6hU
         XIi3snfCV69iP2iZJEdBUZ/6qBjqdW+5a/4Vrnekhyd3PiZLtsEd8n0E5VCUk/H+466z
         slq/9UzXunnw3tydaP5HvStOb0xWE+sYSDe1KJCHWOrsuebfTGTQjNYYy6GykEGv4xw1
         RrNA==
X-Gm-Message-State: AO0yUKXMc31hdCLoW2KmVOt5GSfLyOmlfcX2qoDmZTqhp8d0E864HQt1
        nN0/ju1PTIRWyTtAoqixfO4+qxBNwtgkyGpqW/A=
X-Google-Smtp-Source: AK7set8WHeDUH2QzZ+qXXUTEET93/pMiobKm119Tu1NVq9tGU/rw9YM9TSLJVmG610ERzpj35YEYE8yjCa4xNbbiPjM=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr9465097ywh.10.1678220508034; Tue, 07
 Mar 2023 12:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-1-f8f9a9a87303@asahilina.net> <20230225221405.62e989c8.gary@garyguo.net>
 <CANiq72kOb9mbh4HQzH40Ey+Rax3vREsd0Nf2O0apjDpsboE6vQ@mail.gmail.com>
In-Reply-To: <CANiq72kOb9mbh4HQzH40Ey+Rax3vREsd0Nf2O0apjDpsboE6vQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 7 Mar 2023 21:21:37 +0100
Message-ID: <CANiq72=jWZS+UGx20XcdpRSWxG_CBhmB7Xyib8SCeCFYZdf4aQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: error: Add Error::to_ptr()
To:     Gary Guo <gary@garyguo.net>
Cc:     Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Fox Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Feb 26, 2023 at 3:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> But I don't want to block the rest of the work on this, which may need
> some extra/parallel discussion, so let's keep the helper for the time
> being. That way we can also do that change independently and justify
> the change showing the difference in performance/text, if any, in the
> commit message.

Opened https://github.com/Rust-for-Linux/linux/issues/984 to help to
remember it.

Cheers,
Miguel
