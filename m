Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1CC38A71C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900121; cv=none; b=BMInz977umTbTZYjq2N5hiPZuLMAiFuoTGiNqjudPwKHaZCPqVPKGrlvMvgGyX/RUP3xtBPA/w4Ra6cjcDr9jcpoWg/eWeVe1u89bWcpdMjDwKaTH/1wmdQcD8RwbJVqQWEgCw+5QREl0dMBTTPiOQ1JuU02nAYVT9esgbomwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900121; c=relaxed/simple;
	bh=vKnvsTapPMj7tlzlG8O7I/FxBiOPLzZ52mqnzN9ytlU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dyJ3Q67oeGuLWyKbmnj6uxHBmPfaOMRG+lWB4xuGbEgzB3wi4MHkLuFHWTjQhIkluF+52t6NqgjetkILcue1C61XODWEIwPRzPWfelsYNVwPXR840zj9T7IknOFC/LXQC/cHV1jrpEob4vTTvTJA/+dDAki13oK68q6a+/KOYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3hD/y8H; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3hD/y8H"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so46839475e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 01:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768900118; x=1769504918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hC+s01KDFNFWTdtskG6IEXC5QH5+p0zo21rA3ZNq6wI=;
        b=c3hD/y8Hs4gO4RJpDlGMRlsLPkTpDKh7OKn0Fh4s4TaUsSwImiKVvVNGcjIe6oyuhk
         LXqrspb4LLkz4g6fpT47Swx5xJZIThusSvmnc9fePoxNPdUJ3cBFajf9/e44AVNl5+MB
         mNWZGNVugAaD3qtE6HE3wbDVWQ9rwy4CnpNBNNa2CmNwTz7/BymbyT/HWiApy+AhUus9
         7DFmt0GHlZ8EApQqmiuI/5P1DG+iSgxcq9RuHt8oTZAtND0pNLyzDK6lk1tvPgYuciZ2
         Tld9/MQt9/boSv7T1x36rZnzcKjfzZ6UC0+bVxRPieqV3oEw/wtNIHtsBdYQtKfVVppU
         pvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900118; x=1769504918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hC+s01KDFNFWTdtskG6IEXC5QH5+p0zo21rA3ZNq6wI=;
        b=HHkqXO56uGg02XfuIAjHLgVF5BpexZ6SDx134wizkKW+OwjY+h0jz9QT4PD0caB4K7
         HvA/zbsFN7FIJSibEbeiqcOJ9CBTukUNpfLzMcq7NwaaTWk3pjOLJUC8NE19SLLl/p9M
         wttnor2UAYvLXU5yocjiCv4IDZiCggdP45aQeIUHB9d8cZbBUf0c2ak7dXPIBNqxaxka
         e/CeUYWzCqvABTBtq/Ua5JM5dFznZbGTpXYQDq3yjzR9X0Bxm1i/HicEyPyJnDpfZg3d
         IpVaVlQDLnJYdIC9TP9Q5N2NaBXIGezLx4Z9cG/Dly8Dehj7OokYVT50r5nog/NfJEH3
         Ybew==
X-Gm-Message-State: AOJu0Yykg8tAC2hYtMM271ETgV3Qp8BmRGsWmobw+U1VA/3lqeLoYJbQ
	fs8CmIBlnV20xsjz/CJne6EpronIuQwcAqDg6OFnwsDSKlQu0gs43IvjvyhH+HKm48mWeA1EnG/
	gnoltne1+c1B2UQK7OA==
X-Received: from wmpv22.prod.google.com ([2002:a05:600c:4d96:b0:47e:e722:72e4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0e:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-4803e7e8592mr14178455e9.24.1768900117989;
 Tue, 20 Jan 2026 01:08:37 -0800 (PST)
Date: Tue, 20 Jan 2026 09:08:37 +0000
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
Message-ID: <aW9GFf-Yc_r0_JMm@google.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
From: Alice Ryhl <aliceryhl@google.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dri-devel@lists.freedesktop.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, a.hindborg@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> The `..IRQ..` register is printed here. Not the `..INT..` one.
> Correct this.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Link: https://lore.kernel.org/rust-for-linux/A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Merged into drm-rust-next, thanks!

[aliceryhl: update commit message prefix]
[aliceryhl: add cc stable as per Miguel's suggestion]
