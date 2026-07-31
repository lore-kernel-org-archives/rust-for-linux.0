Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF31E22E9
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502891; cv=none; b=YLIJqvvUahb5PkgTdfeg8e78wiNIjCntXUk0S+Bfhv9RM0VAqM28acXalaoRpUurQRdMRc6dsFxq9vEOSGpsDFQTx9wjbv+sT0OX9iuBiyu+9X3jvDQhH6puUUEcleqNwQ/Egfgf/uOXF4MyN7jDFY3/oC+wrSKo55dG0FsqptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502891; c=relaxed/simple;
	bh=qY/0yET04svAepBp8nEt3pTLBv4nkoF4nroslqjIxCs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ALL/MecNjoc4OkLYTa7DmQUfjikY/sIjY/oZctxc7Wk4GDZ2x/YJRv8PF9EzHm6tnsWH+XlSJmeTvxj+NZkFfJSwzFTylc39aF22icvAHmbyel899GZKwudVPx4Hku4xWqPEJGn9vQGRGnYZrwai+noxEspejgdxI6S/0+DvR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZvw0poQ; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZvw0poQ"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-69afb1d30f5so991167a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502888; x=1786107688; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBHJGJamcmVHqk45wC3+3WaZ921glxpmyO6R7cNL6rM=;
        b=WZvw0poQ5ZVX30/dQ6z4IJu9w/pDj2U4zuHqkc7tYXMzPecCwWfOQLHMVbQLST99+d
         m5htqcM0ku9C95inZ1DGm2wi83bHBs0nb3/Iu8zKV8j7Xyn5L3MYDmvx7Kc4ELgiQlNJ
         2ioMiBU61sCzf+dYX7nSObzwe/0lmjsRvDZQ4ykOY0oPV43CtzIHUpKAqI8w1a+UjEXz
         FZqREEHn1hP17WJaGfhY2mACrcKdyPryhaImJlH/NYXxRCdl+ZEcuUBibYyiEDQvpB5e
         25HdXm1bL+hQW45AMQrtRy3nCjaxJDk5Q0DrEl9z4jlWNWxaYWAX+/iFtEi1SUsnUTHn
         KLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502888; x=1786107688;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBHJGJamcmVHqk45wC3+3WaZ921glxpmyO6R7cNL6rM=;
        b=Adr/fSZaJxtlZOpI8mdV1UpK65qabHjA9JRbuy2Nmx3momI8GgTYAew5Il3RVGtepf
         IVXqiQ21ltKX0r2DiFqn/PSzWuRIoc2gs5UIKkyz7/b2vlLveAK9bD4eUX81JjAng9x5
         igk8+kVzLH/vARFzXQA123Fm96EHHR1bN2QidupbsH1RievEDPqhrRPaBvjfgzEvpcJ/
         s977UsbbO+Fl+Dza5HsTRRHyjx5IVpySvljY+8tU4i/LMtWqhHX+J1llzqnSbHhyVvfG
         4PDgUxZUkz4Ja0DKJKGX1T+RJp5vrRNe0R5we44WRTIwZd4utKZxvwP9VBSMZ8K+JKmW
         KtPw==
X-Forwarded-Encrypted: i=1; AHgh+RqKxNLarNir/1GRCCB7fPwY6OuEkXEq2Bs+/ChJ3BQ3A6513kGiwv/eL0+mEWwQd/8Wq3REqxd3+enIC8N39w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6zOz8bQjWc3AWmwwxSowz0UXwhBo78iJbSzbYf0iG3ur0RV8
	rOJYEmc9SaJbtnUh1DaM+k6O4eWbeX1T6lOTZ89V0FEkmb690W0GXbNTGIxAyvLQqbtawCrfUod
	NtR9mPjQO8GRoxpGnqg==
X-Received: from wmbeb18.prod.google.com ([2002:a05:600c:6792:b0:495:5dfe:fc5f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d3ce:0:b0:6a0:7a26:fc88 with SMTP id 4fb4d7f45d1cf-6a09b14436amr755660a12.17.1785502887568;
 Fri, 31 Jul 2026 06:01:27 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:01:26 +0000
In-Reply-To: <20260731-tyr-debugfs-v2-v2-7-aea19eccb996@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev> <20260731-tyr-debugfs-v2-v2-7-aea19eccb996@linux.dev>
Message-ID: <amycptp9uZOUjMJ7@google.com>
Subject: Re: [PATCH v2 7/9] rust: drm: gpuvm: add dump_gpuva_info to UniqueRefGpuVm
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	"=?utf-8?B?TWHDrXJh?= Canal" <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, 
	Wambui Karuga <wambui.karugax@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 01:05:45AM +0800, Alvin Sun wrote:
> Add method wrapping drm_debugfs_gpuva_info to dump GPU VA space
> mappings into a seq_file. Needed by the Tyr gpuvas debugfs file.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  rust/kernel/drm/gpuvm/mod.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
> index 20a08b3defeb8..9da88501a4206 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -312,6 +312,14 @@ pub fn data_ref(&self) -> &T {
>          unsafe { &*self.0.data.get() }
>      }
>  
> +    /// Dumps GPU VA space info into a seq_file.
> +    ///
> +    /// Wraps the C `drm_debugfs_gpuva_info` function.
> +    pub fn dump_gpuva_info(&self, m: &crate::seq_file::SeqFile) -> Result {
> +        // SAFETY: `m.as_raw()` and `self.as_raw()` are valid by the type invariants.
> +        to_result(unsafe { bindings::drm_debugfs_gpuva_info(m.as_raw(), self.as_raw()) })
> +    }

This can be marked inline. Otherwise:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
