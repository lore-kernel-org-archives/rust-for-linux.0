Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D053C3C9
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006899; cv=none; b=iBgrlT6qYOTM8pNGwkFC+YxLGJkid7epHD6zIVgCjyTC89ZFNXrRoTzQAQx6SGuP3LAd2mxmpsrxjztEJrYKr20uiQVq9WTjF2x/avcb/+QHuqCRrV4G1jQPExWEGxih3mwifN9IVBWsHpq9whKhih/DJjpG3s1y0pmcrwzvTno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006899; c=relaxed/simple;
	bh=4/vSwvQ8c9DmlB8s4+PJhQoXUaG+5IDxf7zgM5+7BQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IGOHt46vMVF8Uya+T2Uaegb1KrKLhx0vMoyROAmBzXxGZ6csQEtceJfGqkuTZCl88d9J4qJyM4c0px7q9L6nayWObow4XAdJxs0vLTM6Ez4JDiQrUgR/y3VGMLQiV6STiz2zp6nH/RNvtrmp7euMVuQOQmmZjk2cmedHSPromkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahBZ3wci; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahBZ3wci"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1f5b673baso2000776a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792006897; x=1792611697; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhtPvxDFZ8jUqL5Jvn1MkdXehkwk+PeL5zTH5nHr774=;
        b=ahBZ3wci4QmXqr/7DnJciuY3O97sEUNwbxQJ3B2hCeykBn9hWgTPpiwiP+TCduMWvy
         rkUAdj7zXQFEsMrLu1PkC+Q72SfpMnoiNwi1ZG4Qqn6df9ayRPvytwCxBFsufCHzEUMs
         6UfAguPP4M/YqirViBmVIX+poS4L/GeJnZISRRC6+ASujIXzf9GWFBpXGdTcrXuCdXxN
         vu0NX/PIyxZ+XyMRYKfky2hFYMhbaJXOLpUibjrwaHbZnMtcG1a8kViKk1+DUkTRfxK7
         qrFQJRb4C90fub5lX6dD2/HxAhvuGGX7BpaU1yfoxHTNndfqQKcMB+BIy04mgLnlQ0EW
         gkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006897; x=1792611697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhtPvxDFZ8jUqL5Jvn1MkdXehkwk+PeL5zTH5nHr774=;
        b=h0KIEeFfE7JqTiknKglwGICznZV00no1PbDkYmILj08UsOYvFP/Uuc9QqAWBQa65Lq
         Ry7nSKgQtL7vqcCEs8yvl7ZlW7q3fBq5tRymkRw2ar6+NmpALIgBe/cSGjgvyBPAfOci
         Ct6tcjH0Yk/6SlDcjlt+gNJYONXTOOJWzeBlALd4oCpsb3VI/IFEwYEQcmFnbdIJRgFL
         RCn0Oql2mSkZWLe4L32aIQATWBK/dy6aJGv51jo7vqy2sIrMJgVd5gUBs+aR1LoSbDNR
         CHzdUsZMY2fpjUxU6t6is++icWMI5O1B4Lx5HCuQGX2sUOjZHifAiPvyO6sP0mBAYZVN
         HPuA==
X-Forwarded-Encrypted: i=1; AKwUvBxiDbuLLJ7shBWdzXcQ8E1n4OPlBSc2DsPqKQ++VkDbVeAG834ScoMMpcvxAAuBMpsb2+mej6wopyr3HrITcQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYISrkE6USgPs418D0YvHguU4d5yTBb2yDG+AhsLKmJZAhGEKkrH
	aM1hDaAZKwdg3VfT0G1DRwK1XUDjHzYs/tUYNwpld+7CVKVhFVA7OqHEDhhhNzcY9VbQ3jQU3+D
	QYwnybI8813FHaOQHXw==
X-Received: from edb19.prod.google.com ([2002:a05:6402:2393:b0:6aa:e787:600b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:c521:20b0:6b1:b611:a2af with SMTP id 4fb4d7f45d1cf-6b1b611a852mr6422467a12.20.1792006896277;
 Wed, 14 Oct 2026 12:41:36 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:41:34 +0000
In-Reply-To: <20261013184809.35143-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013184809.35143-1-ojeda@kernel.org>
Message-ID: <as_a7h-v6eE6P_Yk@google.com>
Subject: Re: [PATCH 1/2] rust: zerocopy: fix link to upstream `README.md`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 13, 2026 at 08:48:07PM +0200, Miguel Ojeda wrote:
> Upstream moved the `zerocopy` crate into a `zerocopy/` subdirectory
> of their repository in v0.8.51 [1]. However, in our v0.8.52 update,
> the link was not updated.
> 
> Fix it by adding the subdirectory.
> 
> Fixes: 2808a3963988 ("rust: zerocopy: update to v0.8.52")
> Link: https://github.com/google/zerocopy/pull/3434 [1]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

For both patches:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
