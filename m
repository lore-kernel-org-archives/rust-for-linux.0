Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B959192D8E
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810140; cv=none; b=OyPe1z5us4n53npeGpXotCr7KOitpkNRwSOSGy6IW3exY2fjomIgIzMEUNNSQT6sxzcmuFlL6Nl4lVkrKFwe5tV2Y66l3u7OodBirD7T7A3+Qj1nuKWJ+PBLS/e997xFo9hFLeFZjb+qdTDoE+KffEvPy75Q0Jo6++/aKzJLjpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810140; c=relaxed/simple;
	bh=ZVJBGbbDNJ4zOnp9Im0juKuDL3UdrCHlHhesvSkdjwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WY/vz+GRzZ3dcJIRGzvB2UUYdSoDSWuUzNH9/6uvXCJiGEDd+3Hn1/Q04HNojEus/Owu1pGMDTf/e/2XbxdlX4PnYQbJmIVCSYdTQUhzbpT51Mo8iqFOJY7TBjUhHx0+VPpfteuDKsxIC3mUowYGE3m/6KsYc0PwJNtpOdlvgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DBQOtUYH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DBQOtUYH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so32605945e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744810137; x=1745414937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u81oNAdu49vrXOlbtVMx6BBHkvoR1t20Iu3dXwAhN/A=;
        b=DBQOtUYH5V5yK+TvOL/yhmBeoj3qzyJi6ORz0NuNNB7OK0uvdwU8/BD74p082lTox2
         tF+KdAnDDuRMF3+I61bUz/vIVRGCKjzZ495HAWLip829NtQ28sFKgdy0oQskPF4ytoPD
         NyGtGAaaSveIxh1LvMtmwJb3tykdifBDSxfJoI8X3WdKQLERnZeUFWvpiw8k5z4WXqhq
         hkw2SJ6NE4MzLkLrWvPuc/6qDS/5VOZQPiSBG1t27936xccJW1u1HORldAs98pdB95/I
         p7MfWpZekPwxle+ZPMeUHFRobcDGdGJ47xyXwAvzzlGiyqmJ2IMlqd4/U36fyCpwk+n4
         7sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810137; x=1745414937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u81oNAdu49vrXOlbtVMx6BBHkvoR1t20Iu3dXwAhN/A=;
        b=Kx9NjcI2fzzOS+O0qsNSgN8U+ZNAc7D2v4GvvNCdebsShf1vpoeThg2vkCuQwc9U3D
         DIfhavfjkxzH+vXMvKSQm0LNzjLUbB2iG8nOdY5P3LuO/p1wutc+clGpqGxPDTZo9DAb
         QLcwn1DLiS7uPg0p+I6hXAEyqDipfTFz08jwhqZXnrdUnLdbcrcoSPfv7FKXYnMjM2o6
         eu6UQOrS7c8vQEzspklVM+G4wJ92hck+fHBhR/ihEqk+gQUT8zJmN+8g8u2B6RdKulFH
         of+m/EQAfcTVSSUtm0DJH+U0OKlfp8JZpgzIYD+mNrumzFXIqtpovEMDCeRONQbRd1KX
         oNOw==
X-Forwarded-Encrypted: i=1; AJvYcCXxmdwC7Qz4bOmTJlvVrjZrfnpsaAy1vuhfDaJ7YapsUnzBqNp3VtQmUL2cBIiEVhPSodhXBvE6ZYqY71Xruw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoX1PI2vPD/PfPKdFWzXGlvG2BDQ3a/uIzYlP6K/+Uw5h4awUZ
	N19qcTB9twZQryjWJkFX+SOk1SUMsVDta8M7c3weJHiQzHv5HFggZ1UtpfXWr1UXu8R4EyomdYn
	ENLg7/fiu2YHSzA==
X-Google-Smtp-Source: AGHT+IG9tHRn4kQG7O4PYIe6bQiZU/BwZMZlgMYNzuNvEr4SHrv8sdo9mrdCS3klZTLkNKvguqHeCRRXkHnjB4s=
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:440:602a:960f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:21c4:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39ee5b8bd00mr1589935f8f.45.1744810137500;
 Wed, 16 Apr 2025 06:28:57 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:28:55 +0000
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
Message-ID: <Z_-wlwaiJNsSZbCC@google.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into `Vec::{inc,dec}_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 07, 2025 at 10:52:30AM -0400, Tamir Duberstein wrote:
> This series is the product of a discussion[0] on the safety requirements
> of `set_len`.
> 
> Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/ [0]
> Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance@gmail.com/ [1]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I'm still wondering if the divergence from upstream alloc is worth it...
but the code is okay.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
