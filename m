Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718281;
	b=FvpO6ZrkZPB3PXkBguxTYTqZpdJRDEX75CAup+sM/rVCAY218Az+C5+iTMD6Vg3Tfwh7
	 kAsOa4DszzX/WqFRwxMIXX+rXlUpECHKJxZjCoTZBSKZvOUsMCd5DG1ucq2YKI3lwE23o
	 aSdmFjggft4MW0ZtcNjjDEvGta5Lhqjl7sCrv5UJ9At2HQBw5sLCXC82K9jUu3hwju61Y
	 EGkhsK1X9llQ37yDVrVzIIJhUa1mrfNbUl/QnfV1SdSIcQYegL9q9fy+NXpDY1FY7g/Jp
	 ehijzRV+kGb0KWMLlT/lmRW7SCyhonCS/RXc4mIkw9c7ZfPppneRC9ol9/1ELnAPs2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718281;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=eY8jWJFPHqeyb/HkuAKihPr1I/XvOpTtt7B78KGWqzc=;
	b=iffMvkdkMcKJauTZPOE0yVRUTtZg7WGjQdLhDxWU9VCShfeyupIxWGBJ/pjzKd72ZJGg
	 o79jfNXgjsYXT4Avpp571r+CC/2hFIrFJl2oFHgLlz048mLNc3gPgDiHlOgFyFwFX9qc8
	 cJOeK6/3I7TMwkRUg6Ggdh8o2tmLSDJXA7rAWhEo0mvXf/QLo9zUxCfqmRel6ex9sfkOC
	 ZNLV8Zca8klr47kxiSgsJFXLVgd7LjfYTHtg1RFx8RNuNvalQDLp+oXNxhKHP7VClN+Ul
	 89rwm1pN2+/656caP6MC/8C1lNrLf4kgMFUlAMizabcid38aK/LPm8orP8URvvI+CKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=lRGZ26Jw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C69606A31C;
	Thu, 26 Nov 2026 18:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=lRGZ26Jw
ARC-Seal: i=1; a=rsa-sha256; t=1795718235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G1ASujFLBFV51mXh8IlS3jA9c8VoNpxlKWfeDdbF9qQfiGcfrPOQ2Ll7J5OAV7wqrdZuJvEogGJenXbos1k/5p2/WxALtdSbNU6OJ4SBXtJNKEh10J7uehbj5nd6hYCXpVqqJa+/XqH9WDoqq7ABEonMxXFrW46yXL+wdcEYcZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795718235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eY8jWJFPHqeyb/HkuAKihPr1I/XvOpTtt7B78KGWqzc=; 
	b=b+j062L9Ogl5pt3qil9usw2Ob95GycMrgxxWWibjqgDpvZHqVbory3At83r4ccE4D+VuAzbadwyXefK4TgtU+vWeIUPNmI5dCDQtYwMaohhYlmq60ANlSSm3cqYyXlejcAWJ+VNR6ebEsx1vwpDHWR5TEsbBtDPLZ8lYDIxeoCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=lRGZ26Jw1gn4h0yNVxFKIj3uGKUc67fKSlt6j8/MotGWmwXyD/gWojhVzaQvMLSfBWTNscsRl+clSagY/MPNpIWupdpn0fwK09J1/4UBgK4ybDnTsJC1ofS5hQe8mmyer7G0Rw34+eoHCqCcY9VVT29MXRZSF6vFOwdys/aq8wQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=eY8jWJFPHqeyb/HkuAKihPr1I/XvOpTtt7B78KGWqzc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795718234041548.7559792769806;
	Thu, 26 Nov 2026 10:37:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 0/7] rust: reset: add reset control abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ffb55e45af601f0afaf5071f92e123c81de22a70.camel@collabora.com>
Date: Thu, 26 Nov 2026 15:36:56 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D28A86A5-8077-49BA-B366-FF29E9E75736@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
 <6300821339d6891983af704e2044fd1ed25285f6.camel@collabora.com>
 <299B626E-DC60-4175-9D66-2DE58BA5070A@collabora.com>
 <ffb55e45af601f0afaf5071f92e123c81de22a70.camel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External



> On 26 Nov 2026, at 15:11, Nicolas Dufresne =
<nicolas.dufresne@collabora.com> wrote:
>=20
> Le jeudi 26 novembre 2026 =C3=A0 15:02 -0300, Daniel Almeida a =C3=A9cri=
t :
>> What does not work with shared resets on the C side?
>=20
> Above make sense, for shared, you need a mechanism to coordinate the =
reset. A
> bit like the comment above you made about flushing active jobs, and =
holding on
> new jobs until the reset has completed. I think for multiple instance =
of the
> same driver its quite feasible, but when the triggering driver have no =
clue what
> other driver it shares with, there is nothing as far as I know to help =
with this
> coordination, and its possibly non-trivial, specially if that was not =
part of
> the initial design.
>=20
> Nicolas


My understanding (correct me if I am wrong?) is that this coordination =
is
indeed needed, but baked into the C assert/deassert API:

Someone on a shared line has no power to assert the line
unconditionally, all a single consumer can say is "I'd like this line to
be asserted". The line is only asserted when all users agree (i.e.: when
all other users also ask for a reset).

So if driver A wants a reset, it gets its house in order, and asks for
it. Same for all other drivers, and it goes through when the last one
does so. This is the de-facto coordination between consumers and it is
not something that Rust influences one way or the other.

Sure, B is not told that A wants a reset, and A is not told by the reset
APIs when the reset goes through, but at least no user gets its hardware
yanked from them all of a sudden.

In fact, we do enforce this even harder by making sure that one cannot
construct a SharedResetControl<Asserted>, for the reasons above.

-- Daniel=
