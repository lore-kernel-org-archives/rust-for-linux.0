Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE429ACC6;
	Tue, 23 Jun 2026 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215018; cv=none; b=LUcXJj/z2uaey+jKwxGkoj3eDgh7Q1Dqb/g5hQfDaxJU9aRPuDdPpBzjMEVP9YmhjjLCj2cmuO6o47TYih35VBmKnvlABqPXsa3+SwvvFI+aKLoZ0vGiqfehuBcOCNJjsz6wXw/mcDKHEOaZvyWVIq/2V0QzFeUOHq67R1fvp1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215018; c=relaxed/simple;
	bh=TZUcykR8ZPPFN4AOl3Orik2Cxh3eQtwWGALViz9NVmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inQkjYgazW8g2tLvebkrOXNlAjWWqdME3AswizWKHsHmSrv49JR+XIkhFyFC+qD+nRAE8FD5Th71IMIJ+60ZEyypQT70ktRgHMIl0ibcl1Eo+6/LJwYyZjbZ4z2bjHlehivrMcWiZYahaqqZnLzTbrdyccOskbYOLz1kBQMsNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rw0wY6tX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rw0wY6tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99F81F00A3A;
	Tue, 23 Jun 2026 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782215017;
	bh=MIYLLXEdXx7L4o6dYJYDdrb0D5HpwPqotDGYXKoVR5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rw0wY6tXv+5a5BRQ63p93wABtbFhv2RtKPXr5/x5aQ4PYasTgBb/Y9xDHp1xkp4zk
	 N3CLzRvVPAYdvGj6Fv5XbXutveX54MBQsEAJE7CaAEnYDsbdedNny6QTxLdg89ZFPJ
	 JnQ49sQlBZuFEglkXvXApvgS7ZIuKPiTuwtYrb/I=
Date: Tue, 23 Jun 2026 13:42:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaobo Liu <cppcoffee@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	miguel.ojeda.sandonis@gmail.com, akpm@linux-foundation.org,
	david@fromorbit.com, qi.zheng@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] rust: helpers: move list_lru and task_work helpers
 out of binder.c
Message-ID: <2026062302-girdle-entrench-11bb@gregkh>
References: <CANiq72=sSkApehxg6eEpAoNU8zSsRAfqD+RVymM3UQGuvfKyeQ@mail.gmail.com>
 <20260623102431.3577627-1-cppcoffee@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623102431.3577627-1-cppcoffee@gmail.com>

On Tue, Jun 23, 2026 at 06:24:31PM +0800, Xiaobo Liu wrote:
> The helpers in binder.c wrap generic list_lru and task_work inline
> functions and have nothing to do with binder. Move each of them to a
> file named after its own C header:
> 
>   - list_lru helpers move to list_lru.c,
>   - init_task_work moves to task_work.c.
> 
> Add the new list_lru.c to the SHRINKER entry in MAINTAINERS, which
> already covers include/linux/list_lru.h.
> 
> Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
> ---
>  MAINTAINERS                           |  1 +
>  rust/helpers/helpers.c                |  3 ++-
>  rust/helpers/{binder.c => list_lru.c} |  7 -------
>  rust/helpers/task_work.c              | 13 +++++++++++++
>  4 files changed, 16 insertions(+), 8 deletions(-)
>  rename rust/helpers/{binder.c => list_lru.c} (72%)
>  create mode 100644 rust/helpers/task_work.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba45953bb..428992431 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24590,6 +24590,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
>  F:	include/linux/list_lru.h
>  F:	include/linux/shrinker.h
> +F:	rust/helpers/list_lru.c
>  F:	mm/list_lru.c
>  F:	mm/shrinker.c
>  F:	mm/shrinker_debug.c
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 998e31052..ea34101b9 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -43,7 +43,6 @@
>  #include "atomic_ext.c"
>  #include "auxiliary.c"
>  #include "barrier.c"
> -#include "binder.c"
>  #include "bitmap.c"
>  #include "bitops.c"
>  #include "blk.c"
> @@ -69,6 +68,7 @@
>  #include "jump_label.c"
>  #include "kunit.c"
>  #include "list.c"
> +#include "list_lru.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> @@ -93,6 +93,7 @@
>  #include "string.c"
>  #include "sync.c"
>  #include "task.c"
> +#include "task_work.c"
>  #include "time.c"
>  #include "uaccess.c"
>  #include "usb.c"
> diff --git a/rust/helpers/binder.c b/rust/helpers/list_lru.c
> similarity index 72%
> rename from rust/helpers/binder.c
> rename to rust/helpers/list_lru.c
> index a2327f1b3..3b88d1a96 100644
> --- a/rust/helpers/binder.c
> +++ b/rust/helpers/list_lru.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <linux/list_lru.h>
> -#include <linux/task_work.h>
>  
>  __rust_helper unsigned long rust_helper_list_lru_count(struct list_lru *lru)
>  {
> @@ -19,9 +18,3 @@ __rust_helper unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
>  {
>  	return list_lru_walk(lru, isolate, cb_arg, nr_to_walk);
>  }
> -
> -__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
> -					      task_work_func_t func)
> -{
> -	init_task_work(twork, func);
> -}
> diff --git a/rust/helpers/task_work.c b/rust/helpers/task_work.c
> new file mode 100644
> index 000000000..cb961cd22
> --- /dev/null
> +++ b/rust/helpers/task_work.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2025 Google LLC.
> + */
> +
> +#include <linux/task_work.h>
> +
> +__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
> +					      task_work_func_t func)
> +{
> +	init_task_work(twork, func);
> +}
> -- 
> 2.34.1
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
