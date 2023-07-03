Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA660EB64DC
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jul 2023 11:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjGCL6Y (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjGCL6X (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jul 2023 07:58:23 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564A4E61
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Jul 2023 04:58:20 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57059f90cc5so50673057b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jul 2023 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688385499; x=1690977499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=waeGDoVgGDH94No5qzti6s6z1JdLzgejSmKbt77NSm4=;
        b=n4DSn/SR8jW6zJisAJudqF9kgG9Pqv7i8vnxTpRtFOtxvSaZj15fVx+EtgG1vTFbGd
         UbJ/ehSb1pcQwECTOdfVFUhtgAaIdXN2JvtJ6/S9iP7uOHqxWF/Hl7MtVTDRxTHkmMBz
         JN1h8sHm/n0fP3d6khiTMAY3w5DF1C6pG2fIFb0/hXValDWqJB+ZuZu80gddy/gJqIBN
         zcXZ9hQytHsS4UAmWXkKlYYZYmZyMHBpRjAC/xF9w5Jj379G5gl651yTSdjiSPuu5XZX
         r4tCuWozs8XfHLNvcBcT30GwP5F025LxGCo3YuFm6r4/azx/r/rbdQG9OIfG0FgxDLx4
         EKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385499; x=1690977499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waeGDoVgGDH94No5qzti6s6z1JdLzgejSmKbt77NSm4=;
        b=QGuTNpaYtGsSbGAXo4VLnmfvif6mkX7mrEYxxJPnTGnnhcmTS9yEPWghU0w6VrEJXH
         Gq3AwMgLOncXnvVcbUgf06I48ydMSZbN694t6G+oFQE7DmogWlyYpRT8aOQjfFTF7gjC
         8Nw6i8hmyzOslUoGCzzVQ01mHvzH3S81KyeXotMMZfn6YSRBbxFCrcOKPoMxKo9SIHJd
         p2q+o8qEXRd9JLz1ivEQvucn4p/uaYTP3pFIb/dQgXAgGAl+ju98bXEUtJKTtLHIE5Pa
         gapHYX7a2Xf3ZuAD9NdpYg82dxxYc8FNC2e/ITrFuTdBnRIfLTSwDU5lChu/ODNrpTzX
         1WyQ==
X-Gm-Message-State: ABy/qLa4EN0XCGjOfj5DQpYeXjO7p2ujaZIcpYQX+g2hil5yt9lYQvjY
        9Bp3c5cJH+pWGRhHP1tFxrLOjxD8+oySals=
X-Google-Smtp-Source: APBJJlHCsEa6ZqPl05Kk8kCJRBjFUQKdWC53i0Nx85xGnPc/NmX5y0re3ZTmg8qKPxbtdgNrcbil/bu/BsKvBU8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:4eb:b0:c10:e586:4c7f with SMTP
 id w11-20020a05690204eb00b00c10e5864c7fmr76067ybs.12.1688385499497; Mon, 03
 Jul 2023 04:58:19 -0700 (PDT)
Date:   Mon,  3 Jul 2023 11:58:14 +0000
In-Reply-To: <20230624092330.157338-5-benno.lossin@proton.me>
Mime-Version: 1.0
References: <20230624092330.157338-5-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230703115814.2294010-1-aliceryhl@google.com>
Subject: [PATCH 5/7] rust: init: add `..Zeroable::zeroed()` syntax for zeroing
 all missing fields
From:   Alice Ryhl <aliceryhl@google.com>
To:     benno.lossin@proton.me
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        lina@asahilina.net, linux-kernel@vger.kernel.org, nmi@metaspace.dk,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Benno Lossin <benno.lossin@proton.me> writes:
> Add the struct update syntax to the init macros, but only for
> `..Zeroable::zeroed()`. Adding this at the end of the struct initializer
> allows one to omit fields from the initializer, these fields will be
> initialized with 0x00 set to every byte. Only types that implement the
> `Zeroable` trait can utilize this.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

I'm a bit surprised by how large this change is, but it looks ok.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

