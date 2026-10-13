Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3788D37A494;
	Tue, 13 Oct 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876296; cv=none; b=SKSmGAkQb8Mml03B3aGMsXlrVHh56K4Gr/U8I+cN09n9NdCsFz6sY7rkfX1TJ/QkDaL9tkZUMGBxDTp7CfPYDDQn/wMOQuI2TK5imXtceDRhRl0NIn01kXFLdlS2BmfT0yF1+Ok3y2rw7fK2ItQDsGR7lJ7jSWTSN34ia8U1CpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876296; c=relaxed/simple;
	bh=NU9kZMHiVxo9G3T+RrsF+nEu4b7ZsCG+z87a6dHWEk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=axPs7Poepeqgv3rhUoRqVsOgRSyFTFiibh/m0+YqAFBKYtH/5fsMAg8sRHpajJ9k8QHCTH8tVv/FV9G8DpVaANyy5Yo++bpUqCc/oNqLcPC0g/XaQAYebbrATQZTbb0LcLKohs+yagmPla0S6IdR4/PJm0v4YhJf7hSSn9qS2wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTD8NIDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTD8NIDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710B91F000FF;
	Tue, 13 Oct 2026 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876295;
	bh=NU9kZMHiVxo9G3T+RrsF+nEu4b7ZsCG+z87a6dHWEk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cTD8NIDBm/QbjtCpiPuNjA6jkfOIQmawx5fSSvEWQAi2maM5jAVDGWlZApnX6RhEO
	 Pny9OzC32UbujbBrb+lj8vYEO/RQHlPKp6D1KSxHTjP28nI0Bsi+OAhuxoUyeMOFez
	 u0ZryZzFp0xPIh0HhbWLOh0e4coIKTzFe1cIfOrowiE96ClnjD4wI9xcS2SZ2RO10j
	 eKrl/Dwbj3vIIarPmKWQbSk/ttrMDCl3xuwr5iR5I0XU2NR6he9XoiwLFVFVRRPRd9
	 BQmPVN53f72R1EARpsyI0nU9mfdHaG6KEguCsWzXp+roi6suHuJXItoRju2pDGM3yZ
	 k27qooCI6uyMA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Burak Emir <burak.emir@gmail.com>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus`
 C function
In-Reply-To: <asz-GkGHJYHdhDLr@yury>
References: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
 <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
 <N2kT-hptgLwPihxLElO65tqya2Wmnmv46TH2XIDsL2pggz0Ezs4mqNk2iHWS1zdaCIlPncbX20HMJuQ-Blrbmw==@protonmail.internalid>
 <asz-GkGHJYHdhDLr@yury>
Date: Tue, 13 Oct 2026 09:24:42 +0200
Message-ID: <87jynmcbb9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Yury Norov" <ynorov@nvidia.com> writes:

> On Fri, Oct 02, 2026 at 11:07:00AM +0200, Miguel Ojeda wrote:
>> On Fri, Oct 2, 2026 at 10:33=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>> >
>> > I don't think we need to split the helper C files by the headers they
>> > are defined in. We can include multiple headers in a C file that
>> > logically lumps things together. If you are worried about finding thin=
gs
>> > becoming difficult because they are not in the file one expect, I do n=
ot
>> > share the concern. I usually just grep in the directory through my
>> > editor.
>>
>> Of course, it doesn't need to be a strict split. But, where possible,
>> I think it is better to match the C side for the helpers, because they
>> are thin wrappers that need to be updated and maintained at the same
>> time as the C side.
>
> Yes, that's correct. This should mirror the kernel file structure
> unless there's a strong reason to change that.
>
> Andreas, can you put this into rust/helpers/cpumask.c, and please have
> the __rust helper thing on a separate line for better greppability.
>
> This patch creates a new file without a maintenance entry, which is a
> no-go anyways, so we need v4.

Ok, thanks.

@Miguel, feel free to make these changes as you apply. Otherwise I'll
send v4 next cycle.

Best regards,
Andreas Hindborg



