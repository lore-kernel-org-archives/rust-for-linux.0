Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B253345CC4;
	Mon, 15 Dec 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808410; cv=none; b=tyVcljoy3+GHGuFqfnhaR/ag8tiky8DlixNWgAWwmLGYEb/cN+zEB266a22RJBJbAo0ZyIJqqjC/D/05hlG01ouCnO2OJRr6w5cwVlx9qQCzeZtr17hdNff+h1TJ3TyjNjL28F8759nNLS4G7wd1fbndp4wgzen5jUd5ApZyWM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808410; c=relaxed/simple;
	bh=u09GmzWw1fv7ORresnd+8xjLpNTb+fd5JFBiYK/tLcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYoLrPBOAQvtt3TBmnq3AHbJVFOH9558jTwmOfsJ0hBCrfuDZscGCvJiqVu6YNwPXA7p7JyvKtz8czMzMkxn04MGwik2qiGXGXwbszv5Px00eAeeBwAUCoWcXyDi/3M0Yitp/t8JOzjwHB7Vd2TXOTOAKnJIOXyaTOkOJaNGoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpzgOr3D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpzgOr3D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FA2C4CEF5;
	Mon, 15 Dec 2025 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765808409;
	bh=u09GmzWw1fv7ORresnd+8xjLpNTb+fd5JFBiYK/tLcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TpzgOr3DChEW29Wp93emAfrVFvKIbtI+5MO8SvdXyljvKa6+jSZ9rOamxXEpkVvtq
	 iF6OiJTR+h4izhr3k+h+y/jc0KWgm70rhFcqs63LxAspzRrjiDg9T3Oqu+CKohPrcz
	 MysIKZOVhTX4fhb0IPlI1RF67JmUkM65RjV+Y9SWkU4a/DRg+7mycDjKfi/INA1/n5
	 7zpmTjuWJ6Ea6VFTvhWjBJl048S088dqHYj0hmpysfCElLGzpy46R4ws7CL0rqp1GT
	 gR5hoaO88GKTSabPzg725ZB6ZpfE6LPJl/xDgIaJ/Bq4UuknrefnZm/WC363s49jTN
	 T6nC1Zk6m23xw==
Message-ID: <f164028a-38ac-4633-bd11-fc1ed135dd37@kernel.org>
Date: Mon, 15 Dec 2025 15:20:05 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: conclude the Rust experiment
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251213000042.23072-1-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/13/25 1:00 AM, Miguel Ojeda wrote:
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].

Acked-by: Danilo Krummrich <dakr@kernel.org>
