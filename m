Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4B2451EE
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742222611; cv=none; b=lFpr7g6kui3MJ1f8SX7FjQRDWGole6/26gnpMD/TgXDrVma6Fp1C5youU2bUYBkpMWOOIOK0gkdScUnP0CCQXOMPwCSJibSQ1rlsC8g5puJETXyrMZXAyDfi7ZEOuA9EIE6Md8djyWyuOUa1u/KgQwuJxLWpmoZVUxA49af8V90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742222611; c=relaxed/simple;
	bh=y0MoIY1f0jG4tiO54zhiTP4RygS0t37nrAz4qSgkgUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cTseqcvQ3enhqd00cTDQh5Y6Deku28OMNs84OZ3mbbAtjcAZRm3QOjDZQm5jqkkdHVIFtS+I1bZvb0JEehdhiMTM4NrmFC5seC+N0d899D60D0QgWj74trnjfMJRW60yHT7WWeHTwP7SK3+s9+sWy1gvRhUpIwn6cmA9Pq7oInQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=AYNdwMV/; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="AYNdwMV/"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id F1869240103
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 15:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1742222601; bh=y0MoIY1f0jG4tiO54zhiTP4RygS0t37nrAz4qSgkgUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=AYNdwMV/KTHhPrXBbU1hGOw+xUXgBxt8zjWdTgOfwOwooHJgM8f+2BHVZUcXhZsi1
	 HxyfjbhXkrrjeZDHPPCTKgWF37OFQLV2KRBZ0MEY0pVbQ5LIRxcN+Z6LUuv+W7ku7T
	 I5TXCu8JB8GRdxAPS48g/L/o/2iH3iy2p+a2L48VP50WIDbAbcRDFqZkHdixnhYZG2
	 gfqyc0/+JhevqCZwRyeeOV2o2HS+tBpCx1R3GLbrw4vFG/U8tX1NNfyA+gfBaqaiB0
	 vHaktCiae7bgsqBGdbs1GvccBSgFKkJnfJO88jvGOlBYsFmT6wK66acrmOP55wIgfN
	 5YL4IzMq7nLpw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZGd4l2vLrz6ty8;
	Mon, 17 Mar 2025 15:43:19 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Danilo Krummrich <dakr@kernel.org>,  Wedson Almeida Filho
 <wedsonaf@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: uaccess: name the correct function
In-Reply-To: <20250317-uaccess-typo-reserve-v1-1-bbfcb45121f3@gmail.com>
	(Tamir Duberstein's message of "Mon, 17 Mar 2025 07:43:03 -0400")
References: <20250317-uaccess-typo-reserve-v1-1-bbfcb45121f3@gmail.com>
Date: Mon, 17 Mar 2025 14:43:18 +0000
Message-ID: <m2ldt3btvd.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@gmail.com> writes:

> Correctly refer to `reserve` rather than `try_reserve` in a comment.  This
> comment has been incorrect since inception in commit 1b580e7b9ba2 ("rust:
> uaccess: add userspace pointers").
>
> Fixes: 1b580e7b9ba2 ("rust: uaccess: add userspace pointers")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>

--
C. Mitrodimas
