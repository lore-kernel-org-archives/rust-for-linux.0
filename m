Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3B146D57
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363254; cv=none; b=Nj4vE+ux8V4IIOR3Tb4XKcQSs3XQChbOeMOdP12YOZ4kNNNn0keMWC1QYA50Tf3mHIzEtOG2xsDeVa2GBH+FhUrMEzkiBsYJk4TaeQtr56zJIlYsvhyOY/tMBOOQi3w9x1dCUcq7GdmA01jJ+W3+PI9yKEXp+/uw2np5HQaFkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363254; c=relaxed/simple;
	bh=a5F3FgJ4sCQoAnQLVuZffSHipON0iENCK1ODCNXBUo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/v8uNV5Z1GlN6XeCP8zmzijQaxaycYUU+H8km/u8WqyrMLlnh6oyaD9yJbsB9VHw5RxbxjpEW1m6GZEt0jlmep+l9WIFD+f/fcC7WgDNnq+bX0yOTm0sdoK3yC6N3KGCofOzxfV2VdoP977voX2CE6L0pU+AixSMF4BjffC0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkSb+4cS; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkSb+4cS"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679eacf25cso266061cf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 11:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736363251; x=1736968051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et5B8hlP2uBddj4+hHdJGwr054UnEhnkyQk5Cy5HvXM=;
        b=BkSb+4cS0o8lou5lg82gcJaH1VeheNVcm5WuMgTVGj8kMmWO3c+DDVEq6m/e/Mlq6v
         t8cfbjytynupKGCWlyMJsRKqvp/RQ38a1eXxDl8YYLBs1vb36yNJpZNc96tZpJqhLM8h
         F4yt/LsVii5DVe+roHAJdb278XkOMrjJXFkCitBwvEZY0j40ZCSLdKnBXXjx4s6y5nP6
         8KIg64oW14530pBOlzES3+ItuJuTzD3SNjp8PoGWBtyYENMOEI9ItLtLnyaeqX2/2TR2
         KvfUpFuLJGwmhUoA0j+rv/VbdOKLEPTw3+XoWA4fIEahNHVO+4rytpw99AJ5pdTL+g5c
         rHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736363251; x=1736968051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et5B8hlP2uBddj4+hHdJGwr054UnEhnkyQk5Cy5HvXM=;
        b=raTKHkLz4UIWuySRpizzoNblRvEwcb8jTJ10fmY4LVb+e6fG+zu12Cu3oEZgQb2Qq9
         ntNs5VYctZvyuO7JW8oXoYvrHd6Pi//iqYB1eyER/oNPPlul5OWI8Ch9D7OSaHULWXvN
         Dtg6kRYOd/xiusaIbJt5yJ2MsmnVYrJWVj3ckfZvarNb8DgH10kde6YC59aiyKjnh455
         mykoFHoOpp0gH/yJC5dRQLifkgDekESEHhcfETaAtSpGGmt3jExsFo+NBGyPoiW7EUoI
         smakyu6EA93x2bg3eeFgkGxzoRUEIbAbaTNnoQdN1W3rc7XuHgwywLSJ8ta0+gp/7zt7
         /pfw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqKvR05QCoWqMSHoSw52dgmPfH0TIeyvDQRpnFJ2R3Zt7MP7ixiWFn8ew4lmTP+J0+Fshc4JIJhPjZfa6CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzFMJPakCruPDsLaMSmAktHsR5mm9dkO6QjUssc/gunq+H7DK
	DIBUxzEO3zXtoOc89LcOnsGZKUh6aVZVhtFZ0ZrzWR646j+0lwbs
X-Gm-Gg: ASbGncssHkhuXPDDizLzgPbvmM9tjIfoXYgyhgigyiyIFTsg854a2/QUUorfJVLagL9
	Qs/z091Xd+8yNNBWlX7tcWcvm2fBOdPQ8JpTjKhHo88Jsxm11+S5wE4+oJY4diVaIXM3MR/rqOA
	xBH8uGq8SQOu38tqkvUEvvgosdw5E65oqVdlhVs+CU3z2ZkcsVaxYr56m1l9Lvawpy+fRnaV7A1
	A+mkWmMAVff+32dYNocQMipmmZi1Kb2gEoM/pOqRBA4x3uwztRY40AbOrR6y6FNVMhHgJKnNJSZ
	TDhLlu3TMRcGEF8nXsRO3c7nPSFWtTwZLwfddhRgm50DurE=
X-Google-Smtp-Source: AGHT+IEsXZGPY0Q5639xJE3pdKuvlKpF2vmpHCQELr8bTSDH+pPkF8i0QcQUl8rRNaApc6tev+D/Uw==
X-Received: by 2002:a05:622a:144c:b0:458:5716:fbd8 with SMTP id d75a77b69052e-46c710abbe8mr57631381cf.32.1736363251338;
        Wed, 08 Jan 2025 11:07:31 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6ad93bsm199260431cf.53.2025.01.08.11.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:07:30 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4A51E1200043;
	Wed,  8 Jan 2025 14:07:30 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 08 Jan 2025 14:07:30 -0500
X-ME-Sender: <xms:8sx-Z5_oYt-_QGc3tmrqzMhScmJBoe4PW-NblTJ9WFoLvpI8OGDh9A>
    <xme:8sx-Z9sBppZPDmwIW1m90PwRjFGFA4BfykZB5QdzDZIikgP-MJEA6dRcKPFal5viX
    2ZLJ1_j-bn_sQfReQ>
X-ME-Received: <xmr:8sx-Z3DkneFWwqSe7VI9MecyNYhsFlggGbgbaJc-FXkakmLaVAmtLeEZfLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepjeehgfefudffgeeguedvgeefgeejheehgfeg
    hfejjedukeekuedtffdthffgtedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkh
    gvrhhnvghlrdhorhhgpdhrvggruggvrhdrrhgvrggunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhph
    gvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdr
    fhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtth
    hopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhgvlhhiphgvrghgghhg
    vghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphht
    thhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpgh
    hhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhi
    nhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:8sx-Z9dPmue2pFJn0V3wzpYJ_Icw9YJMn3PrlmlpEB2LaI9iXyCEWg>
    <xmx:8sx-Z-Ps5ogXtV3g6AKu8S2e0oLcZ1ttpe6927SapcvI6oyx04DukA>
    <xmx:8sx-Z_lqUX_OoDHoAVgZ9kGZLpxpkRmFpX3HekgMofveEd2eaon3QQ>
    <xmx:8sx-Z4vT71l-rCHKmJzzqSu-8UmKmrWuwUvu8wf2_2ITyJ5Ulb3YoQ>
    <xmx:8sx-ZwvBAFo1HEcHz5EkT9U2itW6EUkdRFLgYdOKSJeTNytxntdeLo5e>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 14:07:29 -0500 (EST)
Date: Wed, 8 Jan 2025 11:06:31 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	Filipe Xavier <felipe_life@live.com>
Subject: Re: [PATCH v2] rust: generalize userSliceReader to support any Vec
Message-ID: <Z37Mt-U2_tsv2xx8@boqun-archlinux>
References: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>

On Tue, Jan 07, 2025 at 04:25:39PM -0300, Filipe Xavier wrote:
> The UserSliceReader::read_all function is currently restricted to use
> only Vec with the kmalloc allocator.
> However, there is no reason for this limitation.
> This patch generalizes the function to accept any Vec regardless of the
> allocator used.
> There's a use-case for a KVVec in Binder to avoid maximum
> sizes for a certain array.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1136
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> Changes in v2:
> - Commit description: added use case on description and send to memorymanagment on copy.
> - Link to v1: https://lore.kernel.org/r/20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com
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
