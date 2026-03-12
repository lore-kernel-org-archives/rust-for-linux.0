Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D833F390;
	Thu, 12 Mar 2026 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338376; cv=none; b=jCjBgDoQUOhzF3DL2zEAMBvbpttmCm/x9I9hX/dX6EJSZgccdpH4BKyIam98wfyOJXoW5eI/PtRW7UkJUZvLeOhvzD8W0aeYpZdDNih+mhOJRqiAYUfdP7nkPaW0TlHo1aib0/eA3Uct0xajPF8xQAVn5zxCOB/5YU69yAGZFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338376; c=relaxed/simple;
	bh=8pY4aC2GhQvE/z/Ng9ojArVFIj1iT8cxfkPTarZFYac=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FW+SlKG6IMYO9Vkmkb/T2En/J2vuUqRnZkebTMzmmqw3ylbV+EehoYOsrSJXt7pXK/HGVbZhxcEYFza16sPY1IiE/EuI2KI0DnbV7RXdpEO7ozFPFYfHojr0LJxrWFUXE3m/wfO8pg0Gl/gN3FZ979vUD9ETEkhNBNxWRHBAq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHg9hSV+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHg9hSV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FDEC4CEF7;
	Thu, 12 Mar 2026 17:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773338376;
	bh=8pY4aC2GhQvE/z/Ng9ojArVFIj1iT8cxfkPTarZFYac=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AHg9hSV+Mgi5C7syAXwvMDY1vmKiVKdzMkKmJxQaop3p4a8sXpo8DbMMwbsd3LT2K
	 VnFxBagxfCUdQ2vpGzqBzl9FK8ADz+zXqpo83eCei6joAv4NZ6RznqO2i9LU6t37wa
	 HyoMKOPMJzY8ZzzECjOv3382Sm8jqZM9niMZX0u5SMFb9ZsV2T2wsdUbzYLgkrEbUj
	 F/ObK3CZMjx8nPO/3NMx3s4WD4SvKTlDO2kY60fNslZLYH9cOi1irvxnc5MGwgl2Eh
	 omETdtB0ddG6roMkeY36K8sWEjlM/WOvIZiHhuHNZINUVu2ePCNEXyZKn3VVclhdEi
	 5+yEWZom7EQfA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 18:59:31 +0100
Message-Id: <DH0ZZLC5QQE7.1I1FBK77FQHO9@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
In-Reply-To: <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>

On Thu Mar 12, 2026 at 10:23 AM CET, Alice Ryhl wrote:
> +impl Queue {
> +    /// Build a workqueue whose work may execute on any cpu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_unbound().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "WQ_UNBOUND")]
> +    pub fn new_unbound() -> Builder<TypeUnbound> {

Wouldn't it be more straight forward if those where constructors of Builder=
?

	let wq =3D wq::Builder::new_unbound().build(c"my-wq")?;

Queue::new_unbound() suggests that it returns a new Queue object, but inste=
ad it
returns a new Builder object.
