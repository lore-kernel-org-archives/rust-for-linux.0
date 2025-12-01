Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243732C08AD
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599240; cv=none; b=b/cDfExZsb+SM27VPaYb2aDX6d4xkzFUUV7vj8eYKMWnKHzFElzMgAdHHCvNDNez5earjTduTT8HC7RoCalUDHSzOGPwsQV7HZGdJrtjT5uWSWj+AiSGlujIoMajgilbGcmtPMnJqna4P7+eKHgAZDLwhP13BGwvRZ+W8/ICoZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599240; c=relaxed/simple;
	bh=cqtCxDgD5FlSIZmjjyTV9ZrXTR0ZBphl8UXvh4Xk4kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1MH5+lSvuHiDAOkfBSLHgfMvFHmw5bh+tku758WMl8DcHLl0D/+ZmEFxsi32bMurVsuE3pQgpFvYsA2APMKxxR0K3RsRiA89ghhkSd+xrXPbhfIYP8vd/6OUynoWTMJ386ZtDNOEmBdma/oEyQADNYqVtikl/6p2Z6S7geHGNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuvBbq0B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuvBbq0B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297f35be2ffso63808695ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764599238; x=1765204038; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CyfuXJ3dS1xwuzdmGQEJgMw3DQ60E0n4xhvXA4DDY0I=;
        b=GuvBbq0B1kc8eIMd9gmOSVG/U3ILCxokvt3TtCgP/5t1gZpbyDUC9iEUlvw5tU35gn
         0UkyJci1AAzqZZll/q3fVGZmUT3WvH99lwFWh56/N2sTG1Ntff57e86b0Fg+DY6I4BW5
         CkVnP5MyvPTQNqiicjQU8bKLHsNGtW+bdomwpV4SyRz80n6J0z1YPQwcT5Sqlb84Zb75
         CRykvwdlSYOThZx107bCcyFubtwEhMlulQK8V2OAvD6EmDVXnWo1/rOUfsOF5LreQOZw
         sIHT2UUVxnAdtRoFZ4BS2mcOTOx0Mgg1J8/gqWfZJPuT3zihiHiDmY364ZHOzUwaAL4O
         t/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599238; x=1765204038;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CyfuXJ3dS1xwuzdmGQEJgMw3DQ60E0n4xhvXA4DDY0I=;
        b=eYAARrxqJTbpQIIVfwmzzoQwogDTCmE+Q6gLLKwWjg3F7rGGaKkruOkpJ9Nz8pX0Z/
         cSAm41rcCoRocCAC5C8CIwUN+egMAXHMd5rCY9LHwStAelJUrNPCu/l4aGiyH902DCJd
         UbJopwanaphZn+oeQcVoepeoBwlTKZ78SlCiVVhq1lZ/pCpADXklxcupiH2bA4s2Q5QW
         kKVVjv651oyJLSqzMsoOY7nwXqHZ351niy7qX+k0/qBL8QuN7vF2E53fzMpq5CZ9yNsd
         vXuRBP0eTo+K1zHksJ/MrVx7u32+H2h5nGNf6os+LOvURP4zGOVqmmBCTa/U+vYHIZrf
         mUOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2RwcCJDrS/9OKDi6khpzwTyS5zZf0/a7/5jWD44YVJVoe3MXCkKUtjUKLRjs4SMlzIqjdk8LANBw6vpMGuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv338mL5kpNbAF9MHUoAPBKGHwWKxea72AT/D8sfAwVGpmY+jU
	98kZ1lMXhELEKsYTZd0m26jUx+ev0/Fe9hWadTEbhdnQ268Xw/pX6xAY
X-Gm-Gg: ASbGncvw9tXa2pBaN4OsFqrr/Fee9CRA/8RoGbZ/16wdWSqC8Me4Nc8ZcSoKAfTInIC
	7GY7xefEnmKF6nLV9wrzNYPfNs7J88O/NM7uoOJVmVH+8YSJiiILuYt7WFqvDumRqjgbRBng8tx
	uN2Ac/2LO8NZ/pyLVnEWYm7A8FzIoGKuXybtIJmATNikaNY/9spDKYqF1n+e0CdwRRgHV9Xz0wV
	NKjOKN899FFqdfYz8+ps3GonVpPoPf/mDNurq4h/c+MhLNdil22uMVpUpn69fgGFigyhzIoEITj
	hLXbvTOaP6IKesjagMAm2Ojx3vzncWMIyDNs/zWWbIqqCuurVqOKPwXRwKKEdd2WP4cjZ6TxBVr
	mBWsMu6ZnXBvyxKHobqzWPQSgrX6ePj551oHL/Ms8W+uUo8JZSFsOMZrx6iUDvhfTDugUIJXTVC
	djsod+8NT+kMPmhbMPgpVUvce0KksKm4MLnyB3JRlCRHZdaFElYrae4EdVMUJLhA==
X-Google-Smtp-Source: AGHT+IGgqPIBYFZh21Im7PrQQJOK9fLH8qMDVq6VS434Z4nqdYM39hwMJTbUqbIONb8SI9qarmWo1g==
X-Received: by 2002:a17:903:2ec8:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29b6c6f1d7dmr406419575ad.61.1764599238125;
        Mon, 01 Dec 2025 06:27:18 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce416f00sm124994465ad.4.2025.12.01.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:27:17 -0800 (PST)
Date: Mon, 1 Dec 2025 19:57:08 +0530
From: Atharv Dubey <atharvd440@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org,
	aliceryhl@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	daniel.almeida@collabora.com, lyude@redhat.com,
	shankari.ak0208@gmail.com, lina+kernel@asahilina.net,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations
 initialization
Message-ID: <aS2lvGotkV3lFLE6@atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx>
References: <20251129134834.34559-1-atharvd440@gmail.com>
 <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>

On Sat, Nov 29, 2025 at 03:30:53PM +0100, Miguel Ojeda wrote:
> On Sat, Nov 29, 2025 at 2:48 PM Atharv Dubey <atharvd440@gmail.com> wrote:
> >
> > +
> 
> Spurious newline?
> > Sorry for this, I will send a V2 of the patch.
> Cheers,
> Miguel
