Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE82FB966
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217126; cv=none; b=IgxMp6rh0MdB9UOOseb0uqHJbnbgZdjXz6jjOm85FrBoq0jDlSJvUKobowuy97/jh86XQ93ojXhtnS15NRsohe2wPpoL1DvX3BDJHaHsMibwQU/McccFgfrBmegtFfe9zQCYGuCK63lTAL0KcuZfKw1C8hpezWEHMyLILkXyol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217126; c=relaxed/simple;
	bh=/8FfLimdwTSQJKMzq9wL0PSXBLCeaEIcv6Fh1DDZFns=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ObnJNKTC0cGK5RY/qsDB8Fsu+JRPdmIKeha7a+LZ4MH2Ar0u5OnwTpr+zdUAMNdyYjicyMmOajLYluvozx0252sKkp8xGm+8tOqmrPLQn03PVFHjbrolA5eW9D9IkxxvbasgC1cp8rW473W5NPCmn9FfCXjzhROlG5PH/wY/V6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezzk7vGd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezzk7vGd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so761892a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217125; x=1761821925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8FfLimdwTSQJKMzq9wL0PSXBLCeaEIcv6Fh1DDZFns=;
        b=Ezzk7vGdj9Q/BM9+QBwGATIZ0/N/rwd0R2F/7pVerZtpw6rfUGttNRyIvxG+cZFkY4
         FqJSwW/SuUpfjEHbaNbz9LFnq870MUA7gWqsOTnVTDwsuLZKvxJZcL6dWON2edA/haKp
         A9R02bRhfe6i3L+z4p5bGaB8Iv/emXkngX3m4Mqh0FhCYwDdwAg4TZADwUFf+1Eltm8u
         vBUjBsawxnczTfgOv+7CUp8eFP3obAfn7oNGZsPtHg+R9NAExR9uv8ARaTcziqN2HW9O
         2G29tMHzQsU+L3q7rGIicYETEztdIrU5DXELR0mZParHHVYdPL8bf9thF2eqTfi6xIHm
         9LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217125; x=1761821925;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/8FfLimdwTSQJKMzq9wL0PSXBLCeaEIcv6Fh1DDZFns=;
        b=RYqyUIiBbXy3bL4iZMh885hNwM03fnsorDJW4aMNUg+n0dBOfZ43b+gg9OwWjaKmSU
         8t/rolkVnjSbFQpIoTQlJddDTX/QePYAFv27CGlpzAXsLLL7O9OqWCF4MJ3f87p4MtZe
         agFetxurPgXb4MsnUIUvU/uXJfAVzkER+w0pcsPWv2VK+6so1+A9YKCB7IaEjArZj100
         Ed76X/p8pYXDXLHE9qo/doQ4N6NJR+eG6FxM5sc5V/eyFYTkiaqNEpBuZkVelZcfH4SK
         ZBcDlCouNBgujP955WrXqNAW7I1Sqw+ROfaqx8xX2FInk0SMyFO56jDUS7OxeCtwo721
         OiCA==
X-Forwarded-Encrypted: i=1; AJvYcCU0K8poW078HkBNLs9pxbQr4+6aummCngB5JcblMs6boAk2kB7C2wPAc4KRqrnekPKWQGb0zfmjiPE9uxQDoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1RjB+kMkZp43KHC1DTgIgMf47ZgV7tixYmfDCbryWs0/3InY
	xK/kY4XHxoqJWQzHMYJ88da5Hk7rD73iEiuOXcq6cp2yXe0BVjCaFMBk
X-Gm-Gg: ASbGnctucVVUmBsvwl8YJmZs+cyz5jJjv7VjA50D4HMC8z2Cfh3WAbLKX+1QybwkIRv
	OU5YGoAkB+qjWbggqe0UFJeiXZMxFcsD8p4cW/rRL7fx2/5cYUUmKzg3DRhfF2nYtAeeJmWD7n5
	ev3Th1OlQWseyXt/tcs2BTBmLJDaltjQmKpseWXNLwnDQJNdMYjCv8jleMectUW2TyLX3/hag/I
	fNTOsMFGilTGQusv0IG+FVTm9eQbpiMsfUmTJLFZlT8Bjy7gusiBuJUURpzxzzIDjekRhmgEcTu
	pitfDSui1uhllXXdn4FMjAXkV8XRKoFM0ANttYcc+l/eQt5BXcTEUCn79GcNGR1wagUT4fIeq2I
	Snc1wK5VCcD2nhQgZfBHPYphXV94zS7qL7hQ8K0ssyk9Dzk2rfmC3FM3hqcZFYnCRiBbUGi7+Py
	wVOv+w/TIoQr5XDKwyHwmPQP4SrP+cbo/qOPJIbYPCu58AjKLjFf6ZlFOB6mM77yIgL/IK7KRNP
	eM=
X-Google-Smtp-Source: AGHT+IEtJtpkQDQZMATtX5gEoTyjcU/SlVNaxbFiH9+cQdwIt/WrTow5bb9bZtmwCvX5K9H0qTyrIA==
X-Received: by 2002:a17:90b:1801:b0:330:4604:3ae8 with SMTP id 98e67ed59e1d1-33bcf8ea23emr29132041a91.21.1761217124762;
        Thu, 23 Oct 2025 03:58:44 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37afesm2027630a91.1.2025.10.23.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:58:44 -0700 (PDT)
Date: Thu, 23 Oct 2025 19:58:33 +0900 (JST)
Message-Id: <20251023.195833.1671468354093515571.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, dakr@kernel.org,
 daniel.almeida@collabora.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1] rust: simplify read_poll_timeout's example code
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72n6J16yyPdhNAzDn0LXVBeiaZBcka9WztaZhqMF16CY-A@mail.gmail.com>
References: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
	<CANiq72n6J16yyPdhNAzDn0LXVBeiaZBcka9WztaZhqMF16CY-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCAyMyBPY3QgMjAyNSAxMTo1NDoyNiArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUaHUsIE9jdCAyMywgMjAy
NSBhdCA4OjEy4oCvQU0gRlVKSVRBIFRvbW9ub3JpDQo+IDxmdWppdGEudG9tb25vcmlAZ21haWwu
Y29tPiB3cm90ZToNCj4+DQo+PiAtIERyb3AgdW5uZWNlc3NhcnkgUmVzdWx0J3MgJzwoKT4nDQo+
PiAtIFVzZSAnPycgaW5zdGVhZCBvZiBtYXRjaA0KPiANCj4gVGhpcyBhbHNvIGRyb3BzIHRoZSBj
b21tZW50LCBzaG91bGQgaXQgKG9yIHBhcnQgb2YgaXQpIGJlIG1vdmVkIGFib3ZlDQo+IHRoZSBm
aW5hbCBgT2soKCkpYCBvciByZW1vdmVkIGxpa2UgdGhlIHBhdGNoIGRvZXM/ICh5b3UgYWRkZWQg
aXQNCj4gb3JpZ2luYWxseSwgc28gSSBndWVzcyB5b3UgYXJlIGZpbmUgd2l0aCByZW1vdmluZyBp
dCkNCg0KWWVzLCBJIHRob3VnaHQgaXQgd2FzIGNsZWFyIGVub3VnaCB3aXRob3V0IHRoZSBjb21t
ZW50Lg0K
