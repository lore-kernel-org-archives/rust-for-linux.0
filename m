Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7E450280;
	Thu,  8 Jan 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865105; cv=none; b=hppH9VFVFrkIYAEWRajK5ipCXej87Mcugm8xuQCzqQUWeN8w8kc4/tFzdu1SoVQflH/TsBpap+6p4gUwz5vT52cv+BDIF2CvTa6aDSA5SYHyE6ZJtcy/0bpoIHP7cm3MZ1Mqo1y7Q83Kr2VPmC1/MZSsuq0UExbo7S0mwCZ1neU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865105; c=relaxed/simple;
	bh=9qOR4BkHzuua0Y8f5G0aF9J0YrmwRXlKkmcBVvVdyrE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tFllgbgDuQWhiuNAFua2nz/Vh7hd7Cpe9ms0+OoWfvOZZokGyoOAJDd4z1OD+Sf2S3n+Eo9Lokt9KOR2Oje1KAnzKQsd1cOKsibUmvK930fxlhDC5sc7e030Hl+Vcf9JWgSciuI4ADwQFOzeJLMkcPMeHlcKSXffEr/WDzQsWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxcxyhPN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxcxyhPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27277C116C6;
	Thu,  8 Jan 2026 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767865104;
	bh=9qOR4BkHzuua0Y8f5G0aF9J0YrmwRXlKkmcBVvVdyrE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cxcxyhPNWN5AphTCxKgJQfrD3kDfAIVjltNMsAHxD2ePyqIL5fHmg1ChKk9n3h1/4
	 NcH7r8azmKWIas9CDjTX6NLdPw20jCO3wmyQso6lkHAFgx8FhZ6XSCNjeCKbOpveB5
	 98yXRyCxWrkVLrn9Drb6RpyaMiMQimxmsIsXkN8TZuXk2e0vFEaFMB8QHjYfHK0UPN
	 0bk2jxpwhvMuVmF4eAMJqFZwssbDUqxSgrX1PNRITg/xCHyX7csbYF/6Cx/HMM5pA8
	 GSqRFrLky5jO8lbuCX1dhd6HBkrQffsPK3jRU2psIylkZhQgP4QxCntyi7kyHinxoQ
	 WInvLZQN9rieQ==
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
In-Reply-To: <CAJ-ks9m6Pv85Y-Dfxgf7HxpKdrXsgY4jdpkFX+oYfrLevvd3hg@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
 <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9m6Pv85Y-Dfxgf7HxpKdrXsgY4jdpkFX+oYfrLevvd3hg@mail.gmail.com>
Date: Thu, 08 Jan 2026 10:38:01 +0100
Message-ID: <87wm1sfnra.fsf@t14s.mail-host-address-is-not-set>
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
>> >> Simplify the implementation by removing the closure-based API from
>> >> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directl=
y.
>> >
>> > This is not sound. The returned pointer can now outlive the guard and
>> > mutation through that pointer is trivial.
>>
>> I don't think this is unsound. If we returned a reference instead, it
>> would be, but we are returning a raw pointer. Dereferencing the pointer
>> is unsafe and requires proper safety comments.
>
> You may be right, strictly speaking, but it is most definitely a
> footgun. This is a special pointer that requires more careful handling
> than other raw pointers.

I would disagree. Dereferencing any raw pointer requires the same
checks, and knowing this one is valid and satisfies lifetime
requirements is no different than others.

It is also a private method that is only used in this particular impl
block.

At any rate, I'm fine with dropping the change. The reason I did it was
because I had to double take when I read the previous code. I think the
original code is has some unnecessary complexity with the closure.

Best regards,
Andreas Hindborg



