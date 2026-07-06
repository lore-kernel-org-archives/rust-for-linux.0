Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379903BC664;
	Mon,  6 Jul 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334459; cv=none; b=PBt3RvQPPdxaAThBGV18NBaBWKPZ7F90574G0I5o9VlvfHLnGtcE7lpeNoqRu5ObEbx64aX3qjYoNnz1LFGxe+AWdiQ8WSNIxUIOF595c5rf+C/hlN7SHzfC9VUXPIRjUoe2A2puUtufaDk0T4KeQAg0cjz6owkLJh1yP4GBlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334459; c=relaxed/simple;
	bh=hlpk4VU7XxJmQrTQaEYRNGcaWTCQ4M65vT2azomCBdI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i5XYbFIJZc6zeM9exGHmRacRSurwXk8s3xzW5DFCamNg3SocmW/Uqxii8J3Nz2lItbRAAs+TTKcuiBcZhCnHDtjX4a6BVO4lXSlsHp7OrTXJCjRqmUhZvUn5FnHyZKanBNdbQvQkck6XFrbOMPyDkG8EcuXa73mtc2XCuTvOb50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avmp/hEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avmp/hEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51E91F000E9;
	Mon,  6 Jul 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783334457;
	bh=INdq0iqzKm97GHa+fDcYFQ5Y4lmpvqNW+3+W2s1FxZE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=avmp/hEdoPoUfFQJUUfovNX99g8si3hxLMIYbOmEL3rd6RaKIpJO6hVLGEasrRaVR
	 4w1+C02iQ8EOnMlERAMF3pAL70ddI8ht9AvOiAN+LMGli9FqjJ+5PgszJVcO1oxyqg
	 /CIC0ADLIRIzjZvari6A2YU6y4VTl1FEWSyNCWg+1QGQcjTQBLQfbYGGL2C55VJN4E
	 u7NwiHFKzDbf74x1h0VJsTBJSZc0WWpVdOHrzmUfAWXs8EbfGnYCqUMBRWRjs4xqal
	 7U27HrhJk1CbI6LpnUwtVm/4oPVjhA7scXXqbQ4hbWdyLh0vXXk862nAxthtFaGkM2
	 bjKBEVUIzYBTA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:40:53 +0200
Message-Id: <DJRFAY0H6KXP.HN16JEY756AC@kernel.org>
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and
 gate transfers on Interface<Bound>
Cc: <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>
To: "Mike Lothian" <mike@fireburn.co.uk>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
In-Reply-To: <20260703030020.2694-11-mike@fireburn.co.uk>

On Fri Jul 3, 2026 at 5:00 AM CEST, Mike Lothian wrote:
>  - Add `Interface::as_bound()` for drivers that keep a refcounted
>    `ARef<Interface>` and perform transfers from a deferred context (a wor=
k
>    item), with a safety contract requiring the work be flushed before unb=
ind.

There's no need for this, drivers should have a bound device (or interface =
in
this case) where it is needed.

If you hit the case where you need an unsafe as_bound() method, it means th=
at
either your design has issues or the corresponding infrastructure that cons=
iders
it isn't available yet.
