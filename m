Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087C27FB07
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Jul 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704542; cv=none; b=dYKo59CDX0H8F9KXeMxvaqQ4hEC+ZRxFc4M67BMYPM+9b3nJqQQzRM/BtPoZi/Apo+kSRQ5XYv0WfCKKihkFSGfRDUYQMLv/wZgpXMdh4OkNZ1bwrrzi+JkLBcmN0mK9+xk6v0zKz1YbribnA4phhED8kZYRWiIbdhvcwIKP2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704542; c=relaxed/simple;
	bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZyB7P67OMkT0GyR0blxTlHcSDmq2+jvhTqVHuOA/7nCJ4DgVVd5Ox5qHnnYG+Y6noArjxiSipNvO+K2GTjj35+bmUVMG+G5R08aHL9xK5ulnST7L8upIivVspRRspTfBG2JsCNGn1lNxEfTH+/2Q86bQpU2gK/XHTo/QTsfBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxNsaGXm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxNsaGXm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1673828f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Jul 2025 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751704539; x=1752309339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
        b=VxNsaGXmpFBZzbGKOd6IK9X/JtW/udqf/QFYkdXLMxRPH8E9mWRWHzOT+AbD9nMkC1
         vaV1j7SBSvjfLydUz29ox3rRRDZpZzJRbQEGkh0GwAz2fLNT0dw0/NXxuNgJZeLMROHS
         Q349P3/x4ugtlRCxNp3zhbinpl0JTgQokNMmBk+oqFHEDeRH/44vvvHgcyhH1S3X3GX2
         tz3pFZw9743bK2bsHftHI6JlopBSveB0xVs+haMSn7ibzFOVJFyTRP0hnMuIk6GPjdpz
         HNHvsXdqQc6gu8JSIiWFTUtYBokNkCcIauhl6GCovDOlUxd6nSbvcDR5KxM1IgzY4s7/
         oyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751704539; x=1752309339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
        b=YfhQQW1+yPjHL31b9ZELNpfRc/Ln7ZarTumyRin6phZKYWON78Rw1t4j+Woi4l6ss1
         Ve9D5lHd9eM91gIVEmQfiYOnLxOad7UfhfGt90kqFfm1qoSyDjxwwGjXy1+o2JsbTW9Q
         4jzQchPbi3aHY8LN7j0COvMJtAdt4Tl0sNf3EdQQiNwO45nW00grpuAjUl0HH4DCxe4H
         /GjF4PUFoJV1079fg1AMgOFFGXca4cspZJhExn6+3oaU+i9AOLrV0PymYrZfhNYVlmLj
         r4GKi9OPfYCwe62fTEAnlTzZqzBG0ZI9UqzcIwhfAZLL3crJHkuF6WASxnzCvGlj+3wD
         nhJg==
X-Forwarded-Encrypted: i=1; AJvYcCXizXVKBfqmfUm72rZ0Pz4ZybqQcscoVJvJCaS8fODL+Iv4tY3a9aYyedAiurAh3oXdRBrXPy3JxjStS+sD7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLU0nL1VqywZT94U7GOPRvmeAXUU9Tx9uSkP7ktjWJIuQ6tb1f
	jCF3GpQwZnEqk7FDUAynUUDG+aYPfHluhKCiRrKTEWkB1v6YRGalV03x8SbmkeJhIQ5SGjfDZz7
	LmTt3Y+BseXDFXJKa1fFsxsg/4+iMzwLTwB98Xj0Y
X-Gm-Gg: ASbGncvK77kW+kd3bmWcaRb0PSVM62JZTv6OCTSTLcoTPZWgVnBRblFV7Zy20xsUzTs
	kHehO3sx5dxWolXjZXLOVn9YRxvVKVUtPZ2w6sDSqxAO7EUd5LEDcOASEKv8C6mHTVrtGWeZxYc
	MqAhjKF6U6AbNNb/A50MCSs7oRGM0iwGiJRRySjF2AQ9Zz35n9b+BguBw=
X-Google-Smtp-Source: AGHT+IH/pkllT3Sy9Cb1lHriZM/tG78khhI42JnRhbPr8kP9tTs+gtmjri5ZYwhkuP07q9yAkZH9HXYofTd095qzzFE=
X-Received: by 2002:adf:e18f:0:b0:3a4:c71a:8119 with SMTP id
 ffacd0b85a97d-3b495cc4ea6mr5351566f8f.25.1751704539369; Sat, 05 Jul 2025
 01:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com> <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 5 Jul 2025 10:35:27 +0200
X-Gm-Features: Ac12FXyGVQLpnmxvOqtVG7V_plS_x4VHl-FkqPG4Jcdo-zfXWt7_Lhls-5TlbKw
Message-ID: <CAH5fLgg=4ZqKh1hqFD9bmGJwUf3LK3=K+Q4tTRPnT+NaMubpLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: str: remove unnecessary qualification
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `core::ffi::*` is in the prelude, which is imported here.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
