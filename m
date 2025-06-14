Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96352E11DD
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924258; cv=none; b=LfYyU4/Jnu3p6LDCnoVwAzT4qri9cLlpNMUZBdBMaXlrg/ys1ZpQCAJqFfPcL9dYarGGtWoAv8/pWMk/3ISAXxTxmbEoPm8BnicyZnMEKKjKMq7yAfzJVTznA49FTvbCKxkPBH1uo/obstp7kpONjPpydcgZpV4eqH27vpgw1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924258; c=relaxed/simple;
	bh=paCr9jJp4TaiGOIWi/QG5OQXAQOLHrkgrmLe1DChE4Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b6EGoL9f9aPZQayanJlAwCGvfzbpEunUXXDRha87TVP7qFweM77Q7focIFBoABNQQ07yFTDLyBK6ZduGh8iS76cOFrQ0iwrVvprwlRsPa4o80UAdgnQ3boMhAHFRBZGxPprY39ADwSE3pWMxWp/FlGgKgfljYHYkwuzZjlrYgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faiEWBMe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faiEWBMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972C0C4CEEB;
	Sat, 14 Jun 2025 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924258;
	bh=paCr9jJp4TaiGOIWi/QG5OQXAQOLHrkgrmLe1DChE4Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=faiEWBMe98yjZXEu9di2IK71GxH+mr36NZL7bxHfxjI4Ca4+vom+9dMmsJY9s7ovE
	 xRlQaubSyB5Lx0WWWhOTZrrYKftHnxSiApxD7InEXxsPK6o7WpgiEwBiPQa9S/6zuI
	 EEjt/Ou8RePsFe/GYQkdyfUYB4jZvQpkY/qQ0m96P0cEFYlXdQQ8X49nxY0lPcJM1D
	 ciByTZKPhFhJguDBonb/hfIbLW9Kj7oB0B69nfPceyazJz+Hgh2Ml/vC+/pPpIq7C9
	 VLVjoHhvsBgtyzcYCyXAaTZQpJRKLPpzbHJQkqQO0+LMbjZvXpNdRD8X3OzTsVvxRr
	 I3p5kyzKSdRWw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 20:04:15 +0200
Message-Id: <DAMGDKQJ59K0.3NWUH9UM4UZ70@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com> <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
 <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>
In-Reply-To: <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>

On Thu Jun 12, 2025 at 8:52 PM CEST, Marcelo Moreira wrote:
> Just one thing, I wanted to ask for your opinion on another change in
> the patch, specifically in the `try_access` function. I refactored the
> logic of an `if/else` block to use
> `self.try_access_with_guard(&guard).map(|data|
> RevocableGuard::new(data, guard))`.

I don't think it compiles, since `try_access_with_guard` borrows the
guard and thus you can't give it to `RevocableGuard::new`.

---
Cheers,
Benno
