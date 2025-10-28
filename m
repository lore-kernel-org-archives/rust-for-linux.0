Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97D28AB0B
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761688366; cv=none; b=KF694GOpTSkwyRtpFjYO/8q0ZB0vLaz3li4JNzK/K+Y5VmFHVcByHskkSWy4jUXuwLSGfo0u2Pa8hOKovfGjao+TN10lB7t/hd1ifAackdr9lXZIrokFZSL+Ce47kUY/SY4Vdcr4hKSjyDNhQuZOeTCuJQmP6IYC0imVpu05MFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761688366; c=relaxed/simple;
	bh=Rew2DIZQjJQQJYPoWH0uGoFe28Wfig0fDjDy+zsgScA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uCqCQVLLnnx8pcOP1hEa05X5ftuQe5PrQqY7DUXfRkyRo4+e88rWkZtmGXFt8HCZpOn/NeWOTlcb/jCCzrzLyEIqROgbMXv5cjRm0wMDNTK1QTXPfqc+GTOcURNZi167p3x27SZGwjOVdkl1R1SOlTXdlqTluYTQl3xhTzTY9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cjeG0KM3; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cjeG0KM3"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4298da9effcso4344518f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761688363; x=1762293163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxvTcp57iqNZaGWW5QgrfrUxUlyacGTsuw9SR8IN/F8=;
        b=cjeG0KM3S9e/fLCifyJnDq7staSsT06DuhJl6DFuIjBan130TqhHKatgMFDCF1nbZF
         VH/4S83CO20ZK2Hy9OxcD7uVDHr+7ERcUlDe4SK4JjuN6+kaF8l667yMg5iwXjXdTxMF
         Sr2Zr25Xrh8NZLbF+IBNBwh1sRcycWxCFWXzRfmiuR42Lpmj3BvoUYnMBaGaMIg2utp9
         5WAyWfNVkXsJMyTF1naTPoF0h6O5cBRQkqox2f+g+a5vonCxd2otZKUwbAoVMuU7PqUz
         Bu3poAlYQuxF+3qKZceu1YNNKO2LpR9/B9CXJujpYyvGFP7ZbBQsgiK+aHg0H3uijfc6
         tF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761688363; x=1762293163;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gxvTcp57iqNZaGWW5QgrfrUxUlyacGTsuw9SR8IN/F8=;
        b=PoLEWchRn62/ODXdd8fqItmRGdkvrRPrlhD/XpLJG1S4yq7Jc5v/SFrbaPG8cdZHOX
         VD4fFqzCmSPZG6udQ3gM/nYZ0tGKU3paPLthDo3bp7fWU2qJOEjBb7sdeRssdoEn1G+M
         9ptYkeij6gLWGrGI8LAGcOasiNULP9lmL/YuyPEKmrMfLxYlDsElmLLywHfiUB5jPuVD
         eYuKHnl2Uo+VWGqrRrN6LtfUeNKZ2btpaZbQUIDSJ9JHv7te3hKabkYPNExsKMdh3VWJ
         wBKDRObXqL8wGDB9GAepdftmq/lTNRKKryGGBBI9vGY9dKjSkBiN0Exjzjc48HqGi+QD
         PAiA==
X-Forwarded-Encrypted: i=1; AJvYcCUrCX7EWENvHn93tYNvFqEY0rqnuY26YzHrpYR+OU8XlMZ0bI4SPRr67wYhJs8c2ZCQfNuqPFFfOhVky1tBdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYgS1wcXwlWGRMssavxRGM55JKwfy6LniqLk9ll9CdMXQVKSc
	sMSmm336jc7jJMK1jM48yi3w7C+qlanm2WFkRtMQf2ib7+RcoOymyeg9YMq1OYQ+WqTJYhWcQQf
	nWvflJNv/se7yvI/c/w==
X-Google-Smtp-Source: AGHT+IFqfPgRstRelzXH+amB/IjwATor/dkpPTNhB7q+WHWYQFrq8HCUWQ8G/CKZe92IMAQ4Z7r4uuvZpYk2Ums=
X-Received: from wmkg4.prod.google.com ([2002:a7b:c4c4:0:b0:46f:aa50:d70f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5250:b0:46d:9d28:fb5e with SMTP id 5b1f17b1804b1-4771e16e471mr7732565e9.5.1761688363173;
 Tue, 28 Oct 2025 14:52:43 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:52:42 +0000
In-Reply-To: <20251028211801.85215-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028211801.85215-1-lyude@redhat.com>
Message-ID: <aQE7KliosIU_0Bll@google.com>
Subject: Re: [PATCH] rust/dma: Take &mut self in CoherentAllocation::field_write()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 05:18:01PM -0400, Lyude Paul wrote:
> At the moment - CoherentAllocation::field_write() only takes an immutable
> reference to self. This means it's possible for a user to mistakenly call
> field_write() while Rust still has a slice taken out for the coherent
> allocation:
>=20
>   let alloc: CoherentAllocation<CoolStruct> =3D /* =E2=80=A6 */;
>=20
>   let evil_slice =3D unsafe { alloc.as_slice(/* =E2=80=A6 */)? };
>   dma_write!(alloc[1].cool_field =3D 42); /* UB! */
>=20
> Keep in mind: the above example is technically a violation of the safety
> contract of as_slice(), so luckily this detail shouldn't currently be
> causing any UB in the kernel. But, there's no reason we should be solely
> relying on the safety contract for enforcing this when we can just use a
> mutable reference and already do so in other parts of the API.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>

Didn't we do this intentionally so that it's possible to write to
different parts of the allocation without protecting the entire region
with a lock?

Alice
