Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107502F12A5;
	Mon, 15 Jun 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781556777; cv=none; b=Z5+A6gHGWLlgGtWfIszypr7To+Y7M0trUs8XrdIjFWcqbZTROCsgj0kzUnIXeoj9uSmU5ootBzG5pIZsImPFv/viBTIq7DapPEBl46EoGSkMtvdMClruOzGvQ/7TK1jpocndbCQHHPzEIAOM5xBEVkS1/MlPpUcfSrWYtIZJLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781556777; c=relaxed/simple;
	bh=wd2OctTzlfZDko1+AXk6I9LIimSndLPHn0DyQCDvtBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUj4ymLJwz/9tSWQ5xY2GHotPopfTfzQ6sD0xy06XDlRRrQKqXUF/YwqJstjQWYS2lUyT1FMjxDmOZgBgd17ngOpAA1YlTJsHkcX1YHwdSLzmXtN/MDWIc3ZcvcPPnEYfTg2rfak9HGHBLkNKiHztTWCnrchVwZQAcNFdDqYyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L3eas3zS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L3eas3zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0751F000E9;
	Mon, 15 Jun 2026 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781556775;
	bh=l2MPdC9+lpIY4gUrPuGxvxzBsWucpA/aI5ooRI5u04o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L3eas3zSAHHpxlZrZsi0gi65WbFIIyTUn3ySEsicInv2LdLqCZtqUA50SzEqj0Fv3
	 ml05w0Vrcde5//9geOMRMAE2KHQ5p5ceBwyZ2kXUpg6aPlhCf3fLZa0hWDyuOl/4B2
	 gq+LDEt4e6CEbU2fxc+GKcji3YJiFAEqmjL6RQvM=
Date: Mon, 15 Jun 2026 22:50:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: syncrain <iganschel@gmail.com>
Cc: arve@android.com, tkjos@android.com, brauner@kernel.org,
	cmllamas@google.com, aliceryhl@google.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: synchronize Rust Binder stats with freeze
 commands
Message-ID: <2026061505-coastal-rimmed-2266@gregkh>
References: <20260615201737.262-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615201737.262-1-iganschel@gmail.com>

On Tue, Jun 16, 2026 at 01:47:37AM +0530, syncrain wrote:
> From: Keshav Verma <iganschel@gmail.com>
> 
> Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
> return counters, and use event string tables when printing debug
> statistics.
> 
> The Binder protocol includes freeze-related commands and return codes,
> but the Rust Binder statistics code was not updated to cover them. As a
> result, those commands and return codes are not accounted for or printed
> by the stats debug output.
> 
> Update the counts and event string tables so these commands and return
> codes are included in the debug statistics output.
> 
> Signed-off-by: Keshav Verma <iganschel@gmail.com>
> ---
>  drivers/android/binder/rust_binder_events.c | 7 ++++++-
>  drivers/android/binder/stats.rs             | 4 ++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/android/binder/rust_binder_events.c b/drivers/android/binder/rust_binder_events.c
> index 488b1470060c..5792aa59cc82 100644
> --- a/drivers/android/binder/rust_binder_events.c
> +++ b/drivers/android/binder/rust_binder_events.c
> @@ -28,6 +28,9 @@ const char * const binder_command_strings[] = {
>  	"BC_DEAD_BINDER_DONE",
>  	"BC_TRANSACTION_SG",
>  	"BC_REPLY_SG",
> +	"BC_REQUEST_FREEZE_NOTIFICATION",
> +	"BC_CLEAR_FREEZE_NOTIFICATION",
> +	"BC_FREEZE_NOTIFICATION_DONE",
>  };
>  
>  const char * const binder_return_strings[] = {
> @@ -51,7 +54,9 @@ const char * const binder_return_strings[] = {
>  	"BR_FAILED_REPLY",
>  	"BR_FROZEN_REPLY",
>  	"BR_ONEWAY_SPAM_SUSPECT",
> -	"BR_TRANSACTION_PENDING_FROZEN"
> +	"BR_TRANSACTION_PENDING_FROZEN",
> +	"BR_FROZEN_BINDER",
> +	"BR_CLEAR_FREEZE_NOTIFICATION_DONE",
>  };
>  
>  #define CREATE_TRACE_POINTS
> diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
> index ab75e9561cbf..ec81dc7747db 100644
> --- a/drivers/android/binder/stats.rs
> +++ b/drivers/android/binder/stats.rs
> @@ -8,8 +8,8 @@
>  use kernel::sync::atomic::{ordering::Relaxed, Atomic};
>  use kernel::{ioctl::_IOC_NR, seq_file::SeqFile, seq_print};
>  
> -const BC_COUNT: usize = _IOC_NR(BC_REPLY_SG) as usize + 1;
> -const BR_COUNT: usize = _IOC_NR(BR_TRANSACTION_PENDING_FROZEN) as usize + 1;
> +const BC_COUNT: usize = _IOC_NR(BC_FREEZE_NOTIFICATION_DONE) as usize + 1;
> +const BR_COUNT: usize = _IOC_NR(BR_CLEAR_FREEZE_NOTIFICATION_DONE) as usize + 1;
>  
>  pub(crate) static GLOBAL_STATS: BinderStats = BinderStats::new();
>  
> -- 
> 2.39.5
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
