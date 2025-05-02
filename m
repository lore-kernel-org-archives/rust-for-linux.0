Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC318E050
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171239; cv=none; b=ehYlmuq3bX7Pl25huSc86NFzuGaJkhQdSJ4bpelisMmi6vtyafTSgzcKJSbMwQauh1iCPNQLpASKgnz5iHK5YG76PljVddgV4bMgCfAwvm4tQowDF9iuvN1yUUSj6SPbsMMsEnEg6JSK+PP+PmrJ0xFHYDRYHZfWpWyc1vv5q4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171239; c=relaxed/simple;
	bh=oSKMefOd+BrHXkzfyeuDXivys6DxfqimZTBUiw6lth4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hNjbPxI4GSc/8AErti9l+9xJihL+ypccV/78RmNQL3NDPBFnG7KFFW3eLcM94UhIHalJi3DpSF1YLHF2peR5hWknV9eWiSOnTJxbHK0QlGVZJTLHFKMHDBlDgzHNBnhlaSHixdgbsd04i5bChKHeFdENL9EWiaic/dZvYEd3/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvVZ8trY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvVZ8trY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA99CC4CEE4;
	Fri,  2 May 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746171238;
	bh=oSKMefOd+BrHXkzfyeuDXivys6DxfqimZTBUiw6lth4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GvVZ8trY23bN+tj6qQOiZTx8bFVBE4gyuIB5M1m2QpBPcu7YXC4tJBVmgQzYlZqbr
	 SqG2MsNlL3URWhgeAWnU4RWeXBQCaSYF7+YfbVrmFdkcb6y8cG4MlLJTNxVuQJY0Iy
	 h2jv6y4AE2Ff9zFzmjYYNw+Q4aP644iyRWNPYKZOB2FtuDuN9JOXm7VV4XeqTdSPK4
	 SYMRvmQnk6eNpS64tTjOreL8C/kykMgwgoCH2gEIV+FHM9vy8hB1MlM+dHozpE4gtd
	 G/4cKV/ZjHm6qm5vC59UDX+067hmQ7dUqv4j283Jmtl4lVgQfLbNSeDApsM1K6stTF
	 sG00TuF3BL7DQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 09:33:54 +0200
Message-Id: <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
Cc: <benno.lossin@proton.me>, <ojeda@kernel.org>, <aliceryhl@google.com>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety
 documentation
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Marcelo Moreira"
 <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
 <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>
In-Reply-To: <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>

On Thu May 1, 2025 at 12:18 PM CEST, Miguel Ojeda wrote:
> On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
>>
>> This is part of issue #1160 ("correct safety comments and documentation
>> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
>>
>> Reported-by: Miguel Ojeda <ojeda@kernel.org>
>> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
>
> I think it was just Benno. :)
>
>> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> Normally one is supposed to test a patch before submitting it, i.e. it
> is implicit.
>
>> +/// # Invariants
>
> We also place `// INVARIANT: ...` comments in the places that need to
> ensure the type invariants hold, e.g. in constructors.
>
> Given the issue, I think Benno may have also wanted that you then
> refer to the type invariants to justify some of the comments, e.g. in
> the "Since `self.is_available` is true, ..." ones.

Indeed, we also need the comments that establish/make use of the
invariant. For example in the `try_access_with_guard` function.

There also is a missing invariant on `RevocableGuard` that the
`data_ref` pointer is valid.

>> +/// - Access to `data` must occur only while holding the RCU read-side =
lock (e.g., vi
>
> The "must occur" wording seems a bit strange for a type invariant, but
> maybe Benno had something in mind here?

Yeah, I don't think that using RCU is even a hard requirement. One could
also call `revoke_nosync`, since one knows the revocable is only used by
a single kernel thread. I also don't think that it's needed for memory
correctness, but I could be wrong there.

The most important invariant is that `data` is valid while
`is_available` is true. That's what's needed by the different functions
accessing it.

---
Cheers,
Benno
