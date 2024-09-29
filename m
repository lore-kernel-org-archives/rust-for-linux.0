Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110E3B1AC
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727585531; cv=none; b=I+6dDodaD+dcqX8C67KpPCQD4caMeRoEPw4Xa/inW1mR24yonU+OdX6A5au3moP66PsKOEAtYUiTGNpqavjqzxR2zKOX0LRi7QbTQyL/k3eNjMYLPAnk8Yp+5YI0h6yd4cLVuHNJnuaKPelmYqzDs8+dcxLwS2GfALBmi3KwEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727585531; c=relaxed/simple;
	bh=jS0EBvC7XMwFo9M+zQPcxKM1gJbWMDlWI+8/9TQt4Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTj65n4GI2qifJ0vpSJj+whKlNucGRkmEY7sWmLvESkVjIBdyL1flMejX6P9M9QxP/FvhpnfPicGlhRq9n2RxjChWRMgmf9Gnr68LNk5guNpypprr/geHtJtD/AqbSFe+89gecXUbZaYOArbpLwMRiYMSNSch6mYQc3+TmqzAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Onnyaj0j; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Onnyaj0j"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6dbbe7e51bbso26683887b3.3
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727585528; x=1728190328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS0EBvC7XMwFo9M+zQPcxKM1gJbWMDlWI+8/9TQt4Hg=;
        b=Onnyaj0jSK1CT0qSPRY803oXGkqi3wJVuK42olufxicOsT4Bl1RiyONp2HTDkb6IPo
         z9QN/N6J1F27JIiiFp1EpfkH9r+NWUJzIGG2T9D6kemzeCNuMdrBIs9X9BqhVGDbEujl
         ihSG5evkccIzLZUSMnC7PM9DEqp/FlI2NTYAXKbAKAvyORhWRsWCkaTdgaMZVJa0ud5u
         iLsM671vpMtiP5CbZ+QZ4JLOa0BUWHHX1s+ooDimsUIFnJt9xbZ+7V/BPW6HkOzHcHb8
         zpBY8AN8SCeuPIdmIFlZszJZ391pWObmXQwxeOZHBWP4UrLY3kAaJgvANg2pHiug8PJG
         LRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727585528; x=1728190328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS0EBvC7XMwFo9M+zQPcxKM1gJbWMDlWI+8/9TQt4Hg=;
        b=c5mF+20YIlsh4TWFpQ0HoBn9XXc2fqpNX6C5M5ONLwfZrfUODzo1ug/A//BHR9fBLP
         YChPJcDDog2jdrBa9omKlUDqDLkwu6Y9GorLrrYp9MdVqejE3SbLxWANUouEAXItffC8
         xwAulWKG8doQfLuLHjph5DFFKx8sm1wAH7ZO9Dzo7/W/DNiehDKP9bh7j4C1orp0LmWm
         +178VXMY+RbeoKOhJmvnJBhNojgjLuI0RCn0MuaZWeyUtOoTCyouYa5AqQ/j6TXNSfZk
         dgxbrHXSTIJaG+y3uQJ7bTKlnlbTtLyQVQM9VUcTx90raySjb83BmEYLDe3GoVlqNe5T
         fn8A==
X-Forwarded-Encrypted: i=1; AJvYcCUsoTAoYsAiqhhh8NuXTtTuZsZwGs7yzIyH5TmDKh8thBkmAurNzQKryVacc2QCZbgDc/7I9XbGt5WfTnl1SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPYUxQbmIQZt7K84DtwH1aoKslHbbqq3T2KJ4qQK9iIk7mIPV
	D3CbgjW8wG7LBUEdxevfMOuUzi3fYV9+2KqLJV+ARzgdCky4E9/nGYObV0ubeZDuPRVoc6XZTPc
	0Cm4iwsogNrwtU3O2Hkg0wcomuPZqnXW8IvknfQ==
X-Google-Smtp-Source: AGHT+IHMo7X9/akLsAQal83FgKc+F7pvFVjQlHUFGrQQNk51EFPSY353VuXd0b6yO+OVBgyvQdIsjKfkuOP6FlzPnEo=
X-Received: by 2002:a05:690c:4787:b0:6d4:b774:e503 with SMTP id
 00721157ae682-6e247603ea2mr46816127b3.41.1727585527889; Sat, 28 Sep 2024
 21:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-14-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-14-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:51:57 -0400
Message-ID: <CALNs47uHcW3fSfE1nvfy_m=J5H51S_B5CvWK1HsK0FDKW=bdww@mail.gmail.com>
Subject: Re: [PATCH 13/19] rust: rbtree: fix `SAFETY` comments that should be
 `# Safety` sections
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> The tag `SAFETY` is used for safety comments, i.e. `// SAFETY`, while a
> `Safety` section is used for safety preconditions in code documentation,
> i.e. `/// # Safety`.
>
> Fix the three instances recently added in `rbtree` that Clippy would
> have normally caught in a public item, so that we can enable checking
> of private items in the next commit.
>
> Fixes: 98c14e40e07a ("rust: rbtree: add cursor")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
