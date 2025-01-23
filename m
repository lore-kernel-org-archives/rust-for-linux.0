Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0A29B0;
	Thu, 23 Jan 2025 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737614465; cv=none; b=SPKkAzuo9M7BTsiRBQM5dRvkgqj9//BbGCwDE0OUqaBDd0Br2esU3UGxhLABN+3F1zt3Iq850YxrsdkTbRaKSLkJHvW7ZlkjEk9YN2SF3j5yyxT0JiHt6TEW19QDK6BSWOMGBJ6WZYh4YkErfOs1p0BX4jTNqyuSgNIofYmXqFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737614465; c=relaxed/simple;
	bh=qDIWq7M62DZsZxECitt0m/Od1jwdopIzh/Hqm8j2cjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7gBqC6a4SnenKXznG38hKsDIWoySqP2lRnyD1LUq/HLfHiFzLCZl2VDjAMT0NYuwAoPej/Si9yBubXu67BnEaTUudD2CjQBUsRm/I5wl4+PZePEe+J7G/3E4VL7izafhjTKXDDtOQHd/k2nwLs8iU/fiK+GGuIZaZ2wKfQYucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj6P9OKz; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj6P9OKz"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b9bc648736so51799385a.1;
        Wed, 22 Jan 2025 22:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737614462; x=1738219262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDUXifTIVFjFala2QEgSz/xGrcTaFkLXyhuhETO9n/s=;
        b=Aj6P9OKzAXVe5JgNJ8NdAR1R66PBmPdMTC95HtxUJRylI/iXVfZnEXfzii/FpYQoaz
         4tDh5JvpOF2C24g7pEaQpn/0Q5LEYzlzIOlCa4SUw7H+cI9UZBPrX9B+r6F581ONi/CN
         QGTwwM+J8cqLXRIZaIvwoEuBtCrD7cnF3NQ4jW1YvR5y1hkebiNVWGE012tC9K2oeBIr
         4AU7Cfx+uXVPwwRxoknggaGlqeE4NztzwZSI6joLkDh86krsMT77B5r7v5Hyk4DFj7yt
         F3pTDHcYQVa/Kv5JvACWxhbUvnRSrHddsE183+Fw+xcUYVaicU8QD86HYzrcvHyTn4cP
         rN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737614462; x=1738219262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDUXifTIVFjFala2QEgSz/xGrcTaFkLXyhuhETO9n/s=;
        b=jeVUo52W/x22Mw8jLB2hr4R81y+3EyyOmCrBJhk5F8KTiOKgfJ8RnK89JFoNQIS2U9
         sVvxvSzKflhOFXer6KoddqmQNVQ8uRJGqtsVrlz6j7z/AAejbguz3KYbibVhBh1dpvwn
         l2M+661KAGDuPN25xNO09jYRXm9bkF86mTorJWhtpqhTZqa6G6dEepl+GmZvcUON4VNx
         yEWM35yBiPLMPcC2XbmTsllA8iASfIRFDJYnqspUkpZLo0/LM2pMFmGFAqbrs1muWco0
         FAOyej4g3AIMLNwyrLfLMBaBc1j7vAe02i8UrIlpoDqPEaiZDZvpLGp/hAnIrmKZ2FMj
         UxSw==
X-Forwarded-Encrypted: i=1; AJvYcCVfieQCbvz351q0lDQgJM1vp++ToqkcCUnUBpCjrw2tJvHNvdYZsFrDCe1T1LKGZ7NNP9lN3cWeERYYYy0=@vger.kernel.org, AJvYcCX2fPnU7m7oZO+L8B1NTLwGwIiLnwLKEZMvDFniaKdV+4o3vZYbrbrxROAdSIYa77AzyMACyR+Fr47s+Ls3QDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGyGVIAD4QuIVDkOPZd+Y4Z1ji1YSdE5jH7NNRevIuB0lv9vo
	jzGIb6/mtXXTSt/qjHe9JHeJcG/MH5Jycq5aAeZTdBioEKtNGLcm
X-Gm-Gg: ASbGncsox/4WYDq58TVdI8dREKkEaOAY93B5vX5y6NRPmNMibVIwroig+Ll82Bx0Bt/
	47YY8VcCPDHxkqv/knnk47iuPZw1yZM0GGE8A5vwUvHVYYjN/gHOiEz/pXjZUqWaMkmo7JNi+o9
	EaqdUus1iWf032shdQK2+5Mu9xzJgFH/5rHDiXHgl+7YPntdb6TI3iqqlI3/GO5bgYJ2vM9Qa4D
	at+TTyIHKx0UCVFsZqZyWkj6+FFq0hz2VjfdRwtV21V0SdqYWFl6rgd/EY69GyaxpKrzh7iLWO9
	mpcnk51lI0yaUBwhQKjmnWWzYCA+mYj9QgKcnF6Ois5PJAT5AHOIC0oLaDF2FLif0Kxx1ro=
X-Google-Smtp-Source: AGHT+IGoIFKN0iyVvA3eBy6AySRuk40T6D66ghV0LiWSso9R2xh9cP60i2Gfvn1naUmBiOsmqbq9cQ==
X-Received: by 2002:a05:620a:28ca:b0:7b6:f595:36ad with SMTP id af79cd13be357-7be6324d832mr4007784485a.37.1737614462224;
        Wed, 22 Jan 2025 22:41:02 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e104026c3sm71365071cf.60.2025.01.22.22.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 22:41:01 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2761A1200068;
	Thu, 23 Jan 2025 01:41:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 23 Jan 2025 01:41:01 -0500
X-ME-Sender: <xms:feSRZ70nc9d6DATK6f4r5585hsvsq7YG_STl4eR2q_kvgIeBEovzbw>
    <xme:feSRZ6HV7QG3mNJWmH0BW2JhE-X3p9YBiXNa8W_F9ONmmjl8zaKEEG-jW9GQbhTJ4
    -lNrtfkwTP758eZfQ>
X-ME-Received: <xmr:feSRZ77z_gUL1b4gxJrH_xxJAQEyVDXdXQRij2K6rHc6VCDzESS2VP0It68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeefieeifeelhfefkeeltdeghfeuuefgvdehffev
    ffejueeutdfgvdeftefgleekgfenucffohhmrghinhepfhhirhhsthdrihhsnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtg
    homhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegs
    jhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnh
    hordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvg
    guuhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:feSRZw3olVjqsL1xOrwg3Yg_qIsVK0vZhUZCeJri0Cg9tOW4jfP-8Q>
    <xmx:feSRZ-E_j9Ra4fTSeC56xJm3pqaNT6wzeNSt-m6LDTympMpTc_MKpw>
    <xmx:feSRZx_1tLaLF4UhbUIsrjGx9Z9QLgJPBTqebyixKyve35mMdL_6lw>
    <xmx:feSRZ7nJd6wi9hM99ogY-vxeOLcBAKFhjQNQfi7qbetPzpK_D2Gp3g>
    <xmx:feSRZ6HmeXu6m6G3509k5fPRJ-MtpwqZqFlHkCAHgkGVXIMmI1t8aCA8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 01:41:00 -0500 (EST)
Date: Wed, 22 Jan 2025 22:40:36 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: list: extract common code for insertion
Message-ID: <Z5HkZGoYgrMu8I1M@boqun-archlinux>
References: <20250122-cursor-between-v3-0-aaafbd8af14d@google.com>
 <20250122-cursor-between-v3-1-aaafbd8af14d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-cursor-between-v3-1-aaafbd8af14d@google.com>

On Wed, Jan 22, 2025 at 03:00:17PM +0000, Alice Ryhl wrote:
> To prepare for a new cursor API that has the ability to insert elements
> into the list, extract the common code needed for this operation into a
> new `insert_inner` method.
> 
> Both `push_back` and `push_front` are updated to use the new function.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/list.rs | 70 ++++++++++++++++++++++++-----------------------------
>  1 file changed, 32 insertions(+), 38 deletions(-)
> 
> diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
> index fb93330f4af4..97b3599b7207 100644
> --- a/rust/kernel/list.rs
> +++ b/rust/kernel/list.rs
> @@ -245,8 +245,20 @@ pub fn is_empty(&self) -> bool {
>          self.first.is_null()
>      }
>  
> -    /// Add the provided item to the back of the list.
> -    pub fn push_back(&mut self, item: ListArc<T, ID>) {
> +    /// Inserts `item` before `next` in the cycle.
> +    ///
> +    /// Returns a pointer to the newly inserted element. Never changes `self.first` unless the list
> +    /// is empty.
> +    ///
> +    /// # Safety
> +    ///
> +    /// * `next` must be an element in this list or null.
> +    /// * if `next` is null, then the list must be empty.
> +    unsafe fn insert_inner(
> +        &mut self,
> +        item: ListArc<T, ID>,
> +        next: *mut ListLinksFields,
> +    ) -> *mut ListLinksFields {
>          let raw_item = ListArc::into_raw(item);
>          // SAFETY:
>          // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
> @@ -259,16 +271,16 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
>          // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
>          let item = unsafe { ListLinks::fields(list_links) };
>  
> -        if self.first.is_null() {
> -            self.first = item;
> +        // Check if the list is empty.
> +        if next.is_null() {
>              // SAFETY: The caller just gave us ownership of these fields.
>              // INVARIANT: A linked list with one item should be cyclic.
>              unsafe {
>                  (*item).next = item;
>                  (*item).prev = item;
>              }
> +            self.first = item;
>          } else {
> -            let next = self.first;
>              // SAFETY: By the type invariant, this pointer is valid or null. We just checked that
>              // it's not null, so it must be valid.
>              let prev = unsafe { (*next).prev };
> @@ -282,45 +294,27 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
>                  (*next).prev = item;
>              }
>          }
> +
> +        item
> +    }
> +
> +    /// Add the provided item to the back of the list.
> +    pub fn push_back(&mut self, item: ListArc<T, ID>) {
> +        // SAFETY:
> +        // * `self.first` is null or in the list.
> +        // * `self.first` is only null if the list is empty.
> +        unsafe { self.insert_inner(item, self.first) };
>      }
>  
>      /// Add the provided item to the front of the list.
>      pub fn push_front(&mut self, item: ListArc<T, ID>) {
> -        let raw_item = ListArc::into_raw(item);
>          // SAFETY:
> -        // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
> -        // * If this requirement is violated, then the previous caller of `prepare_to_insert`
> -        //   violated the safety requirement that they can't give up ownership of the `ListArc`
> -        //   until they call `post_remove`.
> -        // * We own the `ListArc`.
> -        // * Removing items] from this list is always done using `remove_internal_inner`, which
> -        //   calls `post_remove` before giving up ownership.
> -        let list_links = unsafe { T::prepare_to_insert(raw_item) };
> -        // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
> -        let item = unsafe { ListLinks::fields(list_links) };
> +        // * `self.first` is null or in the list.
> +        // * `self.first` is only null if the list is empty.
> +        let new_elem = unsafe { self.insert_inner(item, self.first) };
>  
> -        if self.first.is_null() {
> -            // SAFETY: The caller just gave us ownership of these fields.
> -            // INVARIANT: A linked list with one item should be cyclic.
> -            unsafe {
> -                (*item).next = item;
> -                (*item).prev = item;
> -            }
> -        } else {
> -            let next = self.first;
> -            // SAFETY: We just checked that `next` is non-null.
> -            let prev = unsafe { (*next).prev };
> -            // SAFETY: Pointers in a linked list are never dangling, and the caller just gave us
> -            // ownership of the fields on `item`.
> -            // INVARIANT: This correctly inserts `item` between `prev` and `next`.
> -            unsafe {
> -                (*item).next = next;
> -                (*item).prev = prev;
> -                (*prev).next = item;
> -                (*next).prev = item;
> -            }
> -        }
> -        self.first = item;
> +        // INVARIANT: `new_elem` is in the list because we just inserted it.
> +        self.first = new_elem;
>      }
>  
>      /// Removes the last item from this list.
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 
