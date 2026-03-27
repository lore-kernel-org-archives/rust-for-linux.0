Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76342E8882
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 06:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774592053; cv=none; b=ZKtBzPzsyJVDk+kP33/EyCfvma8NcoxViOrsYWCA5c0pBcnGinTrXTBAw8Iswr1rgUc1sOLeFZowZYg1K1OwwvfRhWDIEvzYG0fymILbo0VUQVqpWLIlAquoHp54OYQokkJ/gSxSnAal/R85nMXX/TCvQ/GGfShzlqM2piWtbsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774592053; c=relaxed/simple;
	bh=/aP81OpDGzqtdFqZqvDkoRHzMTstzgL3Ciqvj+RGTzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX2nfYxvZ6YDKLF8lsMdd4Mw1A2gEYKya0CfB7SikvijPqWUPdci2WNOib8yZnbmVTFC/u5Qc9Sz3/rfHC4kxBjl57FvjdSdPXxjBLy48a4zRSG1N6LnDilf5Xdx6Y13/z/ATMoAsgpkAuPG6zUw92RcXxc6r7viWfvYy/9G+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A9gDF14E; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A9gDF14E"
Message-ID: <d8b015a9-72d7-4e94-afd6-2ff96ea09c69@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774592049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCauHrrpuOtEUwL7UUDJRVF5muBm8RrWT/mgiwv+xSs=;
	b=A9gDF14ENKJbOpOxKu6kZy9qJi4ayqoNaNGI8Aee3uuYHEoSPY2DTA8xcMb+AlH1XSW07x
	FLvbdu8ugk3Bo0yzMWN4z9hSk46T76DdRv2t+KrWg6FQEdaAIYnonY6C3MMkrrYa77N9WE
	PKUfoQchdhK1mrxUokwpkv1zcpZb8q0=
Date: Fri, 27 Mar 2026 14:13:37 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] rust: sync: set_once: Rename InitError variants to
 fix clippy warning
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-3-074badd18716@linux.dev>
 <CANiq72mg9nAMrFNc4Tbn7rXeSoZGETTZnUtKBieVT3XLBmmhYA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <CANiq72mg9nAMrFNc4Tbn7rXeSoZGETTZnUtKBieVT3XLBmmhYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/27/26 00:35, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 7:55 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>> Fixes clippy warning:
>> warning: all variants have the same postfix: `Init`
>>    --> rust/kernel/sync/set_once.rs:68:1
> Is this fixing an issue earlier in the series?
>
> If so, then I would suggest just fixing the patch that introduced the
> issue directly (since you are not the author, you can use square
> brackets between the Signed-off-bys to indicate what you changed. I
> agree with Gary that is may be simpler to just allow the warning.

Agreed. This clippy warning already exists in Gary's original patch. 
I'll fix it
there by allowing the warning directly, and add a square-bracket note 
between
the Signed-off-bys describing the change.

Thanks,
Alvin

>
> If not, then please add a Fixes: tag pointing to the commit being fixed.
>
> (By the way, if you do keep this patch, then please copy-paste more of
> the warning, i.e. it doesn't say what lint is being triggered. In
> addition, the imperative mood is what is expected in commit messages
> for the kernel.)
>
> Thanks!
>
> Cheers,
> Miguel
