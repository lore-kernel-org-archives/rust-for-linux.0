Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E32472A5
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489956; cv=none; b=GQHU8eSDN9JydkE9jL8FYStDdwnKt+atqoYHGjWe/gXnPH9Ps/cRsCm1qMn+JitdQzt8mlmFtIdOQ5eiJ4Kb+CATG53PqDOJ+AZD9N4ybgAQgNQfjz/ur/FXhNwT3/cUaRlq8IZ4EKj71VtDoSSZPdD5pbCsn2fpljX8e9SVUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489956; c=relaxed/simple;
	bh=CzH9y1iUWR4nDaqh3cxGyltvFXJQU1S8nDrbLaFGHY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfX5qAIQfA+FNJV7d8CBb9DJ2JwgelrLwmhEwMpkbwAGDB2Wdg84Hr91jxllJlx6Ncemv02pvkpg9Us8khhzn9mxx4ltFE2NX1DK3Dg2SUCvS2aR/5uJKoFNbfFkSZnMEfwgRe3dsMWJugCRlMrnLBmsSyFsqxPnZDwNO6f7fik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YXH3ndLq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YXH3ndLq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so2405186f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752489952; x=1753094752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzH9y1iUWR4nDaqh3cxGyltvFXJQU1S8nDrbLaFGHY4=;
        b=YXH3ndLqABBXUGqAl3oZ9cCH5fxiV5KSVs/UfVqjeKjnnrQRG11j7MGbGSWcmJLFQw
         Ek5forruBccjkVZSg1TFrGjhP5AMPOxu8umCpz/cOqCyYNust+o1kimhkmbsecSNYc4n
         JNkF3eH0qzrqmyHC9inAONkQxWBmYyiIxpsgXE8NiqphIl1g/Z8Ud2nQPNoe8zQdJtf9
         qsX9Xll9Ba4tXLaw65fg/AE+dwrA5THT7M21Ujh/6TpsAP8dA6DMhLtxDKfzKrRoDEAV
         Bb9puqvx4FEsxB2qag4Ufj5CTKxg2AvEi36UVYHX9AwTseEBWjtPxU6Rju2EKb3yBFTb
         VuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489952; x=1753094752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzH9y1iUWR4nDaqh3cxGyltvFXJQU1S8nDrbLaFGHY4=;
        b=cRNelEdKBoIcTFJp38f+F4cYLY54o4m+x/DOk5VJ8CNUZe6VA2nGdYY78Nr0YT/8Lf
         Z5p54FSBVz9qRnOWqfpuL2KtrOux0DIZyrfY+Iy5OTT1J7I0s6peuIceqg6+9XYrH9So
         qQ9hUFNiNYXzGrNjPCsapbFoUJ375Oq6e8BvQ6gpj6J5Q4AzhRpN+kjyX0y15IA/abcs
         csc0Jph1O+oa+5/qvGNycWcA48nZvQzxdxuqDhu2wyTNLMZubSFptegPIGUiq6mVTbjm
         l+HqloRnVgTa+o43i2P/TWV906AobdDAtRNz0oXS0K5j92Ft4GCKa3CHHfrGSspfr7DX
         C9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzYzyxP66GHm6nfPrjVJ/DSZgjT9yN7aGu8dv/ddtqoZeMGLfbe0vAcuWW7Z+YodCDdyOLH2sY7RdN/gRhNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJMppTuHOEc2KMVwGgkdp5U8p2/rq4Zzg1QQuRuwUDlvnLuyx
	fWofSvDIPgTtdHTen7c0mnyNIu5U80H5c1iyUkd1Ac5l3VImG9GHTj0NT7HOE7Ars9LH6q1NbgQ
	kxe9RrmgEQpqiMbeorrLaCYy7OmU/xdkPWlwJMhER
X-Gm-Gg: ASbGnctmVNjm+CAinWb68yj5Zp+LWbHVAqzPiv5qFOcZVopScqpxLTd+NBA9ftkYS6b
	KOOPOiR8R+kfAMXjnibUAxytpQBhl8aLHl+HG8pzniQjDQm7igeMQfbhrTQ4hHkX3FjmQ5faWTc
	s8KRBQ99AhSM/AIFARKhHuPJ6wGKHNtvyB8UIzNug2O+YVCxlS9wJNPZeAxyhdXFSDDa8xZkbWd
	8is63b1x1V4nB058+gLkzSafahUx2a2nUjSVg==
X-Google-Smtp-Source: AGHT+IFuaThDu6sKyZay+yZyfsQDiG54qBZB91b9a1e1KVBlRl/3l2slwG5BRUZ3u59AAqElcvYFV3Cdo7cbx5oqoMo=
X-Received: by 2002:a05:6000:240e:b0:3a4:df80:7284 with SMTP id
 ffacd0b85a97d-3b5f351d7camr8115012f8f.1.1752489952076; Mon, 14 Jul 2025
 03:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-workqueue-delay-v3-1-3fe17b18b9d1@google.com> <DB9A8OPZK3DZ.YVQPQQSD12MU@kernel.org>
In-Reply-To: <DB9A8OPZK3DZ.YVQPQQSD12MU@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Jul 2025 12:45:40 +0200
X-Gm-Features: Ac12FXyTRcfTKMH9Mvagvy6AdIiMuzAfB1WBR_848IQMThGSsgAnTgtWRJa9d90
Message-ID: <CAH5fLgg80eGbYQPeLtHsVqfQ4UmftUpzdhzWaah8qs5HwRhk6Q@mail.gmail.com>
Subject: Re: [PATCH v3] workqueue: rust: add delayed work items
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 4:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Hi Alice,
>
> On Fri Jul 11, 2025 at 9:59 AM CEST, Alice Ryhl wrote:
> > This patch is being sent for use in the various Rust GPU drivers that
> > are under development. It provides the additional feature of work items
> > that are executed after a delay.
>
> I thought I commented on this in a previous version already, but apparent=
ly I
> haven't (was it a different thread maybe?).
>
> For drivers, we should also support 'scoped' work items and worqueues, wh=
ere
> 'scoped' means limit the lifetime to the driver being bound to a device.
>
> For better understanding, in C one would call this devm_alloc_workqueue()=
, which
> would guarantee that the workqueue is terminated on device unbind. Simila=
r for
> individual work items on shared workqueues (such as the system ones), whi=
ch
> would be canceled synchronously on driver unbind.
>
> This is very useful for drivers, since it allows to provide a &Device<Bou=
nd>
> within the work's callback, which allows drivers to access device resourc=
es
> safely and directly without additional overhead.

I believe that additional feature is more closely related to
https://lore.kernel.org/rust-for-linux/20250411-create-workqueue-v1-1-f7dbe=
7f1e05f@google.com/

Alice
