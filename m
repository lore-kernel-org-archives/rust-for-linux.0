Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A56D364952
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539626; cv=none; b=Lc57Xv0V4QlgyoHJvOojldSXWgrK402t8979QY6nr6zSGdN/48LxSVvD5cQV2otPfCfH0nnDcwuE7gvCM9gYDuGucOgzeJF57CybKnS+9NMoAd9hWvsHH16IX5vvEU9PLmqYOltEb4hBmWUL0CS5r15ftfZP9aK/++GzSlkNqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539626; c=relaxed/simple;
	bh=CV/9r9T1tGl8H3sNgsRyAGGKdcCvUg4t94aJpNXl2Jw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=guxwxMU3jeUD9iTcSqi6AVOABaiKDpSw4LYZ9vcn/0MFaIQhuIGgOJFfDAawXuu8K4pgLOCC0tmXF219dh7jZw+nOD8Hm/Dpx2kRFgNuBTTFW4LfZo5rLYGq3aNmFd9Utwqo+80TeN5aLmqdLNETtQ6extyNIkq39OnAxqXfxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FN07/tjp; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FN07/tjp"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-440d12a472eso552892f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777539621; x=1778144421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=FN07/tjp0bnDK+DlC6io9J0eZsaH4EPVROqQmUhn225mefa2mjbXnvPa6Vih0l9v7S
         SR3S+zKtZzieL3DTILGRBNqLjXwEUUbM9cdPe/Sq1aXS68Fpc+J3gbCl/jzJB47Q9lcn
         thbL5sfmgFX2NoUigc8mD5vDejosNCMAeLPt/YuVbabN3HQ4kNtwVGICNX8h2RunygQy
         9QRzEBBMlwbztkvmKNa6Jc8ryUzz3Rag2fqtPjWlP9s2YbIqawf8GJdyNlz0QIIRn9C2
         EV/TQmdyVX7unX5Llr5l8by083sxTbiFR7CLeYdYQHDZSM0cEcrfDgbMic3lJz1ridG4
         FSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539621; x=1778144421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=afP4a7+cpm5Kp27h/mdjnZkxCBnk2yzRXMF/qUBjzfsuzozL8ba2s7yrdkVpL1Q/dR
         Er37O+i8MBCThi2pl06XhQq0tp51etDizE3+m9sHL8VVliE4qrvLTTGdsWxaIaMFKFP4
         pxYAm+5tXNW1dYqi3iuoI7We0OYUhB3Sqo/oGOLO25uRLojirH6D7hSEvfEV0ik/u/kA
         t2xPPRj5DJYlkgPK5yDukBAPCbEsFGaDg+WqE116i3r+4EiEV4NIQ9ibloZlqt4QIS0i
         WmbhZu9T4fSVoDebDbGVuf1qC7eGrxsfi1fdTnT4DWJx65zWwmdXv7sg9ykAAbIkCzsD
         mwvA==
X-Forwarded-Encrypted: i=1; AFNElJ9AqAXiA6mOuXCGk5TQoeSBItOkqyyuh37ac4uUiz34+f+0ouekqgclmPqYfH2wCBHSKvNU6NhJ/uiaXlHXXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO75a2vCQricAJkrHPKww1sxS54TayOCNnyG/3Bzu7K0X5H4yx
	R7Ba7KxbwoTnmWnz67gjwyNbRrLfF4RPSr4Afm+rOujnwM/befoW4zQFkFzmdF+bRBbm+eYVCMC
	jYEVvvszqlX2vBEvzRA==
X-Received: from wrwv10.prod.google.com ([2002:a5d:6b0a:0:b0:43d:74ca:3105])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1869:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-4493e1c1512mr3145148f8f.21.1777539620636;
 Thu, 30 Apr 2026 02:00:20 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:00:19 +0000
In-Reply-To: <20260427221002.2143861-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260427221002.2143861-1-dakr@kernel.org> <20260427221002.2143861-3-dakr@kernel.org>
Message-ID: <afMaIz-EUsHbzqAc@google.com>
Subject: Re: [PATCH 2/2] rust: driver core: remove drvdata() and driver_type
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:09:41AM +0200, Danilo Krummrich wrote:
> When drvdata() was introduced in commit 6f61a2637abe ("rust: device:
> introduce Device::drvdata()"), its commit message already noted that a
> direct accessor to the driver's bus device private data is not commonly
> required -- bus callbacks provide access through &self, and other entry
> points (IRQs, workqueues, IOCTLs, etc.) carry their own private data.
> 
> The sole motivation for drvdata() was inter-driver interaction -- an
> auxiliary driver deriving the parent's bus device private data from the
> parent device.
> 
> However, drvdata() exposes the driver's bus device private data beyond
> the driver's own scope. This creates ordering constraints; for instance
> drvdata may not be set yet when the first caller of drvdata() can
> appear. It also forces the driver's bus device private data to outlive
> all registrations that access it, which causes unnecessary
> complications.
> 
> Private data should be private to the entity that issues it, i.e. bus
> device private data belongs to bus callbacks, class device private data
> to class callbacks, IRQ private data to the IRQ handler, etc.
> 
> With registration-private data now available through the auxiliary bus,
> there is no remaining user of drvdata(), thus remove it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
