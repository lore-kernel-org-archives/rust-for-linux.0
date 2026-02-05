Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC73A1E9B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285286; cv=none; b=F7Ypmjv2Q5f1orwF/da6Daa4kwWmXzwX045OBkQj6HMFP2jEyAFRFWS8msaXJ7iWdxzTTEI12w4JsZ0agLoAaXWN5/4MAWbGxI8H67q1OzSjfIXatB4vb53DukaTCR6yBMrqPC5b12yC0UPEvndpWiwf3VP/6rapymC1kHNCfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285286; c=relaxed/simple;
	bh=+gH07T7gJ7+X3xesrNA2+Bs3sMLJhA4gaSIsoseJoFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f08utrXbOV3zGb/QOzOSeYY4bD43dkB82J08MqdvrOuqxohRkC+1c0qpPVx9bN1pyItTNsPIJcYLA4OCFyPFVzwoGOaBuVWx99ssAMRtWYwIjrdXCtR6q0tNXwh052kKwbv18aPSDGzl9VT1vapw2qQMmQVSfmWM8lulcgEAwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIztZXVg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIztZXVg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so526067a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 01:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770285286; x=1770890086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xBIY0mav+3IAaN2sDOZsKW4O0cnUlRHLSnJJ3/BuhM=;
        b=OIztZXVg1hLazuEkmqd8LlclnaLE4rA0fxlphw3KvArdlCYxrvdQZyDtKojtlalHtG
         1a66CHSgueLHo3e7wgPFL5SSykTdE+DP/Wqo/IzjGPPDm4GcyVlPjTjvAduAfl8knaW9
         NrADuUlm153qtL+TZOZwB02E5FIxQEvXf8VcuyXxGRlrop4XdAcCjNyZpmvoKpOXaqx5
         iTqPuOKTZ61EEAXWEtUzcfKjsOfoqd6olMTXQbZ52wRe3LltSc6K1bAuQ04//rTzOU9I
         efFMVyoMMVC/Y1sfaoxEqpR0CYhnFWHReEGc2mHEIYgZfGzJCicUald9h2trI26NPIf1
         gaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285286; x=1770890086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xBIY0mav+3IAaN2sDOZsKW4O0cnUlRHLSnJJ3/BuhM=;
        b=jwMrg2HIuWV5+bzFtTdnri3oMjo8cgVyF4jw8MZZlFM3kK9FDGJBgaLkx88FU1yf2L
         lwKbf60bkcS3D+dihbGQOlGoLhHE2bifJhb69VLTGSTqvzamyuCHa648jyPok1EjQBd7
         dBwwalLChqPvPh0UGgJFB6bx+tmxrtTjrkY+wK12VrE2AbrumDvi5IxHDUhT2yKil2W1
         etcLb+jWusnM05X96aXfMyExOc/owwQrPWg5v2Zz0s3RNx4HYxzOYqjP51tu9U+/VTIb
         zR0BEiOiQB1DSAptgK+oOY0kr9O9GPzpvd1aBW9YUTYn51Gt6wKlDSyrKiFqn71wAnzO
         1yEw==
X-Forwarded-Encrypted: i=1; AJvYcCWdz45FpIw1wtuUgUrCLnu9BWeHQZJfKOMteqPZTf+H0svUinEbhF6Ip2fYNq0f6Zs8mNUUFjTffJ+G1pipEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybUGiMvu+1ZtzKeJpwxJsNcIKRkZlIUTZrBbZ6fEWUFMsLq3uO
	1VelWHxjdR8Xqvi99V2PkQ6qzo+Yv5MNQgcVgyNHdPvezX+SmCGKPu3yhPMdRbqp8SE=
X-Gm-Gg: AZuq6aJtWbrneETr+UxYNHaZ+t1YEdEQq/LffUaQfrp1hyEy9dJnBhVVHQiOZM7B8y8
	sf52x4KGOvAbPMoZskuOaZz/RtzbvjHfx4CZGFKoAGBlEaDt07bgRC2A0mgNjGcLYBMVuwo2yIR
	VisXj7jFfvA/8e93c+4YfJPhyMXEoBug9uJSWRn/ZuAkJZQitpGE2EJVCCjXuBXPY3/L3SZD8cy
	Lg1LedwB7y3BmfCAYOoiC04hm1JVaZpiOSow7QpbzlDjeR2p7pzTzfkFcIZJ/zp0/ZmMRf1XBEX
	2LIaTnfgCO5Zkxo1o6JqOlTb17VsOe574guMjI6aB7VyTwXk+uXFA3kHJhX0YLgk+a00JDEgvq1
	/mydpkMsxVQepFVbI6ujRXFo4E8cKYp1+ZX0EubepEAGZfBqNfepkw8BxUIlkUboHBJFuJT+mkm
	lIkJNY7P5PUw0=
X-Received: by 2002:a17:90a:c110:b0:354:a05d:9dc2 with SMTP id 98e67ed59e1d1-354a05da864mr1522955a91.9.1770285285886;
        Thu, 05 Feb 2026 01:54:45 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354894533dbsm2000361a91.7.2026.02.05.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:54:45 -0800 (PST)
Date: Thu, 5 Feb 2026 15:24:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Subject: Re: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
Message-ID: <xh3iuwlz4wapmgzojg4v3sen4oezfua4vsedskvrqhc7ryyclj@jggikwra6dmj>
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
 <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>

On 04-02-26, 12:56, Andreas Hindborg wrote:
> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index a760fac287655..06fe2ca776a4f 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -16,8 +16,8 @@
>      ffi::{c_char, c_ulong},
>      prelude::*,
>      str::CString,
> -    sync::aref::{ARef, AlwaysRefCounted},
> -    types::Opaque,
> +    sync::aref::RefCounted,
> +    types::{ARef, AlwaysRefCounted, Opaque},
>  };
>  
>  #[cfg(CONFIG_CPU_FREQ)]
> @@ -1041,7 +1041,7 @@ unsafe impl Send for OPP {}
>  unsafe impl Sync for OPP {}
>  
>  /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
> -unsafe impl AlwaysRefCounted for OPP {
> +unsafe impl RefCounted for OPP {
>      fn inc_ref(&self) {
>          // SAFETY: The existence of a shared reference means that the refcount is nonzero.
>          unsafe { bindings::dev_pm_opp_get(self.0.get()) };
> @@ -1053,6 +1053,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>      }
>  }
>  
> +// SAFETY: We do not implement `Ownable`, thus it is okay to obtain an `ARef<OPP>` from an
> +// `&OPP`.
> +unsafe impl AlwaysRefCounted for OPP {}
> +
>  impl OPP {
>      /// Creates an owned reference to a [`OPP`] from a valid pointer.
>      ///

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
