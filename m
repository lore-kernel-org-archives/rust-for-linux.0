Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70020E01D
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254541; cv=none; b=AgkaEV7RWJAKT6RSX14TQL/Ov/A5EBzd7AXtdFB2Q7grw5W4vbkvtpdNM6lT9Id0HLfoMMbqzh1ec4hLDvjwRa9rsT7Ku5gPUsXfjfPamgtoRiJDsb2d2cuHfJVIX0k+KG81ulUTjYmkwBxLGKNyIjRItWAdovC8ZVLshXRSQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254541; c=relaxed/simple;
	bh=nxwiE27qUkNPBhSkfyKtbpFN1GvgBfCIdPUB1ha5eBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pkmfbs7fe194xIbQGKximS3vBYi9yUM8mFB1B69ajeX8b3OP2w33aq37/ME4jYxhcjVKwRi4GcADHKqy53/0apkdNtDhqtPGuaXFJ2KpWBmzR5G8dCsuOWrXtqaM2/ySTjGpk/orNeElW09ytFFHvkrbgI0sETy3+QHNzWk3x/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n9cBwFj9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n9cBwFj9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4388eee7073so8541155e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Mar 2025 01:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741254538; x=1741859338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxwiE27qUkNPBhSkfyKtbpFN1GvgBfCIdPUB1ha5eBI=;
        b=n9cBwFj9lsHzSlNjLKtT142LdKDLljcg4vJ7TIshc8OQQhpOqAP3LjD2tTZ6uj4HLG
         5eN/cWY9p/elErAhne/nUM0lMhqFo5932f53k62tM08ei35U0uE/43Tfi6WoehO5nMd+
         WT4pAFoy4YNfQvPHsHEC6wIWDjB4EcQaXg1J1PxaaIHciIez8YFGuVTiACoGTW8AEZsG
         DkS7SMFyqB0PNVA6vpX24ZaYNRUrRkP7QSlFeKAYxuUgPATPKZA+tEGfFARvzDpUNouc
         x5g0PvfeQ6Q/CmMpho8uR3ZSnoy1R4ChrwIwVq5nIHyptu9se5u8X01Bk1UEN3+Agv+d
         G7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254538; x=1741859338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxwiE27qUkNPBhSkfyKtbpFN1GvgBfCIdPUB1ha5eBI=;
        b=cuUT5X/D/FTLPVRnMtbdz2RdurEvc+toyerA85eiyuKDlblDj3FI9k2XT9QEAQ+IeG
         nteRKwd7DtBWkGOZp86dhe5bGVAW/1BJxmxgUjrb7kdsUlKKaLy5JFtplK8WbgpvoUfQ
         /TWKUkpDV+IKcSq/tdQfH7m7a7qGf8BJNnetV8ZSqc8B2H6V5t5d2/GCUL77e4+z/hqy
         yT3LKcnFqJBUwuXbPGZV08L969LyOkL/IkVDopvppocaMQyCs7fG8POUR1DjoZ6d+Kui
         eAaNzjf9fimtjP+RkPc+EY9QqPHg67me6wNdqYNeyjWTEapgz1sTA2z1aWoSs71jA8x5
         8u/w==
X-Forwarded-Encrypted: i=1; AJvYcCVFNl9sjJqL+fWuB8EBfA358+ULfwoOj34qunM91PNmPNUy7ORsOWzjCPhpdTWYVwnsQ3rdX2lrMJxPg2sLbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxggmCDAGbTPV22bNZsABD+/nUi1yrfyEdSMpJ2DHxEgkSlryEw
	Aox4o6HA7yilD9Jwqru+MeOYjLsABJdt2JtrvLdl338rRGPVgcwpTEIGzm5mBOI4PBfa44ja9gk
	12kXSFIrX9bsz8g==
X-Google-Smtp-Source: AGHT+IHcxLGTeKieTf5MpR8uUN3kyBhCnfsQJrfWUCJzsJ/+dmd41D08T9ysONrVTL9Ab/MD3OW8mrHYu5zkZKI=
X-Received: from wmbbh11.prod.google.com ([2002:a05:600c:3d0b:b0:43b:c0cf:b8e2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4384:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43bdb37b516mr21077795e9.4.1741254537969;
 Thu, 06 Mar 2025 01:48:57 -0800 (PST)
Date: Thu, 6 Mar 2025 09:48:56 +0000
In-Reply-To: <87zfhz5gq2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com> <871pvbhqap.fsf@kernel.org>
 <eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
 <Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org> <n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
 <Z8icwtIpZ3PO9YcZ@boqun-archlinux> <87zfhz5gq2.fsf@kernel.org>
Message-ID: <Z8lviMzPiMzjQIE3@google.com>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor description
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	daniel.almeida@collabora.com, Gary Guo <gary@garyguo.net>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
> understanding.

There's a really important wrinckle here. Having multiple aliasing &mut
Opaque<T> does not trigger immediate UB, but that doesn't mean that such
mutable references are safe to hand out to end-users of the API. The end
user could call `swap` on the mutable references, and which would be
really bad if it uses intrusive linked lists.

I.e., you could only safely hand out Pin<&mut Opaque<T>> to the end-user
of the API.

But of course you still need the guarantee. Pin is just a library type,
and if having a &mut T is immediate UB, then so is having a Pin<&mut T>.

Alice
