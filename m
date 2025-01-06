Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876614037F;
	Mon,  6 Jan 2025 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182298; cv=none; b=Sz/B6YOGZH04LIYMRSXxKZRWslckYApwGNc+vzUT0jPH7SsNLrLa/I6M2eBHkWXRofDUbG5V51DLC/K3cXgNvnak9Vd+DOp+BooFe/qdOjqrdxZEMq3Y/QLt2OYJlEk0p6odmwppIn23F5b56wegKYeo0ID4K5NFsSDMMyxB7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182298; c=relaxed/simple;
	bh=th2z8AAURH7F7OGYPWqjGpyyD64cUQGV+ZJ8kDi99uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXBgvziQrH4Y7AxpJ3Rf16gnakADCgdbTi0yO/mF1xA1DvNJzuTHR/NCvmqYCk7qZSintkZU2lU3hKC+cW9x8ccPx9Zuit+7dDkDEXfSHRQCFXT2cGx9AXd2KPI8yZC9mwM88ct26r4NxBptpS1EEm1EaspcU59OmK7mOl03wZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyABoCjA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyABoCjA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6ea711805so1641879085a.1;
        Mon, 06 Jan 2025 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736182296; x=1736787096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWn6RSx7XmdW5SOcZ5I++om66I/+VlsL6dababefqwg=;
        b=SyABoCjAWCCAnUm1xi+TsZrS6utmK89c9Zn7p/PWg5FGEdzNXfZOp0pCUFKMMt/xca
         g9lMbGFl3Ug8F6QVLv+EFH69NXgNiIKQZL2CkedQy5M8+NpFJUqqhpF9tMK77bbkqPbU
         UgCC1sjYbN0XIImRQdmNPlT4yRwOgXl5p7OnFIicyW4fPEGhZN8DNU4iyXUVNf0rS77G
         66aKcRpqG7v/ya2KzEw8wRQNZYDc+LPi3ToUi5tOzq7ANaaQYOj2iwAfLDzUZNd5oGnk
         CRN3q2Fx0bWZ6aRwWQoPW3lg+0vkY98iUzmFNVwR6CuCq+7gaRbBun/63Ccz9qzKqV/w
         TLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182296; x=1736787096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWn6RSx7XmdW5SOcZ5I++om66I/+VlsL6dababefqwg=;
        b=BJivQO26Zcq6ihbrlKW8IxMqgCgHYC8/n+899KXpSPbom3BDqfvE1JvE5Sig1gQJiS
         s+Cgbw3w3rPnV6Rvstrpxlo/ZOa1Qx2zi4asCeaIo7XHFs73B/7p+PLZ5FftrhFw7RLs
         yqIOmWTxnTKqx1Intt8VZQUukgNrkR0XWcH24tIDgrttq2KN+YE8BkxDpKkzJCTNuMJA
         VEL2CfcQ7g3mMN/RbDp/I/8AhYqw0Uyu5fgzxur+ErzfPiZsKaQz8DxQmdOIn33B8xXy
         YdcijW1wT+jOupQAC+Ut/7fm41HrDLurpfs05R9DvC9wFOLtLBQPGe8RM6w1yKG5g7YT
         woyA==
X-Forwarded-Encrypted: i=1; AJvYcCWFvPgJsDqUKO7/QQFqGfOC4wfKzfmUTd/Aq5xDbZovEx+Fm/D3qCHTNXeYktVtNBIUoZMowCQke3caN8bEt1A=@vger.kernel.org, AJvYcCWI/nZNiJBhxtwCcR7ZUnHE+1wi5Pvbw/A09NtGre6brPYzLCs032g9bZqH+tkIZ8/EvcgQI7f8GfkpRx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOVG1HTsY4qrtc82ojcGPTkBENAAzFXWJpKGF1j50eCboHPeyS
	bH0ZNeZF+yrBTIw2qFTj19+hlGDRcOk99w+pBWyA4OixOdHScLN6
X-Gm-Gg: ASbGncvcx6hBUdo+SasaO4gyYbcQxxi75bvem2uO8zFEfLsuqxQuw0yUF2s7tz5Hi2o
	US2KcAJV7jk6PPh1fIpUA/HwuDC00m8OxazjmAuh5/Ddc+a8rzwsOMLRZ/NYC2Op2Q1LoipGN4g
	9pUGfmnSSaziofqPMK8icK1ydujh0vn3ig54Pr9f3AFZgJa3cGTNtEDv5yR3UpSk/xp9xaxIisb
	s1t0QqLRAFW11fbX0TFh00ro5a+xAAzP0li2eXGLXhPIuSscrybiwWN/n7kAe9Exd79vjBAg9Ci
	rNJXojCcdM65E5OFbcOQXu+MLMNF3Cz127zfmrV0G27q8v0=
X-Google-Smtp-Source: AGHT+IEFL7IN7Qv/dlTxbkZZgj29mKegDsJjswKF83OjcvV5WI9/ugEQuAZ1RXNdk77klfHAQRuqfQ==
X-Received: by 2002:a05:620a:2447:b0:7b6:da21:7531 with SMTP id af79cd13be357-7b9ba717e7amr8982743385a.4.1736182295790;
        Mon, 06 Jan 2025 08:51:35 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e64b850sm177270821cf.15.2025.01.06.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:51:35 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D28A6120006C;
	Mon,  6 Jan 2025 11:51:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 06 Jan 2025 11:51:34 -0500
X-ME-Sender: <xms:Fgp8Z8aIfwDacKiKbf4Kvc5y-ah0E_EALmf4eOGqe3zJJpBsHlo-oQ>
    <xme:Fgp8Z3Y8rd3JsQ3t0jtQo-bTi3_ZJy-F2UXI7ZQUxGig5yd5KMs3hCpUbxyLBd_mR
    PISjTsaPAf-0f21XA>
X-ME-Received: <xmr:Fgp8Z28aPQ_Kd8h5m5Gj-e1o_4EjI_giL2SHt60-WLv-kG-bdklmoD-lb5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhvdelfeetlefgvdeuvdfgfeeijeetffejfedu
    ueeigfeljefggeduvefffeevhfenucffohhmrghinhepihhnnhgvrhdruggvvhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    gurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhig
    fhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonh
    drmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Fgp8Z2pn-0eqsG5VwXeFaDnShnDKFGBVNbMz7RSfbtSOn9sGc116ng>
    <xmx:Fgp8Z3oI8AJob2-R69mNb38Ddo3nYbc0xuZElS2lFyNFWISwMrG-oQ>
    <xmx:Fgp8Z0TULwXrHSHWr-viSqBe8nv1Xlp9YzSxux-RI_A9wjuvmbGAUA>
    <xmx:Fgp8Z3oKYEckWG5WmHe5WNZq6ZcDb4n9B6zO_mr39KJAqWntsBZgmQ>
    <xmx:Fgp8Z87ediqpS18j2gXY9FeRt01eWA9uDgeHb5OYKefPl9oXUmX4LLyy>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 11:51:34 -0500 (EST)
Date: Mon, 6 Jan 2025 08:51:33 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z3wKFTkmjdaGHKIn@tardis.local>
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103164436.96449-2-dakr@kernel.org>

On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> So far `DevresInner` is kept alive, even if `Devres` is dropped until
> the devres callback is executed to avoid a WARN() when the action has
> been released already.
> 
> With the introduction of devm_remove_action_nowarn() we can remove the
> action in `Devres::drop`, handle the case where the action has been
> released already and hence also free `DevresInner`.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 9c9dd39584eb..7d3daac92109 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -10,15 +10,19 @@
>      bindings,
>      device::Device,
>      error::{Error, Result},
> +    ffi::c_void,
>      prelude::*,
>      revocable::Revocable,
>      sync::Arc,
> +    types::ARef,
>  };
>  
>  use core::ops::Deref;
>  
>  #[pin_data]
>  struct DevresInner<T> {
> +    dev: ARef<Device>,
> +    callback: unsafe extern "C" fn(*mut c_void),
>      #[pin]
>      data: Revocable<T>,
>  }
> @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
>      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
>          let inner = Arc::pin_init(
>              pin_init!( DevresInner {
> +                dev: dev.into(),
> +                callback: Self::devres_callback,
>                  data <- Revocable::new(data),
>              }),
>              flags,
> @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
>  
>          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
>          // detached.
> -        let ret = unsafe {
> -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> -        };
> +        let ret =
> +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
>  
>          if ret != 0 {
>              // SAFETY: We just created another reference to `inner` in order to pass it to
> @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
>          Ok(inner)
>      }
>  
> +    fn as_ptr(&self) -> *const Self {
> +        self as _
> +    }
> +
> +    fn remove_action(&self) {
> +        // SAFETY:
> +        // - `self.inner.dev` is a valid `Device`,
> +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> +        //   previously,
> +        // - `self` is always valid, even if the action has been released already.
> +        let ret = unsafe {
> +            bindings::devm_remove_action_nowarn(
> +                self.dev.as_raw(),
> +                Some(self.callback),
> +                self.as_ptr() as _,
> +            )
> +        };
> +
> +        if ret != 0 {
> +            // The devres action has been released already - nothing to do.
> +            return;
> +        }
> +
> +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> +        // this reference.
> +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };

There is a pointer provenance issue here I think. `self` is a immutable
reference to `DevresInner<..>`, so the pointer derived from it doesn't
have the provenance for writing nor does it have the provenance for the
`refcount` field in `ArcInner`. Therefore it cannot be used to
reconstruct an `Arc`.

We probably want to make `remove_action()` take an
`&Arc<DevresInner<T>>`. Or am I missing something subtle?

Regards,
Boqun

> +
> +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> +        //
> +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> +        // anymore, hence it is safe not to wait for the grace period to finish.
> +        unsafe { self.data.revoke_nosync() };
> +    }
> +
>      #[allow(clippy::missing_safety_doc)]
>      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
>          let ptr = ptr as *mut DevresInner<T>;
> @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
>  
>  impl<T> Drop for Devres<T> {
>      fn drop(&mut self) {
> -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> -        //
> -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> -        // necessary since we don't know when `Devres` is dropped and calling
> -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> -        //
> -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> -        // anymore, hence it is safe not to wait for the grace period to finish.
> -        unsafe { self.revoke_nosync() };
> +        self.0.remove_action();
>      }
>  }
> -- 
> 2.47.1
> 
