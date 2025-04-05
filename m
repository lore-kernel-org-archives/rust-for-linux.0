Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5023FC3
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Apr 2025 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838993; cv=none; b=FhVDeJJIOLwqmQQ/Nyds7N3I1vvN1CDfcRrpulPLGNJBw3Lx+DWIA7YiGG45+IMwU/2oewQncHdzU/bHH25cOVFhI/VKZOgWHp21YMgIgkjDECqIS81TUj77dIr7dxArZFRqFRzjCROm/u8YlrmlnRdqwYaVuhsvLjAJX4QMn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838993; c=relaxed/simple;
	bh=PSIrRoMOfM/C9n64lSMKV4jatMvn57ENX923XsgExyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY/20D64hpemRA67rDmFl1l7vKKhk0kd9flsOVyMOAopvwPR1hzZQNh+3k0acvyu1jrgKxkgf30pr0gezyLNQMTgXibQnV33ExZ0bvyHH2cHIGCsa3eraz7XkkiBmSz5v7ByyUIi8jiOZI4Et0OPZND9OwFmXL3AAens3vKusVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JXMaWZSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JXMaWZSE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17D1C4CEE4;
	Sat,  5 Apr 2025 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743838992;
	bh=PSIrRoMOfM/C9n64lSMKV4jatMvn57ENX923XsgExyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXMaWZSEXQ2cKzZ2yA6JlvcrBIzxBv/eF5OHVgGl4iFXUsYxMbht1XFOuMlA+NIJZ
	 /EB5Spk8TR2NLCrRYjXpEd4LVoTADR2rZSegelIzW5uD3fLgfucP4LyGVQdevmHem9
	 AxDElm4ERy1tYoMWj58VGcOgXarTM8cIGs3iH+4o=
Date: Sat, 5 Apr 2025 08:41:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] scripts: generate_rust_analyzer: Add ffi crate
Message-ID: <2025040517-debug-playroom-f5da@gregkh>
References: <20250404125150.85783-2-kernel@o1oo11oo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404125150.85783-2-kernel@o1oo11oo.de>

On Fri, Apr 04, 2025 at 02:51:51PM +0200, Lukas Fischer wrote:
> Commit d072acda4862 ("rust: use custom FFI integer types") did not
> update rust-analyzer to include the new crate.
> 
> To enable rust-analyzer support for these custom ffi types, add the
> `ffi` crate as a dependency to the `bindings`, `uapi` and `kernel`
> crates, which all directly depend on it.
> 
> Fixes: d072acda4862 ("rust: use custom FFI integer types")
> Signed-off-by: Lukas Fischer <kernel@o1oo11oo.de>
> ---
>  scripts/generate_rust_analyzer.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index cd41bc906fbd..fe663dd0c43b 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -112,6 +112,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>          cfg=["kernel"],
>      )
>  
> +    append_crate(
> +        "ffi",
> +        srctree / "rust" / "ffi.rs",
> +        ["core", "compiler_builtins"],
> +    )
> +
>      def append_crate_with_generated(
>          display_name,
>          deps,
> @@ -131,9 +137,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>              "exclude_dirs": [],
>          }
>  
> -    append_crate_with_generated("bindings", ["core"])
> -    append_crate_with_generated("uapi", ["core"])
> -    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "bindings", "uapi"])
> +    append_crate_with_generated("bindings", ["core", "ffi"])
> +    append_crate_with_generated("uapi", ["core", "ffi"])
> +    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
>  
>      def is_root_crate(build_file, target):
>          try:
> 
> base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
> -- 
> 2.49.0
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
