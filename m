Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AE2741B5;
	Thu, 19 Feb 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771495128; cv=none; b=S4tWVvRhKVxBF914WyzgJ6RsscU9ImqnE1QnBItuUOsGnDJvq2B/eC67p0l0tmYEy0TX7Nf5GOlH/qasjWvf31zH4bjl2yMwHtCQWNLvyq+jQPeddhn1LEgkaF6UixoS4rchr9ycZh0fDXq2LwNTW6cDzAxZb7ot1SWm2J84bJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771495128; c=relaxed/simple;
	bh=UKf32m3uT4JzXholCdQ87l5Nd+rV2b+UR1q5Km3OpUY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=BuvvZcl3vpWo8U7WvT6CVs1GqxFPRBUMKOczcewBNdrdK2C5UKl+j6vrZnWxKOBQWB+1PL8Zz2u+lu8h/Az0f5y7ysEqsYGwdq7gGHJq8CvQXmGcf48HoF2snTBUBaK+9Xkhc3puOz8J7Nf/RC91+tyROPt0JTU7NBMXlUgJ1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRQVYmX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRQVYmX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E61FC4CEF7;
	Thu, 19 Feb 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771495127;
	bh=UKf32m3uT4JzXholCdQ87l5Nd+rV2b+UR1q5Km3OpUY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fRQVYmX/BS7iyXUsNtUY7Sg9jqNMp54m9kaei7NwBPvTdbYtddGLVPF7fOM1zk3w3
	 ZrONiZxfNY9oKKxv0Qiem2wmuq8EvljqxXo24FjnYZ7EKBF+oOg3aFf3nvwqxtNo6q
	 9dK7XCtHBckiSF/v6OJ6M3aphJt+4zS4nfoMNgwLJvs6m20bcpS11RcagiHBqPss2r
	 WLiWSnOL09qcCAV2QynPUj+6RaKfir+I9GRjAOIJxZSO7x44e3hDsYW8tpVOVnoXXW
	 qTjw2dF5LhA11hBfUO2VCsCAH4p4vgC5vJB332TS7lGAaP0iI5uYTYla9Y4BXB6yN0
	 hbBFSg0Q4CMOw==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 10:58:42 +0100
Message-Id: <DGIUM0N4QQWD.1IH8DWPVIFXTF@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Dave Airlie"
 <airlied@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

For reference: https://lore.kernel.org/rust-for-linux/DGIIMT4F1GWA.12UFBEUA=
C80VW@nvidia.com/
