Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC713AA2F
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771174943; cv=none; b=WepoS3ie0gVDf9piHzpt6mpgjesZ1neDytxYYN0vZecZgepwIiitH6nSZ2KdxFHog5WmIiqitVQCwtlhJ1jflLH+BOkgs9txm61Yn8l1DvFuywy1gJhYpoHXr8rHlmfGPGqYfPyJL4IwvxjnvEaYQVXS9p/S7BhW7L89KpOPVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771174943; c=relaxed/simple;
	bh=PfwdO6ooHLYrbQR0CT+e/6cK1/FY1bNQ2l2T0+kl1k8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sXDoVZzCeRSvikLjIlzPdUA9S369grYSjlxXemLwc1ooX685p5GLhhuACqdZV8HknkAUVyAbnXwjs2uvgrGrQhtYqRMnzeBJlpG123VuHC2y5mDAEmUYRTn1p7FsE8mDtFZLihb9FxyPRWXg5crs1ThGWGfALMkMcOJPZQMZFH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiXlFp6G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiXlFp6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F09EC4CEF7;
	Sun, 15 Feb 2026 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771174942;
	bh=PfwdO6ooHLYrbQR0CT+e/6cK1/FY1bNQ2l2T0+kl1k8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BiXlFp6GQ8xmYqupJY/aDLolUC/7RSyKJG7mLzxel6YhSYQgV6Kqf94poJ0gQhOH+
	 i2Bu9BOhaOvZbAqkureGOc5ICQffavwyPKIkTlRLLgX/2SES5aWnQTGU2bG9hrUheC
	 8ELvckB0FMYoTLta1rIfF+yCF3V3JmackE41O4HK0w97CpbGY4VcszJKjFOC+A2Jl8
	 bghzoIl1+rDKA33104GK/7Ij1e2VF1ojmRGjp6thBzPWi3njwuWcvzu6Y533UZWkyx
	 +0Whrc13fcZ6KuqBgw9Bo5p5MqhYVkJYSiFwJ7HNiskB5rXAw25whVwegLdUjZCCz1
	 lE+I7SV5wU9fw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 18:02:18 +0100
Message-Id: <DGFP45YZA0MG.VUXK28J7P7B9@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
 <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
 <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
 <DGFJVWDJUOXK.27766P8H081G2@kernel.org>
 <CANiq72ktXTSsxKHcX5eNGf-6NR-ySXf9CX0M+gPumzZxVVufow@mail.gmail.com>
In-Reply-To: <CANiq72ktXTSsxKHcX5eNGf-6NR-ySXf9CX0M+gPumzZxVVufow@mail.gmail.com>

On Sun Feb 15, 2026 at 4:16 PM CET, Miguel Ojeda wrote:
> On Sun, Feb 15, 2026 at 1:56=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> see it land within three weeks or so
>
> That sounds fine -- as I mentioned, what I don't want is that we land
> patches like this one (i.e. soundness fixes that require a new
> feature) with the urgency of usual fixes, but rather more on the side
> of that of a new feature, since they contain one.

The fact that you keep repeating this and that you said in your fist reply =
"I
would prefer we at least have a reasonable review time for this." confuses =
me a
bit, since repeating it and saying "at least" reads to me as if I would hav=
e
ever said something different, when I noted:

	If you don't mind I would like to take this one through the driver-core
	tree as well, as it is not only the base for this fix, but also the base
	for the upcoming I/O infrastructure work.

I did not mean to create any impression of urgency, but only wanted to know
whether that's fine with you in general, e.g. "Yep, will ACK it once I feel=
 it's
ready.".

So, again to avoid any possible misunderstanding, we never were in disagree=
ment.

> (It is not so much about this patch in particular, it is more about
> trying to establish a pattern.)

Not sure there is a new pattern to be established, it's always a judgement =
call
how to handle those things. As I already said, I don't think that soundness
holes that do not lead to an actual bug yet are any different to other case=
s of
potential bugs, regardless of C or Rust.

For instance, if you have an API on the C side that is supposed to be safe
against concurrency, which is buggy, but the only user does not use it in a
concurrent way, that's the exact same situation I think.

Hence, I do apply the same general handling and judgement.

>> If there is a potential bug (i.e. code that is broken, but no user exper=
iences
>> it so far) then I usually take the fix through a -fixes PR but don't fla=
g it for
>> backporting.
>
> That sounds fine -- my only note is that we do our best to backport
> Rust soundness fixes (i.e. unless there is a reason not to, e.g. it
> could be that it is just way too much effort and the risk of getting
> actually abused is low).
>
> I have just added this section -- we may also want to add it
> elsewhere, e.g. the guidelines, for more visibility:
>
>   https://rust-for-linux.com/contributing#soundness-issues-and-backportin=
g
>
> In general, if code is actually broken, even if a user didn't report
> an issue yet, the stable team also takes them (going by the things
> they usually pick). But I assume you meant it more in an abstract
> sense of broken ("conceptually broken", "theoretical issues"), like
> Rust soundness bugs, yeah.

(Yes, this is what I meant.)

> So Rust soundness bugs are exceptional in that sense, i.e. we nevertheles=
s
> backport them even if "theoretical".

I'm a bit confused by this paragraph. In your last message you raised the
following concern.

	"But it is all a balance, i.e. in the C side, it wouldn't be even
	considered a bug to begin with, unless there was an "actual issue", and
	thus unlikely to be justified for a fixes PR. So I want to make sure we
	don't overdo it on the Rust side."

But now, additional to my usual handling I described, you seem to ask for a
backport in such cases, as your link mentions "In general, fixes for Rust
soundness issues should be marked for backport, unless there is a reason no=
t
to.".

Can you please clarify?

Besides that, as I mentioned above, I don't really see a reason to handle t=
his
different than any other "potential bug", such as the C example I gave abov=
e.
