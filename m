Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A963ED3B8;
	Thu, 18 Jun 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778462; cv=none; b=M5SidQ1Vb1fiDsTWt8rGP3mseehUM3PFvAuWCReMQuNDzcDpFXSjwk4jhjuPx8WZkzSyEclPPsPn1BuHzrUhgs8lV0hfRbEAoUMm9i/wyHqW7Xeq42Gz7+uABCpqDksaoYikRxbQ5wLXcsHOplVcT/R8S8AUkNrsLQ/T8dvGGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778462; c=relaxed/simple;
	bh=gGxlW616bQvWkS1YZzDs+Xa5Zk1p7L+bf/uejdCVSv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daOX/6Md5bHoJ1VyQ87v9ZbyF02/AzPy+17hbxKTTQMOpHJ0rbN655vGdpAbL+fi0U1Tgp71nIwAaVuxczyWv4arxJ76B1KLuEF1Sj7xW0q/H09bdT4sCvQ1HiRb1u7m3QVLM0jFDiVXcOPm9pSw5nRT11o0lA3SUBDkpblCIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hOiMGIj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hOiMGIj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51801F00A3A;
	Thu, 18 Jun 2026 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781778456;
	bh=+UvTI2UZGqM+Kypp27f0k5H4+0ROiGCOi+pSil6qG90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOiMGIj0BVW07cTNKPJFK/YLkejfDVla8CHfojt0IORmQnvym8FVBedVZM8i9COuh
	 3vIcbIn2skC5D/uMD8OwIZRIWYaw4mEgvWxbtcfUajSl0AWyGyYnWMgLWyOHK4B6j4
	 0xGU6akXz5D8dDhjpEztFg6ZxsB95R2ch4ptOpkg=
Date: Thu, 18 Jun 2026 12:27:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Keshav Verma <iganschel@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: check context manager before creating node
Message-ID: <2026061856-rare-envoy-d585@gregkh>
References: <20260617222030.15189-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617222030.15189-1-iganschel@gmail.com>

On Thu, Jun 18, 2026 at 03:50:30AM +0530, Keshav Verma wrote:
> Rust Binder currently creates the Binder node before checking
> whether a context manager is already registered. If a context manager already
> exists, set_manager_node() returns -EBUSY after node state has already been
> created.

Odd line-wrapping :(

> 
> Add a check before creating the node to match the C Binder ordering for
> the common already registered case. Keep the final checks in set_manager_node()
> so races with another caller are still handled after node creation.
> 
> Signed-off-by: Keshav Verma <iganschel@gmail.com>

What commit id does this "fix"?

> ---
>  drivers/android/binder/context.rs | 20 ++++++++++++++++++++
>  drivers/android/binder/process.rs |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
> index ddddb66b3557..562fb339b31f 100644
> --- a/drivers/android/binder/context.rs
> +++ b/drivers/android/binder/context.rs
> @@ -4,6 +4,7 @@
>  
>  use kernel::{
>      alloc::kvec::KVVec,
> +    cred::Credential,
>      error::code::*,
>      prelude::*,
>      security,
> @@ -107,6 +108,25 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
>          }
>      }
>  
> +    pub(crate) fn check_manager(&self, cred: &Credential) -> Result {
> +        let manager = self.manager.lock();
> +        if manager.node.is_some() {
> +            pr_warn!("BINDER_SET_CONTEXT_MGR already set");

How can this be triggered?

thanks,

greg k-h
