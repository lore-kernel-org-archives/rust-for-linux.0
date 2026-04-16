Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B42C326F
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776320120; cv=none; b=Uu5g9pDbxWBvCAztBE7Y7PiqbnrOloNNON0IQuGVre6SxFF56iBVmy9ImWF+Lc8iVcB9jMaQfDvedqfmeWcfxFdEPdxjQx6OMqa4WmX4zGqYquOiIXFzJcVbg0kAXkwfbKNHqBPPUvSze/Acz+To0eunX/EhACad0fOocy1JRmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776320120; c=relaxed/simple;
	bh=g1tDBe02R9oWKeo2DjkwlOarcAqzyX++YZGtBkufrzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhqzhsGJdf0pZhdEd+pr0a4eNfZTK4Obyer9FADULK6yczsr01Mt92uNU1+6Zn/zMIMFEORLx8LX5o4QXDhR9/NhGdqOpeWpbXFLaTYlq/VR6qvWE6MGPxJorjPQDGhwCszqI0Ombv/15TbkYMzXGeW5aFAt79BM+EypbXO3P64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hgDqo9eX; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hgDqo9eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776320098; x=1776579298;
	bh=IEtVlso/Iiv0RzhTMxaz5PrYcGhkjPVNJ+gyihhPivg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hgDqo9eXrHnh8lMcV1JRfRWKACkdi4dB2yLFGqTaEHvt/mljO6Oz6BAXvJ8oasx2T
	 HJ3YlHl5ixYSvSxiXdSZfZ26heYpvYKLQeDU+HwmjqDafYeHrRCAQ5PS/L7F8Ii17p
	 m7z76rh84u4ZE4FNXBpq/VZfaXh/OoIiCUFFzg87ezOudjPQGCoMzFt4jA/d6ZnJwO
	 FeEs6J6813dlAW0my/tMtUfrPTmarCyuyKGQ8SlGgoDRzhl7vT2L/gTL+ZAocaWPou
	 z7cPDG819wbRr2jKRkhVe+IyGXdPTEF3BsttSTUW4qCC3FfrTmub6X7/9rlKbjepxP
	 3zIVfmJ/M21iA==
X-Pm-Submission-Id: 4fx75r34S2z2Sd4Q
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boqun Feng <boqun@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
Date: Thu, 16 Apr 2026 09:14:53 +0300
Message-ID: <20260416061454.3769-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260415232830.8128-1-boqun@kernel.org>
References: <20260415232830.8128-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Apr 2026 16:28:30 -0700=0D
Boqun Feng <boqun@kernel.org> wrote:=0D
=0D
> We have two pull requests on Rust synchronization primitives with 10+=0D
> patches in a row for recent cycles, so it makes sense to start the=0D
> effort of handling this area as a group.=0D
> =0D
> Luckily for me, Gary Guo and Alice Ryhl agreed to help as=0D
> co-maintainers, and we also have a talented group of reviewers:=0D
> =0D
> Lyude Paul started the SpinLockIrq work [1] and did an amazing job at=0D
> improving the design and implementation.=0D
> =0D
> Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a fair=0D
> amount of reviews in areas related to synchronization primitives=0D
> already.=0D
> =0D
> Onur =C3=96zkan started the ww_mutex work [3] and did an amazing job at=0D
> consolidating various design requirements and decisions.=0D
> =0D
> Of course, this only reflects my own knowledge, and I believe they did=0D
> way more outside what I'm aware of ;-)=0D
> =0D
> Note that having this MAINTAINERS entry is meant to bring more people=0D
> to help on the synchronization primitives in Rust, which means for patch=
=0D
> submissions and design discussion, please still involve the=0D
> corresponding maintainers (e.g. LOCKING and ATOMIC),=0D
> scripts/get_maintainers.pl should have this covered.=0D
> =0D
> Link: https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyud=
e@redhat.com/ [1]=0D
> Link: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b=
067c4b93fd6@collabora.com/ [2]=0D
> Link: https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@=
onurozkan.dev/ [3]=0D
> Signed-off-by: Boqun Feng <boqun@kernel.org>=0D
> ---=0D
>  MAINTAINERS | 14 ++++++++++++++=0D
>  1 file changed, 14 insertions(+)=0D
> =0D
> diff --git a/MAINTAINERS b/MAINTAINERS=0D
> index 55af015174a5..220dee78b225 100644=0D
> --- a/MAINTAINERS=0D
> +++ b/MAINTAINERS=0D
> @@ -23183,6 +23183,20 @@ T:	git https://github.com/Rust-for-Linux/linux.g=
it alloc-next=0D
>  F:	rust/kernel/alloc.rs=0D
>  F:	rust/kernel/alloc/=0D
>  =0D
> +RUST [SYNC]=0D
> +M:	Boqun Feng <boqun@kernel.org>=0D
> +M:	Gary Guo <gary@garyguo.net>=0D
> +M:	Alice Ryhl <aliceryhl@google.com>=0D
> +R:	Lyude Paul <lyude@redhat.com>=0D
> +R:	Daniel Almeida <daniel.almeida@collabora.com>=0D
> +R:	"Onur =C3=96zkan" <work@onurozkan.dev>=0D
> +L:	linux-kernel@vger.kernel.org=0D
> +L:	rust-for-linux@vger.kernel.org=0D
> +S:	Maintained=0D
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rus=
t-sync=0D
> +F:	rust/kernel/sync.rs=0D
> +F:	rust/kernel/sync/=0D
> +=0D
>  RUST [NUM]=0D
>  M:	Alexandre Courbot <acourbot@nvidia.com>=0D
>  R:	Yury Norov <yury.norov@gmail.com>=0D
> -- =0D
> 2.50.1 (Apple Git-155)=0D
> =0D
=0D
Acked-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
