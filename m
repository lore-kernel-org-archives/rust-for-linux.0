Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DEDC7EE25
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 12:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbjFLMq2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 08:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbjFLMq1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 08:46:27 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A570BE51
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=hR6Apa37WbakS3h0Rsn4oA9/4sht9cFPfiWdZXbMflY=; b=yK8/wD+JwzrTURGdJe6xlMvol1
        izgrjEZQiNibjWlI/8NwtBjG8R6ZkRZOhVLllRAfnu4YfzH8HzORphNSQudvjhLuO55G7FIYdYhmA
        4ci7SXU91BTmO4C+Vz7kQsrhGG6BQpxRSG7IdV3zLO3/c/NJpdu+RKE1DM0D0uAMKlsM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q8gw2-00Fbok-3k; Mon, 12 Jun 2023 14:46:14 +0200
Date:   Mon, 12 Jun 2023 14:46:14 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
Message-ID: <2b40d932-c994-4145-ae1b-f2a848d97349@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
 <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
 <01010188ae5c1bf9-0893599c-c21c-4fc2-b8fc-c68c9f2a4e14-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188ae5c1bf9-0893599c-c21c-4fc2-b8fc-c68c9f2a4e14-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Once someone takes up the issue, I guess that we could add new
> functions for other allocators.

Then it would be good to name this function to make it clear it
allocates and ethernet netdev, so leaving the namespace clean for
other allocators.

      Andrew
