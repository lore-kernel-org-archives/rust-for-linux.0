Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2D19CD17
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745201; cv=none; b=TDQfZ8paDBNzZZ7GiB79uFb09KcnXpj4AdaZSbrRDh72UZQ6f98gwj/+Wz7osTZzEdIzCckJEmeTzIkJ7bib5/VthV51AiQl53VX6iII72UH5EosvHNFKLv99Znb7IjkMyuaSRj+rdV99ShZSzaEL+ZdlKdz3B760RNcJk3YshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745201; c=relaxed/simple;
	bh=FPda/YVnU6jdfmWcSA8tfvGZmV9xzU+uJ6ZCtEda6R0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hyjga+4pVZV27xa/hluPanlxDEZ0Y1BaaHUi/RucQmSKkoxI8FPDQ0VxJMXIWn4UPa8XIWTNIuH+dkhIID6DAYIPytbwSuLgyyvOs8hrN0UWlzXQyFyvxhL6yj/mVV3y81a58PtadcBSIkfKgLzZroPKfpOTRZWOTuNaAEiXzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=Ucs3v5PS; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="Ucs3v5PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1744745187; x=1745004387;
	bh=FPda/YVnU6jdfmWcSA8tfvGZmV9xzU+uJ6ZCtEda6R0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ucs3v5PSJq2MGerOQ9Vqvf33/WJzkdrhJSBgRIko/N/7MHs6R9QmAIXLwzcl15xtx
	 oPNiiKXhuJ+fLTvVALtN1g7jr8M2ohiud6OU5u4OFbBh5j86VB1jMn+y5HnRzGvrMh
	 SYQz5MWbT6ADhXx24t+TiBaSRAoN09PZrECXxrkjY9Igr7iZmaee9t1Nk20Nlgy+Iz
	 7ZTfvJDwlQXKJawzkYZLlB28ziQx2uAvTZcWbQYZRpFhUnqCavsk7Zk4XvOf0zP0ZY
	 Kr3JgmOi3JUZkuYpSCoBwZNM1wZzo9yNtb2tl3aLh/dXGJygN06IUwKEe/mvlOqhTT
	 qc9rPMVjw0MYA==
Date: Tue, 15 Apr 2025 19:26:21 +0000
To: ojeda@kernel.org
From: Altan Ozlu <altan@ozlu.eu>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v4] rust: static_assert: add optional message
Message-ID: <7f1708d3-be21-47cb-91b1-68434fc65853@ozlu.eu>
In-Reply-To: <20250326202520.1176162-2-altan@ozlu.eu>
References: <20250326202520.1176162-2-altan@ozlu.eu>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: b0f7fd0f1b9bbe65e7e60a249b3c8c2b1deba7e3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Miguel,

Patch has been reviewed by Benno Lossin, can you check when you have time ?

--=20
Kind regards,
Altan


