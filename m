Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721072080C1
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212076; cv=none; b=DasgavX3xHiyFSfA7pQtFKpjt1iKWTWrp0GiELJpg59fT5x6RtyGSpc7HQ3qVdx2yeQzLgrYW9LQrFMtb7i+IUEfByib0xiGjZDSO6PuxRC26ACM72HSzdjOF6FDAoA5sA306zSGcsZHV86M5/8ZM/uh9cSiSkhpRRC4F0e12TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212076; c=relaxed/simple;
	bh=xsA9SQb+/OFmiyqy8KvlFYfWN5nGuahSBL5qwTlZBL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DX9s/EqZYON23sCB7t5QLIARxyZ9C8DRyj7x4VXEmGpkJzUQzZP++aZslVXjVzzw39bWySsYwloo+81se/OT+LM9EE/5fZUkw4GE8JWDcliUDSsbhuCSQd0/y32vNWW3pPyemXeRSlGa0E1gMMevae51tZ3vrjmvDden0QR8L30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=THk11wR7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="THk11wR7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so15366145e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742212073; x=1742816873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsA9SQb+/OFmiyqy8KvlFYfWN5nGuahSBL5qwTlZBL0=;
        b=THk11wR7xRfp07yhtztNxfV6Bw7RIzzhrjmZHV1j5bnD6yXFA925FRS7h9/FrKrX67
         zmEAAInEWLHL7gFQwNCURNvVvxrsx9mgR8k0bXIiQL9TCIF6vaS5Gn0LCY8ShfocpV+u
         VC3Gkc9j12ZuOpBL2rEUQhBTvE32a6Wz7uCImUlO2HB1+3Nmd2OsxL2XTbnvMj1v7+N0
         F2e0Yaefji1CZcBiKbrPe0ubP9dJksR0vMoRfoKbfv3xShLas23ngxsowCDvahGXXtah
         fwLTl9DpdJFVsw3PEkkMOH+8GlnsmExRbuI9bNdjyOtPoHqlXHhZn3fRsMqDDMWH10rG
         ZKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212073; x=1742816873;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xsA9SQb+/OFmiyqy8KvlFYfWN5nGuahSBL5qwTlZBL0=;
        b=wWguQQn3o3lwDr8Rv8kYEKzq+QDjLY7kCxxe5A4Y7JPiEmF8z/obGB33zJu9C8M8OQ
         jaLM8k3B3AG0++rfJIE0uujEZxuOGX9bk95V2iIT0fJlVAuetuvLgSx44aiO6tLE6PKr
         g5DFVZfLH3NowYYDnQwytdEhm5wfZay/69GMX4G9Ya66SrdJ+nAqsFKip+aLC7+Ync8j
         CL9g37SWmDXHWekxsM3a6EgSY21wTzHAmTsO8O+PJfv1/VVnNjsU6fheLi229klSo/mB
         /pR/qmpqgPNQ9iUXwV6wzIY9QcXekH7uHFbmvuYcjH5nNNWkqi3tNyaxvAXr22sJi2Pk
         K5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw94d0eRdflrSJv3K9PCv/wT9XUZswhPCXidIoaaWOZPMXBpDSkWLWiQLkIxyQqLUZ124ewPceibTdK7bdtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6W95a4qfUFZHSxewwyMz6OgFZxMLjoq1rR6/CPQP3NvwQ1ft
	khrVs5W9zzEhqhE59csdhk/JGDm3RnvgkhLwgRpihwqXfooTEi5yhqTOETlKBy+OTx0QjjViDpN
	4JQS++emSML8o/Q==
X-Google-Smtp-Source: AGHT+IHvrRiZPwEAiCbABxkr6B9z355kEoDig4uUNC4rURZqb4W0qxAb2JrapZHIksVqIadtK5iI1woPxAlRK6Q=
X-Received: from wmbgx14.prod.google.com ([2002:a05:600c:858e:b0:43c:eaf6:525e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cd:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43d1ecd932fmr127507565e9.31.1742212072870;
 Mon, 17 Mar 2025 04:47:52 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:47:50 +0000
In-Reply-To: <CAJ-ks9=oq+c_pMg41QgGWsj=phWYfntXQgpSrFmz16Vifofn3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250316-vec-set-len-v1-0-60f98a28723f@gmail.com>
 <20250316-vec-set-len-v1-2-60f98a28723f@gmail.com> <D8IGFTJXS2A1.9JBD1UKGN4PX@proton.me>
 <CAJ-ks9=oq+c_pMg41QgGWsj=phWYfntXQgpSrFmz16Vifofn3g@mail.gmail.com>
Message-ID: <Z9gL5hQWvCNy5XNH@google.com>
Subject: Re: [PATCH 2/2] rust: alloc: add `Vec::dec_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Danilo Krummrich <dakr@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 07:34:44AM -0400, Tamir Duberstein wrote:
> On Mon, Mar 17, 2025 at 6:04=E2=80=AFAM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On Sun Mar 16, 2025 at 11:32 PM CET, Tamir Duberstein wrote:
> > > Add `Vec::dec_len` that reduces the length of the receiver. This meth=
od
> > > is intended to be used from methods that remove elements from `Vec` s=
uch
> > > as `truncate`, `pop`, `remove`, and others. This method is intentiona=
lly
> > > not `pub`.
> >
> > I think it should be `pub`. Otherwise we're loosing functionality
> > compared to now. If one decides to give the raw pointer to some C API
> > that takes ownership of the pointer, then I want them to be able to cal=
l
> > `dec_len` manually.
>=20
> This is premature. It is trivial to make this function pub when the need =
arises.

Normally I'd agree with Benno, but in this case I think having it
private is preferable. The function is safe, so it's too easy for
end-users to confuse it with truncate.

Alice
