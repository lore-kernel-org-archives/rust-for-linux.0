Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8192E1C7B
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947925; cv=none; b=NDhjva+ejyB3jPSMIGaaeKybpZJ6rHns2WICZeUWO7z9NHxCjTb7qWE9qPu14QTYi4/B7O4/InqvUp4wK2WP0ETNZO094yvYuFuqng+aEJc1ioIyxVuypRtFLorOEiIj7+845KbkT7n5wSmy3O2LNr5+losJa/zGUis3cELBpWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947925; c=relaxed/simple;
	bh=ZoL14bgyedgpZA+5RpW1L1FIqwFscmzUrdyV0NBRSbM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zui+41rk6pLenEZkHWTWyQnypKRgmn6juzqL9khcnjHxv5khH0sGFi40Qrca89zBeCvijFF7EGUdIti4v0eCnpYX/94A/m4XEr10zEJv/Qurr1AnUh+RuEXgLH11cff3WQD/mJ4MqgDWWcSCF3Ak3cHI0cyUCQnJqNExoabWIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hpxZilQG; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hpxZilQG"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b3d21b18e8fso465140066b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760947922; x=1761552722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWJe7MZ8jwnEzwPjrfM3Hh8XieA1FNQV7aYyw1otPCc=;
        b=hpxZilQG+U7mIjok/Pj94mJitsin9uyOktIOgRW5KLpSnA5eXEwF68WnioQnpT0dDZ
         wJn1uGw/brpwVfkFOq7U6APsHMMRUcq+rNj6pttsPHEubiVLnFxMRv+U8eMRAeGTNHih
         ZvUXH9VlmRPUZy3B+s2tq6WzpQYdM0be/vDxs0Pp/2e0Panv5zve+erw0nDnq21buqGu
         5sVGdS/Unv3T3E6Ze+zcd5dGhkLvVT7q3BNEJRqEi4qOMDvyfRKvU/61/aZvx/KWvkPm
         bpCSgYmBum0gge2U1YTp0Zum3QuiB75NafT6R7OEUm0o/Nd3g6hRSv8oKxi+Ycc0dYsH
         WtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760947922; x=1761552722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWJe7MZ8jwnEzwPjrfM3Hh8XieA1FNQV7aYyw1otPCc=;
        b=f+/zBI7ZxVzUrviUdNgU3dnDb9Z48czDtFV5QbQQatTWWtiqEZs7OBpXl1DZdjgpdH
         l6iiIxxUzMTmlq1uXfiYYFuznI/lY3462HCBB3V+bdAyy8igd7EPYdfZQwMwZ7jLapCe
         J/mXwaYixvNd4GXfygkha6+bWsgB7u0LgPlAoVQY/Tk+g9LzbunmxAIHIxgH3DUzMtgz
         N9e0lo5BuPO9veKcnk/ivr1tjCz+VII/xpkIDmV293BORDFR/HXfmlnkYoFt+5rn1LLC
         1zx5zKs5qB0XxEw+briefwJFmU5yGj5bnya2Jj2v0NMvFGXjPEsn1p+LA0meXmd4sXGo
         xi0g==
X-Forwarded-Encrypted: i=1; AJvYcCXSkwmAogCvzKEzWJHoVUky0J5/dJkO8yGLlNfCyLZfdWTXrU8K6/Qsz18/d2ikjJrUzx039m2JuIE/j+dRDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWecK/NsSpedmBk3kCC+dyO13lQIHPuqt3Gk9VKQ7g5aiziQo
	uEx12ZsdYNonF6Fsm31AdbLOvRluOfHD2GA3Y1nuJbx6tpIgzO3YE24bdd09e7MuGUM0fgdBl7R
	a5zae5MTIYm7N0nnmJw==
X-Google-Smtp-Source: AGHT+IFU4/q/yrXzjompL2chxjZ/4cPYB/Mf5R5QHtThbKc/LpszZ+WmdtWzUgy8PhR/q3XKqv4iuEvIjH5lVHs=
X-Received: from ejbbs25.prod.google.com ([2002:a17:906:d1d9:b0:b3c:bf08:ba90])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c113:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b6472d5bc0cmr1290270066b.9.1760947921904;
 Mon, 20 Oct 2025 01:12:01 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:12:00 +0000
In-Reply-To: <DDMA6OR8V1L3.22YQDEKL20MB5@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-4-dakr@kernel.org>
 <aPI9tNoh0I3KGDjl@google.com> <DDKO9M4P06HS.3UMGG3QR7BX67@kernel.org>
 <DDKOLD1897SY.84W93E6L8ITR@kernel.org> <aPSzE7DpA7DxTHmm@google.com> <DDMA6OR8V1L3.22YQDEKL20MB5@kernel.org>
Message-ID: <aPXu0FWUrbxyemPq@google.com>
Subject: Re: [PATCH 3/7] rust: debugfs: support for binary large objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Oct 19, 2025 at 02:01:03PM +0200, Danilo Krummrich wrote:
> On Sun Oct 19, 2025 at 11:44 AM CEST, Alice Ryhl wrote:
> > On Fri, Oct 17, 2025 at 04:53:09PM +0200, Danilo Krummrich wrote:
> >> On Fri Oct 17, 2025 at 4:37 PM CEST, Danilo Krummrich wrote:
> >> > The reason I went with a trait is because that's consistent within the file.
> >> >
> >> > Otherwise, I don't mind one or the other. If we always want to use a struct, I'm
> >> > fine with that. :)
> >> 
> >> Actually, there's another reason I forgot about since I sent the series. :)
> >> 
> >> We need it because we derive it from blanket implementations:
> >> 
> >> 	impl<T: BinaryWriter + Sync> BinaryReadFile<T> for T
> >> 	impl<T: BinaryReader + Sync> BinaryWriteFile<T> for T
> >> 	impl<T: BinaryWriter + BinaryReader + Sync> BinaryReadWriteFile<T> for T
> >
> > You can still use a struct:
> >
> > struct BinaryWriterVtable<T: BinaryWriter + Sync>;
> >
> > impl<T: BinaryWriter + Sync> BinaryWriterVtable<T> {
> >     const VTABLE: bindings::foo = ...;
> > }
> 
> Yeah, but do we get something for adding yet another type in this case?
> 
> Another point to consider is if we want a more generic fops abstraction type.
> 
> In any case, I'd like to add this as good first issue for the whole file to be
> changed accordingly.

Yes, keep it as-is for consistency with the rest of the file, even if
the file is inconsistent with the rest of `kernel`. Please go ahead and
file a good-first-issue for this.

Alice
