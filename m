Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D519EED3
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903709; cv=none; b=S/ghUKhF9cxkOjiQDLYMO8p6F/USmladtWpnlvu9DuKW02nsCZ0T7q5J4PYLbFCEXeBpSIcKeX7ry1QHcUJA0k0Q7MP7SF0AI37f6LTYY1ZjID8wf4MO16VB0NHZ3bdlP7+gOZnVHx7Nmko0oOMyKl7knGI2POEw92BROvkTI8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903709; c=relaxed/simple;
	bh=prIX2Ml4Uk2lRIluUxGMWiSiQE1mRANQ3jvD29z2FOc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SWenHcSKfrVVkF3vEh1r3F5ht7sC5v29jl1xhlUa0KOm5fYlzyA8faDD3MpIcjc+XCs7qJ/7qaR9f3yZmqAAJl7+nh7P/PzioE5Ho+RUNHLbP9YyFakpIZBIVyj0czHn1/edTvsm2ECOa0YHewYbxW6ztRz4xkX79xN4GpelkD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cY75z7Up; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cY75z7Up"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490ab3f6e55so11930025e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780903706; x=1781508506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OXc6FJiT6ubwQot3xfkqlsY5PhOBzdcU4pYannWwdAo=;
        b=cY75z7UpXkwfKFnFVzih1T3AwVi4T7T3Ai90fORkKDls9NkGdyzPEH8JH3J7w9iN/t
         V+KaOfMHCH/HLyy3IxfokKSR4/1dABrEGwRXLhMcNGoFT+e3FEM+pc36QaUmQDElbaZn
         fe6qGeadtrXhMgthUwLzwQXovmk8/JUuSl1KHR19XKDewuzLL0DbZKnyFnltRin46UPt
         AHgGMHvf8eiYFO2sgbrPphBtnkAeSiR8HXgHjdJ0C149dTkKI9HwMf+/boRhWMMYTbbr
         aF4/bTL4fIyzJrwKwWtpCVEOgzvg2YceKalO7+ou36+QqzKwMih2J9D+iKK0l7wNn7Kz
         kxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903706; x=1781508506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXc6FJiT6ubwQot3xfkqlsY5PhOBzdcU4pYannWwdAo=;
        b=UZDS0uJAtrGLyBZGROSNGpuocH66haJo6WuFTmlrr8fqELDNCFv/SK2Nn3YUv/ZLYO
         MfDNd2uv2LvcrW4FCE06NMOQkcgvPGYqjrRdO58dCd7AUYcvw0XO3vXATgnivCnjIpL9
         2ro0Me/osAIfMt53D3Hr7UnJSav6kyu7xh4IdcrjV9UJUuKX1mKnoVDKrbYfTZa4B86D
         vQLcqUwhS06AFFca7hI11GTR9S2ano+N+jb4K61ijNFDnJXupEcSgrcgoMPkSC/e+e1f
         mjDo+vO2nBg33RzFu9bQiiFVJ5/R0qzORWTUyO/YApm0KHYBu6eJ4whizbns0d4Ovgid
         A0FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uKP/tyskqLwy4Xc8yL66jpX1znTXubx/xc86Gfb4yfjH53UA0KtNNYzGp/L4hhKQnCioR7bPyg73IUlnBgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3hlz5/Tuwm625xitLiocIo5+03G31MlnMHwY0MCNuwsPn9jI
	2jwQUq+cmzTM6m50kyKt85qYG0CZDFxJ5Ou7zol6KhJt8XKSM+YB0NP1ecTQq2WSIpuB9IhPKdQ
	WM06h86k3ieQAaNlsKA==
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:490:6e12:ab28])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b70:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490c25c20e0mr221589765e9.24.1780903705694;
 Mon, 08 Jun 2026 00:28:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 07:28:24 +0000
In-Reply-To: <20260605-cpu-helpers-v2-1-0ad227f0d91b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org> <20260605-cpu-helpers-v2-1-0ad227f0d91b@kernel.org>
Message-ID: <aiZvGIcBcel03J_w@google.com>
Subject: Re: [PATCH v2 1/2] rust: add a wrapper for the `num_possible_cpus` C function
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 02:54:56PM +0200, Andreas Hindborg wrote:
> This function returns the maximum number of CPUs that can be online.
> 
> The wrapper is needed by the Rust null block driver.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
