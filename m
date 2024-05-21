Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913E1FBB
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716317733; cv=none; b=iT8Zzv/YCWUYxTfcHF1uhMxCIez+NLdpjpqBXysXsW4uaTI/0+HsIDk2AB3WFvICsuGTktGWoOpCrGV7cJPFtYE/m9T56ABIgqv3NlE0R7w8mE41Rk6dXNK+Qke0i2rmZLq1SfliIF9C5sNMkx+wqOQgGBAJnMZ0OCHeF9bD9Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716317733; c=relaxed/simple;
	bh=a7EDAaQnPrME/aBwHQQ0oLFDpvyTRxdNrAqpxInxL2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U1nCNraabcqdWAjB+FA6UL7miZGFjEjhRP0fI7aGwywcoXrJo3INCjGyKfigbe1XiXu49b0uygvNKVoswNLzpXqno1cYROdh4zkncLXzXMYJDccwRG7dLQRHGNMkdFJbjoMb20SatI5rJOg9977D66LR+M0Ms3+QdmfnBaSmpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdDDAi+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdDDAi+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDC0C2BD11;
	Tue, 21 May 2024 18:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716317732;
	bh=a7EDAaQnPrME/aBwHQQ0oLFDpvyTRxdNrAqpxInxL2k=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=tdDDAi+Pk0/s3N1awamGy/CL6K5tl9W8HLnQ4s39oYj2JPZvY2bEbTm/t64xx4AWy
	 rfYp/blbUxoYjQg4Jg0zazpTrdNkUnJf+UVxefF0VS/MDLYqf4QG2aB8bRaEF/z36q
	 RiHsS6ibdNafF8LRq16/ARksT6aWAxUF/fLN5pW69A/2jcP7SJB6E3kBZUE6QxOWGm
	 fHFzSYL/+9YO5bhED9xvQxl318aIpx5dzlWzp2PG8ICuSkP4Vch+E6ESlscuNZSEcR
	 0hJPmbGeiG96BnZkiySmaZvSkLwJaoa7G5eTPmH+/PXfnAvZzaUpofMwgPZpCP2lXZ
	 eBuydjRpZ8m7g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 21:55:29 +0300
Message-Id: <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
In-Reply-To: <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>

On Tue May 21, 2024 at 9:01 PM EEST, Jarkko Sakkinen wrote:
> On Tue May 21, 2024 at 6:20 PM EEST, Jarkko Sakkinen wrote:
> > On Tue May 21, 2024 at 5:52 PM EEST, Miguel Ojeda wrote:
> > In this case I could imagine loading ASN.1 blob by calling Rust
> > functions. But yeah more like "immediate mode" API rather than "retaine=
d
> > mode" style ;-)
>
> Hey, sorry I was mixing things a bit so let me clear this up!
>
> The decoder works as follows. There is a compiler, which generates
> bytecode object linked to vmlinux and a header with symbol declaration.
> Then there is a asn1_ber_decoder(), which runs the bytecode through a
> trivial interpreter with e.g. a key blob as parameter.
>
> And this part is great and it does not really get in the way. All of
> kernel uses it to parse ber/der/cer blobs in, and it is somewhat stable,
> and super well tested. For decoder the value of Rust is not that great.
>
> Encoder (asn1_encoder.c) is just a set of basic functions, like one
> function per tagged type to serialize that type. Most valuable asset
> would be to replicate this set in Rust with better defined contraints
> etc.
>
> Sorry for longish explanation, just wanted to clear up this story :-)
> I.e encoder is higher value asset than the decoder as far as I'm
> concerned, despite being much more trivial to implement.

For the patch set I'm working on I do have good solution. I only need to
encode this:

RsaPubKey ::=3D SEQUENCE {
	n INTEGER ({ rsa_get_n }),
	e INTEGER ({ rsa_get_e })
}

And nice thing is that e is always 65537 and length of e is always 3
i.e. {3} serialized so it is serialized as

	static const u8 EXPONENT[5] =3D {0x02, 1, 0x01, 0x01, 0x01};

Sequence and n can be expressed along the lines of

	/* Last two bytes are filled with 16-bit big-endian length: */
	u8 sequence[] =3D {0x30, 0x82, 0x00, 0x00};
	u8 n_head[] =3D {0x02, 0x82, 0x00, 0x00};

So I just copy stuff in order:

1. sequence
2. n_head
3. n (contents)
4. e

And this is along the line what I'm actually going to do because it is
stable for the use case. However, it would be nice that instead of such
sudoku there would be super stable Rust functions to take care of
writing these. This particular use case is sorted and I'll be fine, but
these pop up from time to time in different situations.

The problem with encoders I found for Rust from crates.io is that they
are like too bounded to the type system of Rust by implementing
conversion traits (From, Into etc.) available. Instead of this approach
for it might be more feasible to have dummy functions with no mangling
in the symbols like encode_sequence, encode_integer etc. You can always
use these dummy global functions to implement those fancy traits and
provide bridge for C at the same time and direct as possible access to
the actual functionality.

I think this is simple but very nice and usable pattern for bridging
from C to Rust provided services.

BR, Jarkko
