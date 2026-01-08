Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B13B52E1;
	Thu,  8 Jan 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865097; cv=none; b=VG5TUJqhgObiEAeeg0ZAjuy/bAToJOx8M17m/0oJQnlKGXSb05o3U+p7ipmgujjRjoT7m2MgpQI7aMLp4rR2AO5pSWjgDLAaTsADmG5p0gE0AJhoI7hMMTS4jxptAr4/GlJWxjQaNd3Wf0vHHjBLPj6T6g0CSBO1F16wb8qjC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865097; c=relaxed/simple;
	bh=tD9M3MqQSOJhN8MZK4keILvvJYa6fjuPGElfpYErrWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aVn11MyV1GUnhxivGAk7SyX8sk7GPQ5OdIdtK/fbYGbeZBKs5TwFwP+aszo0i/pl0SKmyOmPPAfliD0ohQ2S06iepDQ7UKY4qOZrF+InnyCUvSzKTmujSJE+fT5weqbtaoLlrKG61RpyzJeExaEu6gzlDtHoWH7LzkMiSNo/BYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiX7018r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiX7018r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D42BC116C6;
	Thu,  8 Jan 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767865096;
	bh=tD9M3MqQSOJhN8MZK4keILvvJYa6fjuPGElfpYErrWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CiX7018rsCHZP3unmoERwynZFTgSGr1fwSW3SgCQiAbghvQNQzRy2Lbkj5GJIBu93
	 AvppGBfti38TLwpn6yBIzkLdgm3REsZ7/4+hIv6f0Lfa0LOaIiB1jORzb9RHnHDaQn
	 B9UX5i1UOpec6wRAWTKJcdtRWs+92HpFjcEVN8oTt10KlDjg1cPhIbBgrx6GzDh5/k
	 wxNaLhbSCYOGpoZjUZGhd0uU7GjgCifV/Y5j7R213ThQy1xIt0JX9/dcFk6GE2uyS4
	 wY1crL8tNT7YVqbUZyPmd72lA/k3Ldai0OzDjpVs0pX6ZwkGANKRxVdsye+19+Yn8w
	 TMPM2by5SJEwQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
In-Reply-To: <CAJ-ks9nBRfYpQKkzuM84TWsXSEccUXxxwQNUPxZHZZxrnXUbCQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mXoTdOO+Zb9F=cpTrwa+XZ2mLb3NDH9pyd_GZhD2TVRQ@mail.gmail.com>
 <87eco1grin.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9nBRfYpQKkzuM84TWsXSEccUXxxwQNUPxZHZZxrnXUbCQ@mail.gmail.com>
Date: Thu, 08 Jan 2026 10:30:20 +0100
Message-ID: <87zf6ofo43.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Jan 7, 2026 at 2:37=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
>> >> `xa_load` function takes the XArray lock internally, which would cause
>> >> a double lock since the `Guard` already holds the lock.
>> >
>> > This is not correct. `xa_load` takes and releases the RCU lock only,
>> > not the XArray lock.
>>
>> You are right. However, we do not need to take the RCU lock either in
>> this case, right?
>
> Seems reasonable, but the language mentioning double locking should be
> removed please.

For sure.


Best regards,
Andreas Hindborg


