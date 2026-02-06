Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028A2475CE
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 01:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770342539; cv=pass; b=C4B7nAMKCXF7wbsZcb6ruhUFVaxMVlsQRQ5yX36xr8r0uaLMTB/iBimaimLplpJMmbrpmUtrE3AY5fJ1hBTwUKTGIYhfyPq1ArNFS4crXOXBmfWtEcEMfAoNEtYT/azmpxH4BfbBj4wCJtgkGz/eto55WKyi08VelFx0OoIFPqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770342539; c=relaxed/simple;
	bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkIvvNHFyC8kFAQTvf7ULw1LuoUdL/W3NW2E/BxcBMjiCLhDLy5T3h0vGrWuKBIw60bviwOUyBfGOMFTu+GmtE+yMmBElGvEemT6c9yRqebj19jzNo4Pxt07JvbdvFxOIs1UajEn4CXqO9D3YXoNKGBiJJlMxpI8x9kkXPyTocQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSO+dHb8; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSO+dHb8"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c710439535so103131085a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 17:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
        d=google.com; s=arc-20240605;
        b=JfuPjlHmcjgJvnB6o7XGx4F+EMJtBZxSAJCYLVQcd11GP/damrmf5VjvRtzJOVx3FM
         vO1ame0xYVFZEOKUKVuUhXDnAayo1Aclw/oLKXILhgrnUuq7f0ckyT9D3QvyTUihiSIp
         bB1QP1MvvY72YjacE5l5k9+xJDYL9H4mL9CuzPai52a2EzJIKQE1cz8eEGcMcL6CxKrQ
         uDOuWt4BFxe26HeaPG7upd0/57uEmxFnnbPGRxkq/tWwGvc0jIVagjlelatlPnkhnanl
         Q3Pr3I7gOshd+kocYMsPpIj0EuUShPsEMNhapYQCsTp7Kvq6UcHrPQCZ8+t6boifamF+
         ShZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        fh=Rj/SATUtfKBYBs9/1gu0OfKmEtQ3jsED4B9A3Rq/+aQ=;
        b=exxSGkRIvFQUnLL3pfSrqvtJiBYxPgbQjEq+crgK+92BVuyfppEG9q1v9Oq4k3vXAr
         2QfH9VbgUcXZyd/v7W9OXFgo9iM16q/s3MjBVzc3KKKQj/VuysNxRNowavzvqIGB2dPX
         wxyrIzAMgw5b9LIE9b4aNHIgUW8EzUNuvnUW8V+GWX2pPuTzZMa3UL+pgKRPgw8MGYa4
         ypTPu1yUMBs44on1GJBWFitd1ZCPjKjxjI6c+c3gcGxSxdyQ/RInKQyjtVWni592GULE
         8JW5PRiLkcv9K20+xFP06zgJxu4pqAFmLpt3g5ldlEnY8wNXX4sPni/PuWdLhSDm3iQt
         +RlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770342538; x=1770947338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=RSO+dHb8hCYS8eQGF6mFZ5GtOIutzXtL22MzW5vs+SkWw7e72WLP2HFwGWY5ftbyHo
         fHvxfrkmd9G+vmmgohs10bl9oxvYPwOmBlFJlBDSSWJGac24T/sfBEqlStR71XVuDgpD
         4S27igf8upM7T1TXzzQM39mlwg2FWLO7yfXDjQoJbaqnaGGSesYbvET32p5Dr/bhhFxx
         Z/FZhNn86RiWtq8HzwMySL/CSnhkI38m/01DoOpOT8ShMAxlYKk6rxYIDZKx95q0Qixw
         gdsW8qIvDZQkMga2c3+H5gqxwrieC1rS7lWWHd71hjTuzHmhaF7jbzxTJTRAu5FLN37K
         1ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770342538; x=1770947338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=U+vUC2jKtkLAXzHvvToHKdejG9TPH4LtjMTMvjqJ8NWJI9r6x/7VJxRacEwXRJ0UuE
         BSnZrZ1fXjoPS5Q22Hc039UMUBEI/6ivYeb/xd/2tc7gayd8qeh5i6kGj9OZ0IZ8l0US
         vdgEmdX48NB90iMDF3tjN0PK+8e4doISDN0PiefeXrz7E94XwhPLosyeVMI2FpBroX49
         bATUDHgSsBu8sQeLZALnjEPhsrkElSHmPDOuObudKgv6/1l1cjwW7cmhI4ENwNvO8UWc
         YLBAtnrfI8HeBmxb8lZfRy6cuUkH64DHOt4vqruNvQtDuF3vkkWS14mqXDlcXG60WFRJ
         A9xw==
X-Forwarded-Encrypted: i=1; AJvYcCXxH8QlQm7jzr8XJl42l0Iz8Zwz4hV21U4G8ohqyvYr9naJH5mxyWoaHdQ58AQoFSjfuDfktZK5eg+4/n/5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxGsNqygj/bOI3zuWq2uAcjoc/9eFznBkEEOv29p9yhUYl+Kv
	rl+G4dqCE337u5zQaw2LUr4oCHMSLl/eS2x5DrhaUHvMqkKlVT9uYj1QzBl5ItPNNRDXnp1Ixmf
	lY50tuAtLJ2qJlQLUW9X5R24efOwxv/s=
X-Gm-Gg: AZuq6aJHuW++s1DFJoBChTMYpjLcEZxWUBAKFevBE7hx7K2EMV/aGBPbFGCWvwG8qbG
	m5iykmcavwknk4mlNgKI51iOM8L7JS5dpJlRsvCyCYt+2o1bka0fFLj0L0fCwSEuhKRuR9UAl1M
	y7PwMt3yr0H4N6EyhGlOlPzBecV73dS7PDCtTPJ9jcHLtEqzFJytUtyNgEcuqtvpBkJQ+MBjizc
	4XHXArj8Xga5aQuVHmvfDvYbPThLCJvb1+mB7QYF1DYltmECZpRUwzCQneX2XOtjNqrwYGZ0TJn
	Z2ujX9O8uU/6RgpSznPSreLnFyXEVNVzlEYNv/S1AzdTtsZOv+GlbJU=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com> <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
