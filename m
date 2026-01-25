Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B2823DD
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769381136; cv=none; b=ls2xIj9GQcAT3/nl8G92x2ns5Zukhj/OvLtAZCuLay4RHBWTMyahgu6YoRV5HRhFIIq5VN3zs0fsUWvqI8xO3O+g/hc4aRoG1JJ3LiQWS5JcEd4cMKkqzFTkK/7JPePN/cWnCNShj5TnBHhTV50l+R9QvAPaXe7KNG8+EtxQnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769381136; c=relaxed/simple;
	bh=Kxfd4TJghgF9a+UTMwFBHRl29bsi8VSBmHgBlBZ6aig=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cRl+0avsLQqsraQSHQOe7DvROt/pt0SGZHh9/kN3nsaJIMEvo1tIMhRp1mNCu8NzBYmh3Ao+qn63XzzRn4MxfdfLu+tU25bhHQbOJ2do2EJ1ZyJ/uOyVOQ/V+vxn6TqXQZeSaMZr51nKlxRuO3zb64IqQNXSRTWFyDjS0Bv2vbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxHxvmUx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxHxvmUx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC4C4CEF1;
	Sun, 25 Jan 2026 22:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381136;
	bh=Kxfd4TJghgF9a+UTMwFBHRl29bsi8VSBmHgBlBZ6aig=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZxHxvmUxteNKHhTAqnD0c7vHFXuBdXvBKuvRvNKAiW4PnUVYaEudhC1JWGDcoI8KY
	 WkbkW8C69rv/9SsncuCwONNYAAcXQiPtymz5bRw4gEeawc1u0a5ECUKNi6MHsURX58
	 TBr8dS649O6IDUp+KglYkTTYpNwf4XTBJhwGiJUB4L1QTGl/yzyfx9NZ6Jbly6tt9v
	 vWZqXDKkqC/lQy8Rys3Q2OANgMuyxKYWNMqFfee/aTbrIxE5r6Y0LHnwzPcTHTYLj+
	 TJS25cqWN3euVVuzqaxcqcDB5kqj3SdcOQBuUOY5ViyghnQ/kQQrYmiaq/H/k4eEYh
	 hntEIBnHZJiLQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 23:45:32 +0100
Message-Id: <DFY19ISM6K8S.RC3Q66OPMKUA@kernel.org>
Subject: Re: [PATCH v2 4/7] rust: debugfs: use pin_init::zeroed() for
 file_operations
Cc: <rust-for-linux@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120083824.477339-1-sunke@kylinos.cn>
 <20260120083824.477339-5-sunke@kylinos.cn>
In-Reply-To: <20260120083824.477339-5-sunke@kylinos.cn>

On Tue Jan 20, 2026 at 9:38 AM CET, Ke Sun wrote:
> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
> file_operations initialization in all debugfs file operation
> implementations.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Applied to driver-core-testing, thanks!
