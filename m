Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B63803DB
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301809; cv=none; b=MRQcMU93DnbdJshaN/DkzYa0GvQmkTFH6oN6cTUlMEIlHn9kDwuvcBNs36Y3mO0rf7FpVi2Nw/eKNWNK7R9ybNFTxXP1DHcc+fKk3YHEDN1U/hvZFA+ic2JOVc0LuxZplXmmBBtZrcjWjNkkRyxs2wzLhhdVlQimoAEGsZtkEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301809; c=relaxed/simple;
	bh=ldjpHu6Q3k3mdTafwgW1MI30AH9hEGKA/kXMzI8CAF0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KNBg+r7q1C7udkRexfCsUjbamdMwYKC33+5ckUXZOuuPZ4X09H/K515GMv9nzu1qYlCiu4oQKUCDG25CBic7dEV+eeD4sy4LgM38Kq1dUncpVXk59lOL76GH+DAgVMMMMvA3WWohO++xyg5w6klNZdCgZ+SnneLsI0JR0oeEmhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aCiET7WH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aCiET7WH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488f973ddfeso76393815e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777301807; x=1777906607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldjpHu6Q3k3mdTafwgW1MI30AH9hEGKA/kXMzI8CAF0=;
        b=aCiET7WHbumGpASlujSiCV0p2Gr6tK/7R/r5uSiW1JzdeUR6opH6DVtM8w2lR/qszX
         SRDVg3GO2O/S9rHdFVWGn7YSdw2VmRENYIzHf8aJZGZJRNJgKUMyHbyDbkrYPGzrxZ+m
         Y6D+2o7Y+BnXKitMTTjh5fU6f3+u4zcucsw9DolbmTCn6f5wjTdkPy6MKXL7HIEvcDYr
         1WV6tWEntl4wkdye7J8UkLkdFSU9DAN//G1thMuZdpcKeOeqCO4Avs/puWmRsEr4ChWc
         TbeuPrX0rJq5ie/3EsOzQPfuZ62n61uMaHzfDXo5DQB5bC5/FNytRJf+k2XSc2TBY8N2
         g9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301807; x=1777906607;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ldjpHu6Q3k3mdTafwgW1MI30AH9hEGKA/kXMzI8CAF0=;
        b=R9FYuHN7ynSEX6Cc+qN0kSGDx5kLtGSc0WH3ifY1Wj30w5JgwMp3PMBs+pSeOa2+1p
         oMmD8RKc5hQiKRgMbTAjk3T10Txy7NFRW4hNRBWVDSvHT0XhhhI0B2YGpV26iJkVIFPM
         /tBPtgjJBqjgeq+zJhDEPoZvJiA6IeeoqFSXYVrZoI1mlBdCBqOSHgWZNO6ewZTOKnAd
         8IsQBmR4zVlpSq7DpQP5w2IIH4cn8gg1GKeIoZ8beEgsjjj8w/U2Ah68mGHR/PZf4BvT
         04WIBoVzkAQFHIa2sh+/L+TZMhaEZ1O1WqiTGbMEp/3FXX4Ee9ppi5wx0eIBPTzclNWz
         HWBw==
X-Forwarded-Encrypted: i=1; AFNElJ8/dOpfuNl8ok2tqaL7UzWm/X/D/qeOksWzAbyp4+tMbz/KPv7cmEXneu8kytVG5yfcklP9ZKjwd9MyYijP8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZFYq3/OXVkeoO7EN0sa018aa7sHD1RULl5DtXQyvOeffQfrB
	ZdTGJjQUzczznc8l+dr85yY5D0QVsk1TauE0OPK9VVyRqRUojjj5+T+WsVbP3Xv61u8u+WzCwQD
	TbZsBf9sr4c9Wq4Su5g==
X-Received: from wmbjw5.prod.google.com ([2002:a05:600c:5745:b0:48a:529b:3838])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a105:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488fb7826femr431021445e9.23.1777301806590;
 Mon, 27 Apr 2026 07:56:46 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:56:45 +0000
In-Reply-To: <20260425135701.34010-1-sagartaunk2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260425135701.34010-1-sagartaunk2@gmail.com>
Message-ID: <ae95LV8DSHb93aN2@google.com>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
From: Alice Ryhl <aliceryhl@google.com>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: ojeda@kernel.org, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, contact@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 07:27:01PM +0530, Sagar Taunk wrote:
> The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
> comments that incorrectly referenced `Arc::into_raw` instead of
> `KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
> the comments to accurately reflect the actual ownership transfer.
>=20
> Suggested-by: Onur =C3=96zkan <contact@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1233
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>

Thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
