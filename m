Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0612D750
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707213715; cv=none; b=cSYWjzN3NIyd7R6Ces8XPgMk3KaruIapZXNTCDoaiHZMifkmDVLCLoRN3JIvPxogVjWQpXgcUZlHdh5GVVyEflbBbaGCjnO+p5aX6dWIZK/J8m6OfEeVCNqjuC7zSdXjyMu5uRMmviYT+axfp90PHJ+muyHn7EKLtfMsRC9Xht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707213715; c=relaxed/simple;
	bh=sdFurxfAyG20e+0CVpdu3Sbo0OJmnezyvEGAOtLZAY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keK45xiRJm9hms+yNklm8PDd68njhL4SW/P4Z997Z3QBQTcIg3WCBm5juvapNPs0HK7hKm7RcwPubaoeCJVeT8U1zAwVGnNJROGiKo+2uCNYdEt2IVmCD4ZyCe5/NmT93TWbEpBjt1SNCKH8fmdIQWsrS5WqpTLh6iqgXpWs6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=PHSTfMsy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SRbdlonu; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="PHSTfMsy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SRbdlonu"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 364F55C010D;
	Tue,  6 Feb 2024 05:01:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 06 Feb 2024 05:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707213712; x=1707300112; bh=1ET/DiQGlx
	prd2y5ZbKkoL1F8tUCKRg/C1h9tHp1yDY=; b=PHSTfMsyNQU9uacyaRqUiel19U
	xviFSMA3IZQvHCFw9uM/GlAGijxnx82BiBxzgGTN05y4eVv+b8AZ+Z5rQ4ZOTcbM
	moMbw0hCniLYjzpvS1l4J2NuQrmxFogttZ1aOxvmZJrjEONC3J1hCLYsyHWLdx/u
	kzCul7mJ6dhjwczw69BFj2h5WR8GiqL2bNsNVzWajFqF63BC0N3KpDNEWTCKS9vE
	l0WcS9ZK4cRg6+I8k/qEZ7EzMzVF/9bb+kVnNWXPfYMiKQi5YbAyanTHbZ0MW885
	wvmGp20mcKu5BpwlTKO/kKZaiOlkorZvMyyLn0CtXaYIUJVofsHZrJd7DuEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707213712; x=1707300112; bh=1ET/DiQGlxprd2y5ZbKkoL1F8tUC
	KRg/C1h9tHp1yDY=; b=SRbdlonuccJH3m9gktX6zFUG679rBDB2byElEJUHXQnn
	mA/IdAd/35j56wl5GTgazwwH6ZdDNEiSauubaIGYIdJSQLZJzV5StP5inziG36hi
	ScNUWl8a5cPS3h3OUcfXIrJy8rHYlWud2gJ1gqLSe9+5NKD3aBsOj7Neco73kQZn
	sHOSa6nUqnR7HRzdvmYJRbjdtOeg170FPvh+yk99R96hqFSncQ93pVdz/l1hMSSk
	4kIiIkws0tbXbaaoJ1jgulrdOgZtNqdl4Rk7yD0mvjEh6C47NqJ6gY6HpMbO2840
	gOKqDJ4nZXUOCo80bQAWvy5L8VjQkjd2l9YjVYiTZg==
X-ME-Sender: <xms:kAPCZfO5VnHqhFkOIt7qw03AdA2bob6r6aenXBuPqvItqEZOBGAfBg>
    <xme:kAPCZZ-a95rycLo7BXI3jLd3rQq59zvEQH7KECWDKXWylyMufBwbHIgqtGXefCEwP
    J_MiLrI7ZzCFw>
X-ME-Received: <xmr:kAPCZeQHTNSkkU_x6u6_Bk4518Ps342ePswb9xwrwW9R58je-_sxpJvhZuAeTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvfedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:kAPCZTugifZJ7PE0u0sa02pDWeC2fWAwTqPPiiarC_yn4W-Zb_4t4w>
    <xmx:kAPCZXf_NbsvwjfoERz7HK0H4JdSnHsZdDVmUPN-hdZXA-k_2s392Q>
    <xmx:kAPCZf1LHW4KB3ElkjKgrWZ7_t36hCdTBoI-QmEdbsLS-k3w9B4TQQ>
    <xmx:kAPCZS_ZlihcPhotY6XO3HFtAqGPIcahb2m_ifn4fRO3rnxuTgDZbg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Feb 2024 05:01:51 -0500 (EST)
Date: Tue, 6 Feb 2024 10:01:50 +0000
From: Greg KH <greg@kroah.com>
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <2024020617-edition-underpaid-4873@gregkh>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206012535.480193-1-tahbertschinger@gmail.com>

On Mon, Feb 05, 2024 at 06:25:35PM -0700, Thomas Bertschinger wrote:
> Currently Rust kernel modules have their init code placed in the `.text`
> section of the .ko file. I don't think this causes any real problems
> for Rust modules but it does present a challenge with implementing Rust
> functionality for existing C modules.
> 
> If a Rust `init_module()` function (that lives in `.text`) calls a C
> function annotated with `__init`, then a warning is generated because
> the C function lives in `.init.text`.
> 
> I ran into this while experimenting with converting the bcachefs kernel
> module from C to Rust. The module's `init()`, written in Rust, calls C
> functions like `bch2_vfs_init()` which are placed in `.init.text`.
> 
> This patch places the macro-generated `init_module()` Rust function in
> the `.init.text` section. It also marks that function as unsafe--now it
> may not be called again after returning because it may be freed already.
> 
> Note that this is not enough on its own to actually get all the module
> initialization code in that section. The module author must still add
> the `#[link_section = ".init.text"]` attribute to the Rust `init()` in
> the `impl kernel::Module` block in order to then call C `__init`
> functions. However, this patch enables module authors do so, when
> previously it would not be possible (without warnings).
> 
> Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> ---
> V2: add "unsafe" to the init_module() function
> 
>  rust/macros/module.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index d62d8710d77a..e54293faf523 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -222,10 +222,14 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>              }};
>  
>              // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
> +            /// # Safety
> +            /// This function must only be called once, during module initialization, because it
> +            /// may be freed after it returns.

Oh, and the compiler will catch this if you get it wrong, correct?

If not, you all should work on that, as it is caught in C code :)

thanks,

greg k-h
