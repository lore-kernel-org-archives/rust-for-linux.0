Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CE338936;
	Wed,  7 Jan 2026 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814676; cv=none; b=nJo2GgKdHOwj+36PXvsKw9vtXZGHqzdbj6QUVdmqAmlTArLW7rYDbcv/IRJAGEV6QuvGRgRG2fEYt1VtA8MhqDQIK0dcO6KFHxHWisHFPa8/kB8hiY151PfO7Aem4E8ljkgdk9DIyneUMPtzdaGCopITTVYGE1YnHiPmOlKIhTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814676; c=relaxed/simple;
	bh=M8hHwHwOhL6gLt5ev53r2YL97lzTb9HLwVQcfCWZ/EQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xj8h9Xpm72jfRjW0bDFhnae+M76kjnCVZu0ud6y+zNX69K+wkNWoIwp0rHKxj+BGAzw/ZgLQm5ore4t5pdXUIduw/mlHwH8OvhLWwTIv2J8BhRlr+7B4+AWPZ29nLvSAGREJw70zydd7LMiQ7jVmYeFaljmzbtvyHyuEDrRQoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvGAe4Y5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvGAe4Y5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7573CC16AAE;
	Wed,  7 Jan 2026 19:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767814676;
	bh=M8hHwHwOhL6gLt5ev53r2YL97lzTb9HLwVQcfCWZ/EQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YvGAe4Y5dwe6pDosiBxHYetn/pqQoSHRgucHssq4FFGKfweAyI9CshW/3ngJEGA2R
	 9yrR4FkekNwq2MA/uvbQST5dg3xG/eqMSnwvjwFfakTcyR42e7d9jxM6npPQStl7qk
	 LdENupcOGA8Ozpmej7gGgBF+nmQUsDWdMHcKABmaYsvh0js7QormNUVMW6FFxl/VqU
	 n9skqRjLhSMdtNDMDaA+yCgUYyjxAZqsCPI6zDZp8B0ENjvF2j0bFceeaSS5BGrJc2
	 1ylZ/A7AY+fO0WGCQeNlvp5TcTfErJxabGoT66M9fFwdblKO/3IVpZIlL7KuN5ku6U
	 ynmYgUhmBnrGg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] rust: xarray: simplify `Guard::load`
In-Reply-To: <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
Date: Wed, 07 Jan 2026 20:25:54 +0100
Message-ID: <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Simplify the implementation by removing the closure-based API from
>> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.
>
> This is not sound. The returned pointer can now outlive the guard and
> mutation through that pointer is trivial.

I don't think this is unsound. If we returned a reference instead, it
would be, but we are returning a raw pointer. Dereferencing the pointer
is unsafe and requires proper safety comments.


Best regards,
Andreas Hindborg




