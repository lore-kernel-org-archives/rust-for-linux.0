Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DA30F958
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668418; cv=none; b=V4yL3wzBulVgsvR07zxtiHHEsvOJlVOGfIACZ803A7ug9BRnldl9hV8+tbdqmNZyV5mW54cFXKHSIykR62o/kycAO6IlcM9hVPH7NngwKFx8hIheyZEMy27KSyxS8s4cW7+x91U2yAMsE7bIUT2RplBl+n3HZe3/hFN5NVEWIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668418; c=relaxed/simple;
	bh=PdVDF45+7BzUejD7WKOg6f3A9ioZTn8BAVAhOsVMavY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j46i6n9Kc2nne8q1K+WS0WkH7wVsSO6lPb5FubeBBMMEkesGdRonpvg7zrOn+TfXsDqQhXMsP9TSKRNvag3Eza89sz9CN9FCbFZm+SkrB/16E+afnAq4iYgJNRYjfs5RhFINxGtm4OPlMrR5LD7XwSPtJWu9sy0Y6/gW4b96K0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hPub4K5Y; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hPub4K5Y"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2f79759bso3626515f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 01:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668414; x=1765273214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6+dqzVS5WQJ2VvU8h5DB3PLWtil+ghthkGkAa9MHB4=;
        b=hPub4K5Y4MNGQb34tlwkqTXT4f49ZXcpyqoB0WmIB2AMSGhPPe5F8D/y0eZwCinest
         HjewSsuiJAXaeoFUekZMXu/Ivds1ZYjS1n4+qG9duh4HTxAB6g5dkRjpnFfHBrTDioIq
         56WRsawXfNNXQuq+y6wTXwxiQzYFHbdCqiEsooIQx031eYRRgd40JoVRQHUgMNrUM2sU
         TPpng9Ma8frgqP20oellqyzQWEDjPdDTzFQTZINYjFJS3f9REqKvE8HG2L2AGR4IZSo0
         ZJyQnCYnVRexZtEbeoOMgC/Ob+QyKXt7vi0tDHU/yw3Ybhjvb4QBu/RG+gK5GEgNYLNV
         +5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668414; x=1765273214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6+dqzVS5WQJ2VvU8h5DB3PLWtil+ghthkGkAa9MHB4=;
        b=NT91o+4xXTvmJmAj+5dBSjC+Yv1e62FWm9+ZHk0nD3zxJULHLRjxA89M9hMT6ZMiqz
         bAqFQ5PjEhgZifSsZ/4x7AJoLxwJ9Rf1TsCAeSlymDDNUmAUF02bEtRMVtZL5bewGtnk
         OfKRM4GZkpNLjinT3SlMvD/u7mi+dK+nN3oeTFddVyUUWjYno7QZUWB4aLX158FXt5ec
         2jBCVZtaGLKvNpGNWQmYPbxV4pWdLZC1yY8jeqPtRB9XOo9QH3MuhpD2b11wPMdIxdx2
         ERVGRz+9435zbyjg+kdYuzPZkHXO2spcfD9Q5IMP5QfF8GIy31fTJlPQbF0atSa7Co2Z
         +9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgpC/Nuncmh6TJXklwTCzBvm5dODmuRc9lbw7bPO3YUYXvE6RV+p+biy+rW8BBP9N4B7xchZUL5yAxcPbsyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXrikGQ2x/DY8943twEMT/omDsmoDd8Zy2mIJE3jwkiM2x9MZ
	JJwoWOhRlvl2LuwGdLSU0AiaDJSAPE7syeJiOWLVGNKAo0YXHgkrXciYKRrj19Hpq9DiAu9+JRu
	lzXYzjarOJHxqUc4hNw==
X-Google-Smtp-Source: AGHT+IHfJsB26zpLedZ3bqVtYwmFOOa9pxVFJXVyeSkUB7gg98/AHNiJrKqhO9SBFtwTK3t1KChujk6Nue39WIM=
X-Received: from wrtl3.prod.google.com ([2002:a5d:4bc3:0:b0:42c:c2d6:294])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2203:b0:42b:32c3:392a with SMTP id ffacd0b85a97d-42cc1cedad0mr44938719f8f.20.1764668414486;
 Tue, 02 Dec 2025 01:40:14 -0800 (PST)
Date: Tue, 2 Dec 2025 09:40:13 +0000
In-Reply-To: <aS6y5blasMX0KcD7@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aS6y5blasMX0KcD7@fedora>
Message-ID: <aS6z_f7rQ3vRzWmU@google.com>
Subject: Re: [PATCH v6] rust: Return Option from page_align and ensure no
 usize overflow
From: Alice Ryhl <aliceryhl@google.com>
To: Brendan Shephard <bshephar@bne-home.net>
Cc: miguel.ojeda.sandonis@gmail.com, dakr@kernel.org, acourbot@nvidia.com, 
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 02, 2025 at 07:35:33PM +1000, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
