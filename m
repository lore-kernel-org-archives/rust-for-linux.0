Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51492EB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 14:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbjGNOCG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbjGNOCF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 10:02:05 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3EF269D
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 07:02:04 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-cb6f1b3e826so1193286276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689343323; x=1691935323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RX/r2ODC8fCu29Ed3cujFRc453JSyfT5sPImsob4JU=;
        b=BwbXGxAdGDSa8Hh7hYoUt1tjxNITodRy4Ie5C9Ve5VjqA6Jp+nyRz/A8pfmVILcQ64
         waqrj3jD33fIlouxPLj8xVZ7jMJXPFpzZZfFIhJRa14Ko7B0PJ9XRY1ZTwTG/bpqLs6Y
         BruFqcKyT0EUFnXIdp0TIxtA3LQR0nYcxTlVMiwkz4IRgvYemxzWVSA3T8g404mRVp3+
         3dri6WPbfsCB8AwLXDoA9muP0F2W+o/cAaLBQOFQLs1sYckvS7fBVKqH65bEOBGc7dsw
         FK3QzCp5BfBLk4FUwZ4FZA1gNaX3R8wrbNX3RrAAV2tNGAFQZlGdMBItHrESM9ihMcph
         sZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343323; x=1691935323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RX/r2ODC8fCu29Ed3cujFRc453JSyfT5sPImsob4JU=;
        b=hzAjuSm7U4z/TaVjJ0bw0v2BKdLH0C5cIB9EZ9yv+oz+6FYilGjYoY4ZZs1U3B3TpC
         P42AIepcJ6NFHCHBiPufz3o6a5l0OM0PQJL/ixj2yJ5doCeeTLZq4jLSuM5t2+AcOf8b
         UIpNq+R8DTThalg5qOpZvz92tvgDx8r0JWmjOJADgTHskM2eJEWPVjInrDyZ88Yo2dGC
         84M75DJbVP5y3UTGIst6R9KdaTvjb5cSQN/xNkzF7k3PvEImQJm97xD6uKR836lXxhQP
         bnnkzVeqO9QNC/7jCcuaqPX3nw1BwsEXQr9z00fYrBHWpRGkhXs7bV0ZC54Te+NnaOZM
         JC3Q==
X-Gm-Message-State: ABy/qLZ20rk1+zy7WfNXaW+1pwqxR7nxpfDuI4qrJa6fN5uHEslbmiXU
        +DInlsnZ3qDhxo30bX/iNtBQmHcE7BlhOPs=
X-Google-Smtp-Source: APBJJlGzu1LO19CXBMx8FKjaV6KIVSfUtdfZqayTOkYrzFmODQN5OrWCNNNYNkUzckjgrty4qCCNo3lYvl3ikgU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d8d6:0:b0:c62:d787:3acc with SMTP id
 p205-20020a25d8d6000000b00c62d7873accmr25193ybg.2.1689343323690; Fri, 14 Jul
 2023 07:02:03 -0700 (PDT)
Date:   Fri, 14 Jul 2023 14:02:01 +0000
In-Reply-To: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
Mime-Version: 1.0
References: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714140201.383439-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
From:   Alice Ryhl <aliceryhl@google.com>
To:     ariel.miculas@gmail.com
Cc:     alex.gaynor@gmail.com, asahi@lists.linux.dev,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> On 14/07/2023 18.48, Alice Ryhl wrote:
>> Asahi Lina <lina@asahilina.net> writes:
>>> Trivial implementation.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> 
>> The commit message is a bit short, but the change itself looks fine.
>> 
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> It's so trivial I just didn't know what else to write... suggestions 
> welcome (for this or next time I have a patch like this) ^^
> 
> ~ Lina

Adding some sort of motivation usually works quite well, e.g.:

Make it possible to use a CString with the `pr_*` macros directly, that
is, instead of

	pr_debug!("trying to open {:?}\n", &*filename);

we can now write

	pr_debug!("trying to open {:?}\n", filename);

Alice

