Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927DA335082
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279651; cv=none; b=HEX0EkJ9MeTZa+DIJhcUEIQrgOoBlMEideINcxIk+Abk5S5K/Qwa5HcxC/gdBrPeE+b3Iw8yw2wQhXLWPQayM4GDQQHXdXJpa59/lx+p2LdzeRe0OEij4j28jxmL4GBT6A+NUJnX1ERr/QWX+9V/mKcZliwrR26Qfpk3q4Vz8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279651; c=relaxed/simple;
	bh=Rwtp8CiIePyqOLgTkJFhOvh6NcfBCPU3sSYFQ2Hgc9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UfYAYkqhU2yOyZHWqkgW7Dy+xSNF0p6TektdUV9diB/w4RnZ3HXx3k18RnbhcxchGrwhZXgj08WzgP53qF43iaLW5SElTyx5Z+/WE8yqhcP3AHQ63pOoXZUYjwj5jSlrN55lseSV/QouvonSMScA6a5YPdemA7UtgEV8v5gEYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XnmpZE2l; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XnmpZE2l"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4802bb29400so4989705e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770279650; x=1770884450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V71Auv6bMTJGyIQC35YL2Gm+laf5SEW/pciPjrjSE+0=;
        b=XnmpZE2l5F3neItq08fqaZN0n8DnpLW2TkORcU2Y0zZkIgH98FUsr8AdpA/wgX9TYl
         eLVRR+Zu62y+Vs+JV9N1cywchXvwMGrcCzwfFb+0Njm/Rhm1y9Yef4C7hQgVAOBkeJTe
         y5O8ZkyDQLIuH3fGYwlR0SPeBCSC7H45Rtb8x1qMnsBLfPDuKsnWytMdAgD46AY7lquX
         1wMt12d8txM61UayifSPiqa2H5l0CwkZFO4HXCSoiYuryqy3MjaAC+D8GK1dXaoxBLLl
         Fl2DKoUVIzyhOpRBPUVDQ842cNIJY7v0nWYxMp8eM0ok4O9z3qXVlqoED7UdmvITFZnL
         SnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279650; x=1770884450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V71Auv6bMTJGyIQC35YL2Gm+laf5SEW/pciPjrjSE+0=;
        b=rz0ogheqa2m7ctmb5fO+CatYscla+cSdRHlXf3oWC97/JVTSvyqpS82wdoY3MWt0Jr
         ZQQUjfIb8IihH3d2ym8rut/Rz+jWuIlbSb/KtNh6EudfnB3NXKYlv6PvDhx04iR3mrQz
         9fn05IHnPuFCrfrcnqx7KjwNbrDIDAASTnS1Z5CIwHsZcWDT5HZE43bNlTw3WMvCJnJV
         0t4M/bNzGOCKW9UsAdK9srvZbplnr/KeXXFrNwutNwnndufiD8C+Udo5h2qbBtYB4osC
         u2RvT5T6rN4F+C9JEEWU+/ZGTo594ghqio0ULCBJrbqJNxnkbavF0dv90qsPZDmnvOGm
         /UQg==
X-Forwarded-Encrypted: i=1; AJvYcCW1AIeYYIEHocA9UlI1Fqea4w97uS970qF+SxthS+peG9ITd4GrtPpGnQ6y8R0Kij5UnH5wG+q/HFlt1ECinA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxhPmddt7IfxaVhfD+STr2WzcFmzYpDCXdOLApacap0Xrk37lO
	iq4Y1LpM40u/daJt50zaAuUztVeXBqWj3QVgZfQ+ufEo98N1YzUkMXnCwqvMniUlZqDfBy0pNBX
	9rVewe2bk8JKt7VDDuQ==
X-Received: from wmsl22.prod.google.com ([2002:a05:600c:1d16:b0:480:4a03:7b72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5309:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-4830e940607mr67827665e9.13.1770279650037;
 Thu, 05 Feb 2026 00:20:50 -0800 (PST)
Date: Thu, 5 Feb 2026 08:20:48 +0000
In-Reply-To: <20260205050128.17532-1-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aYMkdwic6UNwTi5D@google.com> <20260205050128.17532-1-jongan.kim@lge.com>
Message-ID: <aYRS4K035jOL1fXv@google.com>
Subject: Re: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for
 freeze operation
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: a.hindborg@kernel.org, arve@android.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, heesu0025.kim@lge.com, ht.hong@lge.com, 
	jungsu.hwang@lge.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	sanghun.lee@lge.com, seulgi.lee@lge.com, sunghoon.kim@lge.com, 
	tamird@gmail.com, tkjos@android.com, tmgross@umich.edu, 
	viresh.kumar@linaro.org, vitaly.wool@konsulko.se, yury.norov@gmail.com
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 02:01:28PM +0900, jongan.kim@lge.com wrote:
> On Wed, Feb 04 2026 10:50:31AM +0000, Alice Ryhl wrote:
> > On Wed, Feb 04, 2026 at 06:11:47PM +0900, jongan.kim@lge.com wrote:
> > > 3. Regarding the search mechanism and vec efficiency improvements you
> > > mentioned, these seem like valuable optimizations but would represent
> > > a broader architectural change to the binder driver.
> > 
> > Improving get_procs_with_pid() seems like a separate thing. Perhaps it
> > could be part of this other series:
> > https://lore.kernel.org/all/20260201000817.275382-1-shivamklr@cock.li/
> > 
> > Improving it here should only happen if you need to rewrite said
> > function *anyway*.
> 
> Since we're changing the implementation to use task-based comparison instead
> of PID-based comparison, we won't be using get_procs_with_pid() anymore and
> will need to write a new function (e.g., get_procs_with_task()).
> 
> Would this approach align with the Rust binder development direction?

Replacing get_procs_with_pid() with a new get_procs_with_task() sounds
reasonable to me.

Alice
