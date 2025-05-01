Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33E26461E
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746083623; cv=none; b=e/GUenmrC8tPm53rBJYKY11Ai9kyLjPXmSl+bVtSVUQIG2OHA3RQSpoEwVg+w8y7Wa+xWQe01BCRIzq+Z6lrua/x62C57sHpdWVnj6HgPyq5FEMSA1yk/d/+lCy9Ha1Kq4nTuMFnB4zWId/147AwHSe4+Olmp7z9W78kesdpZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746083623; c=relaxed/simple;
	bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQoSMGlJiz87Afi8Cn0akg4b9y00UiavtAG8fCjd9VrmhnUaUOB5JhilOeSiLUFpEUi/7b7KySz9qTkjlg7+/OUGSJb0/kbdcsNiXR6UAiAlLdZHCwbhtF6++o8FrxRLwHsM7GMZEx7F4O+//7j8dWVa7q+AVC1ELLNfoEM+Pmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJyCDxgI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJyCDxgI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso395826f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746083619; x=1746688419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
        b=WJyCDxgIVnVemuoy4+jDE9QanbmUs7X2yg/SEb0RfdES2Wojd9PTe3vJz0wJHTQ1T1
         0YJAsfD5vs7lMu2X9J3sYq7QM1XMPeTemYlVgky+VZ5FzlIovHV4UKfJ0WuonMvOA4uP
         NpZ+XsTo3qI5EqPSQXYl8MSyrgv18o/uQlPbn/adKoU7ZypqC+csJXZLshjad7Pv1ksR
         2y/8GCgmbu9idQaFBLoD+erN9s9jDY/0K1MrJVUYxbKt7zVBNEYMjkMPO8pK9LDvZi72
         8jDtS+hSo2F7VZbha8LS9yGJDiIEDcdkkNb73SOxA/Nd9NiTk02xRtUAqCt4SXR630zp
         nLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746083619; x=1746688419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
        b=s0CFG3hO6iXAfwRjBovji+TOMnDl3nFDo/7WbajloXwaSDuI7gUXQryTHn9gSpoWro
         UhgEu1BNP2CFHGYROSRda2gV9gurdAfbOpzBi5UALjP32mNgLaaI8/y6dVr//dcstDJD
         wDwFXIzY5dejDyxyOqUgFPjtEH0EjNSZe0zSOMoBZIOxTsh75bjdURYHUAfyXhB4pQjT
         K2V4uJ0OTtytjkH6mFXzsn9q6anGGXP9cCMOYjB1hjg9bweJ0rupc4vqgosfck9ZK9mD
         mtnT5ddzNVyNH0j+FGXddIsl2BRLoFbODLAXqMbywuwK6K9mK4TAPYwWze1jGCgoA+IV
         DI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6x53Wcc4OJrQEilJUvqjrnx+PzrvwKWVGJU0zCrVSl2shmg/1rFydC24bLnxMR34GYCMUP2epaUXU7WXHlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZE2AoliQFXPWONyhvG6/lGUU2Rsv3b3+pr7AsCR6YtVNrlhC
	xzMUPFg+jKEhx469r55w4pfJYQd8q2LqDrkAk7sPr993jocsnSj1POl18dtBYBBFpyL3t1vgWUX
	KwpS1fBOSbtzExQ58FEj05FFoZ4+IrB5wC4vL
X-Gm-Gg: ASbGncv+eYdcnbFHSqw5muzuwL63ik2Nh8HsyCQ+LLiCGIBhtuABArTug2YF1iKEuRn
	AKwcaB47K3VrZRxOmUlYk48fBSjYXLpmaEaqOc/hXmNuAheTpMWCY1dLGA1/xZAttBPDxc6sdHr
	yd1GTVh0i6ZJk2x13ppfZUNME=
X-Google-Smtp-Source: AGHT+IGN3TCVYF0QhPUHuMTXlmMoT5bvOUHFWUt0TCL/e5cKhJDlof9p+ZsQRcjZYfw9VK8lVZJZGWzzaKYax13SJKA=
X-Received: by 2002:a05:6000:2403:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-3a094044002mr875832f8f.7.1746083619006; Thu, 01 May 2025
 00:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-configfs-v5-0-c40e8dc3b9cd@kernel.org> <20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org>
In-Reply-To: <20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 May 2025 09:13:25 +0200
X-Gm-Features: ATxdqUGO2CyyZYzRoShGEfmJdbqkfUThUZw7qk03SErsEjIyLXmJS5-laQdv5uk
Message-ID: <CAH5fLggDwPBzMO2Z48oMjDm4qgoNM0NQs_63TxmVEGy+gtMpOA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo`
 to `T`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Joel Becker <jlbec@evilplan.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Fiona Behrens <me@kloenk.dev>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:36=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Using `ArcInner` as `PoinedTo` in the `ForeignOwnable` implementation for
> `Arc` is a bit unfortunate. Using `T` as `PointedTo` does not remove any
> functionality, but allows `ArcInner` to be private. Further, it allows
> downstream users to write code that is generic over `Box` and `Arc`, when
> downstream users need access to `T` after calling `into_foreign`.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

We discussed this in the meeting yesterday, but just to summarize:

This isn't correct use of the trait. The trait is intended for cases
where you pass a void pointer into C code, and the C code treats that
void pointer entirely opaquely. That's why the docs for `into_foreign`
say this:

The foreign representation is a pointer to void. There are no
guarantees for this pointer. For example, it might be invalid,
dangling or pointing to uninitialized memory. Using it in any way
except for [`from_foreign`], [`try_from_foreign`], [`borrow`], or
[`borrow_mut`] can result in undefined behavior.

In this case, you want to make this change because the C code in
configfs will dereference the void pointer and read from it. But
that's not allowed with the ForeignOwnable trait. You need a new trait
if you want pointers that are not opaque.

Alice
