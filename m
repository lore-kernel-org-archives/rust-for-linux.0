Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336129;
	b=Iz/rYpWVxXZ0BsM9yqHTsnWMYpKkOzbWz26Op/4D4llbmnrgy7xZ8RXOwC9i/WtDufRL
	 Bbbi1k+JHUn8cqQrvbEkM8oq5PUnUiAZxZu2lxAa54OYIr1Zxi8GLttQIM3UgFwTsYasz
	 GsdXk2pwyM+feWWFSvi69LZ74cBeTWIo8udKpEWRuLaIH7eQjQsRmDE0jfGUPLl3+DtVT
	 QYl3uZudMKmy1F04Fk4wpyYtlo7P1EroKlNEraSa4G4WgcTralG+Lx81mxGTj7lTjU0OP
	 55/XheOedby/NkcaM4wOdwvzuy6Clb4DkUYgc7qM4w3X8Z6qhJr60qbvymigFSrR9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336129;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fXb0XqFsaTNiAdOf5/i8uXOS/3ZPKLdeB/CQNiCWj+k=;
	b=DJFtjS7KaUdb0ergHS1963fAyzxKMf4hqw9wFb3AFiEbX2Dp88ZmtK8Sjfla2hn+K0og
	 03ShQ65Powa6kZc3PoESd5XOKMjL6DLaBV+cJN+OS8dORhoLQGr4NYHCWTIg+xKkIFyJj
	 ODB8SrZnYHjkvAasywxazl5aJREpT1Unblq95Qm1iBJRSoxeGmDL4nLfgZiqOXYMNutxj
	 afZbNxLGLeumabg/SIT6nbZJ7NkC8asRipFEArs9QxW27ZvHDaBZv1oi6W+AvtvHr3LLm
	 Bn2S1jni4Yn2kkmOxAFU2Y2qefZ0uWyp+xqrSSx9/Won+2IiSrFeCjS4ust50nreeAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewhSuFsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC1606A913;
	Tue, 10 Nov 2026 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewhSuFsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BEE1F008A2;
	Tue, 10 Nov 2026 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336128;
	bh=fXb0XqFsaTNiAdOf5/i8uXOS/3ZPKLdeB/CQNiCWj+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ewhSuFsJrfdYDpTE/gonu8E6tArNmgjYOFlesKdqqHlo9EJhF1P0yqHueTRP5fiYF
	 Ci0PPLTIqzrOxvuo8gD28UuP9pHzCo0nU833MFNsrp9SWpnxjoARHj7PplWlGenn0Z
	 nlXV0tuVN13TtMkp/5b1j2HczDsnnGWp+lbFeOCgiu6yqKjgsSLHpnLl3kyOgqRAxU
	 /2WXNLjUDTLy4e0l0KsJYI8T0I/fd8axw2litjT8/xP6fdIkREfxjkYydwsPyPwgeS
	 RfKo451W9Yv+oVn9DdWQ4rHLhf4Id0Tj9g18U04ADRyqpLl24vPEgpOoqgmpUvg+uL
	 FPnjI28WRZbdw==
Date: Tue, 10 Nov 2026 20:41:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-ID: <avNlcudgk5N0cH6P@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>

On Tue, Nov 10, 2026 at 12:03:06PM +0000, Lorenzo Stoakes (ARM) wrote:
> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.
> 
> I have separated the patches into areas maintained by David, Andrew, and
> Alice + Danilo, so each can take the patches relevant to the subsystems,
> for convenience.
> 
> Apologies for doing this, but given the current trends I'd like to do
> something to make my inbox a little more manageable :)

Yeah, I hear your pain!

Thanks a lot for your work, mate :)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
