Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B25DC7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 30 May 2023 07:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjE3Hcn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 30 May 2023 03:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbjE3HcU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 30 May 2023 03:32:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795731719;
        Tue, 30 May 2023 00:31:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC86F625B4;
        Tue, 30 May 2023 07:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF3EC433EF;
        Tue, 30 May 2023 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685431889;
        bh=RuVKyZPAoQV/kBVE1LgY2mOw1mOuUIam7NSvqAzkbIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ds6QaLxAdQVVhX6f9aZnsbN8jjNIMoAnMpnQP9agGA4S/4bwJvyF6nHXsefEcKqqF
         vEDW/V2gtDcuXuQJp5rvzdtKoPoqG+fKUsDQAsuLj+j2AZDWIR4/NI/Kj8vAXCHZpf
         qgoXSTZLiFoIukr0gmNNzTzyZvju8fCgsAFTJVCo=
Date:   Tue, 30 May 2023 08:31:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Qingsong Chen <changxian.cqs@antgroup.com>
Cc:     linux-kernel@vger.kernel.org,
        =?utf-8?B?55Sw5rSq5Lqu?= <tate.thl@antgroup.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Asahi Lina <lina@asahilina.net>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Viktor Garske <viktor@v-gar.de>, Finn Behrens <me@kloenk.dev>,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] samples: rust: add `SgTable` and `ScatterList`
 selftests
Message-ID: <2023053003-antitoxic-popcorn-b1ab@gregkh>
References: <20230530064821.1222290-1-changxian.cqs@antgroup.com>
 <20230530064821.1222290-3-changxian.cqs@antgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530064821.1222290-3-changxian.cqs@antgroup.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, May 30, 2023 at 02:48:21PM +0800, Qingsong Chen wrote:
> Add a selftest module to provide a temporary place to put "pure tests"
> for Rust funtionality and wrappers.

Is this for in-kernel tests, or userspace tests?  If userspace, you
should follow the proper test reporting protocol the rest of the kernel
uses.  If in-kernel, it should follow the format that the in-kernel test
currently has to be consistent.  From what I could tell here, you aren't
following either, but I might be totally wrong.

thanks,

greg k-h
