Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78438BF9E
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071330; cv=none; b=OR1A+AegfTnkR0IkeMQg8xIMTHsM/c2/JAf9tSUwATC7CAJtzwdHoTV5xKmmzjtQItVR48nxkQvwnYu2Js8fupWEbQohV2jDvTGJlpTW+WTD5Se3Sf6hnj/KPqYcTSeJkpeE4oVsmTP3xd6+35PIUPtoEj/ghrAhyKTL/1eaTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071330; c=relaxed/simple;
	bh=nGlUpDoVBVDvAGF7vX9CfzjAkkGmzAP/VKRI5OPk77k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XER11p6Bcn8kW1qmDdAZFVCswdrKYm/dNYbcUSFMLZuY/n6ajpIzGJ0jbQ4mJYWo+GYCt3QRndqcXF0LX7LEKkYf09Ttp5G9ZKsbh1+neyrHkMmKjo4YmbM5diBESuXK7oSy/giAdKWdjf3AQXsCWhmZNK0V6kcartDVPI1vbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NgTPb/zE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NgTPb/zE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so5226175e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769071324; x=1769676124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUi/3E4y07lYAhJzymrjYIl8d6EumDS+Xmgbs2h2dPs=;
        b=NgTPb/zECYJYuQPEi2v14v6WwgsDGgJ30yfuzk20GWpLfN8G/cyjXozNTGw1xjpGoC
         nJWV7WbH+hdzmy2dtgFLyW8gVbzkraNGgb+y8sMl4vExdmzS2je3bFQYG2pq7m4t4/ah
         +alipYYDxyIKhDQboUTyhmvWIIo3m35+otiorZYxmmZmQYIqXqUSHUaPhU/YRHhtd1+U
         pNuJ4jL9F9xCiw39z5ZcfUsbIpQ9ZHs9qy47DDzcU47aRMWLtyiYomLZ6XxHEMFtr6d8
         r7pzwnrVm1cl/UM5PeBUESe8yPUNXyCrvzzAPHsPm4pfUnsoEUi1JoXQDziLNAs7/yDd
         5DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071324; x=1769676124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUi/3E4y07lYAhJzymrjYIl8d6EumDS+Xmgbs2h2dPs=;
        b=mDz79PKTDNJsY3XJJGcBv9EdfqrrM7Nz6EpKvF1CsgX4T5CIXugn22dg/JXaT6vDGs
         7mn+4T9BmCMYBRWXa9I/Iv5+/l3+OVl45bGHz1iMZHkTm85VZ2XYDoUMAhhXPeQngohc
         nosOk8qNnf4BL5gijYgdSXrRYdPmWn7JelaRPeT+5naMMONtlqQysnYG8Ui1I5+CMvso
         GsREuCDqQzmWCEYYNOCVAuW76P945fQYRRWceAt2gK9Ab1OE/zkg1pfXy71hqoTCou/+
         56Vi8C3Rv9sy+PPemF/PqqznVE1rkmSlk9O3KmMuzq82USI/9bRuBj2ZJTUvgfzcD4ZR
         ocTg==
X-Forwarded-Encrypted: i=1; AJvYcCV5iGqBsijolZKllBahX1tzm1lcwe4zF8X4cIf1WbMVd8NBSny6ZYLUUMmeBoeSXG1OsMhpkiqY6mUyXvb+CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNv8Jn37QO+kfmLUxBN/wCm/HPm7dS5nqZAok1hAcl9x4N5KI
	4D4EUWk2RjlOp1zmAvwdz8jOUfTLEEncRaQkeH7IC4P7HaTCyTy7GiK54lNtXjolmO7cj+HmaZu
	bUswBWXwv6h9QtoW6VA==
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcb:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4803e78fdb4mr130750555e9.6.1769071323772;
 Thu, 22 Jan 2026 00:42:03 -0800 (PST)
Date: Thu, 22 Jan 2026 08:42:02 +0000
In-Reply-To: <20260122003746.405370-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
Message-ID: <aXHi2jJNptrgUqyj@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> Currently these warnings, as errors, are preventing Tyr driver
> from building:
> 
> error: field `device` is never read
>   --> drivers/gpu/drm/tyr/driver.rs:37:5
>    |
> 36 | pub(crate) struct TyrDriver {
>    |                   --------- field in this struct
> 37 |     device: ARef<TyrDevice>,
>    |     ^^^^^^
>    |
>    = note: `-D dead-code` implied by `-D warnings`
>    = help: to override `-D warnings` add `#[allow(dead_code)]`
> 
> error: fields `mali` and `sram` are never read
>    --> drivers/gpu/drm/tyr/driver.rs:196:5
>     |
> 195 | struct Regulators {
>     |        ---------- fields in this struct
> 196 |     mali: Regulator<regulator::Enabled>,
>     |     ^^^^
> 197 |     sram: Regulator<regulator::Enabled>,
>     |     ^^^^
> 
> error: aborting due to 2 previous errors
> 
> Suppress these errors so that the Tyr driver will build.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I still don't understand why I couldn't reproduce it myself, but
assuming it's not just an 1.80.0 issue, below is my review:

>  drivers/gpu/drm/tyr/driver.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 2a45d0288825..04c865cb4397 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -34,6 +34,7 @@
>  
>  #[pin_data(PinnedDrop)]
>  pub(crate) struct TyrDriver {
> +    #[allow(dead_code)]
>      device: ARef<TyrDevice>,

Let's use #[expect(dead_code)] so we remember to remove this when a user
is added.

>  }
>  
> @@ -193,6 +194,8 @@ struct Clocks {
>  
>  #[pin_data]
>  struct Regulators {
> +    #[allow(dead_code)]
>      mali: Regulator<regulator::Enabled>,
> +    #[allow(dead_code)]
>      sram: Regulator<regulator::Enabled>,

I don't think we intend to ever use these fields - they exist only for
their destructor. In that case, please prefix them with an underscore
instead:

#[pin_data]
struct Regulators {
    _mali: Regulator<regulator::Enabled>,
    _sram: Regulator<regulator::Enabled>,
}

Alice
