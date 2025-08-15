Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634710E0
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755243366; cv=none; b=hqiAuXaiw9eOiUgF7bB12nyMN9a9XDZtkwFUDpIjPHnW0Yu1DDxZ4EAdhG/BZV5Stp1EDeuxim2Unsmw/3oYjLnF0eoh257WbuXdBd0x5RwbmhE+QHcrrYfVC1BnW5oR2+ZR27BXPvG2Jav97F116xHfzhKG+B6hCVI0pjOm0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755243366; c=relaxed/simple;
	bh=2vx85O0mzxhhNkXrIJNGjZCzhhkIcP50MP85vxAokyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l2JSMmGBtiSrcU+WuRW2nnZ4aQSrGfKhFT6tc+HWwARmsNLBNkBp+sAbs8XATr68VGfE+VDhIp4CRLoAYqjEvJ4nLFW7sDfYIbWJQreJ0WoN8nSVIs8nrCEHphNj99d4HhKr0Wvsh2XoAoUv6mmYmTzath2LbNk5xvlftESQVHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/ZjZJ1A; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/ZjZJ1A"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so998698f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 00:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755243363; x=1755848163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYBs1+R/Xgko10NxQQKr5iQnePPmuv/ASrejX1dg/pg=;
        b=u/ZjZJ1AqSEwZD3D46eEQMTGOF5gUPz/cz220rSN6+cnjLp+ES5VyhPK13C+Cw/5/w
         //GRfPQmmVlZK6U/Im6171bQ2qVDjAFdaNMjLeuqYjFUbk5FFF+CpEZo29nN2plPHslw
         v/jSOEQigwgUaJiSzqpyyWl50Capdm9eL5eSibW1KQMwkWNxqxCI+//CBx/3CM9xEz8m
         F7STnaXTQ0/SWaUAF5VNqJseY/V+DkE5aNmtnZwbZsIBjZL+j+xNphz0vazMUI/h8sXu
         wb24x/GH26nEyWpgNigYWi9U1oYmddX6Fo7tsuZQtIxtDE32nZSakpFv7ym0ZAmDEbK0
         vspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755243363; x=1755848163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYBs1+R/Xgko10NxQQKr5iQnePPmuv/ASrejX1dg/pg=;
        b=U0rlx9W4YlLMPm7CIV8N4JZiBe2sX8b0v1mMwsw1p3St2l3zmDkjCMJih3XKX0HRPL
         Kf/ckLYOD1yvOF09nHLSWkaWvxqJirLXQ0NGCmvGpPyWZVt+Q4xCaB4N3t6ohoiZ8qAI
         4Ln13UjTAlOveiNXofzMbsNeJh+oc679+5lUlgwkLyAIhJWmofUGrWvi8768pIjE+qMo
         igYVEkneHeR7z95hE+yz393HGCPInZlAunnxGCgU+d7gnnmhUvRIzS//lH1VsH4Fh1eu
         lUUlRe17/lTzSAESsyDpGiilYOQ/lJWN4N8HyJUc7j0anqYlZzFIAuAmd+cJr2XW78Hr
         ycsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyRGOOVZK1Zf1zgT0CBup+yCAQ9LdUO8i2MkEH8BEIqTPnbxAEjKY84wqcJmO4WIsqrk0IrPVVQ8cTxxO08Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCw3TCZJPfqvjfxZrvBI3EyjZ1uYL2/pTdmk+0lrcbxKJYRLpb
	JYXVPn6DX+TaAcqOAPHPQKabIOUdqoTrU4Mcx2xBmdd9YlTxX+dZU/qjffjBfiD7IYQYgSQndNn
	bbYCdQjALFfFeEAZlSw==
X-Google-Smtp-Source: AGHT+IHBDq1WtZBwoI8rzXZ1kCUgf2Bvd1DyXmdA0qE8Mjfx4c20OyzYeCaxxVwQSMR/ezsfe21wZmOuLGg5yx0=
X-Received: from wmbej3.prod.google.com ([2002:a05:600c:3e83:b0:458:bfa7:dd5b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1881:b0:3b9:7bea:149e with SMTP id ffacd0b85a97d-3bb66567d08mr802380f8f.8.1755243362874;
 Fri, 15 Aug 2025 00:36:02 -0700 (PDT)
Date: Fri, 15 Aug 2025 07:36:01 +0000
In-Reply-To: <aJ4Y_DAZe__0EWEm@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813153548.1650533-1-bqe@google.com> <aJ2Y21Yjs3a0CnAo@google.com>
 <aJ4Y_DAZe__0EWEm@yury>
Message-ID: <aJ7jYdc2vWxw922t@google.com>
Subject: Re: [PATCH v14 0/5] rust: adds Bitmap API, ID pool and bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	Pekka Ristola <pekkarr@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 01:12:28PM -0400, Yury Norov wrote:
> > Thanks a lot for doing this, Burak! I gave it a spin locally on
> > v6.17-rc1, and it seems to work.
> 
> Does this mean Tested-by?

Tested-by: Alice Ryhl <aliceryhl@google.com>
