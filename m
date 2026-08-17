Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C447470451
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997574; cv=pass; b=rO1dMMDwvFVrf4dFqI5juNBUQCpRJ5iZMnWQzgz90j9kLEObG/kuusTM4nixzYT9UgwWU8Agq1vOpkh3MnogiU8mGXRSSilcTQ+/k8SPTHusBv5dcp0V9l9zJU9+cP6ngCj4NTSMySyvfBcXlj0QWJBWbaqgAWuEpNqwfHdROD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997574; c=relaxed/simple;
	bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPS9XwKgbVyUg3aAazqZq2VKnW8OOYkQsYnxnwKUEPHeaTlWrM1DTK+gKkgqNMoNs5iEQCJ4s7H5HwBhFeAgxGIM1rTyeNNNwt5yaOLloZnflucEUd/LxkiaqHjyjIRwDI0GZtUZy5p8irbTFr141SOr6aTPMY7F6SzOle5cqgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lq0QJZSq; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq0QJZSq"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2398616a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 13:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786997572; cv=none;
        d=google.com; s=arc-20260327;
        b=mFsUla/KamzkZIDuD+2suwfForXqZdOYN3qgHYS+VUMtDGjrJecG+t5veCNI7i92jh
         ZK1nFWbvYyYx3t2qdcgiXMen4o2rdYrL0p67PheYzBk3odnetIh5gXFuKxOWOk8JUcuj
         csc7ZSsw7aoB2ca+iwdZymJXYurSRql6s6wM3QnMCOriZoyykyMPVTM77rbIZnaYXIQM
         xPQ1WgWCbP/07R3ryMFR9VsjZhyVZcc68owQlPBfu3gW94LBqSOZq9gTj1+CQOy0lBb8
         kmJnRCpLe+gzf7CSb6Z+o0v+qZ73ZvGwszITX0zI3b2z6CYGS31kVrEVKgr8v/cJV9G5
         T5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        fh=PknxCUHYLBaS+gRUvWt9QQrHtLGOAua2YdxFSlYky+4=;
        b=PtW2nvI8HKdhlpZuVzOlj8RvbL825b0VXC/2hZ6RqLFTf5uH6YgYFFvtmWkiykn3Np
         1USxHf0H7pZzl11r+hl0VtDlnEigvINu6Gczj2pZ3YtGrP5NbZBS7OoS7zfSWZghA21F
         /c6pG49nFY6fqFMM0S3L0FR8sR+vwTwPSY0rGjDdlUVtFOWmkJs4ZQU3TafHNJduhQaw
         J2g+OmE8LnIhHlSfU4qmGH9MZboxlYxfFH/rBxo4fAHY/xj9gNwHuMJoGfcDUlfSgrLr
         3g7cawJNIrPGe9ovk5wiukUa6ZvXvwdvO5JecA8a5Vo38PHUAo88XiqW+gg+kBRdgPHZ
         w3VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997572; x=1787602372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        b=lq0QJZSqPMB6VHxj7mAkioRUiFyD36q2902j+kZRlnZnPAVZaQ58Bpg3P7YCh29dvx
         PYmVwXaoyvLdC7Dwe5pnCNUXELJ9rBM245DQpxS6IB97YZzKlrAiUSIzwrvU/vsSLdW9
         7wEe6SELCnkE7nnT7KFBNjBSF+sxQ5kWIai26w0qDou12WXpQ6y/FlGnIcdrvd1o179p
         0WSZ/z26K7cb214FdZTXuM+KhqucKzuJjyuFc8JdOhgSVuOmnAQEvuTvM0QSnmB7JVuu
         U69yo5T+AxLV8DSCr4XyCT5rE9gcLatlpdexkG7ONupHJf2e26728GSdtFtLzmo1Kg6Y
         bBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997572; x=1787602372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        b=AbGzb+9E+oxGtDZDjOcRR0Vwaije4b8xKEu9V6gQjLvhy3OVUqrLdhct8snZBUsAPZ
         vqKlIvO+5B5CzA1tcd4T7nUyiPVhXTnMJlmi2zCWl46YhsWE4BxyoFT90VU7eUM43h3c
         +XcHBk7TF6rLdtP2XlPz5lQcb8YVhEqqgXHty/nUBFvlxoGgf6q1oLtWZ6Yuz1i3wETI
         2xxf7578mOGRKpRek6Q1SLJji6bKRhLb52G/o8XnOioXDexiOPN4xFAW2bStZLttWAmT
         qbHwbgwpGsGQaqNMi/fHxmYt33nPTcK1e5SqPcVkDErVKoIGc4Ibwuv+4qKHOkyKmm1S
         ucag==
X-Forwarded-Encrypted: i=1; AHgh+RrLabPBN0XTyWuQcFpYoM9PMqZU3Hjmpgcf5u+HTvUl9GNgUdBfIrYWy2LYKa5O8z0q5J5ezjhVoHucnYH13Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxczaRgnrSQ+/5JNziIFQbJqfXPpfM64a99vlx5B7mfxkv129Y9
	JdCP6Soc4nM6dB/BhYlv6YOUauQEzoWBNE/tPLRTIXTCwpKQ3Zbe9sS/8RxsI6CJhHjuuCVg2cU
	PsuMGZuQf8CJL8agUosKKfgyucFH6KaA=
X-Gm-Gg: AR+sD11sHAktai5C2rv9RzzvPUqPfnM976GAMUk3G8PLOT+9iXCfpISzk9cBrT/ORWV
	aKpv9v3nyxveijUowM0KymxaXT1ao5v2GgOyz9cLKFhgrXMWYKZ63+6SMq4nJtW7Oxrd3Zwr56g
	1/F4+AmmYzEQGMoeD6JsAqNbq7Xkyv8/HibZgBDEo9NH2DRv6XtoFq96f203DscpCn3G7Xrjbqs
	ZHg1J3fNp/XFxijk/zaRcfDWeNi5XG8l2fDfMPqWV92WxGVBi9UP4sxsuqEKqgLiQt30wHDPTr6
	mSVcLMVPFjbq111clUWFjCfa6FboIqXQ5fn/WRpm6K5nEg+jOED1W03jUNYnkVexvby43hvnLq8
	aHv9AjGMdpl1nk1blJlbzt+yTQKbRxQ==
X-Received: by 2002:a05:6a20:cc0b:b0:3b7:807b:3cd3 with SMTP id
 adf61e73a8af0-3cc71cb2dcamr30661148637.23.1786997572429; Mon, 17 Aug 2026
 13:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:12:40 +0200
X-Gm-Features: AcwNN1XodtdSigZSPtT09IgGY6kHgbqKpKTjm9HggxTjtCUIibmVj2ooHM0J-GU
Message-ID: <CABwQupNAv1bpPF_J9owrHaENx9O2Gt1spaz8HNHyDy+uBXzKng@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add bindings for area operations on bitmaps. Each one is
> made safe by adding some extra checks compared to the underlying C code
> (for example, checking bounds) and with additional checks to catch
> likely erroneous usage if `CONFIG_RUST_BITMAP_HARDENED` is on.
>
> Add tests demonstrating the edge cases.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
