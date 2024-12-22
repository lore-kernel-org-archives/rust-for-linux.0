Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78B7DA8C
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Dec 2024 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888025; cv=none; b=oNVZxuUJJFFGNA/EwFXnO4iDKmaRwiWyh34p0TusLG3lIj1nH2r5hG4SOx/5fY6FR2HqyjYkTza9rTzRYfA38Fpy6v1yKPgyWqoMBk57bZHEorWIg6cvJKO/uhSCZJZ4uLCT2LRJx+fJd9Wfu9lxbLBrmxgKw++jgUenzdK8S74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888025; c=relaxed/simple;
	bh=bjC2XBV3zci/hhYd8AsNZRQfdDFCaYtTKw50ITxY+pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJNshFIYwlJINjdsQxSQhQNuYHGyl6Z7R48+1sPnyn9tWET3FZNic17yB0Ga0DkJi3nZ8Envl5R2+BRgzgo3vwJhQgNkyv0x1hGb6FrzeZMpLcoAUAwZKbebmNT2VwIIzuSLRpBgekLz15ONntZ9rXFAnflg7ySz+gmpcbmp8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD5uEtFz; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD5uEtFz"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd1b895541so24252126d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Dec 2024 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888022; x=1735492822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR3N98IUxyhEWRjUMgcfDGDNuNCUgEHun8Hh4S09ZQM=;
        b=KD5uEtFzDaqUJSPgrvFQ4u3/rQLxEaiqK9cyGyp6GFsXwmSjQYZx7eGQqQdyeoQWCo
         0ahR0ct/hglXrHvNCCb9qWpmSncto+q5pYhougHuy/cc6KRJKfyWlqsKZBX8REY1KszJ
         o3RNMhR5aCkh0m6vtEePjjPEntfaUPcnzFbf0p68WhYoe1Fti/XAruPr4k3+0Nj3tYwk
         iuYVegjSGHVM4FfribzcZ9ye7ODAg2mjob581cgm5VFBD4JRqSoEG+xSImUvEAfOeEvB
         jKrjAo/uXW/d4wVxgXQ99hXRzErt7ZXD2YCHocidzYGPEhwOjG6pfmoJIZdHBdJtQPS6
         7X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888022; x=1735492822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR3N98IUxyhEWRjUMgcfDGDNuNCUgEHun8Hh4S09ZQM=;
        b=ekgx2amoehSIGDMDepA8ll5jt04EaQKX4xgMj9TD6bYdIQaM39rP6rfIUN4aZpNakI
         T8nek3DSSrgTrqAbPhm8aAkb/5pEYZ+uCAw14sAKXPu+tAbOQ9PyMeqUC/sEAnYp7Md1
         emTqZ2hYAcE6uvvLWp9tBsWE1jukPJVGpJCJmQIzVS3FvJu8P7b57u/oYti2osDOT/pl
         Z3UaTLVhRIpxWgno3Z8gNYnr2xxQjm8O2tSqsyachASXEE2K2oebj2MCrWDADpjj0Tpy
         h2pqHsGVwn5XIQE5Or5tgOcESl9hTVpBm2iIGAjMvGlclkLbdi6s8mogbi1mwUDLjsKE
         1Iag==
X-Forwarded-Encrypted: i=1; AJvYcCWRQ5doeYLKPYecIS8vaChIHR4WODtY1ZragpCgA+PzBA+ZqM9JAza7e689nfGLrGppHCs8Px+B4ApWq3pZTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9Zwu2uw1R2H6DyBrRG+rIwGG8yYZLAmeOruPlosr0B2rmEbr
	pUoZ/CI3g2shfJlMsk33dIX3juMiR+c57s1myiFNq5ftl0kdTAQ5
X-Gm-Gg: ASbGnct2oNc/QMraPZh48Pfme7kRVbfKT73RrqPQ82v441EYz3akf0yN1ZBc54dtbxa
	jijPixaU1lnyny6u75jJci7i8NV+iC8xwuJRiOAYdZyWCU4fS71ANH78X5bD49KFzFiM6bVO4y0
	AsG6yPoKYXYo0YjJQynML2FBchzbeWBIKj3boHuF2IYt7ne5bfun3wkNCTOGKehNNmtxsdiDE7w
	MVHQalANXuEy02rw+ZomjbHjmUS17Bh1CT3yy/009/SOLN9pCp/f/1KWcF6dM5i7hH8tIOPNF4N
	27F/RY6ZR1QWkac3cFcAvmEu8049oNEjQZ79B5HslrBM/1Q=
X-Google-Smtp-Source: AGHT+IGG65y4gMYSNBrQlXJWsHDtj1/HGJqnipCueDa75tjhTfnX4dl88c3fGg554jc048+lRUI2kA==
X-Received: by 2002:a05:6214:b69:b0:6d4:4100:75a1 with SMTP id 6a1803df08f44-6dd2339b960mr197413506d6.39.1734888021615;
        Sun, 22 Dec 2024 09:20:21 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d42f0sm36302036d6.109.2024.12.22.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:20:21 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 891801200043;
	Sun, 22 Dec 2024 12:20:20 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 22 Dec 2024 12:20:20 -0500
X-ME-Sender: <xms:VEpoZ74wTRZJ8PAeAm1tSl5aXPErV2TBvk9BQEivQqKZvLVXQ9hKaA>
    <xme:VEpoZw6RxtMWgQQMzRnS-YiK_YsOWeA9ig785se0ibOg-5KDRCmKyEsWBibnPfv9k
    KFIbBBHALklQaFuWg>
X-ME-Received: <xmr:VEpoZyevJmbIOfpNlHf4SUW4edvsMfWTJqafzowRZmLlOLy5Q89Wi2rd_VE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeduudfhvddttedvheeigeehgfejvdejhfefiedt
    heeijedtueffgeeuvdeiteeiffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvg
    gruggvrhdrrhgvrggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
    elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
    tghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepfhgvlhhiphgvrghgghhgvghrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvg
    igrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhih
    ghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdp
    rhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhs
    shesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:VEpoZ8IJrc6EY_vRybVjaiWnoBa_2yy52mCkyj_FwKuBGRungmTNgQ>
    <xmx:VEpoZ_I3je17rlY6WQlTf0GsYHVBMD9kPPgvd84jtpRtM01_O0334w>
    <xmx:VEpoZ1zaYvXnNbCvv8hNwx9uXiovvimmIuJg6UUQHXcfsqnH0LsRaQ>
    <xmx:VEpoZ7Iys9IcTTz4zcnFHZkpje8xPi1w5E9UV8hkyA-VDAA_JciOJw>
    <xmx:VEpoZ6ZOodZ6emCwqo28kw_d98-NyYUqcuRyKMCUhU58POkaBNEUZn8O>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Dec 2024 12:20:19 -0500 (EST)
Date: Sun, 22 Dec 2024 09:20:12 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: Re: [PATCH] rust: generalize userSliceReader to support any Vec
Message-ID: <Z2hKTPIBaJ2K9HJn@boqun-archlinux>
References: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>

On Sun, Dec 22, 2024 at 01:37:02PM -0300, Filipe Xavier wrote:
> The UserSliceReader::read_all function is currently restricted to use
> only Vec with the kmalloc allocator.
> However, there is no reason for this limitation.
> This patch generalizes the function to accept any Vec regardless of the
> allocator used.
> 

Interesting idea, however...

> Link: https://github.com/Rust-for-Linux/linux/issues/1136
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> ---
>  rust/kernel/uaccess.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index cc044924867b89f6116c7f9ec216d8cea2b3f8d7..719b0a48ff5550acc19f2e607c0a09f818145def 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -5,7 +5,7 @@
>  //! C header: [`include/linux/uaccess.h`](srctree/include/linux/uaccess.h)
>  
>  use crate::{
> -    alloc::Flags,
> +    alloc::{Allocator, Flags},
>      bindings,
>      error::Result,
>      ffi::c_void,
> @@ -127,7 +127,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
>      /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address.
> -    pub fn read_all(self, buf: &mut KVec<u8>, flags: Flags) -> Result {
> +    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
>          self.reader().read_all(buf, flags)
>      }
>  
> @@ -281,7 +281,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
>      /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address.
> -    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) -> Result {
> +    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {

... what if the copy hit a page fault because the target memory (e.g. a
VVec) is not mapped? Would copy_from_user() handle this? Or would it
return a different error code than `EFAULT`?

Do you have a usage of usig this functionality?

Regards,
Boqun

>          let len = self.length;
>          buf.reserve(len, flags)?;
>  
> 
> ---
> base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
> change-id: 20241222-gen-userslice-readall-alloc-8049c668e65e
> 
> Best regards,
> -- 
> Filipe Xavier <felipeaggger@gmail.com>
> 
