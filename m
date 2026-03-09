Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573F37A481
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048455; cv=none; b=K9VLnwHgbu4zDYhStMNfDLIHO5i2qrglai5la+jKigXjgoh2Hn3CTolTmHbkklGr2DenPfXp7Pt6zkIDRL9tzRK87HAcxQrrEWwpV5h+NqeR84AV09fPR65LdxEgVxIOt4AHMxZhADd9KUglgaYHeobybsPLj/m6WRxIu2h092A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048455; c=relaxed/simple;
	bh=uJo6kcu3rSOSjO1Me31c4L0R8zx6Lei1xYU4fBz/9xQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O/G6p7Nh3FIXX1HsiAq5Zy48paixhmxRg2Zld7hckF2fubnrFyyQfQ1KBH6w78FdIjuxhQ74HI0qvgCYJWBj+o4iBG/W/AI+P3c+MGbxFq99bp1SC9kQULWPR3PgE0SCwc5vJzZpM6uON0tyS9cV7rVQVCbi3EeCmmZUKMKhlhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AX6h2EIG; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AX6h2EIG"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b938cb02038so467880866b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Mar 2026 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773048452; x=1773653252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GekrONwdW/E2ASq8vDcpU6JmstrAl1AYagM70tLaMWo=;
        b=AX6h2EIG7fQClkpwnIpID7Q9x3fJKMWiuoOAPBZFNcPD5yF/3F5ET+xXJvCzs+n+/S
         NGHvZtUk+OXUUEYK7yqgOF9VHFaFez5PETDbXjZ9i9z3aqqzK87NNqIzbn9hVDZHUAfj
         yhCSmA9AivKphIKb7H5tr1aW+hduJ8kFtTonUVcHxjXg4ctn47ySP3+17bxKMas5RUhA
         W4IUKB1Jz62sQRB0YU6aLnV9chyCIKA8UQv/S0CsYhqkKECjNBstWO9N9StBMzl8obvk
         GwRCYJ5Wbouc7ueyn7eRmLboL3Q4u5+Kmqm22+/Zd+ci843fj9QCK56wD22PvhFmYPOG
         2BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048452; x=1773653252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GekrONwdW/E2ASq8vDcpU6JmstrAl1AYagM70tLaMWo=;
        b=JViF1XQC29DXudPFyxh3MJe15br3wH9BheR5/4NDfi5dL3K6hEuUuMPsYNPteIS/A9
         2VYV1swGXlv9i32dN4zNbw25Ph9srW3c2gV5yIEUDyYvxu3wPdcfjKz1lpHmXM20jlN+
         Rqjqm97zKPDVWtyAgN4llDpp2Df4wmtdG9GYrWbvpls6/A97vtxeAWpEVkOKIrFb+n0X
         WP9gUHi/OS5y6u7S+Eoyhv5AGm6ANXuqKAeA9N9u3FkSzNUVqtfdrlpFuS1bf3gP0jny
         lTM62c33WC0cfJmYbzCJIIwQYivi7c4wTc4KjFF7kfdcOLoD+2ImXlF5lp+L1b3QEgMd
         JGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXktczmn1A2sUQxz2xFNu9ApnEfBvO2+G6kEwLS+Y21MmVYhKoSAE2aE8obYJa70N6yQiCyVLE3N/YEfcTAKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLEWIM7+B/daFaISuuWZfDUuX5W+FuKuH1Ahu4b/K6Wu9Qbb2c
	gi2Tqjxof4LfC26n83QQ3M7fRAlatpdwfQKqXo9mMWXy3+XnYKqIiCGx7Cv/78Hjj5e6zvZq5Op
	51y/75/dGnbW+7WXofg==
X-Received: from edvi5.prod.google.com ([2002:aa7:dd05:0:b0:661:5234:afa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d23:b0:b96:dce1:2f52 with SMTP id a640c23a62f3a-b96dce1782fmr288787466b.19.1773048451887;
 Mon, 09 Mar 2026 02:27:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:27:30 +0000
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Message-ID: <aa6Sgm-JIS2_pudv@google.com>
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 02, 2026 at 12:23:31PM -0800, Deborah Brouwer wrote:
> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!
