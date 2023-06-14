Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B023EB64D9
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jun 2023 20:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjFNUct (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jun 2023 16:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjFNUcX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jun 2023 16:32:23 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2E22135
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bb2202e0108so1156609276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686774742; x=1689366742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=G7nM3HJOnTFO/r9nAs3VZ8ncUNpyRX/dBLh4cUcJcmbenazk6RT3d0BY4kl05VgC7M
         hNG3l1eFIHZy0gEKps3DT5vySPcxIostlF906zTm9a6QCda+Q5I9tcCdRY8YWvhUYCUW
         lsOxSdJQJNcHDnkCz4F10A5UyoXfstoJTMP4CDGufudVQ0bYtp3EOIDQWs1ea1W8e2lO
         QIxDHcHSEKPBkMjJd96eewXi0JWcq53nWPUQ5+57RZZSBUkQyIVjvR1yEgLxFtsud9z1
         bS9oAGiiTJRrGkQXaK5TaTs/QZsSEcsG9PMfGSVuk52YwGs5GnAvb4usttTNRyYt2s4Y
         0hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686774742; x=1689366742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=Cd7lPIq4Hmo2KVHVBDLf4CD8vWR09ogYPwgMdwOQPsLjT32h1fD3Ruf28qdte6GjpR
         3rV33oaUFoV7RXSyu0l0bts+ZJEfpPUq4QVsE5pQOpjG8mwHL25DhBi16EdEapNjfqhy
         E50Zy4zmH11802jV61TmSg7iWNLW7U/QkvoZ/cdyhpkESlk6NKNISaNRTy3ElJG4qZmd
         sIRGBkPi5qL4cB7XYArEefvhI0hSBddDmtgTewth6g0dNmeM6zH61yfPkpK/KZk9xxpU
         qt6WiJEP/J9BiXHTTXu/PdiXhtdzVtZAyAAETOFg0Un3hH1oiFMhEed2FkkvJVD9NypQ
         ioUQ==
X-Gm-Message-State: AC+VfDzb+vZm7K05RZNH/YhPd6+XKA1njuxScbyJUnmyyo5/kIhd0aX4
        gWNEiARsb6Vy8zvSHqxT3B1pLCictuWVSLc=
X-Google-Smtp-Source: ACHHUZ7nhMzTUUAXeFrCWZk+JOE1hhfH3uptvV1wMpqo0Q8CgtIthBnY4QgsVNVwEM46C0usmP5m88ATIWqIRW0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a5b:d42:0:b0:ba1:d0:7f7c with SMTP id
 f2-20020a5b0d42000000b00ba100d07f7cmr460247ybr.2.1686774741924; Wed, 14 Jun
 2023 13:32:21 -0700 (PDT)
Date:   Wed, 14 Jun 2023 20:32:19 +0000
In-Reply-To: <20230614180837.630180-3-ojeda@kernel.org>
Mime-Version: 1.0
References: <20230614180837.630180-3-ojeda@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230614203219.2909087-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/6] rust: str: make doctests compilable/testable
From:   Alice Ryhl <aliceryhl@google.com>
To:     ojeda@kernel.org
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, brendan.higgins@linux.dev,
        davidgow@google.com, gary@garyguo.net, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        nmi@metaspace.dk, patches@lists.linux.dev, philip.li@intel.com,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Miguel Ojeda <ojeda@kernel.org> writes:
> Rust documentation tests are going to be build/run-tested
> with the KUnit integration added in a future patch, thus
> update them to make them compilable/testable so that we
> may start enforcing it.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

