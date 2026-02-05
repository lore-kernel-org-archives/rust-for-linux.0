Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF363093A6;
	Thu,  5 Feb 2026 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318316; cv=none; b=b+NIe/LLNQ2/m/GHE3MzbmFAvr1wUVkmYEQk4/ucxRmOd1QgIHHBB6EAT2lB3PtuDwnquD85pbIot9fNNefikZcVr1KbmHsG2dJMWt/gk0DmZyfdKUPFDDipVamNx/Y1ab9UJDr9MkEuIjBtQPwrJog31C/k2kgq8VnZKzwTAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318316; c=relaxed/simple;
	bh=+lGXg9aKGgu5PYXE6zY8ByxlH1ZZ9v8LToFwBmv61P4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=utL2xkTUBvPIKScy/zNMfE0i3BQwNdTJ3UjYi5rwmKsM1tREvPYakXPNnJ0GzKX0feXpBF1GvZdY2Z13Q1xwh7Ch21HvVL8M3Uhqj9gAht3U6Xu0pak/sBOQfwtSA8CQ5T5xJ6bEGsRS78j8TAi6lDOEod88x+0hZeJMPxdrxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njnq9icf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njnq9icf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D38C4CEF7;
	Thu,  5 Feb 2026 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770318316;
	bh=+lGXg9aKGgu5PYXE6zY8ByxlH1ZZ9v8LToFwBmv61P4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=njnq9icfLpWLGyFLUKKHz/g2QNTILw6j8z+lYIjhL+qZaGzzpZl2YYIjaVrHVDyG5
	 Cvnb1uBsh91jaUR0XB1eXAJyAt5Qbe1DUqrx4yBaSV0YzGqEjsNO1MulCyas3bH5U2
	 85h/ZSo2fzv8b0wglNRiB+fB27EKuPWFRolX1Sp8ikXls0XlSrGtQnuptrXT7glIBX
	 vDLcpbqi/HdZnIt13E5gSs7C+Sk8WSc6h08osKSCUsXYcjlq/E5pcWe2P4z9r1S69W
	 xmJE+zd4JENgz2YwncaWYqb5xdZpRtKotSnJ56y+vie/r4qUaguz7RcifOzAfBv7PK
	 YyNbHkn1AqbPA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 20:05:08 +0100
Message-Id: <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Gary Guo" <gary@garyguo.net>, "Link Mauve" <linkmauve@linkmauve.fr>,
 <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
In-Reply-To: <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>

On Thu Feb 5, 2026 at 6:28 PM CET, Daniel Almeida wrote:
>> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
>> I think we should have everything default to little endian, and have wra=
pper
>> types that do big endian which require expicit construction, similar to
>> RelaxedMmio in Alex's series.
>
> Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that we
> should head in this direction.

I strongly disagree.

This is a great pattern for relaxed ordering because:

  (1) We need both strict and relaxed ordering.

  (2) Relaxed ordering is rare, hence it doesn't hurt to write e.g.

	io.relaxed().write()

  (3) If you by accident just write

	io.write()

      i.e. forget to call relaxed() it s not a bug, nothing bad happens.

Whereas for endianness it is a bad pattern because:

  (1) Devices are either little-endian or big-endian. Hence, having to writ=
e

	io.big_endian().write()

      is excessive, we always want big-endian for a big-endian device.

  (2) It is error prone, if you forget to call big_endian() first, it is a =
bug.

  (3) It is unergonomic in combination with relaxed ordering.

	io.big_endian().relaxed().write()

      (Does the other way around work as well? :)

It makes much more sense to define once when we request the I/O memory whet=
her
the device is litte-endian or big-endian.

This could be done with different request functions, a const generic or a
function argument, but it should be done at request time.
