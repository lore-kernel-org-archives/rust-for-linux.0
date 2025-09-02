Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1639120297E
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805392; cv=none; b=oxcqFC/Tq2KVMRyck7RDpmKJkFGPuej72Wb3AWpTswLfue4DkSJ+/L2oW4zmgZMXJuHPlpRN3iiZUu0e4857OpkDSs1w0kPY/I2kuUlxm0xzq1bmjcL168USxl/x7Fk8GYoqD8803YHzW356Sa2Dlfparip9LfRcNH1hekIhB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805392; c=relaxed/simple;
	bh=aSwRzij5ZlHF6dj34bVAepPPm830Dt9vwoxlXSQayqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=msxG8wyUTgOCOJPQIZiLRRLhKjyyUQdj3ebuhUE6ENMARZ9YPAHsRmBgbgRSh6m6VA/CXOpvB9uRrdViev/JVNE78id5sJgMtP/m7JGfZOT4pETnXoihwnPeNEsgumMi0pz2k1KNSWDTNJjkOEd1O4GUP7VInmgGganl9WdGhJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RdDNLQKx; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RdDNLQKx"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b7f0d1449so19651245e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756805389; x=1757410189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ilhr5uRoEss7UzbcIUdCo6dlFgB5H7QW/rpXDXEsD9o=;
        b=RdDNLQKxH/DDwC6pDwJkhV7xDAVo1y+kxm2k9K04v5rjH+gK2MzGOcFy/PYv8xUayT
         2fAXYYvjbL/KYMmuHoDjbIWIVe1vEgh07dBnU5nVRQ2PiU+/btv9pmxxkvOAb+lh4M15
         vRhF97b2JH9bUtsJa3N4gGHd+AFo5klbM8bdjLa5+5U20ymeNdJdoWxytijzNSSFZ8Ij
         8o0Fz94V8dYC5/h4Ey84MV0gvl2gcHjndc5jrO0LJscKr71N7dqpT5u7FqBERAadox6Z
         M61k6sccHjwjBZbaKCQ1042W6p3iZFcKGjve1GZlFmhQlqfZrik4+Pz+KNv1tjPkWGVy
         DZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805389; x=1757410189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ilhr5uRoEss7UzbcIUdCo6dlFgB5H7QW/rpXDXEsD9o=;
        b=drhpCtw+2Gd8XIvBBMQgwD8oW02FkX0tlnRF3+hiIeerOB1SfSeTXf39UyGI4ayYft
         8k8UcCg1FWFueyz0gbdutSuqhm+qAN3vJaHOMU/2jN1gmJH04gBw7anW0/02IJj9ataY
         PfW5bZFnHGFgXkaXkzauHpt5ErKTF1636NGESGfivikItCKXdHttvT6jL0GqAUROCze2
         iRio/TcNkFx1x4FJKaNe4/0jeJTOjdIiFZ90vjsZxBZ9Yk+IgJe6ks5iySTANGB75ZTh
         XtfZUsV7rytLSAzFU+ws8/oo7A+PKC9H2r05mvlNgNnA8KjrjUtyOdRq3iziBCWPKMXq
         +Ozg==
X-Forwarded-Encrypted: i=1; AJvYcCXndAHAD+qzgZ2DsJlhHopp0ShwdcGpJn7tiKvV41QXLDHaeqNnA2VS2uwe8HCxTYxtvE9KAPXQOvZMTLnMYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9poooPWhU96TDYpy7QdJ/A/W29xhdBjdjT8op74xs+FCo6Vx
	JWH+JF3QGoRJwcee3YxxqTmZf9btgT+oo0+aiz8rfBcxaCuQUid1Gu9Orrnb/ydYe4L/8UYBnbw
	4cWUpBxwi/15JriT1MQ==
X-Google-Smtp-Source: AGHT+IHeLI2nodfDj5qJHvTiRllvehJ/MUiJeuPZV1+kGBPWE3ADfWl0z8j5DiTZcUKyiqlu28fYRfF0Q9XKcAE=
X-Received: from wmpv24.prod.google.com ([2002:a05:600c:4d98:b0:45b:97e5:47d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c8:b0:45b:80ab:3359 with SMTP id 5b1f17b1804b1-45b8549c269mr88432255e9.0.1756805389426;
 Tue, 02 Sep 2025 02:29:49 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:29:48 +0000
In-Reply-To: <20250902090638.785-1-trev@trevrosa.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250902090638.785-1-trev@trevrosa.dev>
Message-ID: <aLa5DIMV-ADsw2c6@google.com>
Subject: Re: [PATCH v2] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
From: Alice Ryhl <aliceryhl@google.com>
To: Trevor Chan <trev@trevrosa.dev>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, bhelgaas@google.com, kwilczynski@kernel.org, 
	jack@suse.cz
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 02, 2025 at 05:06:38PM +0800, Trevor Chan wrote:
> `AlwaysRefCounted::inc_ref` is a function that shouldn't be called lightly.
> 
> To prevent accidentally calling it, `inc_ref` is now changed to be an
> associated function.
> 
> Modifies all `AlwaysRefCounted` implementors to work with this change.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Trevor Chan <trev@trevrosa.dev>

One nit below, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index dbd77bb68617..3a3d5052786c 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -24,7 +24,9 @@
>  /// alive.)
>  pub unsafe trait AlwaysRefCounted {
>      /// Increments the reference count on the object.
> -    fn inc_ref(&self);
> +    ///
> +    /// This function should not be called lightly.
> +    fn inc_ref(obj: &Self);
>  
>      /// Decrements the reference count on the object.
>      ///
> @@ -103,7 +105,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// # // SAFETY: TODO.
>      /// unsafe impl AlwaysRefCounted for Empty {
> -    ///     fn inc_ref(&self) {}
> +    ///     fn inc_ref(obj: &Self) {}
>      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}

We probably want _obj for inc_ref like we have for dec_ref.

Alice
