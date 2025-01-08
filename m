Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76614B95A
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327087; cv=none; b=bxEEmNMLTrBYBBukWO92UPvDPDoYzZC4VyzKERLdA9Rt6POBW9s2svOpSff7djm5KjMaNrT4Yb5UbmKtUyyS0YS67kT6DT7c3aEnGQEwfjWazYVdo+MAUJzH9cfxUAaVc29+9046hdUeiHOpkNalaXpcYh5Lf78QQLHGaxp4uQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327087; c=relaxed/simple;
	bh=qarM7wEG8hKxvBW0eJ2RWPpwYUUN0q0s4vZtMUCPxho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crE6Z1yizLneAJbeO881FfL/PbLgrrp6JItQ4xEHldu6X3ccbtheGCA6t0NE+vdy4rvGFVXYtJUbMaxJmXft8q1heKMm/s2dsLFzizNksx6rHagQlye6af63ersqrh5alOWJuGpz1WTeWD4d4VlfwU2/kgcGkX2Sb1Muj1LMw70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IDXgA9bL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IDXgA9bL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43622267b2eso171340385e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736327084; x=1736931884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qarM7wEG8hKxvBW0eJ2RWPpwYUUN0q0s4vZtMUCPxho=;
        b=IDXgA9bL7IM9AgtitvTz4RqiT7rJ6EmALYx5/ArdZvFNpcVSM5WYMQCWSLLeJGReKA
         9qVsSGgAq/m1rppwecaPBhBo1bCCKu+Xf2lLL61buBtvnczf/Y39m7odrjWxhDJhafec
         +D6M/CaPwpPkpR8YN8rrwc6EkPnnCcHnD5Jw0O1hfK8/TNpd9DMLRoEi3BobIS8/zQdy
         GeuQHHUBq0/8F0nAWL7dqnhM/Rrq2LhgAR5goCPomlX6RIbukvhvhB2vlkgIiUYzcVVe
         0pJfg8Hav2RspyRZnaXjPrE/uDIsqPVQJSMLZTObEGesPNuOht6Z6QSkCshTwSl52YN3
         5fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327084; x=1736931884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qarM7wEG8hKxvBW0eJ2RWPpwYUUN0q0s4vZtMUCPxho=;
        b=c7Sqt0zqiDRiMzZpjCafSjHVNrrKTq3gadOjs/lT/QJVdNSP44h6j6XaaycOOPtF9z
         lr5FArwNwlyOzutLMy2zE6JJMW+Y2g8AzZSMDz3G+HapxbZOtMnYZtzxXl87dAwKOtVs
         AUplsNS8qxSxbhTmeMzmNNvzFNSuULmT4KCsE+Dn/yiyUmyjwsDAOBYAl6DPYjmcELfP
         zlqooZY+jO74D62TWlj1/0mwfZKtZR9OJZ/sxwewF2UolF4D4wJ/XMD5H+yLZFBfJCBw
         Gz6r2APkoyJkJooXxE+F7pRduOSXj5kXLIsflCQmVL2UnjijW8gDmW1VIFdePbGAbLaC
         2DFg==
X-Forwarded-Encrypted: i=1; AJvYcCU0cLA8OR/k2BC9QtNCH3G1aKDm5Pcgwer3FlV7zQKN++ZicJLC9T2dk47Yz71Gvp1SDkcSz1TIUbtv/VHCcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OFgS5wNDKAztg3fGNkEPCyGk9lxz22xwoblyPpkDmNMJHjH5
	NENrzkhDCv/kzm/vFP6wR6F2rzzYQTBVa/P1SRy7QA7IzX1Kpe9US0eAhdandnzk0shCn0mEzlD
	tarGrgywOpEAroVjJEUMy2Iw8JNhsCS6b/ZA+
X-Gm-Gg: ASbGncsAS8MGIoS6HAT37eHwQYWhVC12k1UcvbSUIwG11F9VFo3KGDTs/2IRy4A2AMT
	oPku/oaInxLQgJHThDFEP5zb17CEzDjPio1KUDI+rrukON8Qn+BOfNcNgoFXXruh3D569
X-Google-Smtp-Source: AGHT+IFrGFDGm48uXUnCckV8koh1sp9VIZ0ZJE80JZk/d/1ZqhEZ5SDfW7JzCZ1hBXxubGUgY3aiL96+oUG8n60Nemk=
X-Received: by 2002:a05:6000:1884:b0:385:f1d9:4b90 with SMTP id
 ffacd0b85a97d-38a8730531cmr1098488f8f.13.1736327083886; Wed, 08 Jan 2025
 01:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
In-Reply-To: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 10:04:32 +0100
X-Gm-Features: AbW1kvYhuXv5H4QhXSF7CF7Ned9wwgZg8hOQHEveI-0UUomFrgKQ4TV1ujJMigM
Message-ID: <CAH5fLgg2g6OqeNDQJz5rNvCim+BRsO_LdxDT_jySisFW8hOVOw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: generalize userSliceReader to support any Vec
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Filipe Xavier <felipe_life@live.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 8:25=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>
> The UserSliceReader::read_all function is currently restricted to use
> only Vec with the kmalloc allocator.
> However, there is no reason for this limitation.
> This patch generalizes the function to accept any Vec regardless of the
> allocator used.
> There's a use-case for a KVVec in Binder to avoid maximum
> sizes for a certain array.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1136
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
