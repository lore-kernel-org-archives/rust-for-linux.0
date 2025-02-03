Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA21F4275
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618739; cv=none; b=uJGPCtz+j8nJziRIvCnp+9HypMqdS7CA1f3DoxUkiXxXaM74cYWVSHgSbSJCSWyKlH6PmzfshCrzPH8lERJ6A64wrLoCRKQW2XpjIIxzw7Z+ixOvlgzp95OkUqZRnyGOjeoqZvWBrODiuOVxYdHMItTPELCS2mBsQ9cvLuHo0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618739; c=relaxed/simple;
	bh=D9xBziS+xFqT48Rqh4BO1j0LRBpgxUWQnqsI+Cez++0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qoCdPdTMd8qTNNLb8E+AKZQUg82JCDj/y2TWdFp9JJPuDERSb82PAPHcIyJ/2hS4fD0ZRPk+QgKL10PUJDKoP4DUJPlIJr46Kx0pkQho1K+ngkPhRoHOq+oco0fp7drTNCAab3XVAAwhplzX8Q1cWUwrmR0/EoS0ROfYL+6l1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=qJONIr/y; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="qJONIr/y"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B15F1240027
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 22:38:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738618734; bh=D9xBziS+xFqT48Rqh4BO1j0LRBpgxUWQnqsI+Cez++0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=qJONIr/ylozfP82SDVm5VSG4ZbBMVh/H2RclYMUnZNhcANwpoipZqFOjwbJ5S3TKD
	 1ufidVt2+wTosHWNXh7l3tVUc5TOHvR5ohjpqoENXPKg3KBqyU/olUsboQWBJGYhXU
	 DMYrzjuvr4PGZAez1aeQAlKNyjRGtypmRJ5BoAerF9WcjBzDP4BNJn+oh4JmHM0HgI
	 KdCq1pdlBmBBDqniJktGA3Btg1i/V7yOOXZCy1m5Zjuc4Y5UzTeIvbH0R2trHPpbPo
	 t+q591womR/bHyB5ipjWMtkJJcoUh9mL3ZX6aKV4l+tO8JfgI9Kd51Lbg5ik78EhRT
	 K8k6esOUytTYg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yn0Hd5BmBz9rxF;
	Mon,  3 Feb 2025 22:38:53 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: albankurti <kurti@invicto.ai>
Cc: rust-for-linux@vger.kernel.org,  ojeda@kernel.org
Subject: Re: [PATCH] rust: printing macros sample: add missing newlines
In-Reply-To: <20250203133717.264522-1-kurti@invicto.ai> (albankurti's message
	of "Mon, 03 Feb 2025 13:37:18 +0000 (UTC)")
References: <20250203133717.264522-1-kurti@invicto.ai>
Date: Mon, 03 Feb 2025 21:38:52 +0000
Message-ID: <m2y0ym3dzn.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

albankurti <kurti@invicto.ai> writes:

> Fixes calls to pr_*! to include \n
>
> Reported-by: ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: albankurti <kurti@invicto.ai>
> ---
>  samples/rust/rust_print_main.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
> index 7e8af5f176a3..7ef3cecc65a1 100644
> --- a/samples/rust/rust_print_main.rs
> +++ b/samples/rust/rust_print_main.rs
> @@ -23,10 +23,10 @@ fn arc_print() -> Result {
>      let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
>  
>      // Prints the value of data in `a`.
> -    pr_info!("{}", a);
> +    pr_info!("{}\n", a);
>  
>      // Uses ":?" to print debug fmt of `b`.
> -    pr_info!("{:?}", b);
> +    pr_info!("{:?}\n", b);
>  
>      let a: Arc<&str> = b.into();
>      let c = a.clone();
> @@ -42,7 +42,7 @@ fn arc_print() -> Result {
>  
>          use core::fmt::Display;
>          fn arc_dyn_print(arc: &Arc<dyn Display>) {
> -            pr_info!("Arc<dyn Display> says {arc}");
> +            pr_info!("Arc<dyn Display> says {arc}\n");
>          }
>  
>          let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
> @@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
>      }
>  
>      // Pretty-prints the debug formatting with lower-case hexadecimal integers.
> -    pr_info!("{:#x?}", a);
> +    pr_info!("{:#x?}\n", a);
>  
>      Ok(())
>  }

Hi Alban,

We also have these, but not sure if we care about them, since they are
comments.

  rust/kernel/print.rs
  408:/// pr_info!("hello");

  rust/kernel/init.rs
  885:    ///         pr_info!("Setting up foo");
  989:    ///         pr_info!("Setting up foo");
  1339:///         pr_info!("Foo is being dropped!");

  rust/kernel/init/macros.rs
  48://!         pr_info!("{self:p} is getting dropped.");
  415://!         pr_info!("{self:p} is getting dropped.");
  426://!         pr_info!("{self:p} is getting dropped.");

Otherwise,
Reviewed-by: Charalampos Mitrodimas <charmitro.posteo.net>

