Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6A311955
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070150; cv=none; b=bqpRDt20spT2pp8wjinoze+p30BtkifLj2W2jVLQmmjrMQWScQly/czjIPjs4PMdF++Sp8xhxFUwmfel6p77jUKQnM/nC3G5CHrLh7vdwGSwS4Vl5+Xv1GiabjnixLDrJ+GW/HtTawlsZBKTHorlsbkYXnG6YIWVJTXJcXjq0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070150; c=relaxed/simple;
	bh=XybfUO7yVGOvC4FG53feah88rsR0zGhrBBfOPUrRHAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BAwLnLm3d29lyUueERZ3PkXXyXXsQQN/EnEcz76dH3JhAxvlEq7KgmEomVHAuhh3Kl/uTd9/jYiS5sPPfsEPsDa/PqQmofdBMJZK9LCO7JNCm+nRUp02n4y9/W9m9oPtEyKEA06rcfnwrM1t2XYO1HrpLybMkmLROmEhnVcw+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OtWVuVEx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OtWVuVEx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4803a72daaeso5498715e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769070147; x=1769674947; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXFQssapFyW7Sp+ikLaCf1ZvrfgQKhOMJ9hRqHbbDRg=;
        b=OtWVuVExGkgU5L8fDj4iwyQup42TQ5QMFHcsUxEFdcUVOvN5ZAE6Eq6B7/Bnd5uB8m
         RtNPr0AJ+wNkazOj4/WWy6Seyw7hlAVDFYR78H7zsFFb7TqqlwhB7wCZSmEb6uwdydBC
         cU50HqfBCPlKzK0wj7nQ1Yedn6jImj4ftIf7gvrIu1V1FpBXke9kIZjt/aHF+xaJmPay
         R69LDU55s7lS8pCQEmIZK7tkmDK1uXo7l0DqKaPa7Lp0Q8SvoTbDornLS1hcSNDOZ16c
         4wNp/qk9XMYAhVINaRAfHIyjEuhjkfigcs//FEKkS9Toh+/Dsd8s+8XX7cMJzSLM54BM
         hssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070147; x=1769674947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXFQssapFyW7Sp+ikLaCf1ZvrfgQKhOMJ9hRqHbbDRg=;
        b=wAuatNinTIDInrjrwuel6zzmu0nzEB/QTojGo6AyK0J9RBj7rOyfY4tnd8qVbLtGVZ
         ik8aJeT2ar5PrLe5fM4T4dJxXmc1oDS4wwJ+RzNUaG6XzXdFMJmuHfcObu63WrAZ7Xv2
         2MLO8WS9VHQuHwUMUvz8o11pfRI7cMEqpMYhsi9vUwm/d02AvOeijzPQvuVWHjegfbzd
         kMrKhgKfdkNdZeGPAd1l2peIIfSjbalCxCuxkaU22EkBhrWBYROfgVxw7V2nAVpxbTZZ
         XbpZ9O7zrwr4Po67xDvC3CLfnW8tL/AJsqpN4PDqnfjD13FnbUIJavnUIJ5A7OZzWxFs
         6tbA==
X-Forwarded-Encrypted: i=1; AJvYcCUpwnnSfwvoYOM4g0VMpcHA8EvWiQyjOI/VExQuQDZQ7xy2wesrNQBle1P6N+3I0Rmj20ij3Z7FUBJ88J8InQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHaHiuaVtcoRFIcPpv0XNxHC+Jbdjrwsf5E0Ql47ACLVlPGTB
	v+uTJtb2dACfySTGyawBvqnFRLnScpJ2FZK+VB0w6P+iglI+oshTaL8Jykg+EcRooI+Dsynb8sP
	1QAaCKnMIc7/jRmZoWw==
X-Received: from wmcq14.prod.google.com ([2002:a05:600c:c10e:b0:480:4a03:7b73])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a6aa:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-480470c74demr22446035e9.16.1769070147395;
 Thu, 22 Jan 2026 00:22:27 -0800 (PST)
Date: Thu, 22 Jan 2026 08:22:26 +0000
In-Reply-To: <20260121184339.74256-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121184339.74256-1-ojeda@kernel.org>
Message-ID: <aXHeQi4xKRJGSHv6@google.com>
Subject: Re: [PATCH 1/2] rust: iommu: fix Rust formatting
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 07:43:38PM +0100, Miguel Ojeda wrote:
> The Rust kernel code should be kept `rustfmt`-clean [1].
> 
> Thus run the `rustfmt` target to fix the formatting issue.
> 
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [1]
> Fixes: 2e2f6b0ef855 ("rust: iommu: add io_pgtable abstraction")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Miguel. For both patches:
Acked-by: Alice Ryhl <aliceryhl@google.com>

Alice
