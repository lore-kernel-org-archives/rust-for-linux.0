Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F66385D9B;
	Fri, 17 Jul 2026 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294525; cv=none; b=pSD5czcb9L0WMxLM27Jmdux5QnXG0p5EeGWKeu0SK5VS4SfS/13aAZmCuZIL2XL0haODrKtw6Wu9O3oI/8uC9BBRLw2LwDxReiUrg19cTEO41/sJri9t8xe4X70QWCtLby8+11/YTEdhn7PbsoWixs3k9QhiBNbGX6xB5xlFbVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294525; c=relaxed/simple;
	bh=LH+3rf3tfya/INYgyMkAGJyu86VAvBM/Avw2JTL/uRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwKmC+u1VbedeBQTTi93TywEqnJts/wKRiCyScbwNDl2LUwFnFWbwhZ3P2CkOe3uM1d99jvGmC43SxEPPu2p9HO2KUPKJbcp21ENq38LXeuICdIRzKmcr4J32TlJZb2uuW1QIUUz5IVeHvjlyplqUPkaAFQ3hPb6sBkGqY2rxJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DC5ATq0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DC5ATq0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54111F000E9;
	Fri, 17 Jul 2026 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784294523;
	bh=zpSts7FEQqjzzUGQO5xwb/ku7/4OE3etKo/Qs/d3JJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DC5ATq0pDlq30rgfAfR8qZ0makRKGz2MFsSvI5JUx0pdXdYjXiE+KzKbbv2K97I1r
	 5CIyDN9aijCs/VVk/vzyEMstpmES2QQBzR4XGgQT3ZQ7Aw+BcopPXR6dWCNSkfIXJX
	 MZ6378+Ue7qcly+FMcHJDbF33/k+87a8341r06dw=
Date: Fri, 17 Jul 2026 15:21:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Todd Kjos <tkjos@android.com>, Carlos Llamas <cmllamas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
Message-ID: <2026071743-kitten-fountain-ef10@gregkh>
References: <20260716-defer-complete-v1-1-ce0e38d30dc6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-defer-complete-v1-1-ce0e38d30dc6@google.com>

On Thu, Jul 16, 2026 at 11:20:56AM +0000, Alice Ryhl wrote:
> Outgoing transactions are able to send a message and wait for its reply
> in a single ioctl. Why not avoid a userspace roundtrip by applying the
> same logic for replying to incoming messages and waiting for the next
> incoming message?
> 
> Generally, when you send a reply using BC_REPLY, the kernel sends
> BR_TRANSACTION_COMPLETE as a reply to BC_REPLY right away. The
> BR_TRANSACTION_COMPLETE command indicates that it's safe for userspace
> to free any resources associated with this message (such as embedded fds
> or Binder nodes). However, the BR_TRANSACTION_COMPLETE message is
> problematic because after BC_REPLY is issued, there will be a pending
> message for userspace. The kernel will refuse to sleep for incoming
> messages in this scenario.
> 
> The way this is handled for outgoing transaction is through a mechanism
> known as deferred delivery of BR_TRANSACTION_COMPLETE. The idea is that
> when you send an outgoing transaction, then we do not return to
> userspace right away if BR_TRANSACTION_COMPLETE is the only pending
> message. This patch adds a new flag called TF_DEFER_COMPLETE that lets
> userspace opt-in to the same deferred delivery mechanism for
> BR_TRANSACTION_COMPLETE when using BC_REPLY.
> 
> Given this new uapi, we can adjust sendReply in userspace libbinder
> so that it writes the BC_REPLY command into mOut but does not flush the
> buffer to the kernel. Then, userspace simply continues running until it
> returns all the way out to the top-level joinThreadPool() loop, which
> calls into the kernel to get the next incoming transaction. At this
> point, mOut is flushed, sending the reply. The same ioctl then proceeds
> to sleep for an incoming message.
> 
> Userspace only actually specifies TF_DEFER_COMPLETE when the Parcel does
> not contain fds or refcounts on binder objects. This is because
> otherwise said fd or binder node will not be freed until the binder
> thread receives another incoming transaction, which could be a long
> time. In the case of fds, this is especially important because delaying
> fclose() can result in processes hanging because they read from a pipe
> that isn't being closed due to fclose() not getting called. Note that
> even if TF_DEFER_COMPLETE is not specified for this transaction, it can
> still be useful to defer the BC_REPLY command, as it can still avoid a
> userspace roundtrip when a new incoming transaction is available right
> away.
> 
> Observing the cuttlefish logs while booting with this change shows that
> there were 4297 opportunities for this optimization to kick in (that is,
> boot invoked BC_REPLY 4297 times). Out of those, 3441 binder ioctls sent
> and received a transaction in the same ioctl. This indicates that we
> successfully eliminated a syscall on the server side for 80% of incoming
> transactions. Generally, this means that a server is now able to handle
> incoming messages using one syscall per incoming message (for each
> incoming transaction, the syscall handles one BC_FREE_BUFFER and
> BC_REPLY command, and then waits for the next incoming transaction).
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Does not apply against the char-misc-testing branch :(
