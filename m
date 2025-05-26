Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76213BC3F
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247513; cv=none; b=r/dN15uvQMswDCUZoQSJFvokgk9hZmNihDlqUZEajj8PVkKxSFpM+ZyEvKH/4LAAgjOSyKAmD/NoSVij79BCpuNQM8ekv61zhBtXzbFMEdbvwSe6HUH14ctWX0CQeuvQEqAIuhQRjs9iyqTs0YDZLzt5CCfCVn49L81E/1aicoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247513; c=relaxed/simple;
	bh=qH/f4+03Q5B6YbDGh6aVNuBGyY8oJOF/mPRmTQ4jrtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=vFGJf8QB4S5MOOM78iYOMUUMuzCt66++XFmc95iKs3844JYL3IqZtS5MSfw7HrMVjVDRnJmMvVXZZpdn3uCDMuji4hNKNlT7V9CSGoVN73xbu/wqCualow/PUzxXOoavdZZKRluqQPrb19O5cbaIrptsOKLD/QIw9//Ek1JLtAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSl53ANE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSl53ANE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B9DC4CEE7;
	Mon, 26 May 2025 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748247512;
	bh=qH/f4+03Q5B6YbDGh6aVNuBGyY8oJOF/mPRmTQ4jrtg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=aSl53ANEtm+gtNJTS6T/3cBrYim0PIWZRkRMzIalNL34nUPaZhbEDKMEw2puqFHzd
	 c/f+HZUsLwWnY5ZSPHSiyhhNhViyRWjpCUh64mMxG8i2eP7z5sofkkiTGMJbvT1zw7
	 X0NPM15ma+ClZsPGvaNsJHngiPtPui2lS0Gb0a1+NJXPNlXTySSuc2Ixpj19z2qQ5b
	 pp34UbJ/J/k1uZnyB3BNFHL6zxUBMtrG1g1v6CGAolSN+YL/zgpjTch8XkAlvz2NAb
	 q39vLh785dt6VHS8EyYbbVqS+jztspM9dxBJ41G1jEJ8QagYdFgvCzRT1hqDfqV2az
	 IENn7eBMTW/pw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 10:18:30 +0200
Message-Id: <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
Subject: Re: [[PATCH]] rust/list: replace unwrap() with ? in doctest
 examples
From: "Benno Lossin" <lossin@kernel.org>
To: "Albin Babu Varghese" <albinbabuvarghese20@gmail.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>
In-Reply-To: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>

Hi,

Thanks for the patch, a couple comments below.

The subject of your email starts with `[[PATCH]]`, normally we use
`[PATCH]` instead. Did you use `git send-email` and `git format-patch`?

On Mon May 26, 2025 at 12:59 AM CEST, Albin Babu Varghese wrote:
> Replace panicking `unwrap()` calls in the `kernel::list` doctests with `o=
k_or(EINVAL)?` so they return a proper `Error` instead of panicking.

Commit messages should be wrapped to a sensible column length such as 72
characters.

Also this is missing the motivation that newcomers might get the
impression that calling `unwrap` is OK.

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>

No need for blank lines in the taglist.

> Link: https://github.com/Rust-for-Linux/linux/issues/1164
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
> ---
>  rust/kernel/list.rs | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

The changes themselves look good, if we want to use the `ok_or` + error
combination. I haven't thought about this, so there might be something
better here, but it already is an improvement over the previous one.

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
