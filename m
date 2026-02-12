Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8035B12F;
	Thu, 12 Feb 2026 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900434; cv=none; b=BZu44VjJZHvSJVAvLq7yq3colrizDFD4ZttPQ/lwkxEBQoYGYNwVJ8IN74uFvH9rKFXIXC6iYgZOH1fsI/uRw+QmDUMzmtEmD1Am5jFqSBEJi9Zug3F7+Tan+ywe7WBNXGsaQ0n6xXVGRFmpDAL3P6YnMiJAahBx3WSqRVB2c24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900434; c=relaxed/simple;
	bh=pt1XnH66Sa55/b3qs2K9wIweFwjrMnxiLDPWhMJ8v6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sRh7QOd86ZChnavYPtnDUzhiR3+xlueasdatcGs3fG6Vq6QPDYIfLmcLl04dV4N82yHavHxb6cBnerNaf3Fx+Skc151ZxvzgFwZza6vMD5FM5Dz8Pofr9KfdtvPWxGC0rgrcJBy/kF/1P0zs7yTAcDmjwV/CnAvbVxzqqXQ9Uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfDbqyH9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfDbqyH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44B7C16AAE;
	Thu, 12 Feb 2026 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770900434;
	bh=pt1XnH66Sa55/b3qs2K9wIweFwjrMnxiLDPWhMJ8v6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dfDbqyH9m4z8P6PXY9Oelm114CRHUZ05O/TLtl7ODeJCsZaJJQjTFcD4I2gBcu6ZW
	 z6vp/SEdWWGj2NbmOweqZNx53yTtFd1kP56PCARdiPKSM0fQ0Whrx9LEgkG6ES16UW
	 q5zkAr6UsyHNSB8eaxZdUnkvlDK434bG2kWhEXQ2v676WhyZ3LOFRNVT60KF868JD0
	 BGa9aMuRz6ffyf3aCWp/9sS9pwMxLncIplKdQx6Nv2JJBw3eMUltrbzW6g91sG7+9Q
	 6fMv4JEXz6CLnpwyfrvrWIakzwc9Ee/RXm2Jrq+CRsZ3IOVsKzmZYJZm4zhKFevhUn
	 bkSd0xXp1HgrA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein
 <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Andrew
 Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, Daniel
 Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <CANiq72=n2=96dvcLXF05Ta4+h7CyUTQNn2b64U4j=VB0xO-0GQ@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set>
 <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org>
 <WXzdKn94ED_qqocwnFPMLL4sIamZUFw57nW-NMKpdYCWhxdCutPl_wcMwF_aTpQvsmt-9NUQZMy7OokH-lQ_2w==@protonmail.internalid>
 <CANiq72=n2=96dvcLXF05Ta4+h7CyUTQNn2b64U4j=VB0xO-0GQ@mail.gmail.com>
Date: Thu, 12 Feb 2026 13:47:04 +0100
Message-ID: <87pl6at9h3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Apparently this kind of code used to be OK [1] but the Rust devs decided
>
> I don't think it used to be OK -- I think that issue was talking about
> code that required non-lexical lifetimes, which was an unstable
> feature back then, and the behavior changed while they worked on it.

Right. The devil is in the details. My point is that the analysis to
support this was deemed to be too computationally expensive to roll out,
but the intention is to achieve a similar analysis at some point in the
future, via Polonius.

Best regards,
Andreas Hindborg


