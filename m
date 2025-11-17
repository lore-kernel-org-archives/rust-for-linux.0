Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC383254A7
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763414833; cv=none; b=eehst/mJbcrzsxY2Dh/431P9WZIJKLLDO/9jtjzQ+aP2s+BM1YeLkC1WWlpui38/YGsLTWN/yBYmaRFfXG0q8iLAphzCX/gdwLio3zoJfgmTp1NyZxOijAZsTkuEW3nDMtB3N1+yoVbpVBbVsOD3cz4ZNZNNpsR06B4x0fv5BGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763414833; c=relaxed/simple;
	bh=7fPlXJYjsSilCDIe8k2o+rTnQyrHViW9qFIFSlnjorI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnEiHzsp+C9WXX+9TVtYmR84IhS1Owo7ezyk/YOuXk2+C+kBSsQM2Kc8asXIgv8TdDY5ffeLDH203E8heZEumCtF2Kgm1wq7UqM+AF/fvDOvtt5Lc9KcT+WnO8UPpaQAIeay1XbgDuk/xQKVDF59gin+qIAVIfpKHRXdAcAcxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQS3Y9RZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQS3Y9RZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-299e43c1adbso1743555ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 13:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763414830; x=1764019630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fPlXJYjsSilCDIe8k2o+rTnQyrHViW9qFIFSlnjorI=;
        b=LQS3Y9RZG6vRiN4TSPJO1Pf+HHj4fKZqYHf4csvQ1r+RV2o7gLBARifRaYQZWjGijF
         NU7uIMrh/rLf70kQ/w8lAEFOkd3uG/VB77wmglmB1Vlp4Md67Dv/NJBjxGfUVowqbkTF
         rpHpOf8iB6pER7+HloF6oQdAn9OU0rZNGO3s2SaOD+8CS0Bm/ZmazJ5ELDNZGdYdMRkq
         M+3+Yyqt4UUXqnyFeXq3XBu9Dprt/1Qn80RR6zS1FpvzNDS/KF5VmwZeZ8Fn9Bdh9r/C
         vSLV1GIEAo28tg/bDjb/b9CtDeBe4V0tmm65eFYmrOPQyqhI8GoU0nphLHctyDe4BEZT
         2+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763414830; x=1764019630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fPlXJYjsSilCDIe8k2o+rTnQyrHViW9qFIFSlnjorI=;
        b=QIFCx+Gpgc4egYAXKm3mxJXbvSgxnJ8U56CilDymcFSRFaXKWdluX/hjWl/wMW8RcZ
         hJH9JU7gkK3+gxRdaOxxKLoI9h9UGk5uxe3C9YxjnWTOMJvgeAhFoIXjzWJDneCNl/CG
         DXhRCWaBu4LgPFI+59qndN90VWYjmfOvfBakqsRQn7XFnJ93fisl5xRLYW/rmlfXdrGq
         78Wo3JDqA1rKbOcH5DwOzl3dVLg7c3UvrCz26cVizmqjkFVWN6af9PJKglYqaoXpt6J3
         mnvVyV0lqsRJrMulnH0soR37vkvMSuLuD/p0BIOTQvX6g0CWctWGGO3WLMh2fGNL/drZ
         ZWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUIsT/3B6F+4h0WsKEy5Xs4jgDxDt2IKgjGiE0MAu2pEiJOQrERMM2VOfYFXdlX3bXNCFs5jk4JdlqYX90HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34PoUOpu8hNwfWMcQttlgv5KFMpCPplJpBfIvvhs83ZxiK+40
	IJm0Fjj8BvG1TQaLM5zJhpM1ccRcrdIZtoVCwWkVWhdDZjWi+3gA/P67ePQHVGoDS1MQKOYbo33
	wXaAsq2fSw5Lyzm2hW7NLCUxRnAIdscQ=
X-Gm-Gg: ASbGncv0jfAV4MngX4vz97gsebFm4y6stGxhW14Cp4dVGFbWuX5MWwXIgjJMLBoMQJB
	IgBRfs1H1Y+HDD9QZKPO7w1yPnp3fgDbGwfr8pBebMorn35ZGT/y1XeAUb4QnU3OKpEe4Svmf7b
	psaE3R4oD4I40WECuHVLkj6xyPrpGRRzaX9Oj7gGFRp3YzdfcBu+X3ZqbIlla9Fk0b0Pm/5wsn9
	bl4Gj1K/9G//BauxS9aAFuCfg/cIUd0QcWdMvM9nlDthKMIaokM+1wa90fwn2MKTpXRWgPmBkxe
	mHy5J5ke5WIyQYbngZH9hZktfpYp/yghaHsnFJ5WK7QKtiHxi1u0GhP0vE0ucLnT1+2aArB9DoO
	lrfU2NH7aHaVJcw==
X-Google-Smtp-Source: AGHT+IEdsu/Qgk454YfNKkEm3dxgZd63f+Euy5hTycBzZybjRHcCjF7RFqpoUEYdE2tEOHrEkK6aqX8cPhz5W4io1bA=
X-Received: by 2002:a05:7300:d0a7:b0:2a4:3593:5fc7 with SMTP id
 5a478bee46e88-2a4ab8a954cmr4688445eec.1.1763414830128; Mon, 17 Nov 2025
 13:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117080714.876978-1-ojeda@kernel.org> <CANiq72=-w2p8sQgUKYgPG3Tx9GSUNgcVUp24k0ck2RqYgupCVg@mail.gmail.com>
 <da4877d2-65fd-4ad2-ac31-68d55bda7c07@nvidia.com>
In-Reply-To: <da4877d2-65fd-4ad2-ac31-68d55bda7c07@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 22:26:57 +0100
X-Gm-Features: AWmQ_bmCoQhe0tDaYS23xSdPDegbNWBwAWpbPsNqHFk8KCfWm6zlxE8mP2aCibo
Message-ID: <CANiq72mXN3U-oZDMfkCNTNLtvReZjROdgNmUDQ0H=kDP5FbopQ@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::disallowed_names` for doctests
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:13=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> The current set of disallowed names is inherited from clippy's defaults [=
1],
> which are "foo", "baz", and "quux". This may be extended via .clipy.toml,
> which so far has no entries for disallowed names.

As for this paragraph, I am confused why we would want to add it.

This isn't about extending the disallowed names or about how the lint
works in general. It is just about disabling the lint entirely for
doctests.

So adding that paragraph would make it the commit more confusing.

Cheers,
Miguel
