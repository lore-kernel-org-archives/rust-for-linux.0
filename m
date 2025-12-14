Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C61EB5FD;
	Sun, 14 Dec 2025 05:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765690058; cv=none; b=kogxKfNC0O7D6VgWV2Y830bwKBvioUhYfI1gNYehl0s31nHbVhk+Fzq9yShrkLFwxNmgFm03bKQBWBOQZQaVfLl2yzfzGpJtmsm+oDb/2K6S8waTzJQRvLwrqmADlhin+DmBrgRIh3/syUp9sfTZkRo3/Y5K0TBPuwLldXLavFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765690058; c=relaxed/simple;
	bh=jzzbfCvdHZS4mp2eLfWnjjj3imRGagYkglBPzv2nIBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X3xL02yBGldhIqCBjic6iZ5I2U39PfgkIT2iSDPacWysNc7J9BPzKY9EciPLbuQmW5qfS8GJuQeqWOUgu8S3BULZtecj3C908ojJu40Zwuh444/RygJb6s2o71+152AOC34gSQrO2DQrvc53fCPom5U606OtuOYRp/hpxUJdCDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6yko54e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6yko54e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DEFC4CEF1;
	Sun, 14 Dec 2025 05:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765690057;
	bh=jzzbfCvdHZS4mp2eLfWnjjj3imRGagYkglBPzv2nIBc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=k6yko54eMKfwT83x/UwFnEe3aqzXAmumhBrJAng2JaXD/UkAkY1HqxUhOARSLDMZX
	 xx8FfArWJl4m0So4c72mO82HPUaeEtdbImhlExjYCr/IJIwWcdy4NnEecbx+z8uNVr
	 c+wObraKoowsXTc+cbrALoAC4vpMqi25+dlxeXafgvRO3flZtmMCZh0WsMRnmsNqz9
	 Er+gCMuCv0PW468mIZ3aFmWUOU1JptzxIdAekQapM4iQUXSqojssAlP94WaNFlXG56
	 otHGGp+IpMNg2u6pqWBMsA4LT+y+bTiUnH1MLptLwWSdkRJVdu1JnrLdJRabCq3ct7
	 17deWDA9POCWg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Dec 2025 06:27:30 +0100
Message-Id: <DEXOVV9G583M.3KVXNRLNBQA4Q@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: conclude the Rust experiment
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251213000042.23072-1-ojeda@kernel.org>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>

On Sat Dec 13, 2025 at 1:00 AM CET, Miguel Ojeda wrote:
> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
>
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
>
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
>
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.
>
> But the experiment is done, i.e. Rust is here to stay.
>
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
>
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.

It's been a blast making the experiment a success! I remember the
beginning of my RfL journey very fondly. I did not expect the warm
welcome I received for my very naive issue that I created about mutex
initialization. I think it is your open-mindedness and kindness that
lead the experiment to the great success we have today. It would not
have been possible without you to assemble all of the experts we needed
to make this work. So thank you for that!

Now looking ahead, we have lots of more fun work to do in all sorts of
areas. I will continue with my work on the Rust side of things,
pin-init and reviewing.

> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno
