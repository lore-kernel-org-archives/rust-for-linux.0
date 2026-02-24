Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3C39E6E8;
	Tue, 24 Feb 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942660; cv=none; b=aDYTtuZ2sYIJemIBQE/r5RPC2T+IafSsRg+/DG6RFP1TEvFvlQ5tjXODCJJvK8JF6qSK3zZyxRxLWqtAW5l3XqpX8N6GyHN+HiNlA+y7LE9cqbGmwTT4Ws0AA9ALZ5Ht3vBji/IEI12CReQhLugx9uYuoy2SAskURp/WVVuu6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942660; c=relaxed/simple;
	bh=Ziv04o8VS9rUdSlEFBgCvXLaRDO3rJ1KOplJuFr+R3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8KFZdczZMjNdNJegFbKLv6VzCEMYPz2g3hlXNSsFydOOOQpHPzgoo6lztGD0i3n5Wx3cjOSd5P425i96LOWdC1ez4Cghfp4Q3FxL95h+bza0nza7iO3CTRc3508GKV6y4g0H2Pt9OnQD/A7D2+EncHeI0wnI1hdLBZS2U35gcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPIVlNzV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPIVlNzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B305DC116D0;
	Tue, 24 Feb 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942659;
	bh=Ziv04o8VS9rUdSlEFBgCvXLaRDO3rJ1KOplJuFr+R3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NPIVlNzVNNLKePtVD8OMqcBXS4ijT8gmOwyQMlsShZ60i4guSCKn00B9XsUgur9EU
	 bKFD6I1oxgNJynT2CefMnhAVv7YGyow6GJCk4YhDzaEaQ2q9NCP29iJeNXrCHjj1xc
	 y5g/NSRRwvL2Zpe+VVz/Yfjz3fM7BDxg9fwJ1YZMfETQIz2/bCCBNJ3vcpZPiuMAlM
	 CEN+n/qtJxRqNWHanNZ/3Z77xDfSOr9ipGTlnpUiITN5aWWlBYR4fP89IG7knk8Vbh
	 EmZMfyZkkOLeZRiitJF4fdjOJ1kW8IyPmJthvNcEhcFnCS/6GBlmlTWP+SNrM5QOoA
	 iF8v9kwT5ajLA==
Message-ID: <a354777f-6275-4b81-90b8-45268db22ffa@kernel.org>
Date: Tue, 24 Feb 2026 15:17:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/23/26 6:58 PM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to drm-rust-next, thanks!
