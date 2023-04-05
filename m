Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE47C76188
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 18:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbjDESJO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 14:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbjDESJN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 14:09:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE817AB4;
        Wed,  5 Apr 2023 11:08:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0929E62A0A;
        Wed,  5 Apr 2023 18:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF733C433EF;
        Wed,  5 Apr 2023 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680717793;
        bh=OsCB65lowLOj8jUPEPOpRTKGMW9a2IEkVkWAQoDZ1MQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2LDOGmHKp+S+Azkxarow4ppeYaIRu2lohVI2KVIBxhNnj1fJFMHbiw0U2mYiNbeET
         Lhtt72c5v1Lc/lNf/zQHxOh3GidMe1/ekU/Os/3D0klSbG+zPlDoNRattoelnM7L6U
         0uD7NGL03IFeo9JXVRVPJgeMQTyFl2vNAuIKdVYo=
Date:   Wed, 5 Apr 2023 20:03:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 03/13] rust: lock: introduce `Mutex`
Message-ID: <2023040554-promoter-chevron-10b2@gregkh>
References: <20230405175111.5974-1-wedsonaf@gmail.com>
 <20230405175111.5974-3-wedsonaf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405175111.5974-3-wedsonaf@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 05, 2023 at 02:51:01PM -0300, Wedson Almeida Filho wrote:
> +void rust_helper_mutex_lock(struct mutex *lock)
> +{
> +	mutex_lock(lock);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
> +

No need to ever unlock a mutex?

thanks,

greg k-h
