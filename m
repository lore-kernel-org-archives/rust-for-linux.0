Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AB19E826
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332773; cv=none; b=J3GvvL9ijYajBOZX/rLmbB7lZGpaCKzRZM0PCgHw/OoMcaizJXvZHszzHvxropgEojyvhCN6o/J8ltU9NdsnQW8kps0L+pL2Y1yi//i8RagRrlspf3oSjt+kMwmPURXYgMyyj+Wk07D2eJS9YimbutUeGGuDMidmQXjUes8jdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332773; c=relaxed/simple;
	bh=DcUEJ7dXl5kVrtUCgHy8PE/zS3sjmWay0hXJs8WFezQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4qPQr8rwZ4/4lyou/HQLg+vc/G525zj6hKVnzti5YWyM24aLwEqx6TQeW/e6UE7XEjSgpNh2YAxEQW5KDiQtsWmLnWvKvWa4ql8IpSntw5bl0Su0CQG+bt+Wc9pejKai4h9MmZdTCH5PQ74yFqdmg4/hNaY65NkMd5Sz1BsQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4QnwX39; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4QnwX39"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2110a622d76so40072575ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731332772; x=1731937572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcUEJ7dXl5kVrtUCgHy8PE/zS3sjmWay0hXJs8WFezQ=;
        b=p4QnwX39bELxQ0SXIKTF9NQSXbE5O2hGQHQaDtl5/BD14uBci876o+ugvwUkyOxv0k
         4MhI/LK7oBa5ucuEn7ZkzeEMkfUyUsZPb5O89EL/kmzoVl0/Z0TkcFIheurw5sslj+AN
         743atVmvHw0WjG8uLXh/rcl9s5/kzzgZEOMzUzpHhKnBb8Gn0/4tUnRI48IQRUKoEPR+
         nvSBBOVLMs8mNe3hNQ1scejywPi2fHBUyEYoZzfotYn9R3NAATnHoig7YAckhtx7MCs6
         sXX754FFVKyAMO0wqP9Qg02S6BeMBLXXEoeOs5P/0McXLBFLWoatOQRhPM/h4nSJZMi3
         6pJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731332772; x=1731937572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcUEJ7dXl5kVrtUCgHy8PE/zS3sjmWay0hXJs8WFezQ=;
        b=bQyWldVNd8jshOF17mqvDhsu6ZNuh4BXTYtEvX4KH4iyCmFQGZrX1m3wa3AUphZ9iz
         fd9zCU9eXSLIr8FN8T/I4Q/faFm0h755x2fnskNH/XJ2bbxiB+p34S/kmziw9Tdda5G1
         scqT5xvObOQS7fnGLAgmHajdhtpLT9jwbJgDmY5+NpOoxFotL6FaZ2UwIiLfBVE3KhKy
         y1Y+Oo1f3uSPY5r3RQSorX7BM060GgmMy44fgCyIsNV971WjNDHmiD2mCfQwvt6GxmHx
         Rs9IVDfgSJNyPqITD2pjbJDoPD9zA8qIVMlQgYEeEB55V1ic5pbr31TSynFLIKjPL/vn
         aQig==
X-Forwarded-Encrypted: i=1; AJvYcCWEEjcUbsu7RLSo94ulC58XMyl2olI59W62xsx9SEyksIGKYrum1nkZmfaW+Kfp+GH0mK55sRd/WxLqqPKsTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSia2haffvBWB0Atio7Acsosab8y/cdtP2+anIah3ol5hfvRy
	wa/SyMvJOXV14879/kwu0WNcNdQiEruLiwKmGs6PUK0J/qObt3S1Fnr8DmNabaOGdRAKsurM15b
	bNmqfG/aWQTQLf3bKlSOHE1Ofp9LGuihPuGxG
X-Google-Smtp-Source: AGHT+IEVCr3UCPDvEsWZSVNQIPJXcp1ogJp5HjZS4vZkY5iuT3G0MdS3I2Y1hggl5UXmGGKVUXTDP6ChAKKf/GpuPj0=
X-Received: by 2002:a17:903:1c7:b0:20c:be0e:d47e with SMTP id
 d9443c01a7336-21183dc7f8dmr136158235ad.56.1731332771637; Mon, 11 Nov 2024
 05:46:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
In-Reply-To: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Nov 2024 14:45:58 +0100
Message-ID: <CAH5fLgi3PDmGgkNRv8T5iaiLAhn-jOv4cXdbX2mmhkx-TQXQ6w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: Implement Display for Box
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 2:45=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wro=
te:
>
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
>
> Therefore add `impl Display` for `Box`.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
