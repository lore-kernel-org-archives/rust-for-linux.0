Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0C2FFFB8
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166969; cv=none; b=P6ZKpdRX3D10jYKo+X1dS5y4S69s9o/nmCUs5X8Hcdd33p/dU5TDMP9fXndzM+Y62VTi5rinGSq9ev7+Yp4xUS+T7RZLZjzRguqKr5SDorC7EJME8bmWPqmLK0H88Gw22OkoOWvITD/EST4BK04WuWM7yzwznqjYQ7y3oF5AVUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166969; c=relaxed/simple;
	bh=Evfz1tcnqjd0f5x1YIdlbDb29zhP2FMybct8RGVgIjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VxFtpRwfhMczW6LKHZORvjTDPRG3dKSIRO3uL2uawNHt1A2skMfqFxAUEqrA86+vCLv9m1mvy9ue5MM3MnTzL+8zDlkQk/0ubkEDF9aaWvvujukp9OuWvezsDTS6/ayzPAbnMPrEVARhEfd4KuQNoRLkV5Bu9JbgpmiTETU2XrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k76QV0pd; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k76QV0pd"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-475de0566adso31896505e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 02:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762166966; x=1762771766; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpWdihMx06jCjHLY5EmCWwN5NA1F7kZ8RlapB6cD5OU=;
        b=k76QV0pdbNe/7LbOu//naw1MYKjcN6XMViWCaSSaCh1xXW31822vn83SUvkd/kMczC
         qjF/vf06TjQ5NltNvQAk7EA+DQFmX+4aHgJq3C2IAGPhcnnpQOC7QbmpGrySg4Q5EwrR
         UinoPIbBiJX0WcNg+aohLLt1Iz3RqM4pNd8cf9TptmeuBdqJqPM0RKMHL3U+wHKR5COS
         mYub+WEsZJtHd0rNSWcfOqaoEubSmmQjK9qK2Qnx0LJRcpa/5VyXkTo4/3k29C+XPMfc
         sX4shZ/mY71mAoKeTniRUdvZO4ZEaTX1KujbuZZTYZ3VMNljhCCNExrZRUqLO4vFDvQ1
         R5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166966; x=1762771766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpWdihMx06jCjHLY5EmCWwN5NA1F7kZ8RlapB6cD5OU=;
        b=bWmTTzXS449OH0hrLXH9zob2r8W2uqZkW1AbccrJWO2tVC/mdYMYNf8v9LT2nfBd3k
         z9Vwbp5ZzOVYfvO0SAglQRIEq3LH6OFAx59nrcBT3g1Sndgo5JCZwGQtMuQ8YJdIRAIg
         34IJ7vWz7zG5uV/M6SoOIOK/2lUiX1x6eO3lwFP+iiAr8khuLQTE2GYGcyG6J1lZb/DN
         1CbFu09Yy+fTVNNiU2Vt23CXvHRMlUTnZouKtjjFZ+bgyF+xw/WJPOYW94wwqf4Vw/3Y
         i1OX9PqSzyVQpWPra4ABa/d2GRkhJIr09K0SVf3gOyw0OFDu+gQMznguN8JMUUyeQXIe
         rZfw==
X-Forwarded-Encrypted: i=1; AJvYcCXvNnnCpjDBSYG8LQ3wgBqtkC5joXkeRq236/6M8swUOQrYhrjSho9mwnNiODOyI/2B4JSKa4V6ZoezYwgBGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0mS/tGfnFvPbRxxtJIZCSSsAa9RVNIkUMNfkwx136QGGxWPT
	TD2NEi9oUXWUnWRQ6lsj4ahDIS/+r7W0/Rx09pv/MRy+IZnpaEt0FRo2y8cOWPk47YmozhmCnIb
	OzBae235jPS+kYpppyA==
X-Google-Smtp-Source: AGHT+IEQzl/e6rTwNPnjUtOH6pZmLtmwiNJNjCotzrRyo/a0nRPHwZhBiPYChczpTpEtjWOvjSdmGgtTEihcQ/k=
X-Received: from wma5.prod.google.com ([2002:a05:600c:8905:b0:475:d8de:fe5b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:848d:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-477308b222dmr106823955e9.33.1762166966577;
 Mon, 03 Nov 2025 02:49:26 -0800 (PST)
Date: Mon, 3 Nov 2025 10:49:25 +0000
In-Reply-To: <aQiBTOj1jl4xM3pJ@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251102-bounded_ints-v2-0-7ef0c26b1d36@nvidia.com>
 <20251102-bounded_ints-v2-1-7ef0c26b1d36@nvidia.com> <aQiBTOj1jl4xM3pJ@google.com>
Message-ID: <aQiItc35Y19l4HOc@google.com>
Subject: Re: [PATCH v2 1/2] rust: add BitInt integer wrapping type
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 10:17:48AM +0000, Alice Ryhl wrote:
> On Sun, Nov 02, 2025 at 11:24:42PM +0900, Alexandre Courbot wrote:
> > Add the `BitInt` type, which is an integer on which the number of bits
> > allowed to be used is restricted, capping its maximal value below that
> > of primitive type is wraps.
> > 
> > This is useful to e.g. enforce guarantees when working with bit fields.
> > 
> > Alongside this type, provide many `From` and `TryFrom` implementations
> > are to reduce friction when using with regular integer types. Proxy
> > implementations of common integer traits are also provided.
> > 
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Actually, I saw Yury's comments on v1 and I have some additional comments
as well. See my reply there.

Alice
