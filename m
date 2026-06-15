Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A242E542C;
	Mon, 15 Jun 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554264; cv=none; b=QrKpSQEA4US6mOf2i1p35IYg2TMsjx3rig1ItWF/8UK756PZx+H/g2UuxAhW3mVL1iwtNCi1xlzGdmzBL7oNdGovWRuPWmd0MpfH9D5ZfQrVMDG5880olFvs+qOr4ntsjBVEhsyM6+KFQitN05ULBaLAkKrFjDQSO+AgE5+2DRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554264; c=relaxed/simple;
	bh=lhYP+HcWEcXrpcHCMG7Zx+MhH2upDVxoeZMFsvmFDUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxuf6T/cxX+Aw30T7O+3loQmTu/gd0oE3UVhVOISU+XpVthcR0yK6rhEybXwx4NoF4Vq1iznWiQN9RNKzzYuSGULmm9GemQQrLQ2cgLt6aKpT8+C1AwdBRzPDwOU8Lf+KRFWxaFfCHUhHIAk4S0kn2zqPwdNJnUKGu4E/4McUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fgz+/GV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fgz+/GV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D991F000E9;
	Mon, 15 Jun 2026 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781554262;
	bh=P5WkQHwUMwemfw99JKqV+s8jQyajSNwPGEKogwqgIJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fgz+/GV+M3CgrbeR3UofdbsDrVh7OYCjRLxOrGmZsJYZwRkGKGG/HvuiRi4UcDPTQ
	 FEt0m4dCXYcsRH0fUbyQPmTW9ecK+gd/F+sP7sWOb+P858n6+dhSYvzu6t7bVpcFP2
	 Lq72JCnvNUzEFviRWApogav6cxwmCjP6xJ5oTOvE=
Date: Mon, 15 Jun 2026 22:05:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: syncrain <iganschel@gmail.com>
Cc: arve@android.com, tkjos@android.com, brauner@kernel.org,
	cmllamas@google.com, aliceryhl@google.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: synchronize Rust Binder stats with freeze
 commands
Message-ID: <2026061512-masculine-graveness-d9c2@gregkh>
References: <20260615174834.297-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615174834.297-1-iganschel@gmail.com>

On Mon, Jun 15, 2026 at 11:18:34PM +0530, syncrain wrote:
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
> Signed-off-by: syncrain <iganschel@gmail.com>
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
