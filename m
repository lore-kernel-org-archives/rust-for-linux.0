Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27B22D4C1
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 00:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332204; cv=none; b=Ww+SmTlcn6sW/wTCha1JoTaI0pdBvirjQcy5cim8qgZiCK6mwI4K3shPgeNhwCaUrLWcdgqafvuMG25tZuYKbmfSltxC1b5JHBb56JmsfhBVegs2EBhXY/YmSyySxYC/7psgP1ip33DA3mtgZ0oEdDXdSeFP+CouX+3MAajAqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332204; c=relaxed/simple;
	bh=uyi373n95XP5WRfAJ6QpuXEns7JeJsRyt8nfx137BbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsBaTiVF8NNLDxyFI5SOKR7g1ElAsOesBUsqB/VqNC7zuoYCdJHH/ZNNpnaOQrBeNlrA70LXeP1mRVQ3VQXSS5mT6NShNJWcY8kbhfagIEdacLj5XfHFTDxRPA3l1VHav75SXMwAPZtGiYX6B/JmqstHnl50K0rhmTHmTslLzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxeVo93P; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxeVo93P"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29af3382dso251222066b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 17:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332201; x=1744937001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uyi373n95XP5WRfAJ6QpuXEns7JeJsRyt8nfx137BbQ=;
        b=KxeVo93P+FRTzd+I1rOApduvKdDH9VkezP2liQR+V22yPiRMvCDX9AD+KxcHe4CrVI
         /C6+XG5CZkUQgOH7quen3NCRHcWzeL+qW/5hwHYRtr00eOvLs2TV1nurEmxW1RVU8yWH
         R4K/sKNA6veXvGVuLWq8dILRK6qnzFI4NIRfqi7yC3CNEJb2JqkmosMmMA5ocyk03QVA
         x+Tk2M4/aXoSCFsrI5mqtosr1f3zm2aIyZ+Q+TnDZspKm5y6EEPR0MMhrPKuiqZrNqHI
         qq+2WRwJ9TA6sX7oPP4Ia91uKcOGpyMn0iVlo0SfngiG0gD6ZOjRZqx6/CLeEOav1xcm
         jmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332201; x=1744937001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyi373n95XP5WRfAJ6QpuXEns7JeJsRyt8nfx137BbQ=;
        b=PFN+PFajpfe+Ph4ZsPTBJBqFumaIfWNab5hu3V4rK3paDybnYUn020JSMW6gAicOr+
         ueUxEDuAmXa3s8v5yJuaenBMPWyT15TugrkhyPZ+DLDx/osNYwSFfG3b1X2rbFT8YX1h
         YanJ8ZmLHx8xSKKJXoYRojg1FnQCtEhR0CPsfP1MvFqkgZL3IUeYooGmLJ1BbHeXa0CQ
         dKBxz8YMLmilmFO5SXXsYQuZNhLZXA5aeX1WbsuLvOJfyK6+akzlFLqIuO6x3RqdWCcv
         4xvbB9aopVnlbaxPUjeKwaJFNWsxz6gPSA7DAku0Q2tn/4py+Cm0dAwDHss3uUK6c8qr
         joBA==
X-Forwarded-Encrypted: i=1; AJvYcCV7PX63lQVkXl3hjpB7jhk4DhXyBKH0ejDcuPUm6d5aBUwwOwk1O2fidn5qu5rOfhA9+eflKqjpzj3RsdOeSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMgf8u7mE9dnr+iPFQPU/JjBTwghxJs74gSUey3gybMEoKeSj
	RuAYwv4stR5rPNNY3owKjBjSeRxf4iXHX5fwZLtu58L7R6v/TzhhZ70UQykiZfC9ND6EFzkHB8J
	g/ngA7hKzz767US3sBdxnVufp8jY=
X-Gm-Gg: ASbGncuolAD6p7iO7g80Y9hoRQNPxLIpZ8g4IRg3hE6nH+A3k4o3kV7CjZ6A1KiMHKX
	DdkvIcO4CHII2rYz7kALAOeS879t8cFnwZBMIsq9Ke5rrsuW03bdNZ6py/WJa+p/jHNSm+tXVjJ
	5xcVxq1FvbSoSeSI43qdMU
X-Google-Smtp-Source: AGHT+IFOZgvzFBpuXRcPT35FR4/Iom095HHvEYYpnHdDBg8O0o49qunB8TKSvlJDTF8V3f7fQmLgMLZLA79RUsdZ8hM=
X-Received: by 2002:a17:907:d7cb:b0:ac2:758f:9814 with SMTP id
 a640c23a62f3a-acad34b6278mr63743066b.23.1744332201090; Thu, 10 Apr 2025
 17:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325235522.3992-1-dakr@kernel.org> <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae> <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae> <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net> <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
 <Z_ecMl2QtAssfczJ@pollux> <88270028-7541-4184-a118-96c182109804@asahilina.net>
In-Reply-To: <88270028-7541-4184-a118-96c182109804@asahilina.net>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Apr 2025 10:43:09 +1000
X-Gm-Features: ATxdqUG_0rRJbh2_knffrJkkAfHJ4Mk1byqpkX0jXcT2607kJgRnLGNNFKx1Sgc
Message-ID: <CAPM=9tyXAdaota38cgeQc86teEebe9XOnBTZ+aDBZpzEBApD9A@mail.gmail.com>
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, 
	daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

>
> > However, I understand that you prefer to have primary authorship, even if the
> > code has been re-organized in new commits, moved, modified or rewritten.
>
> Correct.

For anyone working in this area that is intending to upstream anything
from asahi, I think if code is rewritten completely it's probably not
consistent to keep the primary author. Copyright doesn't cover ideas,
it covers the code. It's fine to add acknowledgements and other tags.
For all the other cases where it's just moving code around or
modifying it, please try and retain the primary author. I'd suggest if
anyone is basing stuff on the Asahi tree, they try to take things
as-is as closely as possible, then use subsequent commits to
clean/fix/rework, this might mean we have to live with some messy
history that isn't easily bisectable, but I think to avoid any
confusion later and to keep from repeatedly bothering Lina with kernel
development questions on what is acceptable for what patches, we
should try to remain consistent here.

If you write new code from scratch without reference to the asahi tree
at all, please try and state this is a clean implementation to avoid
future possible confusions, if you are aware there is asahi code,
though I realise that could be contradictory. There are often cases
where there is only one way to write some code and I'd rather we don't
fall into unwarranted accusations of bad behaviour.

Dave.
