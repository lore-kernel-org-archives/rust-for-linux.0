Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA3EEBA;
	Sat, 14 Feb 2026 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771028963; cv=none; b=CddSomts3FJq2h3IKscciZTBvv7lGHNIwj+K66L/ViHKiZaTETTKkeT2bO7MQEP/+PGOPCRN7ZgoDEvWBHYIcuZmnLHXJ2zNsbGqu9HoQheMseJjgo0GUu/tW0AhOMs77OlXkyyJJqyapJ5NuR7dgYX7U1tue38KI+ukceiq0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771028963; c=relaxed/simple;
	bh=YvsPEh6HCGUHqoLXvFZixMboBz4g8kUXgB9HcJr15SU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MlMmO/A0JViklMAvWmAGhz5Czt2mpwv5RZlvdVImjoHnYZh3yruthBSTskCXoYdm69w26APvpO3byOIZLpFna9/TMKSbzjuSCSn0MxpfjOoQtcwVXPT98aMl4855cnQr9E8rhjjuYPeWJzEodXTfveuJ79BR4uxhlGCoXXmBNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUITrCym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUITrCym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EB1C116C6;
	Sat, 14 Feb 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771028963;
	bh=YvsPEh6HCGUHqoLXvFZixMboBz4g8kUXgB9HcJr15SU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JUITrCymFE8WY9hXlJPFWo1wD9IY5UpE/H2jZVoxtblH62tkk274itODMFESplm7R
	 fvoFDorHMV1IMoUHzdUuLjF6/9W1vBitY/h0vpZPMLunQcJv4nwUA4ryOAuPnwXZuB
	 3qEgddDEJRyVY+9v4uogaxdb8yxJKBN/4eSE7moAiWHHqjZf5j1JNrd584FEjIUHJ8
	 17IWEhk/D5TvGOh95pox7cFI13u31SPRGocJn2nf9LjLt0NaoBeLEcbGpHr1kJhZzq
	 dvcj9/pFauSyKNtGq6PVF5CzhyGS7l+5XMWRf6+NZUlQJw0+bzgaC1VrmqlOOFteTv
	 Yh63U7tikoLJQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:29:18 +0100
Message-Id: <DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>, <tim.kovalenko@proton.me>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
 <DGE8Y55O5445.D6KRXL724153@kernel.org>
 <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
In-Reply-To: <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>

On Sat Feb 14, 2026 at 1:18 AM CET, Gary Guo wrote:
> On 2026-02-14 00:09, Danilo Krummrich wrote:
>> On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
>>> If you prefer, I can send out a version with just improved projections=
=20
>>> without
>>> all the generic I/O improvement stuff.
>>=20
>> Yes, that would be great. Otherwise, we can also use as_slice_mut() to=
=20
>> avoid
>> having to touch field_write() directly, but I much prefer the former.
>>=20
>> In any case, I'd like to keep the PteArray type. It can at least=20
>> provide a
>> function to calculate the value from the DMA address for a given index.
>>=20
>> (Would be nice if we'd have something like a dma::Projection<T> type,=20
>> such that we
>> could have PteArray::init(self: dma::Projection<Self>).)
>
> I think once I/O projection work is done, this would just be
>
> impl PteArray {
>      fn init<Base>(self: io::View<'_, Base, Self>>, dma: DmaAddress)
> }
>
> and the generic I/O projection is used inside.

I guess I should have written "Would be nice if we'd have something like a
dma::Projection<T> type *already* [...]", i.e. I meant to say that this way=
 we
could remain close to what the final implementation will look like eventual=
ly.
:)
