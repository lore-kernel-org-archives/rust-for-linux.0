Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C371865C
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716314472; cv=none; b=mNS4FkQOAPi//fSZEBLynrUjbVrQnFxzrE8xrUkG+bkIsiHLbH9Z7Lf/m8ePNoO5i0Q7Ganzj1gdCIAoq/hpsNzN2rSbsi4uf9j7MCB4MdOv3KiwcHo5B60N+4+5K6EcbMEQiDjcSQSEUP2DyppCis0ci5R1jJ8gpCduZABJx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716314472; c=relaxed/simple;
	bh=wHG6h+FEK3S/JxaA75n0MWUY5UZdQzdPXahIkRSZ/Mo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b12PPpRLEzv4u564m6CoT8XSaZ1IBmmpjUHLMqHv683KEie4JrpkWY85bVEjG1JXRuYwFtFVHQa6QQmR9bdzBEWjYbjM0Uz9JAWY8AunLt8YNFXSY8Y1Xqj1t5hwUZcvspJ1Ly4x4CbhqjcpQWfGA1ckRrOSQV1zrt2uimBhbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4r6zxY9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4r6zxY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4C7C32782;
	Tue, 21 May 2024 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716314471;
	bh=wHG6h+FEK3S/JxaA75n0MWUY5UZdQzdPXahIkRSZ/Mo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=A4r6zxY9oWclU9J50+3TeBiYDKjNJg5qn6wTms6NWrtj2kb3qhRFVI4w/VwugyNpt
	 ODUO8RYka0NPmhCjeLMpDKZVP7h1Og+i+SSuiHTwA6XKjMAN/dOC6GPwa3YydloKZK
	 9WNd6wG70Unx1YkCOENYv4ygynJhocM+4TWa1BvWvtqiJgf+LRBIPxIFas4S+vyuMC
	 Zk1tzD4g8DLwX67Mx7cPXOEmcKVyix1VxjBewl7bgBPiIqtw0l1FIxb5HutLDisM+n
	 YwnchYkjYepbQeMrCK3kQV1Flr2XLslmjY3LMUXbTbxrG/FJjtcHFuyF0bEIUId9X3
	 a+gBxInD4L1ZQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 21:01:08 +0300
Message-Id: <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
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
In-Reply-To: <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>

On Tue May 21, 2024 at 6:20 PM EEST, Jarkko Sakkinen wrote:
> On Tue May 21, 2024 at 5:52 PM EEST, Miguel Ojeda wrote:
> In this case I could imagine loading ASN.1 blob by calling Rust
> functions. But yeah more like "immediate mode" API rather than "retained
> mode" style ;-)

Hey, sorry I was mixing things a bit so let me clear this up!

The decoder works as follows. There is a compiler, which generates
bytecode object linked to vmlinux and a header with symbol declaration.
Then there is a asn1_ber_decoder(), which runs the bytecode through a
trivial interpreter with e.g. a key blob as parameter.

And this part is great and it does not really get in the way. All of
kernel uses it to parse ber/der/cer blobs in, and it is somewhat stable,
and super well tested. For decoder the value of Rust is not that great.

Encoder (asn1_encoder.c) is just a set of basic functions, like one
function per tagged type to serialize that type. Most valuable asset
would be to replicate this set in Rust with better defined contraints
etc.

Sorry for longish explanation, just wanted to clear up this story :-)
I.e encoder is higher value asset than the decoder as far as I'm
concerned, despite being much more trivial to implement.

BR, Jarkko
