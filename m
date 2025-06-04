Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E4E2F56
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050218; cv=none; b=sdokNsngZ5jk6BtE+IR7QuA5MQOgiYrDwou4BNOyfYKlAhL1d0OKQYdFHIPH9RdjuQt4C1zNmoJjopsUebjVARJpJS/jz9e0a32RrfZA+ELh78cbfkwoH2z5qYi8Yl+fQNOqOA5/jtmz2ufrYNpEJP89oz8oyiMvz9vdyXwqaDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050218; c=relaxed/simple;
	bh=TDRjmc+qf/+YwZ2HHCa5DGE5pUGil7GOCRUnwV8Mpsg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MnKSEVE0v3OzsmA7br6tikzNRZVjYTez8fFGj7kU8+7iiAlYTYWwwQLWO6ZJ4G0Ia3y0YbDHiP4J8Eep0zgDXTp/px3Mh5JaUU9nyWc0g82W6TM05/RsKUXfu4bxi8sfPPLSTm8abk1rjsHWe18S9u2JqM/4MTTkXnXsWRSF1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUsFe6ty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUsFe6ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A2AC4CEE4;
	Wed,  4 Jun 2025 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749050218;
	bh=TDRjmc+qf/+YwZ2HHCa5DGE5pUGil7GOCRUnwV8Mpsg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hUsFe6tyEmNp9RQCfjkH+ksKUeSyPvpC008HVgSXS9IlHEVEXWDgfwuj0/rNXSjSH
	 TCBHBl7q0wUZ6tS6b7hMywspEbEPEKdqy58tKvQM7d1QPNLPsWtTUuE/K+XpB2MJzy
	 dqxCfS/+RCPzjaEOjNYIPRVdNOJ8zB3aiN5Hzhye3Ak8g7cR8aOrR/c+u7qdbBlBoS
	 kq+7QeWY9DKGuBL9n6NqtVp/pFts7Yni9/sxhiKtnswpc7DA0GANTp47m7j4NlNxei
	 llAWd6weyScpme0gxX+X40/bIgNDfiGn31UBLttgw0uRCXTcY6lh1l4qPp/IXO0nuz
	 oVp6l9b59Fmow==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 17:16:54 +0200
Message-Id: <DADUK09NUMP6.3Q5UVROS0QDYF@kernel.org>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Timur Tabi"
 <ttabi@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
In-Reply-To: <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>

On Wed Jun 4, 2025 at 12:28 PM CEST, Miguel Ojeda wrote:
> On Wed, Jun 4, 2025 at 1:29=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>>
>> I didn't want to change the existing behavior of any other macro or func=
tion.  This is my first
>> significant rust-for-linux contribution, and I didn't want to be presump=
tuous.
>
> No worries -- things can be changed, and in particular the behavior of
> `dbg!` wouldn't be too bad, in the sense that calls are not meant to
> be committed anyway. A CI checking for the message from the sample
> could break I guess, but that is not the end of the world.
>
>> I could add a sdbg!() if you think it would be useful.
>
> Yeah, that was what I was thinking, though it is sadly one more letter.
>
> We could also shorten a bit more by not printing the column like
> `dbg!` does, which I suspect many may not care about.
>
> I wonder if we could make the `dbg!` the one with the longer name
> instead, i.e. to keep the functionality in case someone really needs
> it. Sadly, that means making it not match the stdlib name, but it may
> be worth it if we expect everyone to end up typing `sdbg!` all the
> time, and only very rarely `dbg!`.

Why not control the amount of path segments with a kconfig? That way we
can have both worlds.

---
Cheers,
Benno
