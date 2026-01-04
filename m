Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25BE21CC44;
	Sun,  4 Jan 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531910; cv=none; b=tYb6WmqFCX4t+W0WHRYlOUgdxOOO+aCLolJDgxua0g4ifIuq9YNwRNzGqy9E/ndP1np3JLXbj4IRymIuezmBDI75VO1blHTRLhUWlm5kUe4WODctpqv5h9H8vNy9rWinE1+AD0cTBid9qRShiVH8KWOC0bYOPgaWADxxZm1zMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531910; c=relaxed/simple;
	bh=OOTXolB6oEJuSDQ9Iohb2AwaOfd2As1Osbaow7vBBtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anGXLe6UbJs/0nAh8btIjaHGHuD6dgJRl1C7YqqstZRiY3hyteMKneTMv5pSGwxUVo9uaqVrL1kgdxL2KifMwrX+CI9dX58FJrJ3zulDSvEOwwstKx7tWFo2Ror3rMhLLbIngRcKmWXxfUq2+p0XUqvdRoUel3QRk7ht4exaYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Zp7BVaIJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ugmQHD+C; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Zp7BVaIJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ugmQHD+C"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 784C01D000AE;
	Sun,  4 Jan 2026 08:05:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 04 Jan 2026 08:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767531907; x=1767618307; bh=T0DTfgCxmG
	Rm89NedrcN/ZsXiPSCqGwrIj9lwpb79n8=; b=Zp7BVaIJxVYP081j9iVwCUq21k
	pQQEOn6tLHijYIVK28yPdU2Vj63HVmVn8dygfIEWLEeiL4rhJqfByMp5eq87myzv
	RIOs4IRtxOrUUg8CDWU3Ka7wCt2vjEDYu0YeguT2g31sfKA4+SVP1eknkE+M/J2V
	OgdjVH9JmcVJd9AyUG7bNMFNwHVOKn0W5yL4nfNb3zC6FHFklnc/hO8xxWTZthTV
	M0QaJtlnYjGSvjc3x9aEd31Fm8pNHeJKw4D0+sRdrJ6RzqTnaE1GQzmrC5jClCqQ
	iJ62BGiQk3ly7hTfQbdWShAWwSc8qfrM/dQb0ytzCKJgai6KHrDuRJMMbOZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767531907; x=1767618307; bh=T0DTfgCxmGRm89NedrcN/ZsXiPSCqGwrIj9
	lwpb79n8=; b=ugmQHD+CPOGYX/L8CssRL1g+pZkk+8Dxfgv+RtSxSah3siZaFiR
	10rOdrsFu1SlO2iL5x2y/2wsffil30lP2xIxrhSjCG7hTnRAU9Mc8FP2VFPL2myd
	fDRP+VdM2W7ILV5H53e17jXqo5jP3o+t5y+uJqCntkjFDNPQTZXL0TWfXyYS0A+q
	6lRluKXp9ly3Yrj0WGiaWuntNxsAkgMGHgTsFIbNCM+UsXxq4mTQ5UxetdnDSRtG
	Ep400VtXNMESSPMLWo3FSxosxXQnQ3ETfd9xeiKCCYLaZFWbCg+TM95Kh7LBT10Z
	5T8vfMrzPZnC1JJGZTX6kgiqNhWYPT49oLQ==
X-ME-Sender: <xms:gmVaaf5S53-Aak0avLAf8-gBXm9Hv7mMPucDZhe197uj34qne70Crg>
    <xme:gmVaaaHRtkB51N8ecoUW8jpu607RE2dlc9usLuKjuCh8MpzFx9i3HssHwaOCToE7H
    FBM0C7CAmd5hJ-ls2B44JVRWdbL6TVIX6Sj5aTSlV0OEDqFpOkrqhI>
X-ME-Received: <xmr:gmVaaZ1vBMzQ2PddPocrdIvzNJAv2OPHaGp5KkgtV7841HFjFv8c0zhZzjmy4R0Zs3b5HauM4nGVsva3CaSQIPjfnpKDaEcV6_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelgeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepiefgge
    eutedtvedukedvgfefvddvvddugefhheevtdefleetfedugeevtdekiefgnecuffhomhgr
    ihhnpeiiuhhlihhptghhrghtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgrmhhirhgusehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:gmVaafrSBIOYaIJvzIJAjrdUT19-JFE-FN4rmAJQjZwAVRyp0Q-uwA>
    <xmx:gmVaaeMDjksXDJ0RW1mzSxENLNQYPC_OhiCUa4j_UGEmYlNqD74-Bw>
    <xmx:gmVaaZUZGnM1XQIMwitKgaBH-MMMLXzGH-k4DnI3k17KpBkQ42JsfA>
    <xmx:gmVaaZtTMIMeqB4WhtWKxy3dBLtBvD9rbQCtYYLyKO3ITXwExqgurA>
    <xmx:g2Vaae6bxtWJmmfTfCTLgcr5B1axL2IFXIKaqV9hNFhU8sKNqxn8_GKK>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jan 2026 08:05:06 -0500 (EST)
Date: Sun, 4 Jan 2026 14:05:04 +0100
From: Janne Grunau <j@jannau.net>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH] rust: fix formatting expressions
Message-ID: <20260104130504.GA4068972@robin.jannau.net>
References: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>

On Sun, Jan 04, 2026 at 08:00:27AM -0500, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> Allow usage like `pr_info!("one + 1 = {}", one + 1)` to compile by
> ensuring that a reference is taken to the entire expression.
> 
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Reported-by: Janne Grunau <j@jannau.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/near/566219493
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/macros/fmt.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
> index 2f4b9f6e2211..8354abd54502 100644
> --- a/rust/macros/fmt.rs
> +++ b/rust/macros/fmt.rs
> @@ -67,7 +67,7 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
>                      }
>                      (None, acc)
>                  })();
> -                args.extend(quote_spanned!(first_span => #lhs #adapter(&#rhs)));
> +                args.extend(quote_spanned!(first_span => #lhs #adapter(&(#rhs))));
>              }
>          };
>  

thanks, this fixes the trivial example I added to rust_minimal.rs and
all out-of-tree use in the asahi driver where I discovered the issue.

Tested-by: Janne Grunau <j@jannau.net>
Reviewed-by: Janne Grunau <j@jannau.net>

Janne
