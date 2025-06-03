Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B4227EB9
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987905; cv=none; b=GVeTOknUAc0Cz6RLGgzG+MGH77Ad/m5NSh/gZrzihUChpIWO7TJ4FiDuiDSwZrN2IomouvD3hEexoyqiCsLKY0uy/lS2wvv1Tww5yd+f1xDzshAqGqjvbytPchIhtdFsazK6B34j6LLTh7X6wjSO3gQif0PF8QRke0vBe5C+/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987905; c=relaxed/simple;
	bh=VIp5mP/mts6kKZiTqIErKPmCZhUCDV/4ud/matPR57Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=daOZGeqvmRf7sQCe6feEw9ZqL1MVQfi4T4ez+TH1OGyUaAvT98WLGv6oa/LUWpEIiXa4LicuNGGHJKh2BEVvjZ6qabzLLtRqsyZYndMgiswgWFd5Mki8mfK0cGifWZqVuRWYOkIqk7BXPQg7aD7Q2/r/Bs2eZVgfKER06WF2W+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zaw3VM1S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zaw3VM1S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68540C4CEED;
	Tue,  3 Jun 2025 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748987904;
	bh=VIp5mP/mts6kKZiTqIErKPmCZhUCDV/4ud/matPR57Y=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Zaw3VM1Sf8hb8bFyV98EUdyUm0PFEPWh/fTf9abwu8RBFS2esu64/U8dXHSjhF3uX
	 2fsUyTZbd8MBTPBYZ/ouQGQ2o3UtXhBOH+yMKozD5je3Vm6FrSp2MTUpm9nrQSYuEK
	 LD4ukVfdQOyphAXmEgb5IoSGKwIemKqNSrfYDV3fjg1kXJ7F/+acgDY2LBqFTJN+ji
	 mr8vyfVOy1THSaIBnRkPCTWBws7ttSTK5vaKqPM8GAC/vh6JmapxxnQ5zr3vrkYQOZ
	 lMGbAat5rekteTQ9U8VRUZw2ltgpPDBqen5JuoejfDu7XCoToFTKLeS8bTO7YL727E
	 DmTtEPeaqu+0Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 23:58:21 +0200
Message-Id: <DAD8GTNP7E50.3CEF051DAP051@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "miguel.ojeda.sandonis@gmail.com"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
In-Reply-To: <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>

On Tue Jun 3, 2025 at 8:15 PM CEST, Timur Tabi wrote:
> On Thu, 2025-05-29 at 22:21 +0200, Miguel Ojeda wrote:
>> If helpers within macros are needed, and especially if the use case is
>> not just temporary debugging statements, then it may be best to put
>> them as helpers outside, to avoid generating all this code on every
>> macro invocation.
>
> That's the beauty of this macro -- it doesn't generate any code.  Not rea=
lly, at least.  The
> compiler determines at compile time the slice inside file!() that this ma=
cro generates, so all that=20
> happens is the compiler emits hard-coded offsets into the string literal.
>
> You can see for yourself here:  https://rust.godbolt.org/z/e947zsxfP
>
> This is the whole reason I go through such lengths to avoid rfind() and t=
he .. operator.

It still generates source code that the compiler has to check and
remove. So it'll probably be faster in the long term if we move the
functions outside (and thus only define them once).

---
Cheers,
Benno
