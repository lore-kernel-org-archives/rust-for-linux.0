Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBDA30147C
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755192229; cv=none; b=VqE/ZsDAOdN7QQX8I11JsFNq6vpP/B/9ZQZtOfH+HxJOjNqc59l91tVWfDfPn32qrr6liiIaghrjMx5HgD95BvcOBaBXO0HDiS8cYP+x5/1xeuA+aRwvh8a4FTVnOUnCZ5RHRKiaOXdqEYrSMabxsA+/8IKoAUmRhCuDH+zcbL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755192229; c=relaxed/simple;
	bh=m9X608APYq6HCMT99UdEMdUApodQZMqc65O/9ajQBsM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i7yP5IJ+Iiz0RCtoep2uGk5D9XiaxkFaCn9RcVo/Ro6iZnw+hkVTYWCf0KUTztHHQaHQhOe3F6QzP9Xt5sVhx0/N+FrypQU+LgbuTl0KVC7a9B23Og92Ei1HsPVuIi9l2UF14lLIbT0SbAJ1wuXsiFcqoFXE7zrMlo6E9r4STow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0LO9yWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0LO9yWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1403CC4CEF1;
	Thu, 14 Aug 2025 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755192229;
	bh=m9X608APYq6HCMT99UdEMdUApodQZMqc65O/9ajQBsM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=M0LO9yWli2p0CGgK5ljL9ysNXO0nuiyylpqfIJ+F/YI2dgFbq68C2I+G2gI7aeCXW
	 dUEFY0iu308rjSweyfOQG5Feu75iyd+CB16db0PvoV3Ti/0ZKJA4c8YwG3emte2A1o
	 QGeEUL5MT3n7CqzIjncOjDvACNzDIO+ve+oDbaom3t3G2CPzIwKtdM0L15gFwGLTSU
	 P/6YgYN6HlR9PFYmF/qeDsmPv3IG3rm0jf7BGvl4wR+M4Iemthlx1uZKu5uXTSeZ7x
	 SwwqYZsOK2ucz/eCLaEnWmyb0GLTMBTKs/Y732rnmVmgA0VTfHAG5Xfu4jRX5NCqpW
	 LUktiiK7CI94Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 19:23:45 +0200
Message-Id: <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Untrusted Data API
From: "Benno Lossin" <lossin@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
 <2025081448-creation-timid-b972@gregkh>
In-Reply-To: <2025081448-creation-timid-b972@gregkh>

On Thu Aug 14, 2025 at 5:42 PM CEST, Greg KH wrote:
> On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
>> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
>> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
>> >> I didn't have too much time to spend on this API, so this is mostly a
>> >> resend of v3. There are some changes in the last commit, updating to =
the
>> >> latest version of Alice's iov_iter patche series [1] & rebasing on to=
p
>> >> of v6.17-rc1.
>> >>=20
>> >> I think we should just merge the first two patches this cycle in orde=
r
>> >> to get the initial, bare-bones API into the kernel and have people
>> >> experiment with it. The validation logic in the third patch still nee=
ds
>> >> some work and I'd need to find some time to work on that (no idea whe=
n I
>> >> find it though).
>> >
>> > Nice, thanks for reviving this!
>> >
>> > And we should at least add an example using it, otherwise it's not goi=
ng
>> > to help out much here.  Add it to the misc device driver api?
>>=20
>> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
>> untrusted?=20
>
> mmap() is, but you can't do anything about that...

Which parameter is untrusted there and why can't I do anything about it?

> ioctl() is the callback that is taking untrusted data from userspace.
> That's one place we have had more kernel buffer overflows then I can
> count and ALWAYS needs to be properly verified before anything can be
> done with the data there.

Are the `cmd` & `arg` parameters the untrusted part? If so we probably
should have a single parameter so users can verify them at the same
time. Or am I thinking of the wrong thing to verify? (`file` should be
already in kernel memory, right?)

> And if write() ever gets implemented, that would be as well (but the io
> iter stuff should cover that).

Sounds good.

---
Cheers,
Benno
