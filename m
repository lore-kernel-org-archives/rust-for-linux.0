Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8A2BE057
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321885; cv=none; b=gXYBUHCm3aQVHRuNHOYrAV2OexabgK22IhN00m7OiQP99LB4qPo9NqwcwJiFOTnmLq2xlftgij/6PcMgM0Ny59/ljf3fy9SVSMG6ypq7y3uA5EeuwQus3EC4iSAKeWvOVFazWS1XqgNYMDMctd8ImrE/aWi2q8lXNW2iKHUpkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321885; c=relaxed/simple;
	bh=Q8doE83FSgGqJo9tqkDQkZXiCNnh0nOsXtwuJKWvUSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIfdB3f9JXOhr/0yyNoVm6r73TeirT1EElFeWbJylwQOjGTGkUImMABhDURcKsddzuOvb4F/ZcQLuqP0Z+TMdL+TOLxAC8JCfUwmGdJ4JSnm4n9GpHXW7kefrs/lsBlVEqOVQ8oN2pxeMb3sBcsTS8Dgva6xH8N+L+7sCSsXry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWPv8Fem; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWPv8Fem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DA5C2BC86
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773321884;
	bh=Q8doE83FSgGqJo9tqkDQkZXiCNnh0nOsXtwuJKWvUSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fWPv8FemlTd+hgW8a2s+66fIpYGx+4PjpimeesVt2SYsZVI9lMkCgDbIIGYXQvc1Z
	 2qzFTdnLH8hQhxygqbg8VDNRn7NdWSRO6kCDnhY7e419cRu4GlRJpwNGrJwkrb7ltu
	 GE4TdouNrvkl5CzCyHfLzzFlF53G40FgTd+60nltB91sct5Ygj5nfBGdyihOYvtTPG
	 I5qVjWW5IyWJw/BWdfp7Sb4IBJMSnGD82iMy+GqLnoS1KNWGQMopn915lmjs5iZzSJ
	 e2kjOh3TtF1Rq2ZgifUxXj/ZgbMBBmGSDDVxqpB8Hn8nIgfsmJqiI4gvjqUlYPWaVg
	 HQQYu/Ei+Afnw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so16884211fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 06:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0om1vilNNv5j7fPOUCkvdMk7+48faeVlSNxYySvbv4iKBYn6rFWHJRBGBthV8QXw4P+KevNndl8RMOVZfkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwgeqbZFv7X7oiZQBCykJ9MBbmipjz5ZaQRrD9aBQou/yxVWcJ
	zDrSq5HdL2/WnNkeSIx1p0vUJDLoFDVw5V003k+rX4mztnF+FzbNNpGtCFTBNzxBn7npvZ/JPOm
	yp7fCRzAXrHHnhKHA6A0zHzMJzkpi4DA=
X-Received: by 2002:a2e:9e05:0:b0:389:e501:41bd with SMTP id
 38308e7fff4ca-38a727cfa94mr9501211fa.6.1773321883333; Thu, 12 Mar 2026
 06:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org> <DGZAOQT96RNJ.1QUVUW1UAMT3C@garyguo.net>
In-Reply-To: <DGZAOQT96RNJ.1QUVUW1UAMT3C@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 12 Mar 2026 09:24:07 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kp1yDQi69DcXm4-xzpZ7GmAr4epOgDMNbeaE+5jUeRsA@mail.gmail.com>
X-Gm-Features: AaiRm528piwno2nUHFEC6iwNT4qIpgi4YbDyfttTJ3QGo584EMhx5tuJGMeVvkI
Message-ID: <CAJ-ks9kp1yDQi69DcXm4-xzpZ7GmAr4epOgDMNbeaE+5jUeRsA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: update `kernel::c_str!` documentation
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 1:57=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Mar 9, 2026 at 5:01 PM GMT, Tamir Duberstein wrote:
> > Now that all literals are C-Strings, update the documentation to explai=
n
> > that use of this macro should be limited to non-literal strings.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1075
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> > This patch completes the work of replacing our custom `CStr` with
> > upstream's.
> > ---
> > Changes in v2:
> > - Drop rename, keep only documentation update. (Gary Guo)
> > - Add example of misuse to documentation. (Gary Guo)
> > - Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-=
a269fe4dc3f0@kernel.org
>
> The lint for `c_str!("literal")` now lands in klint:
>
> https://github.com/Rust-for-Linux/klint/commit/69fa3560e28031faa8c5a93e1a=
c95cc2b3689306
>
> Best,
> Gary

Very cool, thanks!
