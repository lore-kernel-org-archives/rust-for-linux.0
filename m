Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9D2BE7CD
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768730932; cv=none; b=qzo709bcZycl295XN5fUp5w9hrGY4maJrx4b3kQt8b/N6lkkSyCPWEsqv4fS1LGD6IdyJVwDtS2kivkgdK6cy+Dc7IgmaEKR3vmY2i9IF7eNtLasPXz6s09Ud+8yzg8VSXWsiFPZ5eL7t3a5m6noMzyENMjgH0FDdJW3r4eTArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768730932; c=relaxed/simple;
	bh=hZMqDOiBhVT6Gqfcrnl8FzxYs8BKqFbsfne4yu/5XKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui2Wm2MlI5eG3DM9hnJ6/KJW8KR74LpNrx9GDybWXRSYk1fP9FYNSy+ZCdg22WAvqza6IN8A1gvr9DQi87BTVODLutot5wbK14pP/XXyFbM0tqdl5Z7iJsuJRHKtiseBJ4PFPvbcyOKSDfyiEUm+w7TazTJa6aKwXvmc9ix0KLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5hQciyZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5hQciyZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801d21c411so9983845e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 02:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768730930; x=1769335730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhEepC620f7PSurENGJkYTsztzKlzLPGFJM6HD3c33o=;
        b=h5hQciyZ0V6x2RzEkzpvHXZJN6A9lCKongSk6GqfKKon2IPso5RNkc1UU2a3+RAyD9
         WoL7FuRIIIx/ZJM6VvPZEabvvgWq3EhcLajIuh0jH0A4a3qRGpB1WOOm8QAVesy9qYvl
         E01/c5ReuWq21LEGW816bi1RlSId3Q4XxfcgrHiGANr0xkVpumzPPX89RNE0bHMTYzWN
         nmCFVWvWVYVYCTZ607c9KwBFwYSwJ6ZXoReZJBsy7iv7WmEJFw9Tk/OjPVmcUbDGNvkN
         LQk31xf8ld953Zz/HhLCV+u2KnLMpGVEtBfCZKDOyKk6ajS7jPU+MSkgw0NhrRKd3trg
         UUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768730930; x=1769335730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhEepC620f7PSurENGJkYTsztzKlzLPGFJM6HD3c33o=;
        b=u2fm1+/Fn88NWO2dNVlRpOWluzXMi8PY5DHV0C8Ff/jzR7ur84K/0oH+nxkdhMm6ag
         7YxOTx/o1K1xHoTFl0q7bIKzR4+rbBRX1bl+si6C/0eWQpL7d6P3CLv/aDvfGX4Jlu/V
         CP4tWKypIKvQRJfOwZAnXIOOJoMpKR/92j6Rc9T/YEA0yXi0RG+1r9RTBf0AvBm1CXv9
         TL/dI7KrtbTJdhRXQsgUwOzJb6+B0JRwBejejqTKhDPkWmRHL/vNFdweKbltVHxezqIq
         VLGPCKyF3CyccxCBdB0Idw1hBB6t10nf/9tGC3NjZOjr8LoUCbXKJ6vsz4tVDTsgwB5h
         O1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXdwJz35+Khp7Ib0S3gsHC/1QG8q38lyByppYwl0PVYbqzaREOFgdkHJFbHZEQUD85p4O9CRqfFOWM7eq4GZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycdyLnOw7XJ2grSEhbhHE6eS2KeJqO+UDO9QHiKFH8Sujw6L2P
	gcmbwjzZJ9HL01CCnSYdCMmE/dj80nF3InCvRePCZfYNBqJoxPxXTDuKQGuSZkRImMsJqddbEmz
	Qt4Bpz70BqF2oIU5z0jOF5QbPnTVFTO3JVomtuNef
X-Gm-Gg: AY/fxX6ezMdBdtz0q8v6s5ILLNEf+2ObSEu6enIaOYJmBAYnbZlFOtf9EuCS4wkOoF1
	nWL2QEXmVgenw/AMDTg4uHtI26TesEeDBrQOiqZB62HORKiBkAsRZbj3ANcwkM6Gm4cC8TL7BOF
	1VlU+R3oDaazY8J4hWjZsLLNpBj+A4p52okeX+KB8fEFkQugmqfs+WlD7Hm7XvwjZOM5y+yzvuo
	BAfUlA/jy4tNLyBkCCiIrEHKBRudXp4tO3rxKUQ7k3JuXhSHd9jE5RmX5JCgKbhQXu4sCvZmYa7
	VmvSA2zaX5k/oNnsg2GmPaoOKnFprkUeQgdL
X-Received: by 2002:a05:600c:5486:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-4801e33a82bmr102416435e9.21.1768730929647; Sun, 18 Jan 2026
 02:08:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-io-pgtable-v5-1-7ed771bc3d8d@google.com> <swz2lj4xhs6vjmjs56aj5u7pbk4uaqur3cqt4zoybqrx7yckg5@ifu7j7i2fmco>
In-Reply-To: <swz2lj4xhs6vjmjs56aj5u7pbk4uaqur3cqt4zoybqrx7yckg5@ifu7j7i2fmco>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 18 Jan 2026 11:08:37 +0100
X-Gm-Features: AZwV_QgEnja4-Py9gRSQ--EfuDMdE5KO9EC5s-5Nzmv9xxOLMF8VJHFVFbHfPAQ
Message-ID: <CAH5fLgi3sPq5BfkPWJ0ytqyGx7hKb=4GsTcX-ReVtEkKG-re7Q@mail.gmail.com>
Subject: Re: [PATCH v5] io: add io_pgtable abstraction
To: Joerg Roedel <joro@8bytes.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:50=E2=80=AFAM Joerg Roedel <joro@8bytes.org> wro=
te:
>
> Hi Alice,
>
> On Tue, Jan 13, 2026 at 08:49:27AM +0000, Alice Ryhl wrote:
> >  MAINTAINERS                     |   1 +
> >  rust/bindings/bindings_helper.h |   3 +-
> >  rust/kernel/io.rs               |   1 +
> >  rust/kernel/io/pgtable.rs       | 276 ++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 280 insertions(+), 1 deletion(-)
>
> Thanks for your contribution! I'd like to queue that for 6.20 but agree w=
ith
> Danilo that there should be a dedicated iommu directory under rust/kernel=
/. Can
> you please move the file and send a v6?
>
> That directory might some day also contain everything needed to having fu=
ll
> IOMMU drivers written in Rust :)

Done!
