Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E33CC31F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823201; cv=none; b=KRfz+P0hw5hTeJ8phBGZATY7eE0RNzMc/s1Mm04co9APjpqE8EmMt38dqSLCYzxyrXfO55wjn1/bbegza/VJOr8zqP4K3hHagJXuCKTKKuS1aPYL4mWLwudDaPvbDgSl7/EoO1b8Q25P7K3G1oKpEmLGifjwvDtZjWOYhp3tEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823201; c=relaxed/simple;
	bh=OZCly7NZGJuV1grBsVe2mu4UGD/5kupMRSJOzGocY38=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=MNTeLaqRi39iuvPU89Jfsa9Nz9iZefYhvE9xV5JY78RRuRcmHy6UHFWrwfgqLrDr+S74DYg0tdgVq1nlq8Zs4fKm9NAsWspfwCxdGQF37VtVBJFMzOhKEIB3zbqRd7JQ8U2grmB9pVppEbop90hrTLOBKmAKAuAeL1JM5QXXtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQ232HL7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQ232HL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E801F000E9;
	Tue, 30 Jun 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823199;
	bh=ih1TFoZhgNHiklDT5HuCM2GcZP/KHJanzFgzTFbJOvw=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To;
	b=NQ232HL7SOXFk20KGZbrLddclCVoS42Y6AVaTCTldvtWtT2QqU1lUm3tgtOvc03OL
	 Ol2ymbmR0aoz5wOCC6SmtuNGoilmNGLHIRWpLOOeuSg8Zm4rLlQhTzdNBE/Y5paiuw
	 fe8vtI25DO40uiDZa2zucQLoYEZ0igZKKIyd4ZC2YGFGJLFrgyfRt2dupFSEWbYnVL
	 FTWr7Uks/c9+8mtIPx3on//yperoqxApP/761gFk7VHszJKTDBZyXiGMX2ieVoQSDa
	 UdNvyZ+tn1ty9TfKuvB5fmvbdWqKnj9epf9Aw5e9VWHMoXg8PIqmpiZDiA8pI1nCpv
	 3KjnVd9dklDLQ==
Message-ID: <4384b634-2d7b-43fe-8eaa-4a26b31c8150@kernel.org>
Date: Tue, 30 Jun 2026 14:39:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: error: add remaining error codes
To: Timur Tabi <ttabi@nvidia.com>
References: <20260629183022.2709524-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org
Content-Language: en-US
In-Reply-To: <20260629183022.2709524-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 8:30 PM, Timur Tabi wrote:
> Add all of the remaining error codes from include/uapi/asm-generic/errno.h.
> 
> Previous updates to error.rs have been piecemeal -- adding single error
> codes as needed.  Instead, we can avoid future problems by adding all
> the remaining error code in one swoop.
> 
> EDEADLOCK and EWOULDBLOCK are intentionally left out: they are just
> deprecated compatibility aliases of EDEADLK and EAGAIN, kept around for
> non-Linux/POSIX code, and have no use in new kernel code.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Seems reasonable,

Acked-by: Danilo Krummrich <dakr@kernel.org>
