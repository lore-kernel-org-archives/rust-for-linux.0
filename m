Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7B192B66
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Jul 2025 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790735; cv=none; b=pCFsc5iTgmIQ1LjpJqUHJR5L2eVHPmDX/ZA71tDDHfjXisVdENPAqXdHoayHygXfIl/JZ8vh9CqMcb/QQSv1DIo+Y8yUBlw/5WVz2Y22FgEqELUEhkBCLxKmg2ToAERDPMwTz0uAroa91OsZB5G+CUXLVYad1HC4wXMLlKonxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790735; c=relaxed/simple;
	bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTz3XxRgkcJaymV1AhFbjVkKIarFmHr98vuFMsde22NdyC5A9WKGCuMxxAIdoTut7xctQcWyzw0N0f3Ou6vMa7HZt9oUZqh55hW0WJhZUFqwVN0/ydc8uvb995WPWfo/TArZ/EgPyVDk0tAYfN/cHdT6SNyzCYDxbAT6ApqZY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=swpvIHgR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="swpvIHgR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso1571589f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Jul 2025 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751790732; x=1752395532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
        b=swpvIHgRiP0Z8YZPjJ4tUiHt7S9FtIc3r6BOnkc8TsPmePUqxRx64/IJSqlvBTrVy3
         CbVigymHiF5wNJxJqL/t9oWBBa+q0j0R7kXUw0igP5lt6l53iExiDbMx4dgdCp8Rigca
         VI+sD1kE6bKbzty6jwXXNLKK5DfZtg2jD7i039B7hkwOlKqN3udxoHMeF2qKbKFqb3Oe
         FE9huP9Aur0ocTsl23mNbSO03Zb0yorzUtj2PwvorsUCiXV5Mx0BY0cWQQPCmZlOAGUO
         BmFCNdPjpX0QpgFagqE0SVXSWLAFm5bJ5bjipFPWTWbzIgaagfrHKUkzUsXmZ+/3acdF
         +Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751790732; x=1752395532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
        b=G5AyTRfw499+kpnbdQoXhWHeEf4Ss5KgbMUIjRuXb5zYPg2eOgC+aijbmQVKSBTo31
         zCQnsxoPJSdswNjcqxkVfN6oaERQgpWZelEa6MSWILBJgf7unwZaXrbYf+GJq7PQzRr5
         sPV+6xDqoryvj1sYk25PBae/nGoZBsPREsxFVF+ME9yMrOikh+3CxVmvexAiu5u258Gb
         x9nMt5AuaMzuaZiDWOVW1FT5/rZLaPVh2Vo+v8fMFW7WdJ0ukPw5nU6uUOEwWMOw+cOy
         v26+qYdDki4i9JDLAVJ8D4+Gbe9GsXj1VCyK958ILGhaWuDvn/EygkCyELOP2KyCZU2d
         2bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ob8wrkc+obOWMZcKBLDOTv6HiQtI5E5bUvX/zcYHs1Inbbd5qkssBOS03IxD6MaTL27rf43y39lKeS+VxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkmrl+MvrHO9Kqw+zh7vgqS+2pNQqYeN357eC9Ip3YucHKWuV
	K7caJZyQoSSlhUS5ysP8NC7j5kj44oNO1LQCNGsRkleRTgtNTh4Qmu7pahSRLhBfE0DqQmB2Igu
	kSJTnyhnBT5uHW6QyFUMotNXKlhx/56h8rxeMrBd/
X-Gm-Gg: ASbGnctA99NTDUdKSkUbjYVpckesgsZG5Yc8KEY65y9tnvAUlL8taOwiu23dd+njCr4
	W1KTUMjnG5eDrIX6V7vW87Re9CXmTLKrGU+cMWjK0QmnY6h7e/poHs69C81tKw3YqfthFxK3HKR
	Ef1NpZc79Z098q8DMIxQjfqEP4yNYYR5npqVKxzAijRXHU
X-Google-Smtp-Source: AGHT+IEGQ1yvGh1y3CB0u/RmI8WwsZH40VLDWwCw3/I8DzRJFsL4891+0YGeKbVlHlDbDSg+hBTaNvwCq+RYP2UKi8U=
X-Received: by 2002:a05:6000:2f85:b0:3a4:e5fa:73f0 with SMTP id
 ffacd0b85a97d-3b4970195f6mr6202610f8f.20.1751790731838; Sun, 06 Jul 2025
 01:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-xarray-insert-reserve-v1-0-25df2b0d706a@gmail.com>
 <20250701-xarray-insert-reserve-v1-3-25df2b0d706a@gmail.com> <CANiq72nf-h86GszE3=mLpWHi5Db+Tj0TRyUe9ANfjdNbesBEEg@mail.gmail.com>
In-Reply-To: <CANiq72nf-h86GszE3=mLpWHi5Db+Tj0TRyUe9ANfjdNbesBEEg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 6 Jul 2025 10:31:59 +0200
X-Gm-Features: Ac12FXwwPurn4FW_8RxwpWJr25A9vazCDxaz3GDmuhMxLJA4Vob4fuczPZdPUVM
Message-ID: <CAH5fLgjmUXUcXFFYdrM4f2iZeD-JbEuSV1DuFbGERNQNM+V51w@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: xarray: add `insert` and `reserve`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:56=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 1, 2025 at 6:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Add `Guard::{insert,reserve}` and `Guard::{insert,reserve}_limit`, whic=
h
> > are akin to `__xa_{alloc,insert}` in C.
>
> Who will be using this? i.e. we need to justify adding code, typically
> by mentioning the users.

Rust Binder does have a user for `reserve`. As for xa_alloc, Rust
Binder may end up using it, but the current plan is to use Burak's
bitmap work instead.

Alice
