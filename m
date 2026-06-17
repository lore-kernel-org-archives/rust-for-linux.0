Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81F33FE02;
	Wed, 17 Jun 2026 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717365; cv=none; b=usImm+KDnNpagnnnSGdmYn64Cy0UvplCuBcEPuK/F/0kW2KLKn45+RkDDfmeYLKgrn1cxKrNIidmXcjctEmaAO20pzVS7QqI3nfMt+ZL8tf1dgiymYGAXhV10rjCXtCBm7Qbq9sZ2nxF8E2tekSkkAFdF190CjiVJuo3fcMhLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717365; c=relaxed/simple;
	bh=PaSTbLBcpUijmsTYXlKtssJdURQBgW1Gr+yISnMRViE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=tjLNk097z32U6neqhFnaM4Jb7PYt5cyK9QXGk7IYu2VCTCXPoSrkdZYIMTt/lx4f8K00S17uWc/vkFKWp5AlaOCUk3tGPLr0EClYODNsYYM8vaTtVFoL7NKnXHz2TmZqXzOqhfoQPraXArB08P/uAwfg2e7ju8slOEQ4eR1eQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwx8WkGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwx8WkGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404C11F000E9;
	Wed, 17 Jun 2026 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781717363;
	bh=+zlA4BqPCSjev3mf0pY8zrm54TbnnTIQPELdOZLAFjQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=kwx8WkGS1kc6njcvfu+JJ1uZB+En8dhUnRFw1UdH8aHoFBddSMRW4niWJxR03upAN
	 GG4G7ZDq9HVNuA9y75ANZ2RhqxlC0FZckAGHYkwstg2vsUD7XKA4br8t6y3kJosm22
	 YeZVCU282DQOGYOGQWTtvs+qbRhlOnnTO27qWi7uUykOxH72icNM27eLGr1XTa4FV4
	 Xrio7K238hpCW0de5H0hT+6xyxKeGIzR1Si32ZlMVSISSZMbqXbMBgns6q1sXBpjjk
	 07In06Zd83KhLA/OEgXlFax1ExxIHTNsWHwdFEmYHb9j9ixqOC6apo/hKuajY72Iih
	 m3TypKoZ5usTA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 19:29:19 +0200
Message-Id: <DJBI3BA9L00H.3KOMQOPUO6BB4@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/1] rust: workqueue: add ScopedQueue for lifetime
 bound items
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <tamird@kernel.org>,
 <daniel.almeida@collabora.com>
References: <20260617144645.253444-1-work@onurozkan.dev>
 <20260617144645.253444-2-work@onurozkan.dev>
In-Reply-To: <20260617144645.253444-2-work@onurozkan.dev>

On Wed Jun 17, 2026 at 4:45 PM CEST, Onur =C3=96zkan wrote:
> Add a workqueue wrapper for work items that are not 'static.
>
> Tyr reset work is queued from a handle that owns a Controller<'bound>
> where the work item holds references tied to the lifetime of the bound
> device and its mapped IO state. The existing API only accepts 'static
> work items which cannot express that relationship.
>
> Introduce ScopedQueue for this case. It owns the underlying workqueue
> and ties enqueued work to the queue lifetime so borrowed state cannot
> outlive the queue that may still run it.
>
> Construction is unsafe because the queue must not be leaked.
>
> `compile_fail` doc-tests are ignored for now as KUnit doesn't support
> that. Enabling those tests as regular code block would raise this error:
>
>     ERROR:root:error[E0597]: `data` does not live long enough
> 	 --> rust/doctests_kernel_generated.rs:22029:44
> 	  |
>     22027 |         let data =3D ();
> 	  |             ---- binding `data` declared here
>     22028 |         // SAFETY: Queue is not leaked.
>     22029 |         queue =3D unsafe { new_queue(&data)? };
> 	  |                                            ^^^^^ borrowed value does=
 not live long enough
>     22030 |     }
> 	  |     - `data` dropped here while still borrowed
>     ...
>     22034 | }
> 	  | - borrow might be used here, when `queue` is dropped and runs the `D=
rop` code for type `ScopedQueue`
> 	  |
> 	  =3D note: values in a scope are dropped in the opposite order they are=
 defined
>
> which is exactly the constraint ScopedQueue is meant to enforce.
>
> This series is based on Alice's "Creation of workqueues in Rust" [1]
> series.
>
> Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351=
c38f@google.com [1]
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
