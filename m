Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5D1D90DF
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237918; cv=pass; b=rIlNZ6+3/HakyCgmd4bl/vB+7dZWN1a5IMXHAWnUM+oxUpKjZsAjz903gRY+obHTsNBSw/iX4/JsKVhMlAIgA02hLSHCRLcDkp2vU7HqzpdG2AhQjgFIaswRpaWqPOKlYh4OXiVpBYLDIXEU6gVD+bCOtRYSvqxAibE97j8K+3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237918; c=relaxed/simple;
	bh=mYMjCijn2VNsBpyXhFtQ67j1K2xeuQUZ3hiSVMgIw0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMY875PX1M3vlmIp7N2WqMyjfhPGe6TD4fjy2zumO/ePm9rgdczpPLy+yChEhYDE1OmtYIJV2OQN4L6hSa2q0DhMOFc5nzx+K67JO346E1tS8n2ndG3be9upumjfLFK5GAszEN0bMk9FRgwqWMBOzz4Inp7M6KLFSQBL12zAIzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=dDiNbL4j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dDiNbL4j"
ARC-Seal: i=1; a=rsa-sha256; t=1772237910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NqKY9nwwIRO9Das6zw6/VLDkpSVzsS+qkXLEtGrxWNUPsrzEX7SxqQOF8HwDtLSAYq2gtmscNCe0YOw00eMMHUBpeaU2C/ontuXJS8p7iZqORbFmhzPVdU7VnOfMPmUlfLpBDyzY4KxHBGn0FC7igE56QeSNdJpDXoa0s4KpFqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772237910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Klm6q63orIAA7W8i0kJmSBPifIFUgHAEkJyTVjy1+kg=; 
	b=D6wRGBTGJdf4otEGXCWQ2Cm++SX3Lzy9C+CPIXpDqPYuWosTDqZSW9ctJMrdnrwEFjJipYB1tLQvGB+Cb2qDldPXMoAYovT9rH9+WA6TsrbzdKgNVHR2iTpzuig6eDrC+Swx/D/IvQK1FkYsGQF5zfIyKq4dgTgd/ckrG+zB1VE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237910;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Klm6q63orIAA7W8i0kJmSBPifIFUgHAEkJyTVjy1+kg=;
	b=dDiNbL4joLNuvPOBmZhVT6iKrb273U/P2rhPhgAyqZ9X2HTnDsQpfp4j5RD7XwxB
	bsyCh9vT2GJka8Zc+ZVzO+2eI5zVg3tX5MzyzBJW/Ajh5731leFgdFpHOyiFFto/tzB
	m2R+RwlPuLlAKt3V0PiOBiZqkwj6UvdetPs2JvZI=
Received: by mx.zohomail.com with SMTPS id 177223790747952.936575191812835;
	Fri, 27 Feb 2026 16:18:27 -0800 (PST)
Date: Fri, 27 Feb 2026 16:18:27 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Message-ID: <aaI0U13AhtG0qdFK@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
 <20260212091255.74b65cb0@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212091255.74b65cb0@fedora>

On Thu, Feb 12, 2026 at 09:12:55AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:03 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> > causes them to be shut down before any other fields in TyrDrmDeviceData
> > are dropped. This prevents us from using the clocks when dropping the
> > other fields in TyrDrmDeviceData.
> > 
> > In order to better control when the clocks are dropped, move this cleanup
> > logic into a Drop implementation on the Clocks struct itself.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Maybe you should mention that Clocks is no longer considered pinned,
> because it's not needed in practice.

Ack will do.

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> > ---
> >  drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index ae4daa12b3e5..9bc6ed56c45e 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
> >      _device: ARef<TyrDrmDevice>,
> >  }
> >  
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  pub(crate) struct TyrDrmDeviceData {
> >      pub(crate) pdev: ARef<platform::Device>,
> >  
> > @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
> >      fn drop(self: Pin<&mut Self>) {}
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for TyrDrmDeviceData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        // TODO: the type-state pattern for Clks will fix this.
> > -        let clks = self.clks.lock();
> > -        clks.core.disable_unprepare();
> > -        clks.stacks.disable_unprepare();
> > -        clks.coregroup.disable_unprepare();
> > -    }
> > -}
> > -
> >  // We need to retain the name "panthor" to achieve drop-in compatibility with
> >  // the C driver in the userspace stack.
> >  const INFO: drm::DriverInfo = drm::DriverInfo {
> > @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
> >      }
> >  }
> >  
> > -#[pin_data]
> >  struct Clocks {
> >      core: Clk,
> >      stacks: OptionalClk,
> >      coregroup: OptionalClk,
> >  }
> >  
> > -#[pin_data]
> > +impl Drop for Clocks {
> > +    fn drop(&mut self) {
> > +        self.core.disable_unprepare();
> > +        self.stacks.disable_unprepare();
> > +        self.coregroup.disable_unprepare();
> > +    }
> > +}
> > +
> >  struct Regulators {
> >      _mali: Regulator<regulator::Enabled>,
> >      _sram: Regulator<regulator::Enabled>,
> 
