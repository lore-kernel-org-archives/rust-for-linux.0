Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979FC1C84DC
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 23:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137366; cv=none; b=Vc4Taa28zLKwJTZJswqLZ54ZDhciXjEBIBP1P+inK2APC0sEmdTIKr9mfiNF+fU8ZMf3gBvj5qgouD3zF4G9Mv387g9Z6dRkz7M0xR1dc2sCUFR7tacFlXW9ChZBFHQBakJtKC2hLAQNAvq4TbARHp5EaCvliDzDU/7Lry+o6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137366; c=relaxed/simple;
	bh=//3KhSIDuKF8cORC5f1soO1VWIwcJyd5LvthvJ4/Izk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfX75f4wiq5oscU8JNhyAndoP2rrzGbOf2/5meZxokDmwEuKXrcJEUBWxhOxZOXDST4ZOXcw2TKABppTfqQybPVnbxZAlab+nKFHAzwEg9WJKzpjVFPJ18UxHKPhia3jUP6rV2swUVTMIYwmaayWuvap1JnohaUm2kiQlPtnBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqHO4i7d; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqHO4i7d"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2f2c5ec36so1202010285a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 15:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767137362; x=1767742162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stPkj3CsotlBmKIpyRSfvDMp5yBz1CLwuEpZUEVVAHs=;
        b=UqHO4i7dE6x3K94QbkYykQwAHiUeszIGPsg0nZ03+GrmWlyCG5i7HEngtB07bT7GVO
         0FQ3QKantOIIo7tBiXM70LLvbk1kufmQEsFXY9P53pjtwwo3Sgp2KKamKU1GCJauKpTQ
         jYEW8f9aEOf0ihYRo7okbriD4xuwljfeZb52VBn43DHtAcaES2De4zR79EBxRGvc/TNz
         qecW2qi+u0ekHvrJyptQg+q8ge0klsn6AjOuUDa4bRc9vH96z/Mwb3KpF1NSTiQS7An8
         q7hUaQVw2DfE1Cz8MPkEM3IgW2/NJuWBSAfLa9DM4ePENZyqSConyOAcANXoqs0IJMnD
         rSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137362; x=1767742162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stPkj3CsotlBmKIpyRSfvDMp5yBz1CLwuEpZUEVVAHs=;
        b=veazvPE6OfABCFbb6moFuOVtxORbpBDOC9aLqV0mlWripAQ9TuwLZpHkh9ugQ2lfHp
         OeeqRM6tPNJhXQ4ALeBV7MBeEC7ildOG/2LGdRM3EUN7WZb5+ea9ghPAFTWmYIuNqZgc
         yymWSBudDrP2hK2g+y3Iji7Wbzf5GAFy9mvDCmoJaU0n+w9/akFxu49v0oabG0uTqfGU
         SL1ZE7s9h42MHD6I3WEc6lNxZzhZNJXW9XXXsZ53Rns8sF+9C2+vEEZ9SuUIvi/E4gpz
         ntGu0b63HBoVsf6OjxisIahWD+bx+qGGcDJlMtym3ajllv3N3+4uc0JdByln+rkoqZVV
         0hvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJaoF5OlAGjullUZbxeIJq0lQAj6zwRGct7/kiBU+PIRP9tvrLhjK7oHT2C0E8mHZ71a5n3rU79xGz6PlijA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymqt046GcUFLLiLOQe2DXBAuhbZPStPIDgOkYWZUqUWkwSEGZ7
	ngNTQLqJ4L1BILqRA3dkmajKSbAM8x0KPjtrcZ/6/EZkpEM/4iinOP7s
X-Gm-Gg: AY/fxX5Chkfir2wusWZ3e07ondo1+gscAXggw7/iW4692ZiNqwDhIRNcaPfNtY5m92l
	O66tdftv/pVWJv3RZIQBGUym7m8/KJ66vwEybJvSfQNgWenRDyeYGApVwtOJSaL3Zc71xNMKa6l
	/d7CP6A+Fngcqqh/ppvd0hHegi3gJAspt1eZE7yrgWnR3UEnYPxSYFYrP9OO+YegaK35I6+Iq7O
	WpruIZ3ABa3DGlsASQgi6C29h0LOIf+/Xs3rC2zzZ1AK8grQeT/x3hdko4nDSjeNrrRysJG27xE
	r8Ias9cMXqWAN7AYNf7Pppe5nAqE6PTKLejZWtq6NjdtgrL7zp1SUzcr875snA9Rj4OhdylU/2E
	Tjg1Zjq8B2judvqd4MxuMO66U2q66IgqQiv7YjtGUwVl9jgorspfQcPLGVrxh4ZGiVAJbAmI9DE
	2PVtVO9E7jSMILD0UH0E4A7H4IUmUGZjYmBr8esEOfOn+kSc3PyOi20TSoEIqaBUPSKNFS5+3M9
	NEFHa099CHFYOA7HunP6u7tKA==
X-Google-Smtp-Source: AGHT+IGqneIWBLQvS0c3sU0igfZIsOmEqyqD3kaJsAmqiRD3t/cbyOPhQNRzBk8+aZ6I9LkScbz4GA==
X-Received: by 2002:a05:620a:3195:b0:8b2:ef2a:e885 with SMTP id af79cd13be357-8c08fbbc8d0mr5022356885a.76.1767137362385;
        Tue, 30 Dec 2025 15:29:22 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c1a674bcaasm1601794385a.38.2025.12.30.15.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:29:22 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6CAEFF4006E;
	Tue, 30 Dec 2025 18:29:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 18:29:21 -0500
X-ME-Sender: <xms:UWBUaS-2KPXunQQuaaa7-OyywC-0NC8Zlz-0745BVEF7v8-lqu9-vw>
    <xme:UWBUaTI_At8fccq9E1mZKEBs3zG5U2JsrnUQH0NYQbYUGqUkfN9rVmq_BAbMPT-34
    Ws7Ce5X439QogGinXV3xgvOmBRKuLOEjqFGvbjUL6El36JEFsyK>
X-ME-Received: <xmr:UWBUaXxEt_fLCwh-TZVGzJRE9DE-7UdES5lJZXDnf3lzV_RdYviL9nxGdN2v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhvvges
    rghnughrohhiugdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhkjhhoshesrghnughr
    ohhiugdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:UWBUaW1gcSGrkOBUCbvgohM0JxatSQNoBf5onsQmXyMaTTq6Qa65kQ>
    <xmx:UWBUaQ8HD5_6Q9KghLWKzRUwX-9UXOFJu_0eS0sNm2ExHsH00NEfqw>
    <xmx:UWBUaeTaRHEwVBXL2xp3-aXhSC1IU-wtsCZDNL8EqARWCimMbK2HJw>
    <xmx:UWBUafmSe61CICWvkAqTkYhgAXwrdSj2M7LD327ynXjrH_TQ6RR6cQ>
    <xmx:UWBUaRWIuy4BsZVQOa36T_Q2wndkGBc-smNd5p2se_2YoJ1Syo94G8ll>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Dec 2025 18:29:20 -0500 (EST)
Date: Wed, 31 Dec 2025 07:29:17 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, arve@android.com, brauner@kernel.org,
	cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
	tkjos@android.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic
 primitives
Message-ID: <aVRgTQWhqjKB6xpK@tardis-2.local>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
 <20251230093718.1852322-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230093718.1852322-2-fujita.tomonori@gmail.com>

On Tue, Dec 30, 2025 at 06:37:16PM +0900, FUJITA Tomonori wrote:
> Convert uses of `AtomicBool` to `Atomic<bool>`.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/revocable.rs | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 0f4ae673256d..47cd2b45eada 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -7,12 +7,20 @@
>  
>  use pin_init::Wrapper;
>  
> -use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    sync::atomic::{
> +        ordering::Relaxed,
> +        Atomic, //
> +    },
> +    sync::rcu,
> +    types::Opaque, //
> +};
>  use core::{
>      marker::PhantomData,
>      ops::Deref,
> -    ptr::drop_in_place,
> -    sync::atomic::{AtomicBool, Ordering},
> +    ptr::drop_in_place, //
>  };
>  
>  /// An object that can become inaccessible at runtime.
> @@ -65,7 +73,7 @@
>  /// ```
>  #[pin_data(PinnedDrop)]
>  pub struct Revocable<T> {
> -    is_available: AtomicBool,
> +    is_available: Atomic<bool>,
>      #[pin]
>      data: Opaque<T>,

I actually think we should use Atomic<i32> instead of Atomic<bool> here,
because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
doesn't save extra memory but makes the xchg() operation slower on
architectures that don't support byte-wise RmW instructions (e.g.
riscv).

My rule of thumb for using Atomic<bool> is: when you really care about
the memory usage, and you can guarantee using Atomic<bool> is saving
memory. For a general "flag" usage, Atomic<bool> is not strictly better
than Atomic<i32> in most cases imo.

Regards,
Boqun

>  }
> @@ -84,7 +92,7 @@ impl<T> Revocable<T> {
>      /// Creates a new revocable instance of the given data.
>      pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>          try_pin_init!(Self {
> -            is_available: AtomicBool::new(true),
> +            is_available: Atomic::new(true),
>              data <- Opaque::pin_init(data),
>          }? E)
>      }
> @@ -98,7 +106,7 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>      /// because another CPU may be waiting to complete the revocation of this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard = rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> +        if self.is_available.load(Relaxed) {
>              // Since `self.is_available` is true, data is initialised and has to remain valid
>              // because the RCU read side lock prevents it from being dropped.
>              Some(RevocableGuard::new(self.data.get(), guard))
> @@ -116,7 +124,7 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>      /// allowed to sleep because another CPU may be waiting to complete the revocation of this
>      /// object.
>      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
> -        if self.is_available.load(Ordering::Relaxed) {
> +        if self.is_available.load(Relaxed) {
>              // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
>              // valid because the RCU read side lock prevents it from being dropped.
>              Some(unsafe { &*self.data.get() })
> @@ -157,7 +165,7 @@ pub unsafe fn access(&self) -> &T {
>      ///
>      /// Callers must ensure that there are no more concurrent users of the revocable object.
>      unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
> -        let revoke = self.is_available.swap(false, Ordering::Relaxed);
> +        let revoke = self.is_available.xchg(false, Relaxed);
>  
>          if revoke {
>              if SYNC {
> -- 
> 2.43.0
> 
