Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48742C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjFIN6M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjFIN6K (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:58:10 -0400
X-Greylist: delayed 222 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 06:58:08 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3101BC6
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686318866;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=UZGLUpK2zuOeesSxYJ9dJYtyDXiloCfMkpZ+pFEInSY=;
        b=TVKTF0kTttm3uwdeSeLu39HzFLTLxB4VkUx2ymPl2jp3f7B3TPWDjBgTWLoWJEzf
        2WQDTQyDy/3c6aOmNavUhR3v99Eh4m2Y+dvgBpnT8351E+ieBrTJlSBkxm/kxRNcrWQ
        PbroqCHFg4ShqxnYgPcRnJJw6N1/SebzRhGFdEZB4BCgryGMsYS9uE70F/rTJEqhjao
        DR2kTW756SHjgY7idS0wx4vm71grIwUqnK1d5E5NVji4aRcEeWdEdXL5AD5VVPltNrN
        4hTUUBmoxBiDBaJ1tu38n8q1qKwocNDTyaLKekcS3dKa7VMiuXkFLRMbmkWAN90iHXU
        a9zfhKYY8Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686318866;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=UZGLUpK2zuOeesSxYJ9dJYtyDXiloCfMkpZ+pFEInSY=;
        b=nxXMN4Xz4ssNBAwTUwxGgPQsLG/54k03mePzTOl3YAkvux/3WLc9xWS2gT8P2K8O
        X8FzmVhM4Mg5eYB52KZZmvWj4OYc4f93O7czEyuWkptcHy7m9oGHU2OaocIJHUgYBlS
        +T72IbKNEaswzl9DeZ2S88nmRjHryqJ6rzfRV94E=
Date:   Fri, 9 Jun 2023 13:54:26 +0000
Message-ID: <01010188a06fde45-e7c47cbb-2395-4bb0-9098-042f167a7281-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, andrew@lunn.ch, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230609131158.1646249-1-aliceryhl@google.com>
References: <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
        <20230609131158.1646249-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.27
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Fri,  9 Jun 2023 13:11:58 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Yes, `fetch_add` definitely gives an atomic instruction. I was referring
> to the `load` and `store` operations.

Sorry, I misunderstood what you meant.

Anyway, start_xmit() can run in paralle so fetch_add() is necessary
here until adding Rust support for per-CPU data.

Thanks,
