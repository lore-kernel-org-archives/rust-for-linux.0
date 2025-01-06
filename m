Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B818A6AC;
	Mon,  6 Jan 2025 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185364; cv=none; b=ZG++GbZJx7G2E/g1pA8kMVBo57r+oyzOz8lie9MRQ3+pKUYMraDCL1rfZlDS8CWTdJZwAOWUwFybNOu3EG0ZexXfhitd7LFldyUPgPPiyCq2YR44OXhR6XrpAiZCYU2xn+W0Gs6Pe6Uy3Be74xavS5WerwV2rarcTmR9cI18OSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185364; c=relaxed/simple;
	bh=euNe+uI/PgOIa7aGEaXUnViMhKcy7CDB1HKJkQabzVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqxt1Glnlqf85Xp7vSd+l+2vreTsAaPmfDOM/gJoeukXcYIN00tHL/VMMag1uH+9WOLqA+hiEi8amv4jaeQtgju8l5J9LZLquOUukz5WuqO77AMItZ+uoEktHbGg7nzrra+OJKsDGM+FztWmWfutpq1fEHvxHsPHvgg7yLF6jIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mkn/qLhg; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mkn/qLhg"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b702c3c021so1284953785a.3;
        Mon, 06 Jan 2025 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736185361; x=1736790161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQuQO9Rm3yTV+CxAoCi/zzgut6k6eBAAVPLnTwUskl4=;
        b=Mkn/qLhga9y2ngWFjxHJZuLvvI/jft/mu2cOObo20KKnSzQhk7yoiujKicVTy/BH/w
         gCgGZONMtqcWJvFWZA09252wt44j/tWnS2eStuPSJQWR51IStApsuvQa6i9VKE1/UIZV
         maMkpnZl291m0Hu65iYCJhFdgVpBfT9t77ZgAHTbgT5mmZdvIc4f9j6Bc2lOqq5Gt2Fm
         ex2EG0Mu7vXwUPiVS+0AYXSGJ17jshkOebxjXiC/FCEldnjoIOlrpbyP7InO+/CZVzuQ
         LDcx1btdWvwcVPq3SqeZBA9NJn6s8qQn4C5KHrzEZ9CVV1103FO/ocK0vGlUtEBNt221
         Xlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736185361; x=1736790161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQuQO9Rm3yTV+CxAoCi/zzgut6k6eBAAVPLnTwUskl4=;
        b=LAS7JNhZYRx0rbEt4x0n7e3CmmCC4DBs6ZAZwRuXr5ZuRk+LC5ZPiTYFMU8l0kwExt
         wCt60KDt/1u7ijoxGEgq909KLaXJQi3CeZJFLp98rgBLPNkJkk/4tC5q2uId2/tYwfef
         vSD2/2mrFGLnW3hfB6HwGHRuAwcNRtTtivIVxxqCsvfTG0D+wB4ZGEXm3zLZqeHPL4gb
         Lf0G/0mXawVr76WqnRiiTcwhQV0s/7H06L0TOnAADATP2LibxgIsluc14ih02otouJIz
         TtTSnpHZp9osxdjr8rxt2VhFhOSjzHmUh8ItPR4pD0s/R9okni7mLs/fNBmITs7ytCjO
         72ag==
X-Forwarded-Encrypted: i=1; AJvYcCVS1YahzKI569jZru/foI5X7WPocLZseq5hH3CESmA1djPLjYJK+EhlLun5Bx3A1Z+BGlCST6NqgUSsLypq2Kk=@vger.kernel.org, AJvYcCXfz0moPJrkiiQBvGMdzz0eOyMs+MyXL/VHDxc4CiQbSFMHPWiRLdtjBGBmuSiGj8mGrsE/jGuCrNP2tjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJBw8+ZlOLnsMRyd2kIZW4qdeYO+s3f302HalJjPtaFbN1ONRh
	e541r0ArKoD77TQWrENAgKtlLPtsYAFfTHxFBYzLpviq5v4Ety6k
X-Gm-Gg: ASbGncvU4lhVaPbHG0FSbCTUNIKOiTb+7TggZwC65h8tJ6j3hwYIg6QjDSlkR1qtj7E
	5RzuvqJ3wqTzdlrhTMArMLVTiAcCxmaYueMgsKytghAFWbQXX9+ancm8jgLqwiYIDcom66HPjfm
	/fTcLRAA1uquYMtoFj6O7FhCloSDDA0yS54wGDWlj2W3Rl+8Hz155ja8cB9qFzeLnx/Ynu/Ik/r
	L6L8iQdmmezXbn6icK3fai+NPc+/B547qVzxbynujeMwkVQmZyE2RSujWW/fYkBeVQM3GWMAM+U
	RLSyxPc0j04IlFAufYaZtgwnAGMQLG5HO8qbCBFUyxajKfw=
X-Google-Smtp-Source: AGHT+IEHv9MpzBGIYb2QQv8o4gZu+xwb/nICclZ5JDGhNewocsxJm40gIGUHKlkceb1Ekth/oBjqmQ==
X-Received: by 2002:a05:620a:618e:b0:7b7:342:a0a5 with SMTP id af79cd13be357-7b9ba821e36mr10703968485a.55.1736185361368;
        Mon, 06 Jan 2025 09:42:41 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2e89a4sm1522946485a.50.2025.01.06.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 09:42:40 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35B8F1200043;
	Mon,  6 Jan 2025 12:42:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 06 Jan 2025 12:42:40 -0500
X-ME-Sender: <xms:EBZ8Z-v6AwC8fQKDhN1HuuB72X7Kop6SL_YD66aVN3NpMltcfojvsQ>
    <xme:EBZ8ZzcUu_dMqeD-FYwkNa_y1UcXMFc6-Ytb6VnN2cvtOBwLnrettKYydVuw9GAzl
    fPaqNEgrosLmdYPEw>
X-ME-Received: <xmr:EBZ8Z5xd5drcbXkjx01Auco-8QaqvoCiuke6lONrrZ9CmUE6UJqGztmR_Uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhse
    hprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhes
    phhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopehnrghthhgrnh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EBZ8Z5Nvdh76sXizqpj0pD9txl_1jHBA6dw0zw3gd3YDY1B_yjoRlQ>
    <xmx:EBZ8Z-9Xc_KzmcY2xUyWoDBOT-M5KWrnqR4xEn3-nngePNqxRcYzVg>
    <xmx:EBZ8ZxXHV68iJkZZRMLFR88YO3HDBqRNg6kLdIPIK9psSuI2nwTMZA>
    <xmx:EBZ8Z3czNrWw4GdkWs1x9x0oPWttSO0N6yUq8B2DZK4Ebe-AYSosZg>
    <xmx:EBZ8Z4egtYbmKqlyR-ohWGPHhSieSb8rio3Pt1oF0ACjD33YzNrBvt4u>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 12:42:39 -0500 (EST)
Date: Mon, 6 Jan 2025 09:42:38 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust: alloc: make `ReallocFunc::call` inline
Message-ID: <Z3wWDgSe5D-Pc1Cf@tardis.local>
References: <20250105194054.545201-1-gary@garyguo.net>
 <20250105194054.545201-4-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105194054.545201-4-gary@garyguo.net>

On Sun, Jan 05, 2025 at 07:40:06PM +0000, Gary Guo wrote:
> This function can be called with different function pointers when
> different allocator (e.g. Kmalloc, Vmalloc, KVmalloc), however since
> this function is not polymorphic, only one instance is generated,
> and function pointers are used. Given that this function is called
> for any Rust-side allocation/deallocation, performance matters a lot,
> so making this function inlineable.
> 
> This is discovered when doing helper inlining work, since it's discovered
> that even with helpers inlined, rust_helper_ symbols are still present
> in final vmlinux binary, and it turns out this function is inhibiting
> the inlining, and introducing indirect function calls.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

This should go in even without the first 2 patches, right?

Regards,
Boqun

> ---
>  rust/kernel/alloc/allocator.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 439985e29fbc..aa2dfa9dca4c 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -80,6 +80,7 @@ impl ReallocFunc {
>      /// This method has the same guarantees as `Allocator::realloc`. Additionally
>      /// - it accepts any pointer to a valid memory allocation allocated by this function.
>      /// - memory allocated by this function remains valid until it is passed to this function.
> +    #[inline]
>      unsafe fn call(
>          &self,
>          ptr: Option<NonNull<u8>>,
> -- 
> 2.47.0
> 
