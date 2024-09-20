Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1613A26F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726824065; cv=none; b=tR8SIqw1WC5qvBrbW8Dsbtrfpubji5xavCDvO6MqFLcOp6Elhmg3eF4yXRMxAbUi1MYMlxLT6liTYX9ZRQgFoYAlqKzfYbmcvISEKxnHsokSMM7B8gWGRKe3+8cdR2kAoaxeIA8HBQuQad55wLsRxjPwH7XDGarUpusGHgQoaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726824065; c=relaxed/simple;
	bh=fbQlRArSP6dp+8o5fGT70KCZAb06VMkpfMG3zGuMokY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YrjVzWhsauR/ALRCsaqgTwhFywSAz9Ntm5VjAGvgtXHx7W71Eohyd6e7JF4I303MeTQIVg9hNwBa/QoVJ1VqeFITkq1vBhM4dxlcEgVQLc8DvGiuS8K7VdaAE9VwMkuVjioHh1MScdbmAk95RboDXmi+q46ccoooyEgPR4IQeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=dONyFm3R; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="dONyFm3R"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1726824053; bh=U5AuNzwYRDJeSadSRT5QWf2DtHHKGZ4a1+KTsQJZ1Rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dONyFm3RZX5KypvtqnJ0ZNlFhk7MFxcZldEZW/7JHZv6oF0gqmaVRnIRP9gPGuRrg
	 5qX33tRPfOVqhl+DOVagVJtM+yI9yA74f00UIzx+JfViP0B5a+OB/RhasPYKp6Hwvg
	 6h/qPCRlzaVe1ZinyjByXQyWazPFoMpoxhfOjnqg=
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: Move `FromBytes` and `AsBytes` traits to a new
 `transmute` module
Date: Fri, 20 Sep 2024 11:20:49 +0200
Message-ID: <03386BA2-453B-40A2-8E0D-AC3946AE45F4@kloenk.dev>
In-Reply-To: <20240918225115.2309224-2-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
 <20240918225115.2309224-2-aliet.exposito@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 19 Sep 2024, at 0:51, Aliet Exposito Garcia wrote:

> This patch refactors the `FromBytes` and `AsBytes` traits from `types.rs`
> into a new `transmute.rs` module.
> The traits and their implementations remain unchanged.
>  - Adds `rust/kernel/transmute.rs` with the definitions of `FromBytes`
>     and `AsBytes`
>  - Removes the same trait definitions from `rust/kernel/types.rs`
>  - Updates `rust/kernel/uaccess.rs` to import `AsBytes` and `FromBytes`
>     from `transmute.rs`
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1117
> Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

