Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E8426D14
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469960; cv=none; b=AWdYMbkFamIbO04BiefX/dgNT6tUSkqYzNEDpXqlgM0CMC9G1KmpA7fvNl0uczB2l0kUDiyMMtlQS0x/HP/sQcPst1Tvbucx6IQ9PDT3uQBD11+gnTWaYybIyLeG/82oNRcTXd/gqjGHLq/fdOmnIbyO08lbNfm65wqpuXeMEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469960; c=relaxed/simple;
	bh=RkdVvtQJVzAlQ6OLqTTZ5e/BZoCbP2nAPT2gdiorTOU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lvwsX5uPfobDrJ7kf6xLnMP370gBWQimn3zXuF6LZf/KzRZT6qlntDjifiDc0zVrLt+0U72bd+FvPnWYnuOWMOhOXIf6z+dIucKg6yKbdZ65MTZKXf/z0jtqoxRkOLAHD3Eieb7v0O5BnhVa08aDw8i0NqAFJSOBcl1Wtv3Tz1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ciooMLSO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciooMLSO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836abfc742so37203205e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772469957; x=1773074757; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sOpHk1BL+uJZfW7J1uTT7wM4CHb4+mXkf8VEbmZQIDI=;
        b=ciooMLSOfaL+99dQs9sixObFL1w+UVgJVRcDplMuGkXS6RByc6uMhTw/cXdUTQIdGJ
         68DXD6/4/kCARi0KxSP+3ykHDzHB9JU1Q06GPQ5VdtwNyq7o+eRWUwfa9EhV405LAe0W
         MfPp8eNxJzo0/LvYTJxSuWQtysiKOi+D2t2FK44bQHXCM9DK7yMTozcyDuowwKV7fLnq
         e+ZeFAssjATJf0xBJn9pUMuWpbWgzcFIF7poxOd9MbpM6yYbXH+h5qAaKjJ7Ik6t6gI+
         Ro6FHTOFXtjx5KJOVvawoq6txFBYng6DM7QJ24zWyJ5TGgYB7wRMNlk1FkylUS4wvM9Y
         +MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469957; x=1773074757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOpHk1BL+uJZfW7J1uTT7wM4CHb4+mXkf8VEbmZQIDI=;
        b=wD4XoxURumN7fliIR3wwY4NFKhA8PecNrZ0iMwG+6kLmjFZgTkuigK8coajmF2uvzY
         Gwho9qfhjFUl1bQcY3LbkxikLrG4q0ZOzolgH2sEvD7IWuIvJPJS+JPjzFYVMouPHNUY
         3Nl59uTad5fpQkUDoIfNDO4EIoD9yvjtu18gmg6zdN6dI3I7OW7IiNdKx2CsWZ2S8MkO
         iOoPwXejemJKEVm4J8uvolATtKAUL8U4NdmENproBwmuBp9qizp9B8YJyepSkIFawxA8
         KfuAw0nq6ShNqFjUUrAORuGIvs9C3MT8XcGxfVZaJD+dTvJYfYjMO9ovQXg1MBXSJokn
         qNlg==
X-Forwarded-Encrypted: i=1; AJvYcCV3VV4v4UOWdDIpentS7DaHoLMddXhNaRZohU6KwI91UsSTGdgzk0VkkcEtXkS7DvTq9YTE7Qu3xTXoXvQG7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnuXVBKVspYhAQtHeXI1BMgNsZLoBatylS/C1P/GL4jW5YEEFF
	Se5Dr814I1gXtuAlHvJm2onf75hOL4aAKYQAqmP3+GHiB7BS6x7hmCfUrD+Ae3D19wBpNOphN5r
	1nUPeDu6XdboSaE7pPw==
X-Received: from wmbg25.prod.google.com ([2002:a05:600c:a419:b0:483:6c98:3d2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b0c:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-483c9bdd26dmr247647015e9.33.1772469957264;
 Mon, 02 Mar 2026 08:45:57 -0800 (PST)
Date: Mon, 2 Mar 2026 16:45:56 +0000
In-Reply-To: <20260224002314.344675-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224002314.344675-1-deborah.brouwer@collabora.com>
Message-ID: <aaW-xIX_odWZEEDZ@google.com>
Subject: Re: [PATCH v3] drm/tyr: Clarify driver/device type names
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, dakr@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 23, 2026 at 04:23:14PM -0800, Deborah Brouwer wrote:
> Currently the `TyrDriver` struct implements both `platform::Driver` and
> `drm::Driver`. For clarity, split up these two roles:
>  - Introduce `TyrPlatformDriverData` to implement `platform::Driver`, and
>  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
> 
> Also rename other variables to reflect their roles in the DRM context:
> - Rename `TyrDevice` to `TyrDrmDevice`
> - Rename `TyrData` to `TyrDrmDeviceData`
> - Rename `File` to `TyrDrmFileData`
> - Rename `DrmFile` to `TyrDrmFile`
> 
> No functional changes are intended.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I checked with Danilo who has no additional comments.

Applied to drm-rust-next. Thanks!
