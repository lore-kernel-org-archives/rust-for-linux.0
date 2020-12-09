Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75998C4361B
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 21:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 441C323C44
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 21:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388340AbgLIVsl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 9 Dec 2020 16:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387514AbgLIVsk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 9 Dec 2020 16:48:40 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF90C0617A6
        for <rust-for-linux@vger.kernel.org>; Wed,  9 Dec 2020 13:48:00 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y16so4280195ljk.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Dec 2020 13:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9TtMWjZDSSrN8xjz681dnTtf+tYfdjzpewcUbTZqz/w=;
        b=Xx1hCNV9YV14aBYhoTb4He2oE0PY9AkG9cAMpu1NSIfxIfdxwDa8/Q1ZHDZ3TGIETm
         axGJ7aVC2D/RbbrBOwG27CaEIKojTdA3iZT3ZIt0DgE+F/wL6cGcXhp5N58VtiQcx1xm
         qkFJ3QjxZegNSQV5J0/U3EFXpQIqxbh8hJHvPnqWCUzOAKld6PBTTAZ/yYuDztrBZqy+
         szWMwRO9SiCw4Aq70FOgjElLIREQ/e4VeZKgRrX0BmRsiHom5KUCLD0RlShu3MGhBlV0
         FLCx+hyK9NcpP6DgXSA0MptI91ofmySiqa9s15+ec3Ub12fDbFzHLGqskOlfhjeIEhYb
         kK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9TtMWjZDSSrN8xjz681dnTtf+tYfdjzpewcUbTZqz/w=;
        b=UeoERCM54Dl4wUQVw5IS3qBJpf+zdHrkhEBP+pfebRlJ+O39LEWXU0yQHUI/u2eRcw
         5GnIlxFTEKOVcwKZUk9NDLWy8Uym2UAxBfaVZgxMl/UDRc+hp0BaHXZY0S91ITjHPDeG
         v8WK9d5wAIT17t4NDWNDdQ7bmKOneIXKT/mV3NXPRVbRcsIa6tekjyjgT3vJnnvLjna9
         KCL7FL/wrhIuJ7Qo+OPreuBgRbUfPC0TCXtDtY+bphBKL36y1Qgas7jBrKFtst4pw333
         +XucLd7jMKHJTLkHLAYapgs19TnKN1WBb0wOKDR+VClPdxAqihk/Kjizzpa39WlvhLT0
         rq/A==
X-Gm-Message-State: AOAM533ZGvfTWeepgZhhFnWvvWHaaqKzJ/swbA2/cMIq5CF6sMZe3R6+
        A5c1MKXRr/BMFDSjtsznNQWXWsussvMjTk9vhC0UoE68WycN4gk=
X-Google-Smtp-Source: ABdhPJymZ/8ZaNYsaFLGUzexxfZ/G7jXOwEau0jceSG40CU4wL1PvnDUa1IclheCueB48KLohUl4fadR2gWQSPOERzs=
X-Received: by 2002:a2e:900c:: with SMTP id h12mr1761742ljg.451.1607550478428;
 Wed, 09 Dec 2020 13:47:58 -0800 (PST)
MIME-Version: 1.0
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Wed, 9 Dec 2020 21:47:47 +0000
Message-ID: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
Subject: File operations
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

I'm looking to implement a FileOperations trait for a driver and am
finding it cumbersome. For example, to implement read, one needs to
declare the following (copied from example):

impl file_operations::FileOperations for CycleFile {
    const READ: file_operations::ReadFn<Self> = Some(
        |_this: &Self,
         _file: &file_operations::File,
         _buf: &mut user_ptr::UserSlicePtrWriter,
         _offset: u64|
         -> KernelResult<()> {
         ...
       },
    );
}

I couldn't find a way to simplify this to just implementing the
desired functions, but I can get it down to implementing just the
desired functions plus one annotation for the impl block, for example
(note the [#build_fileops] annotation at the top):

[#build_fileops]
impl file_operations::FileOperations for CycleFile {
    fn read(
        &self,
        _file: &file_operations::File,
        _buf: &mut user_ptr::UserSlicePtrWriter,
        _offset: u64,
    ) -> KernelResult() {
        ...
    }
}

How do you all feel about this? I think it is an improvement but would
like to hear what you think before spending more time on this.

Thanks,
-Wedson
