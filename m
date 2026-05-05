Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFD37FF45
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978449; cv=none; b=B1tTMXbFqh5qYgcL5tdXN1tU70T3OOI1f3/vEG6UVdPDgVWgP5E2LOpqeQUOTOB2vMwvM2ZKQpyHIX5+Nc2dN22Rv8lVfFj41c8So4u/8Lot5nHQHjU0Grlt55co3/fbK/oqMhZx7yRJJI0BFS5yq0dqfeRvV0SVVngZIgvRtJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978449; c=relaxed/simple;
	bh=JLJj9hB8Pr+w8O2nIKYm/jAlzJ0UGVZNm4yS1FI56UQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dkR3rEnWSU4JD/8lVd7h+YAvoClDF/oxpTqcLa73d8amVH/q5YtqlGO8XYb9QFkcsLkgvJF03kQMrWoVwdO+dcktTEdRs1kFaEzPvN1xmhGVKF/S5geFUSj/eGrP2KdoKQ4aGCy+wmS3cOGMwhVwYlKDeHwR+TpDXCaQ9X1HE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UdA4x6Bc; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UdA4x6Bc"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-44a122a5128so3062652f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777978447; x=1778583247; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h801/7LXCD9kwNe9ms/6qfnOisrQsjId3Qwf+1jqbR4=;
        b=UdA4x6BcopkxjvPGIpM0zUgsoz4BsFH97/08BOkWLWLkU+4+V9ExMfOdVtehdfrRwf
         AbUTwh3czkOqgFypVuXK6GHDebJfO0ij5C6PUo+kBSidKEaL+C0ZA7piAcU5QkkFvvoq
         b14IaSrF5o0GKGsUZYVWqIpTEWFUoVxQQf+VSuGm2NrmmSmT5w3kiC7c9HZz9hBOHo/q
         GeBf061kuCJ2Jv9YMoULkdhWA0nK6mkMteMhPlSx6ENt87DD2jQoj0nnD77cXlyjJHjH
         KCiFkNYDNxvpvYvr695IG0w2mX+nGS8UOK0Xb8bXQrEL8MljjI7KKFlBkLGFqDi7SoOy
         1Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978447; x=1778583247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h801/7LXCD9kwNe9ms/6qfnOisrQsjId3Qwf+1jqbR4=;
        b=S7bw6Q/XyA/9jBkHzB/Jj4GY1g3vcWMM19CuRmMYe0V/ZyxWp6MVMHfdmYciV7RkxD
         Mcd/BUk8kYueiRRrEcYAAQOz5tNAy+Tj1rZwll76XEcPW+HXUgnQgUyat9uX+E0pGaHp
         gX9GG3W3C9RT1zjEFRKSjWlkmx2xMFgpSm7HgbBQy+2+pH6666ga1yHa/CoUGhuk5tdj
         TPuhPHWTCcwlmJUQ9frSY2o966gRv+Fdz4/ydOL//RqDtS7IkoxjIf85wk/2WKRdSr9J
         9uzjciSmmhwVkUyug/rOhHSS5Yk07JHiOCdwdgRy1By1qGU1PLon+wrk5Rw3px8E9tKN
         DaEA==
X-Forwarded-Encrypted: i=1; AFNElJ+KF9QUw6IRA5Dm71bvR9EAn+lsDT7QjtHH2LxVrWT1ffeZYO70tPt5suqh6FZ1sAgrF8xVXLWkrL5PcCcirg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQw3TwkdJ3tQcO9KOgnc1+dZ8AdxFwcl6Fsxz/YsC0aX7QGP6
	Kv+h0hJZj0wUtQgTUX6KsKU9exzaPRHehsGluQ018tigd+tRSkAVhUaB7h+ILt+VV2EAir4Hhdr
	dpyDrD2sqB2f2Q+Ra6w==
X-Received: from wrbdx9.prod.google.com ([2002:a05:6000:e09:b0:44d:9f32:eb86])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f55:0:b0:44a:1d55:1e20 with SMTP id ffacd0b85a97d-44bb2d37c7cmr23705090f8f.5.1777978446484;
 Tue, 05 May 2026 03:54:06 -0700 (PDT)
Date: Tue, 5 May 2026 10:54:05 +0000
In-Reply-To: <20260505092304.108262-2-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260505092304.108262-1-laura.nao@collabora.com> <20260505092304.108262-2-laura.nao@collabora.com>
Message-ID: <afnMTfVfGq_iLXov@google.com>
Subject: Re: [PATCH v2 1/1] rust: drm: add RENDER_CAPABILITY flag for render
 node support
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, May 05, 2026 at 11:23:04AM +0200, Laura Nao wrote:
> Add RENDER_CAPABILITY bool constant to the Driver trait to control
> render node support. When enabled, the driver exposes /dev/dri/renderDXX
> render nodes to userspace. The flag defaults to false, drivers can opt
> in by setting it to true in their Driver implementation.
> 
> This is then enabled in the Tyr driver, while it's left disabled for
> Nova for the time being.
> 
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Overall looks good to me!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  drivers/gpu/drm/tyr/driver.rs |  1 +
>  rust/kernel/drm/device.rs     | 12 +++++++++++-
>  rust/kernel/drm/driver.rs     |  5 +++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index e20a5978eed6..b7ae37ce3a1b 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
>      type Object = drm::gem::shmem::Object<BoData>;
>  
>      const INFO: drm::DriverInfo = INFO;
> +    const RENDER_CAPABILITY: bool = true;
>  
>      kernel::declare_drm_ioctls! {
>          (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index adbafe8db54d..e121303d88f0 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -80,6 +80,16 @@ pub struct Device<T: drm::Driver> {
>  }
>  
>  impl<T: drm::Driver> Device<T> {
> +    const fn compute_features() -> u32 {
> +        let mut features = drm::driver::FEAT_GEM;
> +
> +        if T::RENDER_CAPABILITY {
> +            features |= drm::driver::FEAT_RENDER;
> +        }
> +
> +        features
> +    }
> +
>      const VTABLE: bindings::drm_driver = drm_legacy_fields! {
>          load: None,
>          open: Some(drm::File::<T::File>::open_callback),
> @@ -105,7 +115,7 @@ impl<T: drm::Driver> Device<T> {
>          name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
>          desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
>  
> -        driver_features: drm::driver::FEAT_GEM,
> +        driver_features: Self::compute_features(),
>          ioctls: T::IOCTLS.as_ptr(),
>          num_ioctls: T::IOCTLS.len() as i32,
>          fops: &Self::GEM_FOPS,
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index 5233bdebc9fc..92cbc26ce11f 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -16,6 +16,8 @@
>  
>  /// Driver use the GEM memory manager. This should be set for all modern drivers.
>  pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
> +pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
>  
>  /// Information data for a DRM Driver.
>  pub struct DriverInfo {
> @@ -115,6 +117,9 @@ pub trait Driver {
>  
>      /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
>      const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> +
> +    /// Sets the `DRIVER_RENDER` feature for this driver.
> +    const RENDER_CAPABILITY: bool = false;

I think it would be nice for this documentation to elaborate more on
what this feature actually does. After all, it clearly took us a while
to understand it, so probably others are confused too.

Something along these lines:

/// Sets the `DRIVER_RENDER` feature for this driver.
/// 
/// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
/// userspace. The render node is an alternate low-priviledge way to access
/// the driver, which is enforced on a per-ioctl level. Userspace processes
/// that open the render node can only invoke ioctls explicitly listed as
/// usable from the render node, whereas userspace processes using the
/// master node can invoke any ioctl.
const RENDER_CAPABILITY: bool = false;

Also, I'd probably call this const `FEAT_RENDER` for consistency / to
make it show up in grep.

Alice

