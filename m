Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826482AE8D;
	Sat, 24 Jan 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769272034; cv=none; b=S9lGNsMserPVyYCOqUVSH0Gu+VgmE8O2SJurhN2kL0IQzwW4mR3LAcCRbbcPh6q6szbx3qci7+eG3M7TiVACPJ9TEZ/tWAKc/b7mq/SJESb2wYos+iLKrSA5kHIxhtHMbZLfaTSts5UXYxHRz0sglOz2zzoIr9t1r6og/7gFpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769272034; c=relaxed/simple;
	bh=+xyiRjyVyxALKcY0ozUf6K3rEO8EtH2zhCMvugtPRDk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j2xa3+3s0ft8oeqQpfp2Ax5spjnMXwcXDgBSSA7Rz4OSwhImJWWqIK2KIJsjNKW7ICjBtIrgfEQSAJNoXS7QU9s/G0Wswn9wRG4fiH3dcsX+wBkfivg9EdMC35CFi8o5onvJfbvuGVZgUB8wp8OCaOJmS+5y8nbRshupHMGCE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVC/LXxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVC/LXxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FD7C116D0;
	Sat, 24 Jan 2026 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769272034;
	bh=+xyiRjyVyxALKcY0ozUf6K3rEO8EtH2zhCMvugtPRDk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TVC/LXxsqgluQ4Wzh/kzfkVIm4iUUJpSV3o/+mtgFVcN5KoTGRNGk+movua/BZZ3F
	 VXAkVlZ5XxCKvopTKqKFG1MwYlc6anbYdRbSR4zxrdJhaZWkhOFUFzQRy93kBq9YVC
	 Wi6TpQ89olfhXrUd0Cajsd/HyoYEBC/YxE50WNeQKcAlayyMolmqJXQ3ejqSWr7f+0
	 61ozhjlfkDMsM+vsRGtanC1VduorXdIQ8wdOEBSNIhNCXdyGU9Ciz8sUp8+otbWOeF
	 H1F1GbW8o5QDYpoNHi+bqf1uEFlAmcsprxgw8aD6mFZnsYwmxK0AdxhnCOv7gEvE12
	 /iaT2Rx7hb2nw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 17:27:09 +0100
Message-Id: <DFWYL9I1P2TI.O41F9A7ST2IL@kernel.org>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: gsp: use () as message type for
 GspInitDone message
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-2-477d71ec7c23@nvidia.com>
In-Reply-To: <20251215-transmute_unit-v4-2-477d71ec7c23@nvidia.com>

On Mon Dec 15, 2025 at 6:49 AM CET, Alexandre Courbot wrote:
> `GspInitDone` has no payload whatsoever, so the unit type `()` is the
> correct way to represent its message content. We can use it now that
> `()` implements `FromBytes`.
>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
