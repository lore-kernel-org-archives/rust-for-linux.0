Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536941;
	b=4zwu7wtJQ3kUvFiFXKLuBj27zLLytcYD2n+UQb0fYuG15YsSBSqFjbDzvccbx1BYanJg
	 ig6JW23s9tQABlwmHyDuQrZr6VdPSuMGRCAqO/wrIaMYuqjYaNO39U2AiIvICyF9lTVng
	 gLNr7CQ3UD4JyGtQvUsBk1EGowPxDu8Tj/KkrvLv+Rv1jDQhzkfxQrG//uqR592s8Cj4c
	 rE9rpGCjXvPE9t6MEyJ+IGMbSSSuWolJEcEnIMtOHB/hQWqGEzFWQ8Ue4EUKEbM8qgUWt
	 IxSXUwvEr8iImAcbam3pgWT60ENo3+pWGsLKtkZHxkkPFNJ2hqVlyOW5sc3rUf38aTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536941;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=4fGpYbzHzZNSVAKKRu+qV1BoInElsP1inCjMVMQpepY=;
	b=eftmHZUxYPtgyMVNFZ9G0Xu9LcGaOhbEUkZMZhhj/LrC+gqsezNB/Yzt4rz2xWbVloA6
	 f2VMT+xoXo6QaMGj32Drzxy1u0ij5YCdIxjpQkqeQIf/hRfnWSmXlHZYoNZelTqJTmmNX
	 wmroSMu3QU+eo4WEKjvEQk/6qiN1byBwYlJwl4vWCGNaV7GmHf0OvydZy3lzqTpkQ1YZz
	 rbCdU0oowYfMdmjrsO9w7ZtOu+MgctHW1qqDyRV+CG8RGDBD5zIkXJ/HYAR61g3nLW1u1
	 Id5n/OeLCaJ9F9fz7z8aCz++kqiSJip0jeW7upjEXM3Flc6ZOi2/q1w83VQuIVIfYiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HovdU7dc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C919606A31E;
	Tue, 24 Nov 2026 16:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C919606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HovdU7dc
ARC-Seal: i=1; a=rsa-sha256; t=1795536906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G2PlnvjTUwXd7E9dnf/I6lFDa/5qm3ncnhDdOFXeTnw540btq5oL0bRm/TIFOrAYgcUazPrj6edoo8ED3BlfXkWXqAnYY0R2ksshicp9tidVntXM9WecXdo6YBx5lTm+Ltmo1NcHyJUrAtzESdyiDHgzj2BXBuyZrzqvJAENNTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795536906; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4fGpYbzHzZNSVAKKRu+qV1BoInElsP1inCjMVMQpepY=; 
	b=Rt5JvPswW+19sA4CtfQHF/iDKlpEEbhmSv2M/TSU1Fh4jsQhuB8tyOi3X/T5JE9fl9fflYOSS3W8PIk2+Mb5E25hdAiTDKmEPTQsgbszoZsbxYCr37GDGgqfzYxnv5kgD+S8yKQSKTn2TLg0IgFJTD/d93meP7ZDHHEZ4+QZxuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=HovdU7dcdTXIZ6HeAAy2m/e/+hq8u9Xrb1jUeMma8ynh/tPa4eFZuKuX8lefdLRI1CdzTmaxOSQ1jo7VF24gIcPj3OrDvcExjzfaU95MxA3LyUnVQgWKCLnvpRe2WeAJolCXIFaVux+/kJhlggy3h5K9Iug7xo4ind3hWH4eEc8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=4fGpYbzHzZNSVAKKRu+qV1BoInElsP1inCjMVMQpepY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795536904772150.76233120905488;
	Tue, 24 Nov 2026 08:15:04 -0800 (PST)
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
Subject: Re: [PATCH v2] samples: rust_dma: add missing newline in dev_info!
 call
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DN3II6MGM5KW.364GAZDJSKNMU@garyguo.net>
Date: Tue, 24 Nov 2026 13:14:49 -0300
Cc: Ivan Borovyk <saref012@gmail.com>,
 dakr@kernel.org,
 ojeda@kernel.org,
 abdiel.janulgue@gmail.com,
 robin.murphy@arm.com,
 a.hindborg@kernel.org,
 boqun@kernel.org,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D2642C7-8293-4E9F-9DB4-3199A20B0CF2@collabora.com>
References: <20261123010430.365536-1-saref012@gmail.com>
 <20261123230618.375172-1-saref012@gmail.com>
 <DN3II6MGM5KW.364GAZDJSKNMU@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External



> On 24 Nov 2026, at 11:31, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Mon Nov 23, 2026 at 11:06 PM GMT, Ivan Borovyk wrote:
>> The dev_info! call in PinnedDrop::drop() lacks a trailing newline in =
its
>> format string, unlike the other dev_info!() calls in the file. End =
the
>> format string with '\n' for consistency with the dev_*!() and pr_*!()
>> macro conventions.
>>=20
>> Fixes: 5444799d701c ("samples: rust: dma: add sample code for =
SGTable")
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1139
>> Signed-off-by: Ivan Borovyk <saref012@gmail.com>
>=20
> FWIW I have a series that would make trailing newline optional =
(although I've
> not got any feedbacks about whether people would like that):
>=20
> =
https://lore.kernel.org/rust-for-linux/20260728-printk-v1-5-855606634d70@g=
aryguo.net/
>=20
> Best,
> Gary

IIRC, there were some discussions about this, where people asked the =
Rust side
to not deviate from the C side in this regard. It=E2=80=99s been a while =
though, so take it
with a grain of salt.

=E2=80=94 Daniel


