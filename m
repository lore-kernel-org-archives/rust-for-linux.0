Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C6142EEA8;
	Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916307; cv=none; b=tMx81D5pG7M++zM8rF9Uf4E20P4De2kHFUxOsSZbB2NuGnlNI/21xaRrFqlb3Jee8bBSZ1hrzrUay+/ElZSpfRbYpYcfzGsKXcuo2rdgudWOYeE0twLoCSgiJCD//xDBs82GGIJX7ktej7t8yPvsXaVCc5j01WP70XFCcZAVaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916307; c=relaxed/simple;
	bh=HCLkGMFuJeXizWowUS4mHobPnpLqaAmfdib8PKqUB5I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QWsC5E9Bsj0pxuRfufI6ktm2Zvlw4534F68LlgtETT7tc40QKS+nec2b/pl1g1Q0carXoKM18LeuHAOT7lGnKajhGo6eq/ZvVPd/Cvcc0jq8y11Qa8Hrn7OoXaV5OVjnpoImbz5NssVq6TldGfOWAGZVqhvkwVXGUbmvZw2E4v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuZcPMhg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuZcPMhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68FEC19422;
	Tue, 20 Jan 2026 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768916306;
	bh=HCLkGMFuJeXizWowUS4mHobPnpLqaAmfdib8PKqUB5I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FuZcPMhgeXFEdMIjFHkNjDSyP3thl2LhpyuSzWMwaqopMN6xEK/3c/ijQrF2B7LMG
	 tgue+e35Np52MzPWABBJY0tTNUp4Xi7eJKMIirPfeejlyGEd1XrcKHwioKyMLHOyP2
	 hR41mbh2a1rIwZJQaP2v717nZvqQnjzdLMd4P3Lnm8MxEoxa3QuoFkQXYl+BsgFhKD
	 pxwdkVsJLiNmaE8CEtxo0r1JwZtMckKIVy/FQ1ZBYMkjhSIyB7RNJAESeKFW2aYGrd
	 MEmI52zDgoahbPAuM/QXrLpwcdszRr35Ozr9X/Srrxa7sGULlANo2URwN2m87Fazr1
	 IWC6IRwztDRHg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 14:38:20 +0100
Message-Id: <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
In-Reply-To: <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>

On Tue Jan 20, 2026 at 2:14 PM CET, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 7:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>       rust: num: add `as_bool` method to `Bounded<_, 1>`
>
> I could apply these two this cycle if that would help, since they are
> straightforward and you say in the cover letter that you also use it
> in Nova code -- does that mean outside the macro? (I don't see it in
> linux-next, but perhaps I am blind...)

I discussed with Alex and Alice that it would be good to land the register!=
()
macro this cycle (having some local to register.rs bitfield support), so dr=
ivers
can start using it next cycle.

Subsequently, we can follow up on the discussions for global bitfield suppo=
rt.

For this purpose, it would be nice if I could pick up those two prerequisit=
es as
part of this.
