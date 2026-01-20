Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EBF43C06B;
	Tue, 20 Jan 2026 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918715; cv=none; b=Pr5CnaByWbbVEpFcSSGrenZnGhn+qys9XeAL0lWBwHufV96L41L4AFNGxDDu9lBolJbEAWFTv46MKdg42h27hrxXUNLfvDJ2ErqtjD+0V7whc1Y1TCklbvbCfW8ISxNwV5LrIssZdzH5fnsx9xQkQBtQf8cPgzuheM18b59pvsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918715; c=relaxed/simple;
	bh=ia5JQrW6rAcNYJY+iu4j5rLB0PXLK37c4bqMJ5vWNi4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JrKwknaJyZpDOpQti38kG1kIrHXCeCvunakVoLiJtqMNAQxjUMSUQN7K+i1BPZUOvOlQAaOwNtNcVwVhGCYHJ3z4DkeEIpCf12MMV91c8tBtCSBYuTtkgvbYfICoWRmQfCrHGVLOEZe1wD4zj1CaA7a3UcZxITImBZRF0W5vhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKDH1qJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKDH1qJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9648FC19423;
	Tue, 20 Jan 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768918713;
	bh=ia5JQrW6rAcNYJY+iu4j5rLB0PXLK37c4bqMJ5vWNi4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=aKDH1qJGs3VlyqDNGM+KM78MQctmD1umzBpar/bnZxy48xnfBA4D6+nrJh7WER1xQ
	 gehKqcmwVQUNw+W29zoyrlbLQRhwioddyoD7RmQHmPSV/fvfDkdGrYT+5pXg4m/5I8
	 947wmXtrbjugAdkEBqny/+jvySyp+4OMBoA/ryUhb3XOSdGyUq6YC+jfjq8LEeyDne
	 Mb7C6RwYtzM4bjbD4V8ij8rVzqpObEyv7/Ous/4qvgQXIIrpYIw0GwiKstehGndPtu
	 gL6fONDPtH3Q7v83Vvgil1bVwmeDF0pWiRKIZQ60/uDXZa4lzAyAzD0MDTZuEbMlu4
	 jlkY4VyHJdXew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 15:18:27 +0100
Message-Id: <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
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
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
 <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
In-Reply-To: <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>

On Tue Jan 20, 2026 at 2:50 PM CET, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 2:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> I discussed with Alex and Alice that it would be good to land the regist=
er!()
>> macro this cycle (having some local to register.rs bitfield support), so=
 drivers
>> can start using it next cycle.
>
> By "local to register.rs bitfield support", do you mean something else
> than this series?

Correct, this series came from a misunderstanding, I think Alex plans to fo=
llow
up on it tomorrow.

> To be honest, I think this is all quite late for the cycle.

I think there has been consensus on the register!() macro, so it seems poss=
ible.
But as always, if it works out, great -- if not, that's okay too.
