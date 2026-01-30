Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA452DECCB
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762079; cv=none; b=Mk26KtT1wbyIfY0PVhaDkG0he8/4QMV9VgTm8w50zpLJOrmVNaw564u4UHdzHgM76xHWpV4vOy5kt1TJvfML8JWJ2FCmRayBYNGVAwVofSDfKRBtoUJcZyOcHy1TGwoYlk6XuyHRXE5iunAhsAFRQixZ7zDS2zYF8rnshMn4tMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762079; c=relaxed/simple;
	bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IB30h2BxDkRMrbof3kGS1U8GB50wg4HhGKJYcdjngLiyia9NLf/83cPfsxZ+LpMrmejKqSFhIC+yBN5GF+IJPpHptf5uiIV7x9Qt+dzxKRzf43xhzIbSMjhLBsvFSjH5VeDWZjma91azSZ3T0FAPJwQSGCmJXVyLEhL9oXZdbGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vqz772fG; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vqz772fG"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b884bfed5a7so181514766b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 00:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769762076; x=1770366876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
        b=Vqz772fGDp+KpsTekSxBN1rUPUSvVHQVcRSVbcsN2i6dHCGIqMS/i+loJjTN1V1jU5
         Jg7rqBcDlkro4f10FgVsMEFkI9IdywY8kBkriMZ5EU+0S7vJ+d2mGhuSYQnZ3CX94FLE
         Tfwezk4XJn+4iFdYXxpXliQsglKBK7TJOlan31EGqWUzViElaPNOnnNmTsluAQp2p1u3
         Cim5igqcjHarOxqm9IJj25vBGekY7bNoXrQIR76lYCady9v+hOTQDqq4Gg6pICvNpg0v
         92sZDJ7Ni8Gx9f9W4oJbeZXwjN/45z08chSRVajYRCZjfh+XrTcS9/m62tQxRXN0Jz1G
         B1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762076; x=1770366876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
        b=V40KmcSvBnW1ZXa2goRvvRUChc0q0LPXC00BNrv25ggR68jI0ZC34JZZ3ekw3kdLof
         1/xDPgRzL2LECOhKoURfvoVdgRmcIHxP5IvOtUbreUFAF9vC9VfDDnZbDIAPZrtONBKJ
         y6q/tDUi4cLPJAGs7amnQ9SeIreCeqc1SaL2OzMDSqMB38XdTCjB0QFmDRzwfot+K039
         cRXedtol62ZG7TYY8inj8Onb0CRiW3na2QbvGD/D/iMdJnkMAlHJbaTjm/ncuboAHuJU
         zA8blIjSoLw2yom7QlU44Nx9vy60tGgQFlWCBFE16cCZ3719ppPvrB+MBhxvm3OTv133
         98bA==
X-Forwarded-Encrypted: i=1; AJvYcCVW/I0w+WFtn/Agm2VViWgNXUqBK4v0SU5U/G9/FkwwLrOXctiJuEF7tU9IVSJtCxelRs6Ia9TsN29MQ6zHAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSl3ESc8VpeMbZ5XJ4CeTmHhQTjbolqBrDiFo3RbJM0UQJCUnv
	n8C/WiXSc0wOm43dkj6RyEN1nXjHSuSMiPzI69OCo/aU9rPzVh8lN2FCwfirHsADs/YEj21m4Sy
	sFRxzWbmRidx0B/4eEQ==
X-Received: from ejbot14.prod.google.com ([2002:a17:906:ccce:b0:b7d:380b:a83c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9287:b0:b87:1fe6:f223 with SMTP id a640c23a62f3a-b8dff5e8fecmr102609966b.6.1769762075992;
 Fri, 30 Jan 2026 00:34:35 -0800 (PST)
Date: Fri, 30 Jan 2026 08:34:35 +0000
In-Reply-To: <20260129022837.4133832-7-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129022837.4133832-1-ttabi@nvidia.com> <20260129022837.4133832-7-ttabi@nvidia.com>
Message-ID: <aXxtG0TTk376dRsT@google.com>
Subject: Re: [PATCH v6 6/7] gpu: nova-core: create debugfs root in module init
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, mmaurer@google.com, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 08:28:36PM -0600, Timur Tabi wrote:
> +// FIXME: Move this into per-module data once that exists
> +static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;

Surely debugfs has a solution to avoid this...

Alice
