Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341447C088
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706110584; cv=none; b=g6MiHgHbjP+jJ+gAOEHkxgGYGOqjapPgLH+1XsoeHQj+lTjdPLgNVfxezl9YhOsOn7dor/8j8gKS/xUbeLPEktMzaTUkwlkgj4wG12A4AXbAMVnHeOv1g3AiY+7ka2GxNNUTL6nlqIIVKXbiD3gDMlGgU9tp3tGB3IYe+9yEutA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706110584; c=relaxed/simple;
	bh=PADzwbWNi+FrxMrgIQEbqFCyxLY+PSm+aqIJot4GbYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqrySdTXBwz6kPB6lkdD+WIsCKUX5J2x9qBPk0RPcKyOSYjjKtMWDlO3zt/+53tZqvt9Ae6ifRW5kZvhRMAlHtRsdHCLASCO7axRB0OW5e8gdXScpLeTrXyEYtIgyctGtSp5eBJWK1/A6LbFNBB00tdU5rVNTXNSM4ik0o8siM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUVE2mwu; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUVE2mwu"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-429be9fe952so48448811cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 07:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706110582; x=1706715382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/51VeilcYF0I+4NJURq00ejDGQNa8r3vT2AfM147Qo=;
        b=BUVE2mwuB6+0JBxqTJOToikgu6ENjBiAp1dfCVc7Mz7SdbxRCwrACjtvZ6L/rUc7r7
         l64mhfYhCpaZ5liOEhKeItdeYSWY1qn7p77m9doj4JOmrbwVmujpYWj5FhX3+424CNqN
         6vV0DgctEz6mwEqqi9AmEyKicQ3OW+xnb+nY0Fpwx92k2MBdYsyh0xdc9Pq1Xw3y3iLV
         kwJVlytyKNzaLjO//777Qn0YmSmmFS2icSfUQmNUo1PrSWn7A47NPAClnqhdrJANq43M
         Sd0NGBVEnZ/atjx6DAl+uTnnOQJxSENRzgydNi40kBTvnmZFxv9QgSFCAFCwOi12FpeB
         nuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110582; x=1706715382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/51VeilcYF0I+4NJURq00ejDGQNa8r3vT2AfM147Qo=;
        b=DFdcgAf3o1f2ls3CaO0hvMDzsDRuWspL1uUeJ7lXHtK4+/rCWbcvJc6DZEuGujOrmx
         aBuDhUpqYnn6AcEuABlc9o5rySIv/AHffZiCXjyM8W/j7wUMl81DjZXJfl2EGd6QNd2r
         9VATFj1Vqc3Hwkfx5RQ4BOMd5gL7JTwgLXH90vdgzqamZZNwsQ1sHa6koLk7f5pM9gqE
         /RNUsP9hwWnr6oQcwNblsBGQmWEgl6LV1sqpN+JiztjMuWhMH4/XCZAADKdEjIng0xrp
         mXz9vDqMGS5stgpD2yKKAZjNwNAyjWfUFBGBWTnHeGPMvRnteMxt301puB313SB/XM90
         R3Zg==
X-Gm-Message-State: AOJu0YwQ48JjlLOQH618YQVpiHDx20ivZIUkJHtFg+j8HTRSLg2VdvIp
	marQUIk1dlVJKtqRqvcNGl5Z3c4PEo63RR2wJBtql+bv08ijJtVC
X-Google-Smtp-Source: AGHT+IFznP7aB44U+YTG3BrgSMMmk3NrfOeYhsBy5JtcMkzUbA4v+ZwQMBDbYVjDJwCcKCePWIGuog==
X-Received: by 2002:a05:622a:91:b0:42a:378c:12df with SMTP id o17-20020a05622a009100b0042a378c12dfmr2197291qtw.38.1706110581936;
        Wed, 24 Jan 2024 07:36:21 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id eo10-20020a05622a544a00b0042994f83b25sm4475500qtb.35.2024.01.24.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 07:36:21 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0FC5E27C005B;
	Wed, 24 Jan 2024 10:36:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 24 Jan 2024 10:36:21 -0500
X-ME-Sender: <xms:cy6xZXM69kn7XI9H9rl4s3ozEPQVKkbYRD0cd4ac_RY6dBDEPF1aAg>
    <xme:cy6xZR9RVJo0McRnmzq-wiLndpZ3wJO7cycz5MnkBCVzoL_3AKymq7Ik1OIhXENlU
    6GRHb4rwIbIRduwdQ>
X-ME-Received: <xmr:cy6xZWS8vBgIhEns_OTT5iFJd1z0Apt82XGStrR4MOhRj6fE29YcnAiORA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeluddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefhhffgudfgfeeggfeftdei
    geehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:cy6xZbt6scLeBiyPjFrRMN16M8oeiw4DDyiQCoSQEellwGGZ9mx3gQ>
    <xmx:cy6xZfcHfeSOXQzYDUtqxFIQr6OlQiLKoBQejAFoVB51a6_bAKg4ag>
    <xmx:cy6xZX3q_qg95W56ruddcnTskhmTgj_LTx_K5LQNilxQOUw5SrUiCw>
    <xmx:dS6xZT7A1qshhodzxrwx2NKGpLo9-fTgKe6CD5-qQNXgylRZVI_uow>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jan 2024 10:36:19 -0500 (EST)
Date: Wed, 24 Jan 2024 07:36:17 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Obei Sideg <linux@obei.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: types: Add `try_from_foreign()` method
Message-ID: <ZbEucTWVZ6yXI6sD@Boquns-Mac-mini.home>
References: <20240124113241.380026-1-linux@obei.io>
 <0100018d3b3e9621-dd8655bf-d355-41fc-8a10-a6167b67d77b-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100018d3b3e9621-dd8655bf-d355-41fc-8a10-a6167b67d77b-000000@email.amazonses.com>

On Wed, Jan 24, 2024 at 11:32:53AM +0000, Obei Sideg wrote:
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few
> duplicate code like:
> 
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   Some(unsafe { T::from_foreign(p) })
> }
> ```

In the commit log, you explain the current status, which is good for
explaining "why the patch is needed", however, you should also add a few
sentenses explaining how your patch would help/improve the current
situation, otherwise it looks like an unfinished sentense to me.

Thanks!

Regards,
Boqun

> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1057
> Signed-off-by: Obei Sideg <linux@obei.io>
> ---
>  rust/kernel/types.rs | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index fdb778e65d79..f27f007ca543 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -46,6 +46,26 @@ pub trait ForeignOwnable: Sized {
>      /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
>      /// this object must have been dropped.
>      unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self;
> +
> +    /// Tries to convert a foreign-owned object back to a Rust-owned one.
> +    ///
> +    /// A convenience wrapper over [`from_foreign`] that returns [`None`] if `ptr` is null.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must have been returned by a previous call to [`ForeignOwnable::into_foreign`] for
> +    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
> +    /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
> +    /// this object must have been dropped.
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
> +            // call to `Self::into_foreign`.
> +            unsafe { Some(Self::from_foreign(ptr)) }
> +        }
> +    }
>  }
>  
>  impl<T: 'static> ForeignOwnable for Box<T> {
> -- 
> 2.39.2
> 
> 
