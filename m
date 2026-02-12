Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56869279DC8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770883982; cv=none; b=XUlwluDOoGmQHj3Q32Rbd3lgV/MBPm2wwaqYE1gdHoL61G0XzED9gv1VjwAMXYIClnXTNb+2eMsV72ztTF5uLgS0XenyKDCHIGOyLx8mHkrzOZzlUAphI2XFMosB5+nM0FjcnS8CpVrZ8F8pCu92ISsWyI+iCs51xdWlrLjwadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770883982; c=relaxed/simple;
	bh=MkM9n5G5FuzwWDYfSic5VW8fnNrPDgI90fLJj7mIByw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHEd+2+tWRTc/mUhWhOD1b9ocUIlXNsvaXcka9RUllKqWNHWyHCgoMfygmZwuFzwiqbNO9DOADU7OwEzAHiWSWTzW7y67Y8sYuHY9R9XC/C9eOIIm9Arr7nHGR98UtysasKZTeYdnI41w0GOMXFopt9HLmJ0/08I0A3OWbzdms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHYuJr+w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHYuJr+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770883979;
	bh=MkM9n5G5FuzwWDYfSic5VW8fnNrPDgI90fLJj7mIByw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bHYuJr+wUjzI51eO+PDeIfnLBsR502/XpmkC5mJCljP5lejNFKK4ajD4imfZ70oWA
	 TbX5O8eU0tls7rMqOqNKw+3Zxs+qIdOsLkG2KD20wAwfp5BM4uHPoVbtYDQneBx5tc
	 ZMNg2QcOfG8C0FvsgWs9E6J7tqmI5nrgPd16FWIQ9Gmsb5rpjysg1TSBKJL4jORm8F
	 FjXPG/bg0it6MBTemdpTnQ3BVTUIk3Awib43oVxrqvAjUMJaj6JGePPOdnTfNJ1MfU
	 i4Bf7eFYtuFN5VfZK9W46HhDvv8XY8crk5JQPFH4WIJAZ5LNdgeduA7xgQsFfNUQxt
	 8yY0WHOF+cy5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1530417E110D;
	Thu, 12 Feb 2026 09:12:59 +0100 (CET)
Date: Thu, 12 Feb 2026 09:12:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Message-ID: <20260212091255.74b65cb0@fedora>
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-3-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 17:37:03 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
> 
> In order to better control when the clocks are dropped, move this cleanup
> logic into a Drop implementation on the Clocks struct itself.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Maybe you should mention that Clocks is no longer considered pinned,
because it's not needed in practice.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index ae4daa12b3e5..9bc6ed56c45e 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
>      _device: ARef<TyrDrmDevice>,
>  }
>  
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  pub(crate) struct TyrDrmDeviceData {
>      pub(crate) pdev: ARef<platform::Device>,
>  
> @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
>      fn drop(self: Pin<&mut Self>) {}
>  }
>  
> -#[pinned_drop]
> -impl PinnedDrop for TyrDrmDeviceData {
> -    fn drop(self: Pin<&mut Self>) {
> -        // TODO: the type-state pattern for Clks will fix this.
> -        let clks = self.clks.lock();
> -        clks.core.disable_unprepare();
> -        clks.stacks.disable_unprepare();
> -        clks.coregroup.disable_unprepare();
> -    }
> -}
> -
>  // We need to retain the name "panthor" to achieve drop-in compatibility with
>  // the C driver in the userspace stack.
>  const INFO: drm::DriverInfo = drm::DriverInfo {
> @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
>      }
>  }
>  
> -#[pin_data]
>  struct Clocks {
>      core: Clk,
>      stacks: OptionalClk,
>      coregroup: OptionalClk,
>  }
>  
> -#[pin_data]
> +impl Drop for Clocks {
> +    fn drop(&mut self) {
> +        self.core.disable_unprepare();
> +        self.stacks.disable_unprepare();
> +        self.coregroup.disable_unprepare();
> +    }
> +}
> +
>  struct Regulators {
>      _mali: Regulator<regulator::Enabled>,
>      _sram: Regulator<regulator::Enabled>,

