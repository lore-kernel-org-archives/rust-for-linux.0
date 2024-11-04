Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512781AAE27
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730758105; cv=none; b=EL1ZNJhDkCVrUYKo3Vmrqo1Bx0DCvbpR1oQyGXQejDz5ViBoFb9rH/uuJ5T/V62eueP3k6KLZPRR9wvY80fsTrau/dZ8xvsT0z7fZYvUtbpDDAkLOmnItLA00SkiIvUQoH2dFf1GhVBv9fdkBEIbmx+JsmJIMtCNY469a+17V98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730758105; c=relaxed/simple;
	bh=PQx/fNE6iZBB9FGOyQyL6YRR0ROBUM7Ls2iNmQjQ0fk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TvbAlS3jBfz14lDZf18DRNXRb38aFvliTsdnPHwpGFNkISYNa/O9i6MkCtRRSZWJucNSyzZEd0PRIuC5WXg8UDytBgxAnKNDtLqAWw5AzGbIc+rS4HN5oXZI76JLi3iaYpZvqlR87MTIsFghma9JCn/siJhRHM9bNF6yxljFOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=MjyOXoVQ; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="MjyOXoVQ"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 75A36357018F;
	Mon,  4 Nov 2024 23:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730758101;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=PQx/fNE6iZBB9FGOyQyL6YRR0ROBUM7Ls2iNmQjQ0fk=;
	b=MjyOXoVQgWbwFvF0iIHh4y/9KQaN5Q8PeOZ9WX+zfZeBZ62hcUYuMFtMyC6R8lpZ
	YEGgr5Rak/F/7W2iWJGx1+60RBu8Rus7j+4HwIYgsd2YIa+YfAsqvNkWxAqxvC5/tb9
	4tFB+QQpmMwXc/+dUoozryCZxFLdCpy3fwll8hYQsoujRZIGJE726IhVhmdGQSrKPDr
	1/Y9RM75Oejpdav36bcX2cBe77knqr04tyOwIcudVOw7MwHPUxykoSrp7bVg31diIEI
	NM45u8gL9ROco2qOIrNnfUyvI8cGG844qFHHRQZ20mwBK356GHeuRFn4AHLjipIL6HT
	4ie0oMMxAQ==
Date: Mon, 4 Nov 2024 23:08:21 +0100 (CET)
From: jens.korinth@tuta.io
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary <gary@garyguo.net>,
	Bjorn3 Gh <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	A Hindborg <a.hindborg@kernel.org>, Aliceryhl <aliceryhl@google.com>,
	Tmgross <tmgross@umich.edu>
Message-ID: <OAtDBYR--B-9@tuta.io>
In-Reply-To: <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com> <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com> <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com> <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nov 4, 2024, 16:45 by miguel.ojeda.sandonis@gmail.com:

> On Mon, Nov 4, 2024 at 3:08=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>
>>
>> The code to execute only once is very basic code like the kind found
>> in textbooks? I think that his focus is on optimizing that code. Once
>> the the basic code is merged, it's easier to send patches to optimize
>> it.
>>
>
> It doesn't matter that it is "very basic code". This was discussed 2
> weeks ago in Zulip. Most importantly, it was a new contributor to the
> kernel that was working on it (as far as I know).
>
> The issue is that sending code without any indication about the
> discussion, without Cc'ing the author, and so on, is the sort of thing
> that can annoy people. And if they are new contributors, it can drive
> them away.
>
> We need to be careful about this.
>
I think you both make good points. Fujita, you're right - it is very basic =
code with little technical complexity, so it may not be worth overthinking.=
 At the same time, I really appreciate you including me in this conversatio=
n and acknowledging my contribution, Miguel; communities can be quite sensi=
tive, and sometimes, attention to the small details really does make a diff=
erence. Perhaps we could simply add a "Suggested-by" or "Co-developed-by" a=
cknowledgment and move forward?

FWIW, my motivation to look into it was the TODO kernel/error.rs:123. Might=
 be a good first place to use the new macros.

Jens
