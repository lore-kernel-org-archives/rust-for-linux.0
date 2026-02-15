Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5E0304BB4;
	Sun, 15 Feb 2026 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771193601; cv=none; b=OewnXSt0U1rSRtbdNvN9+hODfuf96/rrFB6fR/RExZrNvmSkDmecu1JRR778aPHT4+k8H6tkAhLzK6WtE0LpxaI+JZi0nw/kPNRYFJlavloVEowQX/LtssEqUwMhFhyY16cNih8rfsGs+/PlP5Spi/2fDkaibuqcvyPH1oHnd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771193601; c=relaxed/simple;
	bh=wusGVrg/btkxa54gvuCMUV+K7hWdyG0MjATj999nBAA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=C+7IAGl0QjKUHpHoBhhk2aq0/voEXZMDec6y98r9wPj9nw97rVQ1b9D1Jemh9wh7fc82keqWKi9kMStH3Z0xXVnLztUDYGs5UNKK0qJLHwfilaB6x48OumlRUJ7EqEiSOVi4Vn++Z2ddg9hWJrCkYn4HH5/3f67lL8LeakRMkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5ZEBagP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5ZEBagP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316A2C4CEF7;
	Sun, 15 Feb 2026 22:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771193601;
	bh=wusGVrg/btkxa54gvuCMUV+K7hWdyG0MjATj999nBAA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=g5ZEBagPqkVi2x2dP5XKsJ8mK0ACv3jBYHca585K5oykdBa3pYL0CaGfyL8voAVNT
	 Mp6O49Vr6VTgSJFzVXHTnPFXVDzLfbUiNJvRR46jAIc+7KFPbN/9yBDIu/j0/ZMEpb
	 w89wj5GV54PXfhyJtqJzvFOeqZGxElPQF2mCT1hp8vuXnnIdAMG+0M94tP6Bj0udhY
	 Es7fptS85bgs+i19IYPbkbPTYVTstK4a9TnylNMOgzyP2hpl7YiPaRNR9km3VFNqiV
	 9v6C7U+T6AZojCz6pHTfrxiuF9FBJqMJk4psnJ0yHF1oddyJbgpgr5b8HLqMdmRe/w
	 OpoDdjYs4K6+Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 23:13:15 +0100
Message-Id: <DGFVQ8Y1LLY1.SKXJK85IK4JH@kernel.org>
Subject: Re: [PATCH v5 0/3] rust: alloc: add KVVec shrinking method
Cc: <shivamkalra98@zohomail.in>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>, "Carlos
 Llamas" <cmllamas@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alice Ryhl"
 <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
In-Reply-To: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>

On Sat Feb 14, 2026 at 9:35 PM CET, Shivam Kalra via B4 Relay wrote:
> Shivam Kalra (3):
>       rust: kvec: implement shrink_to for KVVec
>       rust: alloc: add KUnit tests for KVVec shrink_to

Greg, Alice, I assume you want to take this through the Android tree?

With the comments in patch 2 addressed,

Acked-by: Danilo Krummrich <dakr@kernel.org>

>       rust_binder: shrink all_procs when deregistering processes
