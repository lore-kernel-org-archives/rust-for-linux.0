Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D4F5FDA7
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730686100; cv=none; b=KbhWxFZb65W6oN1PFGd7V3kuPF9WCF+BhXz9uoqRVp/u6xGtkbDKk1xuFlhcBGlRZzLzmfamE6pQC1YPmp5YLSHZQmLP98850+Jl9ex8cBA0mkygSuRbblHEfEHaj7WIgtY5dvfNfbNuOs2NteEoKKYIvaJrgiGia40UmOhS+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730686100; c=relaxed/simple;
	bh=K79ICLAKJeAyA+RuI4gXUn7sBFovfz5mY010AXQmmVM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XtRcKqwmeelvuyHO12SDE+pLBjm/3rMgWklaAfx+KgPom36wRWpo5iKnwcxS/0pIjt4cWXtXEsEnLrjqvXwXehY6Ka6rvMBEr2fCl0kaKp3bdjZPECA+/epR7bbrvAVdRFwAodMuN0Xsa4yx32dSonwBHRKq9+DEb07pyMKRDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIwYoXs1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIwYoXs1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-720be27db74so2291189b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730686098; x=1731290898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K79ICLAKJeAyA+RuI4gXUn7sBFovfz5mY010AXQmmVM=;
        b=dIwYoXs17TFTLNucmP6DWMPEQb/8CSDPm270H4XpU2qXlNMPrExhMqQKLGQudjBMem
         WZdbNUvuISRypgcfcTPjSVO0+7G2cEsYPcLi0XE6dwugWBs6iOltchMJgqgzDg59LRV3
         W4xDCMVzJKmhQLVutGwuv3CwPDDc8YFWBlbkcmYVcSat4rT4CiNUR+RnpleDXRhsvxok
         S2jGhoaG/QOGUBCbPsHFb4pwTlGMJ3T/Z11xLnxsIDGFG1daR7UxCRJbdT40EmOcVPNy
         fsyvBoo/LBtbWrcDMhG87kaDWnKrsvgUUUyhLds5wPfM1pdPdegR/Vj4SV+BK0d34GAx
         IGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730686098; x=1731290898;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K79ICLAKJeAyA+RuI4gXUn7sBFovfz5mY010AXQmmVM=;
        b=gi2MMg8bZYCK+VJjCE717EXo0FjPJ6c/qNvjvHR0ynjhLwGWeLE9q+cdpmzLxeo9ls
         ldOLQHtEvE1yXkXhBhE5AFrkyLG4NHP5wIRHUdLITPOtRH+iONoef1MvJ+Ac/dm5sJfX
         atBZE8UgHzvGIpXoPok255lakRz+1w4tml5Mqpqeb9kp4G89wiTf0b0RCvHX88w6pog3
         mThdSZ0WIFNz4OJQGqcXGtsTfOGzuF81RygEyTvq+Pgs9JkvbB8I8X8S8YVHYbqibVSm
         HoOjv+PMvJw0ER2mI1HeSMU6QoDEHg7hbSGjRggb8aG5Ni8WUzUX4VAgt1qJPUqSMlBW
         UUCA==
X-Forwarded-Encrypted: i=1; AJvYcCXXcEdeYDSRltZa346RuY9M0q4tEUMhhg9M+StdldZbA3AH46yNw8zgnxx1NYN63X+1Y4vd9eloZP/x2GQZFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLSogfbU+HV1ZoKOfAsIYs9ByYa7AY1naYGYmeWutUuNZtwij
	Rf3xdosy4FNmZ1ID4EAMm8t+VCjx3tt56yEDYkMNqAv4iCwDUr3t
X-Google-Smtp-Source: AGHT+IEq1HxslQhf9XuMZUz/OSS3Yq8BbbwX/Xa93cXwVkkXlBkVFgSHhVlo8oM7v539HVlqX7upKw==
X-Received: by 2002:aa7:8fb1:0:b0:71e:4798:8753 with SMTP id d2e1a72fcca58-720c96602d8mr14810917b3a.6.1730686098247;
        Sun, 03 Nov 2024 18:08:18 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ed31fsm6274889b3a.79.2024.11.03.18.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 18:08:17 -0800 (PST)
Date: Mon, 04 Nov 2024 11:08:03 +0900 (JST)
Message-Id: <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, jens.korinth@tuta.io
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
	<CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU3VuLCAzIE5vdiAyMDI0IDE3OjQxOjU0ICswMTAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFN1biwgTm92IDMsIDIwMjQg
YXQgNDowNeKAr0FNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gQWRkIFJ1c3QgdmVyc2lvbiBvZiBwcl9bZW1lcmd8YWxlcnR8Y3Jp
dHxlcnJ8d2Fybnxub3RpY3xpbmZvXV9vbmNlDQo+PiBmdW5jdGlvbnMsIHdoaWNoIHByaW50IGEg
bWVzc2FnZSBvbmx5IG9uY2UuDQo+IA0KPiBIbW0uLi4gSXNuJ3QgdGhpcyBkZXJpdmVkIGZyb20g
d2hhdCBKZW5zIHdhcyB3b3JraW5nIG9uIGluIFp1bGlwPyAoQ2MnZCkNCg0KVGhlIGNvZGUgdG8g
ZXhlY3V0ZSBvbmx5IG9uY2UgaXMgdmVyeSBiYXNpYyBjb2RlIGxpa2UgdGhlIGtpbmQgZm91bmQN
CmluIHRleHRib29rcz8gSSB0aGluayB0aGF0IGhpcyBmb2N1cyBpcyBvbiBvcHRpbWl6aW5nIHRo
YXQgY29kZS4gT25jZQ0KdGhlIHRoZSBiYXNpYyBjb2RlIGlzIG1lcmdlZCwgaXQncyBlYXNpZXIg
dG8gc2VuZCBwYXRjaGVzIHRvIG9wdGltaXplDQppdC4NCg0KSmVucywgaWYgeW91IHByZWZlciwg
SSdsbCBzcGxpdCB0aGlzIHBhdGNoOyBtYWtlIHlvdSB0aGUgYXV0aG9yIG9mDQp0aGUgZG9fb25j
ZSBjb2RlLg0K
