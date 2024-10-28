Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E01DE2BF
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730133801; cv=none; b=gdNnbgE1yZwT+MaYgVkJl/1LAURp1ghvJ/1V46jK0Ya/ENH4kHb/EzTOBuZU4nhUZn7B+4fGIbDq8g1J9kUEg2SLwe30Qw9L1bsR3d6U6kM3nWsq7DpdE1Lk+Zz5fuYt9pcDwR038/VO+g1eE46T17R6PlQPsB3RYAQVAqnsyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730133801; c=relaxed/simple;
	bh=Fl8xusHqSMBxswVkEbsqCeWXP9sCH3oRHl/7ltbcEJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZB2CLKJpJ4wpYd1Ebx5M7dWzrxMpWr8wIfH208kL/X1AF6maiiGGYwllkxSY8PidafNRcO1dmSGQ9i0Z4q0aG+ve+0eTvq4ytYsMIDybvAEW0+OdSho6IWUIWCuffgEEub1sbG3jU/Z7ohn/Tb1Ev04cXUM5BRilwWBNvIL5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bls0ip1x; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bls0ip1x"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ebc52deca0so2277366eaf.3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730133798; x=1730738598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtL3YYzWXArixgsMMVt4XsshSwZ5R+kxshmkBCRNEZ8=;
        b=Bls0ip1xyABRj9iPrzLTf48JonROy7yXvkMmS1w9r2r7LK1b++UQpStnAZe768Afnk
         h8OAqHXWxO8ou6orrIblYMxK6aN4whG2NZfHqx6pDWl9atBnVScTQpbU8tSdDzypCa5i
         /ZDYZ8BW8F+jK2bOGGvl81I8lTZNKu3g61poJqWmohYNY7Zca8KA7L3VaSl6YXohd8TW
         xtm/WNLGkOj13zu6BH6WHYfmAIzwr2WieRdp64nMpp3uTRDHJUPTYgwkoAhTYhEqT/ob
         FuYHUn66+6C6uHiPnA0vjWGJiGYk69Xjwcqf2bcNnoe2oX3Bd0DHlRCz/bonkKf9eo3Y
         wd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133798; x=1730738598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtL3YYzWXArixgsMMVt4XsshSwZ5R+kxshmkBCRNEZ8=;
        b=q6IKiCptmyhrNSoSQtPAafh9SBi+Fosa9X4fjvdY2bUUV3FzDp/HtwvZvUdRG6EhGW
         8yXnA1/nc3GVn/XUVON/Y8FVOw7qv4fBgZ2EGeyeVTu0zA/551OqnO8GHRbcA7NwkOvX
         dUaIuGdc0kqNj4vSsV79GShHkgG63gDUircVR7i1NHay8ik6FP/8OmdapLUm4nrLG2PF
         dTslnD4Xo+JwzECqz5Et6ouhmeiSVMWiBI5a76usilf5CjDoC55XTgBD3fF7Ixvv31mP
         UbCMBEVqB2riB4+OyuMT45/VsiFEunItx4cU/N4OINTLzRJLG3qGQ8oqMEw3Md3338iw
         AkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVmdQyHQy53ry9kflMF7wu5S79ey2ImpAzuK4inTMSkXDOHYHqeuGFhsqYT4soNtibF5PrlRF5DZQXRfxQcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlN5kC+18IZIgwW1RFsk3OilWrJF/8fZ0uNuYoukRTRZO2kyi1
	+DLT+EEWDxFKBk8oAjPXAXb+UWENWwkspxLF6ROFnafJ5BjfEzrt
X-Google-Smtp-Source: AGHT+IGIIAbTij9hDnctG4KIHSXkaTLV8fBdwweFlSszoR5Npxq9EyfoDuP7WZQIuqrtTabaS6p8hg==
X-Received: by 2002:a05:6359:4594:b0:1c3:7ab6:9f47 with SMTP id e5c5f4694b2df-1c3f9f78c70mr282607955d.17.1730133798167;
        Mon, 28 Oct 2024 09:43:18 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461321431a1sm35851501cf.25.2024.10.28.09.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:43:17 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 436A21200069;
	Mon, 28 Oct 2024 12:43:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 28 Oct 2024 12:43:17 -0400
X-ME-Sender: <xms:Jb8fZ5vOt9D0Lk-eC0hmoQU1bQIr7bBhZWzt4y6P0BtAx87uy08pWw>
    <xme:Jb8fZydWvCrWeX_1tchiwy42KIZfahQZTMzqvs9qTh6AqpcLPQJrvGkics-bSESvF
    GdEwmAdlV83_OKVuw>
X-ME-Received: <xmr:Jb8fZ8wQ7JyYBZTXNq-x07TwHgHs1PmqTgChStiZ5wUe4nhqki4TqOQQWGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epvdegtdejtddukeefjedusehqqhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnoh
    drlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhg
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:Jb8fZwPbjZAv3I7TKgf9mAGxK41EC75Xtfll2F5QDeVir_PDuG0bMw>
    <xmx:Jb8fZ5-2MrwvHjdSSmIL86nmCHJo-W87sEgEwwF0HO4prBI5QjmSDA>
    <xmx:Jb8fZwU4JW8LqQfsl47pORiudP11H6O2qkZFxQZTXJaY5-h-2UPtwA>
    <xmx:Jb8fZ6fpZjBJvN_psob6C1_jYqB5CPzoRDaliT7fD1EVbvpr1vvlIQ>
    <xmx:Jb8fZ_dSYlI3eB3cUxR9sEWCUzGYBuM150M-fFcYKKQ6CRgB0Rhn_-FD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 12:43:16 -0400 (EDT)
Date: Mon, 28 Oct 2024 09:43:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
Message-ID: <Zx-_IzvBzL1TjQ39@Boquns-Mac-mini.local>
References: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>

Hi,

Thank you for the patch! A few comments below:

First, the patch title should be as tight as possible, please consider
using something like:

	rust: alloc: Implement Display for Box

* `Display` is a common trait in Rust, so can avoid mention its mod name
  (i.e. "fmt::").

* Since this is a *kernel* patch, so the word "kernel" can be avoided.

* The generic parameter is not related to the impl, so can be avoid.

On Mon, Oct 28, 2024 at 10:52:47PM +0800, JCKeep wrote:
> Currently fmt::Display is not implemented for Box<T, A>. We can
> make the following code work by implementing fmt::Display.
> 

Usually phrases like "We can" are not preferred in changelogs,
especially when describing the "why" part of the changes, because in
this part you want to describe the current situation based on *facts*
not on *desires*. So how about:

    Currently `impl Display` is missing for `Box<T, A>`, as a result,
    things like using `Box<..>` directly as an operand in `pr_info!()`
    are impossible, which is less ergonomic compared to `Box` in Rust
    std.

    Therefore add `impl Display` for `Box`.

?

> let v = KBox::new(42, GFP_KERNEL)?;
> pr_info!("{}", v);
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1126

Please use a Closes tag to refer an issue you want to close on GitHub.

Regards,
Boqun

> Signed-off-by: JCKeep <2407018371@qq.com>
> ---
>  rust/kernel/alloc/kbox.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index d69c32496..5f4765800 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>      }
>  }
>  
> +impl<T, A> fmt::Display for Box<T, A>
> +where
> +    T: ?Sized + fmt::Display,
> +    A: Allocator,
> +{
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(&**self, f)
> +    }
> +}
> +
>  impl<T, A> fmt::Debug for Box<T, A>
>  where
>      T: ?Sized + fmt::Debug,
> -- 
> 2.34.1
> 
