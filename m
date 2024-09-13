Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C95018A6D6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223181; cv=none; b=ADgKEOO7ME++G6fgk1NMvy4i25lkDETbOrbDT6l7Xehm3Wcoyu/mbxA1GHuDJs0abc6N9zbdG1TaPKmcMSFIfSXQC04B0KbEg9wQQYTUZ2374jCGFBKrlWbdaS0d56TV2gv4nxuSOsMar1u7f3h/dKVjjNbJ/WjUKklT3CR1pzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223181; c=relaxed/simple;
	bh=IJ35uM5ogPvozG2ohGKEw0VJUjmA1XrrjV+6g3amEj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7XAX++C3aLXwjeRd5Twld7FY9UvAVp3t0LNush4W8U27d+SsYrL9VLTMswNeO4mNBy65sPv8MIGK9MTrGF3GPgIt9xWNPeSAGAavj/AaZQ8bd3YAfSB3IX2sxY/DceV9apA489f4rIXfcV24Pck13Th1yJ7QdD6p4AYLr0rw9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dsexwaQu; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dsexwaQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=sk7rejp6bjfv3j5ulon5hqffay.protonmail; t=1726223175; x=1726482375;
	bh=7gTzfmrn/jGIfLDg+m2yVjDOLukoxlFs0+NrTFg4IGM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dsexwaQukd5pmxYlx0+xUp+f/itY7yjmjaoYvMnL2VU8ZuLZjSsA9nprV7dS0Gm8T
	 nCSsRPS1gy41ti/bAN1cD0bm+J0nDMMQCCOO9Q5jYTHXSsjg6WtsWCWTdctlj9O/JX
	 QI3h0SaCJRCT8JCfQGq9WlDGSBFeuyHez8ZfSm4KXa9bfD2Up2fnnpdZtMFx/1Um8v
	 MIem9B6LcFHteZ20vAPUzqWDLQFZ2qZvA+MRFXahJtZYAtTU2gskeJ87N7FmfZofEh
	 tAPV5+XQrlCGvPR/Nk5zb2y9gDaMKTqGNeA/xrYKEi1myzAlVM51ihwI2RZ7AcsV1Q
	 6jz7QbOblLJ8g==
Date: Fri, 13 Sep 2024 10:26:10 +0000
To: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com, ojeda@kernel.org, boqun.feng@gmail.com, alex.gaynor@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: error: make conversion functions public
Message-ID: <4fc202b2-5f5b-411f-be03-595ff927f073@proton.me>
In-Reply-To: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
References: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d60cc08c58ce63cb2506666d6f16ac4758d532ba
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 12:19, Filipe Xavier wrote:
> Change visibility to public of functions in error.rs:
> from_err_ptr, from_errno, from_result and to_ptr.
> Additionally, remove dead_code annotations.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1105
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Filipe Xavier <felipe_life@live.com>
>=20
> ---
>  rust/kernel/error.rs | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

