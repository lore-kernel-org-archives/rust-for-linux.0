Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776521CC4F
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004819; cv=none; b=etNvJDBrtq7ExCfer5dzTen3wHyO5cna17I70PF/PnxDRUoMNcmDH1zlM0b1wpJt3ArcFGEuZnEdmZGszTnaEGUVkLnkhsqyc3l0dokKs6P60X5uY7PHEFwrONihOap54JeNU+BjDyAnh6MuXQhVmkwYEOfi9978Qs8Ti0Ud41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004819; c=relaxed/simple;
	bh=AVEzK1PWr2c4WZ3AbuO3r3fSKBSqH07bVkH+rHQUrqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qiv9M4o6F9iqP6pMlCFwJZ3N/vrIv5Ycqg+uNd6EqqYCKpNe8UTapTOA5dPZY7LeV7dWkfZqEKJxpotTMEcjpwa2LjMOS45bVtigw8eqbqm/P7vgTrBJMrbPh/rdfVDHY9I5cVuQjlpCr1rYZen7oHBKtkw0GfmZNohmCrnPSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t7yElAxE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t7yElAxE"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-391315098b2so2073889f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004816; x=1746609616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVEzK1PWr2c4WZ3AbuO3r3fSKBSqH07bVkH+rHQUrqU=;
        b=t7yElAxEpb2DK6ImMDP/9m9hOYR1GxA7iBPossvLxDtq4MaIBsnjlquFyyENVrS7Ix
         5FLGP3Ha0PIiTlHmJkEsQNYf1Sdi84j+tay89tYyxV+hk6xtnZ/B/fIoImxgmVGjFS6f
         JoOr1fQ/bRquOTFap95XbXKDGBtNqzYLmU4zoVEVo9+wNRZ6bdrwBftrYDxq/9LhcRQc
         tXTy+PQ4JFlG2AGQTV3B8/8PJ1w1MFazjcvgMy1zQacsYnkKa+A33FG9hmN6eqv8dXaE
         9TfckXF9McUiNVzSm6U8nQ4Snk5d557yN69pLBPH7A0HoyXNU9vYPGfWRbLxdsepf4nw
         krfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004816; x=1746609616;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AVEzK1PWr2c4WZ3AbuO3r3fSKBSqH07bVkH+rHQUrqU=;
        b=ROSCOMBuAy7DfLaYpMcyMlTe5PSRwKczR6J+1GNNgY0YAe8aAlWXvBUcVV10qhWnbY
         tQKjWhG2NyZI5Qcvq9a5Sbpl1O6u/T/IfLeet9sVzPm0OtymZGWCRxzsJfdjicethZ5R
         ok+qbk89K8sP8RsE9bzzOQkzzYZGDxTojvAMBY+GMhwB8kbFtSzaDCIFPjtCf3ocdaUL
         rIG7/kacwRA49qQ9WgojBAteFdumPYlk7gLgHq0ywNgGHae+Ot9YMxOxsGpNhdvo8QdC
         XfoNsse8bpF76UZ8s33vMftmOaBStLTO68bD1zQJ5FaVay20u4KhiPwIBJyp5Gs1Ju2x
         97GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtgLz2H3prq8c7LRoHOhcAyJTVlYO4vUt6gd0mG2xLZPhk6nFbVdHjimgxmjhI9OvrD168VVXx32UohJKXSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCsx5WoYZwSGYRFFLNvpD+bHTW4sz1fKgCmTkHh5OwDCn3ZDjt
	+Q2SY4dhapcHlntTC2oO+VLg3nZDrBg3sSaKD6nI2cguM3cFwUs33ODjXGWn+cqhE+mUVUETo6X
	KMrXODFGVY8dNsA==
X-Google-Smtp-Source: AGHT+IGoHxc+2SZHxc4L0RgBBwirzugsV5s2XYZKFutlol1D8M28Mep4MPuTr+1AXPcpMDInTumbJB61uQWaboI=
X-Received: from wrbfu24.prod.google.com ([2002:a05:6000:25f8:b0:399:747a:bfb0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c7:0:b0:39c:1257:c96e with SMTP id ffacd0b85a97d-3a08ff55599mr1167194f8f.58.1746004816651;
 Wed, 30 Apr 2025 02:20:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:20:14 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-2-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-2-fc8617a74024@gmail.com>
Message-ID: <aBHrTrdY0dnHZgFb@google.com>
Subject: Re: [PATCH v2 2/3] rust: implement `Wrapper<T>` for `Opaque<T>`
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:36:12AM +0200, Christian Schrefl wrote:
> Moves the implementation for `pin-init` from an associated function
> to the trait function of the `Wrapper` trait and extends the
> implementation to support pin-initializers with error types.
>=20
> This allows to declare functions that are generic over `Wrapper`
> types.
>=20
> Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
> `pin-init` function. This is currently the only usage in the kernel.
>=20
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
