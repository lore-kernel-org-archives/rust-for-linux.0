Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274920;
	b=nawBEj88qLZoBIuKQ/XmHQC2biA6Xh+w510TIcLs6OfeyONbiYQLSruT02JuqyI7orCf
	 zzfFjbeWTaVUCMlJ4BKj1e4mFCNhaCmM/JzXvQ4HdDw1tFJXu29YXaPvLnclAwgQrgk5X
	 ypVmx3iQr1LTYyfdVK110xJDY2tUerP8AWrgU1lYaI4JjVFhQkyJ5FOXcBW+0T/ot8vLk
	 QxHdAjuDMz5BrZfPVZlNZ5DbjoundOzicmJLRrhirhtpuNotmjo0h9kjWQNo1lpUHrXJa
	 F8C0tcz4X2l0yj7wZ+e90u77omBYPZjQcy3i4TVkmFDaC7UDvKvJKG2DbQ5ymxvuKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274920;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=tu2X+l79DQrXYjw0mWYuuJBKGa/OqdTNT6ih39CCmpI=;
	b=yhGrzV1K3ZPurdhST7LxZn4c4RvXFZYQjnexTOqWVGcvmEKLjZ/dWxx2AdtqUHfPHiWh
	 N/SP5hFEQmDNHI+0vaI455QS7HVaoOs4CzzR+qwxVwaqaim7stMtSvIRLC2PM0cSLTl1O
	 7mU5eo9XgIVEtLXP8FHybX0FRDrEIhtUjTV73yMhOtaMX65t3qQR7aK48I9tKKc6OK8hA
	 gIA6hf2uudMOtlh9E5momcANPeAyx4fTnp/NoohWnh25+T7xTHdgbMFTzoBxeBjD7jNGh
	 eiv6MQsRXSDk7rCw5WgHAtgGrwJJjyh4zsAKiRJTjGGqv7GrIA8JkCu+n0HcO1LPgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gV0tG84/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED711606A320
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gV0tG84/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E7F1F000CA;
	Sat, 21 Nov 2026 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795274919;
	bh=tu2X+l79DQrXYjw0mWYuuJBKGa/OqdTNT6ih39CCmpI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=gV0tG84/xLm6saYJjUQa3vCjzk+tZ+zwn6yjheIhUtg1SHIwTvc849mGY2YbgO4El
	 sZb0ltUST4jqfnjbJ9xs3OpOP8abEJbGNVQpw0qRqudAnbYf9FweH8rCnai9gxc7Xl
	 vlYDGXtTrmotbjzRYzlhvvIq+p5MzoPnoRpiW+OJwuz9mIQixfMxfew7j0XYYnZIUZ
	 8X9GelY5JMdx6O3VdO24+P2iRsEN3joIXKb2NvvkmQ1YEipwCFvROO4J4B2PwmUlPI
	 +B5Wvvb6FftMexmYUZKJ7ysn6fQl+P2Mu1iByQKFvz6aKbu0RN/kA4UErV19TlH32s
	 NeA2wjcVvDNZg==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 16:28:35 +0100
Message-Id: <DN0ZUECUCER4.QK2US2HOR3I4@kernel.org>
Subject: Re: [PATCH v2] rust: gpu: buddy: store the allocator inside the
 Mutex
Cc: <rust-for-linux@vger.kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Arun Pravin"
 <arunpravin.paneerselvam@amd.com>, "Joel Fernandes" <jfern@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Ivan Tverdokhleb" <mbkchelofficialdev@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261119111850.33270-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261119111850.33270-1-mbkchelofficialdev@gmail.com>

On Thu Nov 19, 2026 at 12:18 PM CET, Ivan Tverdokhleb wrote:
> @@ -313,16 +313,11 @@ pub struct GpuBuddyParams {
>  ///
>  /// # Invariants
>  ///
> -/// The inner [`Opaque`] contains an initialized buddy allocator.
> +/// The `lock` field contains an initialized buddy allocator wrapped in =
`Opaque`.
>  #[pin_data(PinnedDrop)]
>  struct GpuBuddyInner {
>      #[pin]
> -    inner: Opaque<bindings::gpu_buddy>,
> -
> -    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::n=
ew()`
> -    // accepts `impl PinInit<T>`.
> -    #[pin]
> -    lock: Mutex<()>,
> +    lock: Mutex<Opaque<bindings::gpu_buddy>>,

I think we should keep the name inner.
