Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4076FC433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 18:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F36610CE
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 18:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243798AbhJGSwZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:52:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233884AbhJGSwX (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 14:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F402C60F11;
        Thu,  7 Oct 2021 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633632630;
        bh=hNRXhnil9jW0VPvkaHc2kgd0uMoE8ySe82LJeq58Nhw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=RYA3Fk9+LJBZOfZEQf6Iss5Bc+s8S6AuoM4Jr9LAGXDbM4NyBJoXANG2zEfM59BRa
         FQN8I8CqOZF7JFb1FlSaOtHr4qituyCRqESj5FNpGTb6BA27St7bVVb0f9UXitp6b1
         Hk/cB38u9Q3oPTqLhSAQ0DI7Pguro/mfWD6WcFujkc7PPMEyMFkj9paPushIHhQ6Ud
         TbuVaNYvLkTSTZ6zgSLUrPK8WpHfzAJ7GPN7CXGAY37VAw3dfL4OCuC6KaJRGaAGdW
         llHOMV7lBlr31zdnEjlJW/ur59V031K+pWmi1YATGQfLL94xXY7usvGq7jnwCQyJsj
         ONq1NaxPGadKw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id C62A55C0870; Thu,  7 Oct 2021 11:50:29 -0700 (PDT)
Date:   Thu, 7 Oct 2021 11:50:29 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Marco Elver <elver@google.com>, Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 07, 2021 at 07:44:01PM +0200, Miguel Ojeda wrote:
> On Thu, Oct 7, 2021 at 5:47 PM Marco Elver <elver@google.com> wrote:
> >
> > So if rustc lowers core::ptr::{read,write}_volatile() to volatile in
> > LLVM IR (which I assume it does)
> 
> Yeah, it should, e.g. https://godbolt.org/z/hsnozhvc4

I have updated https://paulmck.livejournal.com/64970.html accordingly
(and hopefully correctly), so thank you both!

							Thanx, Paul
