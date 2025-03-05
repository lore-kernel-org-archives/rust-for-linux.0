Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1981DFDAE
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181541; cv=none; b=N3gLpoqD7tuE5g2WqWVkYSrDb4sneIyHk1qeezgantNUZghQOcP+DZ3IDY3F+64AZO8dvzdTsWRkxq9e+n4Dn6Sy6CSuX1JmShuzAYlo8WMYUFm0Pl1pKYR2d1/TbfUJvoM1FZAlaczbthzB/nLGTTX0OTEvcRuaxdgN3TGusJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181541; c=relaxed/simple;
	bh=MA/Tl5K/HzeGHY11yV+JGFQTHKF6NRYd26L2b8QqFyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RW1HDqEWdkX+raQdGY/kJWHp3+8n8MeQSUokogDOp5kJYEqyI6E4siri7otp/GRjHOWo/3AzT52WL1SSKiSGkAJDIx9wbRnoF2GP7Bfl8J7qRiWj+NyI9VHVNQzrWY8eMc/9ZvgZx2u1sfDme2kNa3BjA5h9s0k7xGN7CsiYxa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBkRY4SB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBkRY4SB"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39104223bb5so1753658f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741181536; x=1741786336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhZGVnCd1LrD1r7cIo0XuyDXMDAukxGRXDEbG9YaT9M=;
        b=BBkRY4SBFth7JiXR1NcIKNRPFp3Zbo0aw+tS8SJkPtCT11RxGZouVhU73Qr3AVcwZS
         CkeeogZi8PLjLQGh/GPFLtoQFRgJWxgCUMd1DZyhjJyA7PXU3Nl+9yS5y/In2aEdEJE2
         SXmemAE/W2y6ZD5lgWqrfrlrQDdMDuNoS8uOqcqVFHF1jPvUUlV2i4TeqzoF2K3bsIWb
         v5820P6avKywS7f0ThGy/B81G2HNDGbad20rEjITW5IYfKdvbnVufn7jdcTBkq0QQ2Li
         3D2YWf893AAV/xzPM0giFzWdLA0PTXMLEXGanI1+Q8cR5q+tCeGfWWRGX0TZXZH6WLp1
         dBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181536; x=1741786336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhZGVnCd1LrD1r7cIo0XuyDXMDAukxGRXDEbG9YaT9M=;
        b=g0jFGUrmxDdNaJXkRoZBJWfKmgc4D4spzXxAfho95zbumbF0FcZdO/r1vZuoHPXeB3
         DeBJNCqVeyOkYBzBarqMho0jGeyEKBB6MFAPPoMEx7zsLvSPQju4EuQ66A5h/7w3fdhu
         P9K8x/I2Xi7f4P5hqjvO50VjvqaoKyqUoypS0DuxiyDnTW8cSqSEe0bX6X0k23gM7z63
         4km6npoBIhFM5ZapXqTbjq6GDJ5OMzKs3Gt/H8BTO9B+9dbow87mUasvAKDIvLZx9fUR
         sOs/u5T1BWZ7uMPmHilpIYN6QpZd9c/HwoIllHRoP6948NlbfbODgl+XdYT+Fr/VYVx7
         0qLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQi8aM6YADcnBi5zFGob7ooEYh/XYzyqyf2TV44SbCH+aJchu2KL9W+KO/tmNW0019NLx4FHjpP3xswkVN6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhUlYJ6B1ODSZQeEPVHonxS4J/orOKH9+8oDjiwzjBmSWkXn4+
	Zsxg4UfRaWMqdDRlidLn0Em+gv97VJUh/jiVyiFRQkQ5svrXCdSwMHs4non940+lfoCcUX3hoF/
	hQTx+ATAhufYCnQ==
X-Google-Smtp-Source: AGHT+IGqv7w5ZYvUvIWCvfPNCsKIl2w0sI3jypHqC/lLiiOmT2zEfZbYg6IijEn1V2yDy4haEHjOc40D25h5t60=
X-Received: from wmbhc17.prod.google.com ([2002:a05:600c:8711:b0:439:8e3e:b51b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:188c:b0:391:23db:f218 with SMTP id ffacd0b85a97d-39123dbf45cmr901576f8f.40.1741181536569;
 Wed, 05 Mar 2025 05:32:16 -0800 (PST)
Date: Wed, 5 Mar 2025 13:32:14 +0000
In-Reply-To: <20250305132836.2145476-1-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250305132836.2145476-1-benno.lossin@proton.me>
Message-ID: <Z8hSXgC-ecXCEPiS@google.com>
Subject: Re: [PATCH] rust: init: fix `Zeroable` implementation for
 `Option<NonNull<T>>` and `Option<KBox<T>>`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 05, 2025 at 01:29:01PM +0000, Benno Lossin wrote:
> According to [1], `NonNull<T>` and `#[repr(transparent)]` wrapper types
> such as our custom `KBox<T>` have the null pointer optimization only if
> `T: Sized`. Thus remove the `Zeroable` implementation for the unsized
> case.
> 
> Link: https://doc.rust-lang.org/stable/std/option/index.html#representation [1]
> Cc: stable@vger.kernel.org # v6.12+ (a custom patch will be needed for 6.6.y)
> Fixes: 38cde0bd7b67 ("rust: init: add `Zeroable` trait and `init::zeroed` function")
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
