Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EC335064
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519356; cv=pass; b=ia5WJb9HMddwB6aX1lEfeacCKBGqDDuSsPK5VfruL43+ZVdLfiX+7X3A60Jmp3EUKdn4MayNL7uEVAWhiaCn74YKsrpPIHcStxAxfh/kRItsxB7rxcqW98hyzfZjeUf2KLN3jvLzY+pvvHcsNMpOZ/c8iqwP6VmsBWSopDq3RVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519356; c=relaxed/simple;
	bh=1OWmAlCrAiGPdgaQw9eVnry7w/6dx5rfkFoVZ/smTl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWSJcpESfjZEpG3MKW+Ysls/oldtEFMOkEVf94GnlNyVsyr5INw7Yq9MSEegvqoUWhuSIQnV7w/En0065kboR4ZqU6xVUeJpqYnI3pjZM5e4dUxqzU5jPCn/N9yPjVTfECbYOTFc3Q8lDQ7nxIPA7xThEvj76+9VVxB4mwuq5HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vuY4EjZI; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vuY4EjZI"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d864c23bdso319161cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 20:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777519354; cv=none;
        d=google.com; s=arc-20240605;
        b=DsMcO2GD1GoG0USuY4VezBQ8JZLre8njpt1rWNSSxP1kV1gsDT0kcKbfpqN0QHG0dX
         iT9eOPdlnvrcBbHSUo2qkRapFXOWCgKXFa11hD9ppHLUavWxNZcYLfLSt2uL0cptzEb0
         Nrpqff29PrSMQjNXrqlMr2hb5aFUnc2ZER0JR5LUepYOkhE+1vefvPjec/vn0zazoP0g
         /0rXB9asPn+Xgvu8PssDlodnsl3t2+SrlIwVmjSa+TeaN/JebZahH3c7Qbk5GgymlKDF
         wbx7JpE4DSnJrUxY0+YoPkZh96Shqw4BOr8C/3vBF1CHfpSJWxWGRADcb2cTXne1TKYS
         vvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1OWmAlCrAiGPdgaQw9eVnry7w/6dx5rfkFoVZ/smTl0=;
        fh=qZtUc4OrBoTKVlU1x5U7ups0nah9yAXcZbb1kkPkoTY=;
        b=BNMtrCayTmRnIm/dElrLa1YHHiAL6LtzVGeUtjw4RfMqi/1RhMJ712dF9JStbkAV/D
         9Ftd0ScrYmOo1GEFdK5HmZhlTDwFtgVain3X1/fnn4+P+d2VvpcM0ET0eF0YGq7DRMBh
         i/I//EZmizBgMK9IUmfJNWHvSt2kBvE55Hv1XayzP5BXyghvXnFSf3OJFLATDm5koZU6
         kuK7JO43w0AVpP3BuQll0gj9U9nNcVgwkMXp6G++QPSnoGgHPHQRtGgutwgKPdkP3t/+
         DoxbAYuBGKetm1YBEwnWnLBgLXMUFhZwvGvabSEAKHh8HFlBOHd40TDx+ZrrrBkKavb0
         /gcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777519354; x=1778124154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1OWmAlCrAiGPdgaQw9eVnry7w/6dx5rfkFoVZ/smTl0=;
        b=vuY4EjZIm9kzn6afnEorxbw8xdOOTkgAOfTy6MKk0kZRXrj5IOKfpaIvg9aq+lwAb8
         mGa0OBj7dnkQj5ewQiNhV6FS4JavH7fvMFXo4NFmZwy0sa5p62VtkSCCYCp2DyietKwU
         3f92jV5cVe3c/SZSPZu+Lb4BQ0xyO8Mxm9ywNwjrZAY2lVDKmeFnHzvNF9DJRHM7UAck
         selL910fYbxrsjr9QZBiPq8JN2ZoJWB4/x/NsVHNeJ2t2tFRcyL+7YQYs1n7gn7G5b4Z
         YAcUbvVxCWN2bvxzhojsNscSuDruObDVl60pT0exca7k+MiEA4Ah5KcIUb5/sqbqMHG7
         XVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777519354; x=1778124154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OWmAlCrAiGPdgaQw9eVnry7w/6dx5rfkFoVZ/smTl0=;
        b=amQ2pX7NsAoknbA0EdsbitSLxyPyjzdL+DNzWnMkBJZGupslhkdDjGw/T6W6NrqacZ
         cEPtmQc1mcVLHZiyXuEjO0qA6KBGYZHGnljVvHsyVqcHIPiDnvkYJdfQuL3uBCjaBD0m
         4WzzJDNpK5Wb1/0VPqPuV9TiEGNTdi8HeOxHzEgn81UI/BhwO8xwGjd50jdX8x9IlkKJ
         6d+Nz2v/7f45SIpTbWBgN5hXZrCT37+gSCDWRO2mfm7UaKr5WnmIaUQ0udLiUuZUxPQA
         4CNCm2fdok2x4kN9oz6i2YVwAxqBmOYzQmOs5wsOQmgk8d/Uk38HI1caqu4UFDL1+Kas
         iqrQ==
X-Forwarded-Encrypted: i=1; AFNElJ82AuzS6KYO7y/MvmYPOLwIQdn9L1QIXJDkxN5GNm5Vfu4E1yzy97tgG45hqhjT+YOliCwt9Z/gKRiioz9O0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ifhTDWpXWkqClNrHfC9H7t/fDUvd8+fIbYfr42YXf64yYGj8
	5lehC/fJiTanapP9ZJZyk+HXVo9m2udwfeno6ALHyYonMylyKd6y2lGMkDjxmcxBxKBrONstvNz
	Ih2FSbYglTk1/cNcRqPsUC3qOGrMALMM7Pg2gLQgT
X-Gm-Gg: AeBDieu6MZXHKn7arOZ7cgb6B1XqhEeHVy3+JVoU9JF6shD2Yyba8qByOS3G5qKCyiF
	T43T/M7cBJrwKDKIsFSG4DByCKB0AG2bDVm9gb5MU7ynkxuPy2oki2Sw8HgCzlazJYgphsFXP+q
	wAiApDQ5lNOp/82+kmefvZppg1RVK/b4oBzV99Q9OsbqgMkJV3GwAwEnQeos8fy2WDRPdEWSwip
	YzwxMeseqeKwXyVX3nlJlEbYQxzcAZYlWffSADv5wberWZxRPd29BwkQcc4mMgmUeuKinmyGmq8
	E0woUOSW/HZyYoax1a4mGn9Y0oJ2DUtne19o3xu4D9nyT3BpZ3MKumYw6Ui2aA==
X-Received: by 2002:a05:622a:296:b0:50b:8d3c:5bd7 with SMTP id
 d75a77b69052e-5102a3f5626mr5372721cf.9.1777519353198; Wed, 29 Apr 2026
 20:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com> <DI62AHDXLAWA.2ZM8JKWQALKAU@nvidia.com>
In-Reply-To: <DI62AHDXLAWA.2ZM8JKWQALKAU@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 29 Apr 2026 20:22:19 -0700
X-Gm-Features: AVHnY4KytIaw0XfYJx_3CifnvPO_cbAodLoAu9gWKUcC0jQo7f4W3tL1ObihM3g
Message-ID: <CAGSQo01-EjhXTc+jcer_5FJMwQ4cpBtyHDoCyYR7dOdXKfUFHw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Support more safe `AsBytes`/`FromBytes` usage
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"

>
> Do you have plans to carry this series on? If not I would be willing to
> try and drive it until it can be merged, as it would be very handy to
> use in nova-core.

If you want to drive it you can, I was not pushing on this because:
1. I received no feedback on v3, so I figured it was in a state of
"good enough but in need of a user"
2. I heard there was work going on to introduce `zerocopy` as an
additional vendored crate. If that were done, this patchset would be
mostly not necessary (we'd need some of the bindgen tweaks).

If you are aware of something I should be fixing about this patchset,
let me know, I'd still be happy to update it if there's something I'm
missing.
