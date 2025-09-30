Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECED2F49E9
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759225499; cv=none; b=lCC3RYKYRD6Eu7Z/mq8e++Q8om2kgIMquQrK+H7piu2IL+WYPJhqeF6u5Do6ycHi9W3QX0o9QYW+UUHjzmZ1NtR4bNqpXrONr1AEFeGADrxJ+QQp3Ea6u1lBXkmpFy/kIlWJtBBvK7GeBLiGlt58cdEuj4KkCt7cX0Tqrwq+d2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759225499; c=relaxed/simple;
	bh=EOpvFLC0DM+CJsSaiaGKaJte91AVZz5/fq5Fn3S7jSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7E9/TPaldt763Q279GYRncoKpQnl/9YSfdt6nU8/1sJyXMuDpU8ALlQCRQQzjBlGUMMaWa5t5rPbPARr98Fk0xEAD7VzFP9nF7UP3GusDBPO8rRs2WoQcHcBT4EXKe/cTOGML9gTOAnWKPbf5i+Vz54YFA9U9n+KyS6TfbCbo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt8nxaTF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt8nxaTF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269ba651d06so11299785ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759225497; x=1759830297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOpvFLC0DM+CJsSaiaGKaJte91AVZz5/fq5Fn3S7jSA=;
        b=Gt8nxaTF074tFW0h5JNFPey4oRRMLfGERSBWyZRPg+aPXWhHaqD9nuJRQjzK6shPpr
         Y62YOuWCe+br11LvhtrxrNNi3txt600AwTFQNITmJCw6f8rQy/uTTHVPa0v78Xw8fcWV
         8vQrg9KYuGzmt8A16r0nBfoHdftkWC7naUX/2dflseDxxS/n3mPvJjGkf0BDb8lCZUFL
         6vd5rhxUrUGuaZbdN/9BRJnAeMM6wyqHCqBnUCMjla9G/YybF5rbY2wmKj1oOa8CJ4FE
         Va9ZhsZelXXX9FwecomCRDCQ1Zszk/2o7INaZlR6tdVH9n5LNkySSq97ZERiOuPVQiw/
         Ku8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759225497; x=1759830297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOpvFLC0DM+CJsSaiaGKaJte91AVZz5/fq5Fn3S7jSA=;
        b=Wgs7YY0FAyPoRIB/AEXBQwvN+hRSK6UKk7jpJ5WoNP4zfbIK+CV7iX8i/isKB3Ltux
         cv9v0TiavUDK4mOgB6Ccdwn4B72tgIVci+kCrJvbYR98aaGdZd6mvXzS7bSgVx8Zvprr
         zYg7aBs8w+ZQfncg6cTRdiKad+9+hbXUSIgP1D5n6jNVNPGSe18IqMih65RqTdlzv+wi
         dQeUOpi30yHbnFI3b7OTTs2arIWIqrA7eT8FAIAgvyHZ9QHVgloSVG8kHIMDd0csaVCB
         QWpieODe7QoByqq9Xo4CVe/EktQc+8m65JxTgl1vZSET39VgF7fN2r4Imx5zb5ji8Wf4
         q+8A==
X-Forwarded-Encrypted: i=1; AJvYcCXPxLtGcV/9OkIJmOyBXhwVyRcRrQksyXJkGNpQpnrp14tpZaHxQxipEzBhqe2bStjCbvM8oMK3e5rzaraZtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRt0aPRvf4Zt+CamwGpBfZD3rm8OOjn5QN6BeCl163LBpzqEh
	qBdhSaI21u4zwPTHR6NsWdi0Tqd5LJhr8T7oUVOqM0KM6pmHuthtIeRX30MTgDai+MpmjVHebKg
	GD5WU2s0r29A49vHT8wHFK1P+pmWFSR0=
X-Gm-Gg: ASbGncsQe3oNR2SNrCKYl3ku5asBpTap5RkdccSrwGYRk0lNiAB61Ic71pDGMeCY84o
	U106Lkifi2BFScEgN9vLTPXgxrB1QKNlvt4p1KNXlZ/9zjqZRvIOkIFD8gWVeGCcXSm51MI5XuO
	4mVx38xfw3w5GxATwaqtZCsDQk1LCX5bKATs1a8g+XqrPnekZOI/pJoDuHSuy3DUFRxVyyc7qd9
	xv58rOpWWsoLQsiOqXFVRKfl9R1fYxZa6nEXkwGRZ6YlBlbtwoguzKbd3h9ldWt1/l08YHwI699
	qY95lVpQHgkJO/1ZDXbVSbxK2j0WcOW/F+YVZTq47dNLvJToczo7fD8pGayS
X-Google-Smtp-Source: AGHT+IEEaqHs/3HkDXBnqrL9QSlh9L07a1Lvl4D0CKgF1YiEc7T7bXF4kQ71S21yp9VQu4QZCMUstMX7WeLtxkHU1G4=
X-Received: by 2002:a17:902:d508:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-27ed5b0a538mr130702225ad.0.1759225497483; Tue, 30 Sep 2025
 02:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930092603.284384-1-djfkvcing117@gmail.com>
In-Reply-To: <20250930092603.284384-1-djfkvcing117@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 11:44:45 +0200
X-Gm-Features: AS18NWBTBbrXx8bhYvQxjR6yhdZAGCwAVpYFbCZHNQGuhnogYHcg3b42SpfZvTs
Message-ID: <CANiq72n+tBB=NasbJr95YJ=HPgSc35uwKALRyHDOyh4nG6xUOA@mail.gmail.com>
Subject: Re: [PATCH] rust: file: add intra-doc link for 'EBADF'
To: djfkvcing117@gmail.com
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Onur Ozkan <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 11:27=E2=80=AFAM <djfkvcing117@gmail.com> wrote:
>
> From: Tong Li <djfkvcing117@gmail.com>
>
> Suggested-by: Onur =C3=96zkan <work@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1186
> Signed-off-by: Tong Li <djfkvcing117@gmail.com>

Normally commits cannot have an empty message -- this one is trivial,
so it is not a big deal, but maintainers in general may complain. Up
to them, of course.

What you should normally do is explain the "why" of a change, i.e. why
we want to add an intra-doc link, its benefits.

Other than that, it seems like the formatting is good. If you fix the
From: header, then the From: line in the body is not needed and Git
should not add it anymore, but it is not a blocker.

Thanks!

Cheers,
Miguel
