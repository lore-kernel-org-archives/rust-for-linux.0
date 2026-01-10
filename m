Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BE23A99E;
	Sat, 10 Jan 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768063266; cv=none; b=jEnfsD5F21oxjljjsxrMEc/zJzmdMDX/5euMYQWNpkVbxxdtX7aQ295Ztwwa6qjawxXoYY6fm9PpYy9DLoH0Oi8DkHa8Evs712W16CtOLvugS1hpHWyvUU9vIuJlEtBzr4DyvbtjJNyfY83fXUnX2THtqRjNGQph7S5GF7Ou43A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768063266; c=relaxed/simple;
	bh=Mb//NBe1m2diF36kkMy2/IeJdVfjVhCrRt9yJTPGt00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K8wx9yPW9HKOLDKs9OlHTN7tCyCaZbfKekTvxStXIXERwU6Sq22fZlxs0LPSSnkGqpIxG9XJk+5Z5XM4dZotjWCbfpyNa5tl1vHq0thUdcdLeyZQtHOGv4X+9t8tLrd50MMNYTG0X4ndt06PPcfdQFrs1O68AltOrguYCHZ3zMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbKD757P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbKD757P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C20C4CEF1;
	Sat, 10 Jan 2026 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768063265;
	bh=Mb//NBe1m2diF36kkMy2/IeJdVfjVhCrRt9yJTPGt00=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZbKD757Px7hDqF1bEvwKBoAZz3x63Ka7SREPbChhxJD/tHG3tQqo7XAhBNQW47sIA
	 kGewh7wtUmcybxEe015o2c/VgRduQpynU4J/uqr4VR1DdlIL7GFde44suQY7RFMSTC
	 WWrFNtey1xHbadmbBgYthZ9UmSPXxiFlgLG1mQAmPoXsNaxcIRaryohC4eL2ss1St0
	 4sxNmPkFSMzHSjvYSMIjVORbSJziVgTr+7vXjpYegSDoqx5QIA4r4hZi1JbitaPneG
	 kZm1AR4AI5FL/fJ+8BRTeP1DWYGsjh/M0AuQJeS7w2Q2eXtqF2zAu7HbYlGoJD1ugo
	 6HHpu4fDZb7WQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 17:41:00 +0100
Message-Id: <DFL248YSG9CS.GQNSONYLIDWQ@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@Kloenk.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alban Kurti"
 <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-7-lossin@kernel.org>
 <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>
 <DFK7GA22REIQ.1YSKLW77KQAWH@kernel.org>
 <DFK7M3CCUXLM.33VAXRHV6U4W0@garyguo.net>
In-Reply-To: <DFK7M3CCUXLM.33VAXRHV6U4W0@garyguo.net>

On Fri Jan 9, 2026 at 5:46 PM CET, Gary Guo wrote:
> On Fri Jan 9, 2026 at 4:39 PM GMT, Benno Lossin wrote:
>> On Fri Jan 9, 2026 at 1:47 PM CET, Gary Guo wrote:
>>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>>> +fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
>>>> +    for field in &mut struct_.fields {
>>>> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
>>>> +    }
>>>> +}
>>>
>>> Multiple places have similar things for stripping annotations and check=
ing if
>>> structurally pinned. Would it make sense to do this at the very beginni=
ng, and
>>> build a `HashSet` of structurally pinned fields, and use that as canoni=
cal
>>> source for all generate_ functions?
>>
>> There is https://github.com/Rust-for-Linux/pin-init/pull/94, and I don't
>> want to take away their work. I'll contact them and see if we can fold
>> it into this commit/series.
>
> I don't think that's the same? I am proposing remove `#[pin]` and build a=
 set at
> the very beginning of `fn pin_data` and just use that set. Which is not w=
hat the
> reference PR does.

Oh yeah you're right. But `Field` doesn't implement `Hash`, so we sadly
can't create a set of pinned fields. I'll just create a Vec with a bool
and pass that around.

Cheers,
Benno
