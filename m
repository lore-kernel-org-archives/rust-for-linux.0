Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D68DC6FD1A
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 17:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjCGRa0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 12:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjCGRaC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 12:30:02 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4128C530;
        Tue,  7 Mar 2023 09:25:18 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8FD7C2D3;
        Tue,  7 Mar 2023 17:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FD7C2D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678209917; bh=MXdgT/weL/sGwELNPyPxwLyYWjuL98nFt25rMpbGw10=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QenhgGQYPFbxJEAX5UJ0287KfU5iW1wZkZxtA9qx/3TCHQPJEL9UZGF/KdfrALjFu
         7yMC1FW1q8rqO8y+2ZfhkBdV+LaQTHdnnuvEfpx5WF6RCS/ymJptOurEXpmDnTWgln
         wsTCyB35LpEA6a992r/rwt0dHKBQquaEljkC38Tykdx8l2t5V9fbKI8Z2ZsaoYfo27
         CWmLnj8L8n4SH3CvlL6fZkOx4nqr9z5G3bFGB/CwGRXkEqyZmUkY8qf3VzlcKKHp9k
         p09pg5fUK2yj7hXFzaBqMg5fDxUlVGb22ACoimYBKvoCRa/asNjPlIrz1VAi1Y4heq
         FMf7hLTgpNH5Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] docs: programming-language: remove mention of the
 Intel compiler
In-Reply-To: <20230306191712.230658-1-ojeda@kernel.org>
References: <20230306191712.230658-1-ojeda@kernel.org>
Date:   Tue, 07 Mar 2023 10:25:16 -0700
Message-ID: <87pm9ko4n7.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Miguel Ojeda <ojeda@kernel.org> writes:

> The Intel compiler support has been removed in commit 95207db8166a
> ("Remove Intel compiler support").
>
> Thus remove its mention in the Documentation too.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/process/programming-language.rst | 5 -----
>  1 file changed, 5 deletions(-)

Both patches applied, thanks.

jon
