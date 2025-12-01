Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E330AACC
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599498; cv=none; b=L4R3b9B9Yt/TjhW9J3JExFCpKUA3aOsBQpW9igiL0WAmtt097l1nSm2SJP769ubMJpGY0u/eFvjs/Kf/qj//FmKmAXZ0DqzRiR+7XJvEVGkAm7PUJ0O7zIBY0DSxnnRXxbq4wEHu1vmckozS/MEAmbBLu7cFlhi966CBIPnQ7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599498; c=relaxed/simple;
	bh=6IOGvsQ7JJkK9NqZyThSzk/We7JxrkgA07y82I7ci3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVWUxr5/HKNVFhj0z4PL8T2mruTbuVTnsX1GAqL1VXrADmEu8HjXLLbuI+s4aV2ms7dTqNGtR8KTRMddq5jh4U3YkmNJTRyV7QRqtXgIxEKT6u5OOqfdcRXxHxM4XDQD5bjYNa0v9XjU1x/1AF6iTffbV7mZQBGcIKpZOj414sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBOAdvMn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBOAdvMn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso3889959a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 06:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764599496; x=1765204296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0g1S8qHX+DaR+1Bz/ZA/uLjK+Q+YLAA5K0tVpFYArqw=;
        b=gBOAdvMntHzOSQZnbjroaO+tlLK1Xj7I3vcRiREH5iVqDqFxZfb2pId184w4dI4A2O
         HIEe6kdrXHHvRsyctmK1RgaRtTf/RtXbskdUE+0CFfo6L978wNmVaLEmkW1ESyOCziH/
         qfPV1iL7EQ2TREKzTxb1Nfjxkv+z8TtU/D3djN83xkLC+a1GlyKkfdyZYnAhzl/L8zTu
         2/GesfETgSxVjUSJjzqNfPAD1CAPBLtv4Zx1GCa+lzJssANLlTSKpOYCwzzuH+eYfXSb
         OLltL4sjh2B5p09JDhzqVbQ0AdtTrMrk52WmfD38JtpMWkoIMd+f1+xlFnBzHVYd06GR
         TxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599496; x=1765204296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1S8qHX+DaR+1Bz/ZA/uLjK+Q+YLAA5K0tVpFYArqw=;
        b=A1WE/OzNTQ4nAH7Y561b81Oi40JLVMGXNvCAiw0wFvFrnhIPSxyL0ces1hyqMa/pe9
         3MO3PVjG3bLR87oRWcfxj4JYsHqfALPgtHLWZ0xE8wg0Tz9u8xU0SEP9JHEjeg8qRPS1
         kImstY7+Vpko0ObF2CH2cxpNK+RxXx1OB6nMENwxlLeS+3vR4rbs/UEf4P8GSyERHNus
         KdFl6WkuhpmD91rzpiD6nuYql4nDiT8cApYFhysXl2nOaOMvQ3jeMFPXkpbcPybHS9Va
         DOWkXLT03cw0gJ0gHi7Gg7AQc9eB89KJSqo8wRMALhS1tpKVAemuXdNlbvUCzldUA5SM
         +75Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPRMkP6bTFqri0+LSNs8hfIZ3rRNm/69QCXDLPKQL/88M8LsEvFYtjO82lIzzC1Byhkcwm5lZmlshuY5XkgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJVyy/NgjUD53Hztd/FsHsQXs7VKPaZc/8QFVTZUxSNGHDRt8
	OeU5et284h1ct6eXm+UtjlfbqErLzl9Z7Egg0xAdhchvdfKH4ZYZ2EU4
X-Gm-Gg: ASbGncuTFIyC7jjf7QJ8MSbiql3EMbub7MQYywdyBdA3uQuN7V5YRab0zyXhQDE1We0
	Ed5EnQ4DJXQh1twa7HawjMJp7wpS/gwyXUX8mt++xmEcq2Pg4X3ygZ83YZfuvZLqtrXRQ/ueiSR
	XfNS1lZu7RZPqlnoOkLnoiBYJGrbqIxOtvaRvGBQBfFiElQZndbhodsV3OH6ngr2kaCkVrJ5mhz
	FUoWBcVgljPiUp8dqmLdYQWK3100tkNuxWBeOiJ+6w1E9BVEU3gqPMM8CoEFiCRBe1nW/gidOKR
	Yey1XQy83v+BDWJKMzEqlPK/ZV5A5mXCM7xHst0rvjZw/81jyCFhzZ+rl0AhBMF4HKt0XnddwqQ
	85oPy97j0tTjwsAdWxMrLmuLjIss4tFvhUhO4P1Xji41vS+v6sTPjapK07PhvbOTaFxYC2hKZAV
	dgkrM1irKOlOMuHdjydjjmYcQRN2JvInR3xErZBVq023qCJL14r7/F3uZHIBs4gDYU/0fZ1LjP
X-Google-Smtp-Source: AGHT+IGvbF/byQknZb6N80Q9Lh4kdld+1bFxsz4P0/QJgof/Fo/fWclFfoLJXhcr6zXEd2KDjmKnkw==
X-Received: by 2002:a17:90b:2587:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-34733f34e52mr40043250a91.27.1764599496039;
        Mon, 01 Dec 2025 06:31:36 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a560090sm17186239a91.7.2025.12.01.06.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:31:35 -0800 (PST)
Date: Mon, 1 Dec 2025 20:01:27 +0530
From: Atharv Dubey <atharvd440@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rafael@kernel.org, lenb@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	linux-acpi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: acpi: replace manual zero-initialization with
 `pin_init::zeroed()`
Message-ID: <aS2mv2jEsTT4vK_W@atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx>
References: <20251129122753.23022-1-atharvd440@gmail.com>
 <DEMKDP6SAN8X.2W77GYK34BQX0@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEMKDP6SAN8X.2W77GYK34BQX0@nvidia.com>

On Mon, Dec 01, 2025 at 12:36:22PM +0900, Alexandre Courbot wrote:
> On Sat Nov 29, 2025 at 9:27 PM JST, Atharv Dubey wrote:
> > Use `pin_init::zeroed()` instead of `core::mem::zeroed()` for initializing
> > `acpi_device_id`. This removes an explicit unsafe block and aligns ACPI
> > initialization with the pin-init conversion used across the Rust tree.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1189
> > Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> > ---
> >  rust/kernel/acpi.rs | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/acpi.rs b/rust/kernel/acpi.rs
> > index 37e1161c1298..9b8efa623130 100644
> > --- a/rust/kernel/acpi.rs
> > +++ b/rust/kernel/acpi.rs
> > @@ -39,9 +39,7 @@ impl DeviceId {
> >      pub const fn new(id: &'static CStr) -> Self {
> >          let src = id.to_bytes_with_nul();
> >          build_assert!(src.len() <= Self::ACPI_ID_LEN, "ID exceeds 16 bytes");
> > -        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
> 
> Let's keep this comment as well.
> > Sure, will add the comment in V2 of the patch  
> > -Atharv
