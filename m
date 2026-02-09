Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441C23A566
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640831; cv=none; b=Mpogici+FdVmUFfhvVNAgcsb0iLZFufcNfoLjIV7QzupZLa+YSzuqKpp7Yd1VCyW0yNJNwnlOvP1/2T6CqwfhyqkRSSFeGnVZSN2h4RwjFVrOA3wTksBBso1JbWp1yq6fVEgjZ9Ereg+wmoJ4HXHzp2zY58J76ZI9KYvm+CY6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640831; c=relaxed/simple;
	bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u+/xtKi++nc4T4dRIU14ws32kr7nZXeUBZTfcvQ/TWvfOtdNUqy+86h9B6QwV3oYF8Plk3HFzOXyRSublbf1WzwyNNeI2Y3uMvrAQXiEhrNciPUPU5hl5O5pYMyg73J0BZdJ42ePjxyKjqsrWm4i27Ucgsf5J3zjOuzZABprbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dN74hCV8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dN74hCV8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso33034935e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770640829; x=1771245629; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
        b=dN74hCV88fcQXI5YfPJ5uzhXuK8oVqqHvFljihMluq5srEhD/cqf8FY3IdQbsvx44W
         BuEng62+dJsTLDENXYdyA89yZRU7mAGztkWAULxblnHde6b9HYM5b7AdPUekkTIPZYh0
         Wl12JnyAj05SEne08VvTx6b+2r8zgciWhU6ZMSJYrHf588pUSwH0mD4CRoSCajYRj0vi
         sBQncQhOI1+X+B5ylvgJQ9FXPufp7QFajuSNUJ/5NW0K2rTd4hHWMp4TaRgy/g9JOskt
         FLE7nilqGyFs4Hog4cFgCRrBleSksy1N7upFRFjWqrgYkj0WXxkuB0mRWznnwtGgi1pF
         6wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640829; x=1771245629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
        b=JsvqdUJaNqRsY3zun57GX/ZUtF4IhKmsMnjJc/8GZ95HxtAKGhNIFfHSILOg9VBQXJ
         RcCiLJWWP4x1UYOxUSXw+YY1kyQQXvYHIsCmOYRjzsDTwyM/9sWkU3/EbDrtKizJlw6I
         cyIab+qAbpFUdoeF/C7UgG1SJQhjhd1QZhic+Xz09qTOqvEEiBJjIzfVnB9QzdTwAY7+
         9HHSN2EuMB6KE6d8JMACECrUlQ6Yg+C4gV614ti9FT7HpmLPCx5t2z0+TRQWf3T8PPA7
         2ggshHLPsqRY6R/8PqSPmlnfWARilqQ8+tgfhLpJhgtQx2gAovdbvYgbQeTb8I3fMEZl
         dcaA==
X-Forwarded-Encrypted: i=1; AJvYcCX2zO5IyXktpGlS4y+k+1bCGocnI+9DiMc2NyGoNYZoSvxxRwrY3mENgriQjfkXPdC02X/hrQ9n2Xb8KeznMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2Kv7IQixkQ5HPTgU+iwLkhsHg0xpvYVzJFPcak0Om4i/R1U2
	YxROApOPMF2nYSG7rZ9sue5CKLMdAjeP8h9t3gwsRMI/MjTzKXTIZOG+w2D2zAqGd4CyxLp8f1p
	j855z2DybmKMGZngo2A==
X-Received: from wmjv20.prod.google.com ([2002:a7b:cb54:0:b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4d:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4832096698bmr152297515e9.19.1770640829288;
 Mon, 09 Feb 2026 04:40:29 -0800 (PST)
Date: Mon, 9 Feb 2026 12:40:28 +0000
In-Reply-To: <20260206223431.693765-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260206223431.693765-1-lyude@redhat.com> <20260206223431.693765-2-lyude@redhat.com>
Message-ID: <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	nouveau@lists.freedesktop.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
> Reviewed-by: Janne Grunau <j@jananu.net>

I think this email is misspelled?

