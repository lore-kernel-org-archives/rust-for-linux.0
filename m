Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301E2E3360
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162367; cv=none; b=IuYJHVG24QhZIaZ1ccx23zG0Yfvely0y9SXnD5WtatM6MVeWxlZaKJSBlAAVrj3qCIqQhlys3Mxx1Dsx5S0S5SzdisR1w/xw0SpYd2SUzU6bJoS8W2WcF+l3Z5yMoHVPawxD+DrvUBORBfWK/rVmDyHEnY4Ie5yY3o8OiUQ1G8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162367; c=relaxed/simple;
	bh=xRXpkNhg+ohP9mY5AAV2icew2EWw08lraO33A2quezY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jDPzZ1XQB1BMT5NcTmH6aaIBG5CXc70BpTBwvMf4tYRPBwcKYzuzKthglvLQSzyuEi7WDo3B/eTrU+Gwq/OH6N37vqlJdNS3nPFGgXOPtnQCSknATleRudreX8VYYkysy9BZ6CWGJdCEqeLrlbR4GukB3kgMj8Fk17MzMwquEA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNXHSjMR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNXHSjMR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43bcddbe698so5574055e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 00:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741162363; x=1741767163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vsdDPGRMveuEnRMgemGR+mHgTYTLTWjy2LAEpszAaHs=;
        b=SNXHSjMRGixGORfcrCiUDdPexQGYveMHGpK+L3X1C/dUmmCIJFxtVqVI5MAXvZMOIa
         jA6bOTLfQW1JsrcuEyUHFclI8M+11YnR13i1q4hGXo9+7wcr4c0p7RNqkjpyzCrXrw1O
         RjPUo9DNoQJkGMDSqaV/2sZnLszjschWE2tp0NAHndsk2RPhUD7ueBzcvUlbCdfWcs7c
         nU5Y8ksgOmpZ+YeUzUcRz3zVwkAz9AUd8D2NqvpuOlXWj5L8j/PXpQaeWmUvsOx5qAKP
         JuVKklWOTj0FdEfGrMQTyGxJkOloHHSQhfkZLvfyE3xmbKXH52G7Php6rU6ZKnpfr4X/
         Q7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162363; x=1741767163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsdDPGRMveuEnRMgemGR+mHgTYTLTWjy2LAEpszAaHs=;
        b=u9ZW9sBrKvfDQlLUyHyU4N2TpGt6o8IDeB6cUv6tMNNe2UewNuX6W+Mh/AL6R32Duq
         BxnN0+aRm1fxcrDG12iNbN/9FZl3XZDTEJe4TNjRAUWntDPIzk6zq/lKRVOvpReXew6L
         D/ZtghPmXgGcmmKE7qBaP3iChDzIBdH+XNF+nXLGcnqx8oB+teg5NbIXuUbqt7i09ioA
         A9j6vIBErhc8Nsg6wRTP9blGGHUQxPfFaOyvwpsnmkcvQ0yGkoGrykADVYYjayEcLxUG
         ViDy/gtRNydQoMXmMa1PGQf0I+4bvXTJ0pbHvJ6gxJUHQ1h3VbI83dPvlYC96RePw8wo
         XIGg==
X-Gm-Message-State: AOJu0YxZoY9Z4Kcg4AdpZ4c0key0WgJvjihe6GJwjgS3oSqK2f6tZVpI
	yOycalvMoCu8fOh9qce9oAlIDdQM/0VQcWkO3tWdFJ/HFtAoU0KbBzbvOq3/at9evpMDMT/HV56
	JQaLxFrflH2+atg==
X-Google-Smtp-Source: AGHT+IGKsI18YgIBiDGLRjQcyi5Kl2ksd1YvDB1oNMxt6Wgj+mRQwLl/JLvW2jgl0cNAZfk6j3dMw2IG5RyXtU0=
X-Received: from wmqd4.prod.google.com ([2002:a05:600c:34c4:b0:43b:d46e:7d80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0b:b0:43b:cd12:8c92 with SMTP id 5b1f17b1804b1-43bd2ad7566mr13374225e9.31.1741162363681;
 Wed, 05 Mar 2025 00:12:43 -0800 (PST)
Date: Wed, 5 Mar 2025 08:12:40 +0000
In-Reply-To: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
Message-ID: <Z8gHeIe-1AkhnNgO@google.com>
Subject: Re: [PATCH v3 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
From: Alice Ryhl <aliceryhl@google.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	daniel.almeida@collabora.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 05, 2025 at 06:34:37AM +0100, Dirk Behme wrote:
> Add some missing intra doc linkage `[...]`.
> 
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/types.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index c3dc798221dbc..af30e9c0ebccb 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -271,7 +271,7 @@ fn drop(&mut self) {
>  
>  /// Stores an opaque value.
>  ///
> -/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
> +/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>  ///
>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>  /// It gets rid of all the usual assumptions that Rust has for a value:
> @@ -286,7 +286,7 @@ fn drop(&mut self) {
>  /// This has to be used for all values that the C side has access to, because it can't be ensured
>  /// that the C side is adhering to the usual constraints that Rust needs.
>  ///
> -/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared
> +/// Using [`Opaque<T>`] allows to continue to use references on the Rust side even for values shared
>  /// with C.
>  ///
>  /// # Examples
> -- 
> 2.48.0
> 
