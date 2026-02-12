Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141E258CE5;
	Thu, 12 Feb 2026 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770917023; cv=none; b=ZvK2d9PvvYQb25eTgoPtnQdNCPMDMS+ntHShIAZ0cEhoAnS7CiTj/9dhEyx8gzThSQhfAXSFtfhwfD/fSktnV+fl+HXLtB7GyJ9kKyoSZsoqRvem0jZhRmlqZG1+uSgKygA1RmBDorkd+/vwk+9HP2tI9Z+9yGjTx8dk8jkgWxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770917023; c=relaxed/simple;
	bh=so4QGrJOcY7JuWr3cPaTVDLZ62UF9pT/A5r7PuP9lGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M+NMvi+T66o2KML/NfMU/vhMqL87JpuEsXkkc2S3UaboO+0p2bj+wKhORpoSfbnGQHsjBgM5Ow+AFj30qfD9267K3ONh0fZiREALmWZZgSdqonrBuNPG2cvggEpdMBd9+ayfpLBGH80ijtI4/FvdIPJzSI74TgYzXv/8G2sio2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1jfRton; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1jfRton"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5109EC4CEF7;
	Thu, 12 Feb 2026 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770917023;
	bh=so4QGrJOcY7JuWr3cPaTVDLZ62UF9pT/A5r7PuP9lGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J1jfRtonQwBnquYFfzu5ltBwES3ulkbPUHEzJr3NS9bM/5ujnYx2dHiY5ClUTTrwz
	 TxmEErZT4EpfFh8es7SLaolgKnOY3+Khe6QdldXbDuRznz/nxlsdPL+gd4HdpEOabD
	 wYU8Rr2ux0yKbiX3RJHSU67TF/TI9d2TAm2AjTaEiDoKZo2NIt7xsrxHVRJBB2nXGC
	 q12bKAPrmLpSQZATzq43PHoTZ7lZabJxmJy6HVH2zVwM0EWFrOMV39Uxm7NcstzZmh
	 fpWp28cmSZQ+TUn8DfmIDgh3ju70sHzNonuv/5QvInrFJqZVGBmXv4MPQLjr20Bt60
	 dW6kOVdhg65Ug==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <87ikc1ubuy.fsf@kernel.org>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <W3U8SrC8rs4Ivq5fjTvV2BD2K5BO4RxRg8tyWuntERIaS_RqDgtfBq5y0zcnazWgNJyT5ECvutnzV9d2UPDzOw==@protonmail.internalid>
 <aY4CuCtBfkWZne0d@tardis.local> <87ikc1ubuy.fsf@kernel.org>
Date: Thu, 12 Feb 2026 18:23:36 +0100
Message-ID: <87ecmpub8n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Boqun Feng" <boqun@kernel.org> writes:
>
>> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
>>> When copying data from buffers that are mapped to user space, it is
>>> impossible to guarantee absence of concurrent memory operations on those
>>> buffers. Copying data to/from `Page` from/to these buffers would be
>>> undefined behavior if no special considerations are made.
>>>
>>> Add methods on `Page` to read and write the contents using byte-wise atomic
>>> operations.
>>>
>>
>> Thank you, but in this patch we still have "the given IO memory" and use
>> memcpy_{from,to}io() as the implementation, is that intended?
>
> No that is a mistake. Please pretend it is regular `memcpy`. I'll send
> v3 soon.

Sorry, pretend it is `kernel::sync::atomic_per_byte_memcpy` ofc.


Best regards,
Andreas Hindborg



