Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D12374721
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354657; cv=none; b=Vup3YFFkj6urypi+ZjykLLYGTO1uGVblSkJvVRtR4Z8RHm0VZu93n1UTWMiH3FOTTN2/47nGtA6aSnw+gwgLHyZn31v+hs8PIW02kP36DdO8Y7pcHXH3AGPJ07pK91D5wunMLaEkR+lLjZ8OhMsisQV4j440BTbbebQPOfbqhJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354657; c=relaxed/simple;
	bh=wP3hKCDKoD//66i9JGFv6lSpkvVqov8oBCX80QQgxRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rSIUUHZE2mpLJy+VJfs3hcNViDdKGTeAe4ZnFLp62l0r70SW4FczEP7FLp0Kkfirfs/RISPXc2aHRfkMqgz3wDHq+jHMbHcxwC4uvOUZm50WyxB7I/L6Rp6HUSVUKjKDcwRmtZnQ2AaoJ/pURiWM8W2owfFsTm47Kqb7mZLqNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faekKi3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faekKi3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B89C4CEF7;
	Tue, 17 Feb 2026 18:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771354656;
	bh=wP3hKCDKoD//66i9JGFv6lSpkvVqov8oBCX80QQgxRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=faekKi3ABnzzfMhf/GpMsx5uQkWh6JzJ/zNH+76CuSqqyBe4U1CoM1BO2CwH11Du/
	 y5M031XAgWUU9X6N5PY7Q3byMy7zPzGlfLynzM8GyEDcKvJP3tQlf6ODwEY/JOsbCX
	 U/XwP3zc7E+s5dMqV0XO7x6Q1FcayH04RS0ZOPS8rZmctg77eHgo3pr+FkNHhM7MdF
	 ux/ujJFqHGjAFfNsJznsV/abNOu7YXbtUVWzo+rUPLhNN+g++JgRhQIAltO0ztjeQ2
	 0BcKWKdXINMt3ctD5hR+J6n+N3O0NfSMTtEUi8W4hYCAeuAiWi9Y7UjU1GlzaNd/WH
	 lwak9KAQkCrew==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Daniel Gomez <da.gomez@kernel.org>
Cc: linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org, Alice Ryhl
 <aliceryhl@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, Daniel Gomez <da.gomez@samsung.com>,
 gost.dev@samsung.com, Greg KH <gregkh@linuxfoundation.org>, Julia
 Lawall <julia.lawall@inria.fr>, Kairui Song <kasong@tencent.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
In-Reply-To: <CAJ-ks9mhOAgNKjepUOS918q90JkmyqVU6axKt-v35Rav+MNy3w@mail.gmail.com>
References: <aZRncP-sKLLS2K1U@macos>
 <Zy05aTxJToTSNNCXvTAVZ_iEi3KkZ8R0an9b0G_kemt0or0JyRUp_dfZ79wuF91J6xV1bna6fZwo5rRwsrlgoA==@protonmail.internalid>
 <CAJ-ks9mhOAgNKjepUOS918q90JkmyqVU6axKt-v35Rav+MNy3w@mail.gmail.com>
Date: Tue, 17 Feb 2026 19:57:24 +0100
Message-ID: <875x7vci5n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Tue, Feb 17, 2026 at 9:28=E2=80=AFAM Daniel Gomez <da.gomez@kernel.org=
> wrote:
>>
>> We propose a topic to discuss the potential use of Rust in core Linux
>> kernel data structures.
>>
>> The XArray unified the kernel's radix trees into one API back in v4.20
>> (2018). It sits under the page cache, block layer, filesystems, GPU
>> drivers, and dozens of other subsystems.
>>
>> We looked at XArray bugs since 2018. About half are the usual suspects:
>> races, resource leaks, encoding and overflow mistakes. The kind of bugs
>> Greg says make up 60-80% of kernel security bugs [1]. Most of the rest
>> are complex logic bugs where Rust's type system may help but cannot
>> eliminate entirely.
>>
>> The motivation for our interest in evaluating Rust for use in the XArray
>> started with a bug in mm/filemap.c that corrupted page cache data [2].
>> Consumer code called xa_get_order() without the lock, the tree changed,
>> and pages from wrong files ended up in the cache. No CVE was assigned
>> to this issue*, and no reproducer outside production existed before the
>> fix (a synthetic reproducer was only created [5][6] after the issue was
>> escalated). Kairui Song's refactoring and optimization patches [7][8][9]
>> happened to eliminate the issue.
>>
>> In Rust, xa_get_order() would be a method on the lock guard. XArray
>> users would not be able to call it without holding the lock because
>> the type system would not let them. That does not help with the complex
>> logic bugs, but it eliminates the class of mistakes where the API is
>> used outside its required context.
>
> These benefits are compelling, but they materialize when the _caller_
> uses Rust (and when Rust abstractions exist, whether native or
> wrappers around C). A stronger case for a Rust implementation would be
> justified by internal complexity; IIUC that was the motivation behind
> Rust Binder.

I agree with all of this. Having spent a fair amount of time reading the
xarray code, I am very interested in seeing how a feature complete
implementation of xarray would look like in Rust, and how it would read.

For C callers we could do things similar to what our current C data
structures already do. Asserting preconditions for calling certain
functions, lock held, etc. I am curious how much of this we could do
automatically with Rust.

>
>> We have a Rust XArray prototype that implements core operations designed
>> around Rust's ownership model. By the conference we aim to benchmark
>> it against tools/testing/radix-tree/ and use it to back the Rust null
>> block driver for A/B testing performance against the C implementation.
>> In the longer term, we plan to deploy the Rust implementation in the
>> page cache for A/B testing performance of generic workloads. We invite
>> the community to take a look at the code (when published), which at the
>> moment is rather simple as it only covers the core operations.
>>
>> We know that Rust is not magic. The first kernel Rust CVE was a race
>> in an unsafe block where the safety comment was wrong [10]. However, we
>> believe that constraining potential memory safety issues to small unsafe
>> blocks provides a significant advantage over writing in C, where the
>> entire program text is to be considered one big unsafe block.
>>
>> With Rust now part of the kernel's core infrastructure [11], we would
>> like to explore whether Rust is applicable for use in core MM data
>> structures. We invite the community to this exploration and we would
>> like to start the discussion. Specifically, we seek insights into:
>>
>>  - Which workloads set the performance bar?
>>  - Would a type-safe API reduce consumer bugs, or would they just move
>> elsewhere?
>>  - Would rewriting core data structures introduce new, previously
>> unseen, bugs**?
>>
>> *Under the Linux kernel CNA's CVE assignment policy, data corruption
>> issues do not meet the cve.org definition of a vulnerability and are
>> therefore not eligible for CVE assignment [3][4].
>>
>> **Our thought: The existing test suite covers years of real edge cases.
>> A second implementation running against it is not just a rewrite, it is
>> differential testing.
>
> The downside to a second implementation is that it acts as a change
> detector: If the tests run against both implementations (and we can't
> drop the C implementation since Rust is not yet required to build the
> kernel), any change to the C implementation must be accompanied by a
> change to the Rust implementation. I'd be surprised if the C folks
> would be pleased by this.

I don't think anyone suggests putting this Rust code into production
first thing (if ever). Current C development should not be impacted,
they should continue as they please.

It would be a cat and mouse situation the people working on the Rust
code for sure. But maybe that is OK.


Best regards,
Andreas Hindborg


