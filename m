Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F93603D3
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502790; cv=none; b=MCeTd41cEl5GZyQFmz72fUtmm1ubx7vs8z7uO7DiVoU+g5BfWutPEiPG7D1vEGBF4inXyi/a6sfwDtAFa8WH/nURpkkYLZcuz0ibpN1sJuFCwUNHxWA4rkTabSBG3TrGlMoVMw8ozi0+PeNtEIPzS0IVMjOw/f06lUDmB0VC4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502790; c=relaxed/simple;
	bh=TV4S6QcoDp9i3XvYMLYR7XmivYO8ZF+r2apXG+G/N38=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gn4JjPwzupCqnStls21CkbjJ+/T9VTFQydFrYzCBhw8dG6hJF1M7mZqWTqeBUc9KBbIEcS9dAEIENe5B2rZ/9WCc9tmFw5FCdKU+doPttOKNNKSTahafAy9RF9zkMpE1lsBiYr8FkVME5wuTTjfRT/DN16r4e5Nqo45Qu5p7PJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ndfpA7Y0; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ndfpA7Y0"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f83999cceso1120856f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502786; x=1786107586; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9eJPXgMx/k8Zzskbe/ENfQg92M9fVEFYQJ0hF5Ni8Q=;
        b=ndfpA7Y0GsNFLanOC+eIuifaU5QV6v0LAtAYIw1n/8oU6TX6zasR7u1B3z1r8co46h
         GkZIo3yZSmVu/axU9AXVePaGqs5cybI9hws8FMmNGImBFezrZ5rPZ1AnBdPu360mAxFy
         aRkVBvm9dBNd3BzaQilbELxrcX+U0h1H8dCpBHqjdeh0p7iEZOGgMAEGsZeL5NrdsWhD
         2Y87vnojOnehGdD+b4pD3MaTgb6vQxVf6SxsFH8+8ZAZUiloebrPA9y57McepYyDH3+F
         cJNX3KWruJ6YQEutCWTuiqcxpJVqROyuCsQ0BrajJH3fJW5HaCzevReU8v21Y9OP6JCU
         8p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502786; x=1786107586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9eJPXgMx/k8Zzskbe/ENfQg92M9fVEFYQJ0hF5Ni8Q=;
        b=s90QOZXiM4V/wSDKsjT9rngwn0D7s/LsJHqrxkl9F6q/r1vHiNWOiuDY3EzLqzhGSa
         j5It/JcGCSKIQJvua3gtSjkzRk2FI6Cp6WLTwlqqfTcCY0EqLhABCVQ9uyG0YAmE9YBv
         MNNkyTmrpcvOUGQ3G7DYHYHG0D+LKUSDQ+h00q2leAZl8Q/FpJWhDUtV0BEildsbGyFT
         hE/YPuuGRPntqOnHxZun6ksk2p5EF4JgB0LevAByuqsfAxwStBVZfoePqKmUx9Ht9adQ
         gvV+tCsaCfKHNlkuCUycB7kZHeToKhJCg4QXDd0o+zMc1kwbIB8IiWc6Sdqa8yIYqAu0
         IZBg==
X-Forwarded-Encrypted: i=1; AHgh+RpwzgzYa8upj6Pouf363I6p11lRaWN8Cv8iPP0GSmA2DTianS2ugmGZmXiTkMClfIwbcHqA1XjbHnpYbBSuYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38IB0YmbGhPVn2bk7V3e5L509Q0diQhCHoYgMuSHgLbs+VyiS
	aApcafx5rYhvkqaSqJeLdNKpP3+aJIGdNcz4RwEFoqJ1QfwYpe0Y46cJITtDqERQ+XkgEHSU+Qd
	oovZzIWhPixaGWRFgZA==
X-Received: from wmbdr14.prod.google.com ([2002:a05:600c:608e:b0:493:af1f:8829])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40cd:b0:47f:6d9a:d7a6 with SMTP id ffacd0b85a97d-47fd2aed4ebmr4411247f8f.25.1785502783123;
 Fri, 31 Jul 2026 05:59:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:59:42 +0000
In-Reply-To: <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev> <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
Message-ID: <amycPnwWUS1qwGs9@google.com>
Subject: Re: [PATCH v2 8/9] drm/tyr: add gpuvas debugfs file
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

On Fri, Jul 31, 2026 at 01:05:46AM +0800, Alvin Sun wrote:
> Add a gpuvas debugfs file listing all GPU VAs for the Tyr DRM driver.
> Collects VMs into a shared list during firmware init and renders them
> via dump_gpuva_info on read.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/tyr/debugfs.rs | 65 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tyr/driver.rs  | 16 +++++++++++
>  drivers/gpu/drm/tyr/fw.rs      |  8 ++++++
>  drivers/gpu/drm/tyr/tyr.rs     |  1 +
>  drivers/gpu/drm/tyr/vm.rs      |  5 ++++
>  5 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tyr/debugfs.rs b/drivers/gpu/drm/tyr/debugfs.rs
> new file mode 100644
> index 0000000000000..d381b1901bd08
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/debugfs.rs
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! Debugfs support for the Tyr DRM driver.
> +
> +use kernel::{
> +    alloc::KVec,
> +    drm,
> +    new_mutex,
> +    prelude::*,
> +    seq_file,
> +    sync::{
> +        Arc,
> +        Mutex, //
> +    }, //
> +};
> +
> +use crate::{
> +    driver::TyrDrmDriver,
> +    vm::Vm, //
> +};
> +
> +/// Registry of VMs for debugfs access.
> +#[pin_data]
> +pub(crate) struct VmRegistry<'drm> {
> +    #[pin]
> +    vms: Mutex<KVec<Arc<Vm<'drm>>>>,
> +}
> +
> +impl<'drm> VmRegistry<'drm> {
> +    pub(crate) fn new() -> impl PinInit<Self> {
> +        pin_init!(Self { vms <- new_mutex!(KVec::new()) })
> +    }
> +
> +    pub(crate) fn register(&self, vm: Arc<Vm<'drm>>) -> Result {
> +        Ok(self.vms.lock().push(vm, GFP_KERNEL)?)
> +    }
> +
> +    fn for_each(&self, mut f: impl FnMut(&Vm<'drm>) -> Result) -> Result {
> +        for vm in self.vms.lock().iter() {
> +            f(vm)?;
> +        }
> +        Ok(())
> +    }
> +}

This code maintains a separate list of all of the vms for access from
debugfs, but I would have expected that this is not necessary. If we
already store the vms inside the driver's private data, then can't we
just access them from the normal storage location?

By having multiple copies of the same information, you risk that they
get out of sync. In this case, you never remove vms from the list even
if the vm stops being used, which seems wrong.

Alice
