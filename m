Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019A139566
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737019034; cv=none; b=mHRI7KD6FAEoayqVKildKAxYhAVWpXOBD7MkznfpkwMKduV42PrcKXlWVVoIIbikgtH679jn5erhktHt+p05zPDW3PmGJ6lERfOU/YxyqWi88fOSejan++uSAPodPVmfkSUy3yVhF+sHCJGCluT3GSQ1gE0ejnWLelHV9GBtutw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737019034; c=relaxed/simple;
	bh=jjpMue/Ht2qG19a9VG6JkTKgFZVesHzLY9PoP2l9ByE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui4HtInHTGgPgSpllGPGPku78uCpw+rZ37RKmMp/d+LTQBK4FXIHuvotfO5NHKVr2dMyAHTvuHgVU6WzqOrGyFjjX2gSpNGP5PVZOYBx9a5yw5IzrNqSf0OFTLSL0jfwTsEXccaIq6MPIFDa66EN1MBmXY3F0wISkD1Di6R1zC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDfv/rWx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDfv/rWx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21670dce0a7so14253175ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 01:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737019032; x=1737623832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyCJ9CTa+KPiCKak9X4mNUa65nCq9LRdipr+oToK3pk=;
        b=IDfv/rWxhptW4SJyVWvMXrX3iG/7Me7LTXXSMDAczbZXR+yuwFvOwiVRkXbNW8NlHp
         mvaYX4uoply8BPuw4MVoh30lEgPZjvbjteNuc3dAvdrJick9qUkydfDjoPsNKGFdjYMY
         3hfJChqGZrX/dOYM7TvzUtDdIzYAAtROMhZhozExC8/87NSWPSob2NSZyhGEwmVILD0u
         TXIeqKzEDE7TBIc+p8mXjM2uD8UY7B+3IrIne7Sf5R6m+Ttrq2i2BrT7pVKxYyMoPva1
         0Ce1CBYZjO7DnQASoyX9EtRny1UANsVZwMYmWM8K94sz9aXM91vKYBS927mYM89D4L95
         fWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737019032; x=1737623832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyCJ9CTa+KPiCKak9X4mNUa65nCq9LRdipr+oToK3pk=;
        b=MGAKuP/KV917duzL8HpyOoA6ExuEmXMik3IW3roOC4EaahzDa9KcVpXjndXu76QJ9r
         8pMy43LSV7WlWoO0RY4YbmyDi103UwBIpBAD9ob4A9jK5TgLdYlIZYjkM/oW2HhZYNsL
         k3x639FkjSak/K5TaGz36HLfB7eb5SPF/xE+imnC3g8RxVQcS+yhL7pd0h/9dz3/CejG
         xt6a2CFVfSbt8xOXro5nsvrBt0gVaQSeMAg1R9h0GezB3/yH7FZgra+G6faYW/Qa8NyM
         r1byvaQ5YCnAhj0Y1GhIn/yOPtkzU9wVcTUy7dwePCwM+FLc371vhCV9q6UPKW2v8wRM
         RAhg==
X-Forwarded-Encrypted: i=1; AJvYcCVFksDJzdwoyFmPkk6Ku3kbBwyKMU9bR5oG5G4peT3FI8B00Y3pE/qP5/YNXc0ltulMdE11D+ogO7lvWDSJ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/coPcGcqxzQDyCUF4kRWMRjuhxG6mvCZv2fhh0CqtB9NVBN4e
	ziSMAfQi1/8rIa+QEJJAAO8rFbw115weKg+U5N3MlaUyi9NZVLwdctXytNGxgSM=
X-Gm-Gg: ASbGncsWmrnaXNiav3GNK1pCAJevQDJHEB5DfrVF8jPPZgjcPOjoxMUvifAnlwCosn5
	R2bQmsLCJoFfsF7a6T0eCuTp0S6tnn6F5m6Q2+Vi5UiKXY3nEJyIf/Q4tTvWEFYX+JYiA50u69W
	aYgXGTS93/sRtLSloINVknuaKJ3JWCqQdFtPlzhuZ4My14x5up6WsC0qYesb+08VSgDtJb2w1Ko
	ZEe/S1d5mnhQ6CDiJ8qMPIZdgMFEfuVgpU4f0otFbbZ6fy2uE5UqSnHa4g=
X-Google-Smtp-Source: AGHT+IF+AB/yDyP3sHokpXz+G8vtI+AE7lEQMNO+j75LpMCWt8816cElgMQ9bohqqloA18c6JDTSNw==
X-Received: by 2002:a17:902:d481:b0:215:b01a:627f with SMTP id d9443c01a7336-21a83f48e86mr521010235ad.4.1737019031771;
        Thu, 16 Jan 2025 01:17:11 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22e52bsm95102715ad.184.2025.01.16.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:17:11 -0800 (PST)
Date: Thu, 16 Jan 2025 14:47:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 03/16] rust: cpu: Add from_cpu()
Message-ID: <20250116091709.gg5r5d7dmiqudt2g@vireshk-i7>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
 <854f7b8c9cbcc7f38fe5ed548290f41224478b40.1736766672.git.viresh.kumar@linaro.org>
 <2025011430-humiliate-expansive-2ea4@gregkh>
 <20250115072050.72oeibi735k3pjdq@vireshk-i7>
 <2025011537-shuffling-unpaved-121a@gregkh>
 <20250115075859.mjpcvwctxx2vutpu@vireshk-i7>
 <2025011556-regroup-swapping-623a@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011556-regroup-swapping-623a@gregkh>

On 15-01-25, 09:09, Greg KH wrote:
> On Wed, Jan 15, 2025 at 01:28:59PM +0530, Viresh Kumar wrote:
> > On 15-01-25, 08:54, Greg KH wrote:
> > > Ah, but that's not really something that SAFETY should override, right?
> > > 
> > > Yes, you know your implementation of this will stop using the pointer in
> > > the hotplug callback before it goes away but that's not documented here.
> > > And having the device "fail" afterward isn't really ok either as you are
> > > relying on the driver core to always check for this and I'm not so sure
> > > that it always does on all codepaths.
> > > 
> > > But, I'm ok with this for now, as you are just copying the bad C model
> > > at the moment, but it really feels like a huge foot-gun waiting to go
> > > off.  Any way to put some more documentation here as in "use this at
> > > your own risk!"?
> > 
> > What about marking it unsafe ? That would require callers to document
> > why it is safe to call this. And yes add more documentation here too.
> 
> Sure, that's fine with me.

+/// Creates a new instance of CPU's device.
+///
+/// # Safety
+///
+/// Reference counting is not implemented for the CPU device in the C code. When a CPU is
+/// hot-unplugged, the corresponding CPU device is unregistered, but its associated memory
+/// is not freed.
+///
+/// Callers must ensure that the CPU device is not used after it has been unregistered.
+/// This can be achieved, for example, by registering a CPU hotplug notifier and removing
+/// any references to the CPU device within the notifier's callback.
+pub unsafe fn from_cpu(cpu: u32) -> Result<&'static Device> {
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    let ptr = unsafe { bindings::get_cpu_device(cpu) };
+    if ptr.is_null() {
+        return Err(ENODEV);
+    }
+
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    Ok(unsafe { Device::as_ref(ptr) })
+}

-- 
viresh
